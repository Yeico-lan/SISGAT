from flask import Flask, render_template, request, jsonify, session, redirect, url_for
from functools import wraps
import hashlib
import os
import sys

# ──────────────────────────────────────────
#  IMPORTAR DB DESDE MODEL
# ──────────────────────────────────────────
sys.path.append(r'C:\Users\javie\OneDrive\Documentos\GitHub\SISGAT\Model')
from db import get_connection, Error


# ──────────────────────────────────────────
#  CONFIGURACIÓN DE RUTAS
# ──────────────────────────────────────────
template_dir = os.path.abspath(
    os.path.join(os.path.dirname(__file__), '..', '..', 'View', 'templates')
)
static_dir = os.path.abspath(
    os.path.join(os.path.dirname(__file__), '..', '..', 'View', 'static')
)
app = Flask(__name__, template_folder=template_dir, static_folder=static_dir, static_url_path='/static')
app.secret_key = os.urandom(24)


# ──────────────────────────────────────────
#  DECORADOR SOLO ADMIN
# ──────────────────────────────────────────
def solo_admin(f):
    """Decorador: redirige al login si no hay sesión de administrador."""
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
    
    conn = get_connection()
    total_proveedores = 0
    if conn:
        try:
            cursor = conn.cursor(dictionary=True)
            cursor.execute("SELECT COUNT(*) as total FROM proveedores")
            total_proveedores = cursor.fetchone()['total']
        finally:
            cursor.close()
            conn.close()

    return render_template('dashboard.html',
                           nombre=session.get('usuario_nombre'),
                           rol=session.get('usuario_rol'),
                           total_proveedores=total_proveedores)


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
                                  usu_telefono, usu_contrasena, id_rol)
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


# ──────────────────────────────────────────
#  MÓDULO PROVEEDORES
# ──────────────────────────────────────────
@app.route('/proveedores', methods=['GET'])
def proveedores_page():
    if not session.get('usuario_id'):
        return redirect(url_for('login_page'))
        
    conn = get_connection()
    proveedores = []
    
    if conn:
        try:
            cursor = conn.cursor(dictionary=True)
            cursor.execute("""
                SELECT prov_id, prov_nombre, prov_telefono, prov_correo, prov_direccion 
                FROM proveedores 
                ORDER BY prov_nombre
            """)
            proveedores = cursor.fetchall()
        except Error as e:
            print(f"[SELECT ERROR PROVEEDORES] {e}")
        finally:
            cursor.close()
            conn.close()
            
    return render_template('proveedores.html', 
                           proveedores=proveedores,
                           nombre=session.get('usuario_nombre'),
                           rol=session.get('usuario_rol'))


@app.route('/api/proveedores', methods=['POST'])
def api_registrar_proveedor():
    if not session.get('usuario_id'):
        return jsonify({'ok': False, 'mensaje': 'No autorizado'}), 401

    data      = request.get_json(force=True)
    nombre    = data.get('nombre', '').strip()
    telefono  = data.get('telefono', '').strip()
    correo    = data.get('correo', '').strip()
    direccion = data.get('direccion', '').strip()

    if not nombre:
        return jsonify({'ok': False, 'mensaje': 'El nombre del proveedor es obligatorio'}), 400

    conn = get_connection()
    if not conn:
        return jsonify({'ok': False, 'mensaje': 'Error de conexión con la base de datos'}), 500

    try:
        cursor = conn.cursor(dictionary=True)
        
        cursor.execute("""
            INSERT INTO proveedores (prov_nombre, prov_telefono, prov_correo, prov_direccion)
            VALUES (%s, %s, %s, %s)
        """, (nombre, telefono or None, correo or None, direccion or None))

        conn.commit()
        return jsonify({'ok': True, 'mensaje': f'Proveedor "{nombre}" registrado con éxito.'})

    except Error as e:
        print(f"[INSERT ERROR PROVEEDOR] {e}")
        return jsonify({'ok': False, 'mensaje': 'Error al guardar el proveedor'}), 500
    finally:
        cursor.close()
        conn.close()

# ──────────────────────────────────────────
#  MÓDULO MOVIMIENTOS
# ──────────────────────────────────────────
@app.route('/movimientos', methods=['GET'])
def movimientos_page():
    """Renderiza la interfaz visual del módulo de movimientos."""
    if not session.get('usuario_id'):
        return redirect(url_for('login_page'))
    
    return render_template('movimientos.html',
                           nombre=session.get('usuario_nombre'),
                           rol=session.get('usuario_rol'))


@app.route('/api/movimientos', methods=['GET', 'POST'])
def api_movimientos():
    """API para obtener y registrar los movimientos basándose en la estructura real."""
    if not session.get('usuario_id'):
        return jsonify({'ok': False, 'mensaje': 'No autorizado'}), 401

    conn = get_connection()
    if not conn:
        return jsonify({'ok': False, 'mensaje': 'Error de conexión con la base de datos'}), 500

    # ── MÉTODO GET: Obtener lista de movimientos reales ──
    # — MÉTODO GET: Obtener lista de movimientos reales — 
    if request.method == 'GET':
        try:
            cursor = conn.cursor(dictionary=True)
            
            # Modificamos la consulta para hacer el INNER JOIN con usuarios
            query = """
                SELECT 
                    m.mov_id, 
                    m.mov_tipo, 
                    m.mov_motivo, 
                    u.usu_nombre AS usu_nombre, 
                    m.mov_fecha, 
                    m.prod_id
                FROM movimientos m
                INNER JOIN usuarios u ON m.usu_id = u.usu_id
                ORDER BY m.mov_id DESC
            """
            cursor.execute(query)
            movimientos = cursor.fetchall()
            
            # Formateamos la fecha para evitar errores de JSON con objetos datetime
            for m in movimientos:
                if m['mov_fecha']:
                    m['mov_fecha'] = m['mov_fecha'].strftime('%a, %d %b %Y')

            return jsonify(movimientos)
            
        except Error as e:
            print(f"[SELECT ERROR MOVIMIENTOS] {e}")
            return jsonify({'ok': False, 'mensaje': 'Error al consultar movimientos'}), 500
        finally:
            cursor.close()
            conn.close()


if __name__ == '__main__':
    app.run(debug=True, port=5000)