from flask import Flask, render_template, request, jsonify, session, redirect, url_for
from mysql.connector import Error
import hashlib
import os
import sys
 
# Importar la configuración de BD desde Model/db.py
sys.path.append(
    os.path.abspath(
        os.path.join(os.path.dirname(__file__), '..', '..', 'Model')
    )
)
from db import get_connection
 
app = Flask(__name__)
app.secret_key = os.urandom(24)
 
 
def solo_admin(f):
    """Decorador: redirige al login si no hay sesión de administrador."""
    from functools import wraps
    @wraps(f)
    def wrapper(*args, **kwargs):
        if not session.get('usuario_id'):
            return redirect(url_for('login_page'))
        if session.get('usuario_rol', '').lower() != 'administrador':
            return redirect(url_for('dashboard'))
        return f(*args, **kwargs)
    return wrapper
 
 
# ──────────────────────────────────────────
#  LOGIN
# ──────────────────────────────────────────
@app.route('/', methods=['GET'])
@app.route('/login', methods=['GET'])
def login_page():
    if session.get('usuario_id'):
        return redirect(url_for('dashboard'))
    return render_template('login.html')
 
 
@app.route('/api/login', methods=['POST'])
def api_login():
    data       = request.get_json(force=True)
    correo     = data.get('correo', '').strip()
    contrasena = data.get('contrasena', '').strip()
 
    if not correo or not contrasena:
        return jsonify({'ok': False, 'mensaje': 'Completa todos los campos'}), 400
 
    conn = get_connection()
    if not conn:
        return jsonify({'ok': False, 'mensaje': 'Error de conexión con la base de datos'}), 500
 
    try:
        cursor  = conn.cursor(dictionary=True)
        hash_pw = hashlib.sha256(contrasena.encode()).hexdigest()
 
        cursor.execute("""
            SELECT u.usu_id, u.usu_nombre, u.usu_apellido, u.usu_correo,
                   r.rol_nombre
            FROM   usuarios u
            JOIN   roles    r ON r.rol_id = u.id_rol
            WHERE  u.usu_correo     = %s
              AND  u.usu_contrasena = %s
        """, (correo, hash_pw))
 
        usuario = cursor.fetchone()
 
        if usuario:
            session['usuario_id']     = usuario['usu_id']
            session['usuario_nombre'] = usuario['usu_nombre']
            session['usuario_rol']    = usuario['rol_nombre']
            return jsonify({
                'ok':      True,
                'nombre':  usuario['usu_nombre'],
                'rol':     usuario['rol_nombre'],
                'redirect': url_for('dashboard')
            })
        else:
            return jsonify({'ok': False, 'mensaje': 'Correo o contraseña incorrectos'}), 401
 
    except Error as e:
        print(f"[QUERY ERROR] {e}")
        return jsonify({'ok': False, 'mensaje': 'Error interno del servidor'}), 500
    finally:
        cursor.close()
        conn.close()
 
 
# ──────────────────────────────────────────
#  DASHBOARD
# ──────────────────────────────────────────
@app.route('/dashboard')
def dashboard():
    if not session.get('usuario_id'):
        return redirect(url_for('login_page'))
    return render_template('dashboard.html',
                           nombre=session.get('usuario_nombre'),
                           rol=session.get('usuario_rol'))
 
 
# ──────────────────────────────────────────
#  REGISTRAR USUARIO (solo admin)
# ──────────────────────────────────────────
@app.route('/registrar', methods=['GET'])
@solo_admin
def registrar_page():
    conn  = get_connection()
    roles = []
    if conn:
        try:
            cursor = conn.cursor(dictionary=True)
            cursor.execute("SELECT rol_id, rol_nombre FROM roles ORDER BY rol_id")
            roles = cursor.fetchall()
        finally:
            cursor.close()
            conn.close()
    return render_template('registrar.html', roles=roles,
                           nombre=session.get('usuario_nombre'),
                           rol=session.get('usuario_rol'))
 
 
@app.route('/api/registrar', methods=['POST'])
@solo_admin
def api_registrar():
    data       = request.get_json(force=True)
    nombre     = data.get('nombre', '').strip()
    apellido   = data.get('apellido', '').strip()
    correo     = data.get('correo', '').strip()
    telefono   = data.get('telefono', '').strip()
    id_rol     = data.get('id_rol')
    contrasena = data.get('contrasena', '').strip()
 
    if not all([nombre, apellido, correo, id_rol, contrasena]):
        return jsonify({'ok': False, 'mensaje': 'Completa todos los campos obligatorios'}), 400
 
    if len(contrasena) < 6:
        return jsonify({'ok': False, 'mensaje': 'La contraseña debe tener mínimo 6 caracteres'}), 400
 
    conn = get_connection()
    if not conn:
        return jsonify({'ok': False, 'mensaje': 'Error de conexión con la base de datos'}), 500
 
    try:
        cursor  = conn.cursor(dictionary=True)
        hash_pw = hashlib.sha256(contrasena.encode()).hexdigest()
 
        cursor.execute("SELECT usu_id FROM usuarios WHERE usu_correo = %s", (correo,))
        if cursor.fetchone():
            return jsonify({'ok': False, 'mensaje': 'Ese correo ya está registrado'}), 409
 
        cursor.execute("""
            INSERT INTO usuarios (usu_nombre, usu_apellido, usu_correo,
                                  usu_telefono, usu_contraseña, id_rol)
            VALUES (%s, %s, %s, %s, %s, %s)
        """, (nombre, apellido, correo, telefono or None, hash_pw, id_rol))
 
        conn.commit()
        return jsonify({'ok': True, 'mensaje': f'Usuario {nombre} {apellido} creado correctamente'})
 
    except Error as e:
        print(f"[INSERT ERROR] {e}")
        return jsonify({'ok': False, 'mensaje': 'Error al guardar en la base de datos'}), 500
    finally:
        cursor.close()
        conn.close()
 
 
# ──────────────────────────────────────────
#  LOGOUT
# ──────────────────────────────────────────
@app.route('/logout')
def logout():
    session.clear()
    return redirect(url_for('login_page'))


# =========================
# MODULO MOTOS - YEICO
# =========================

@app.route('/motos')
def motos():
    return render_template('apa_motos.html')
 
 
if __name__ == '__main__':
    app.run(debug=True, port=5000)