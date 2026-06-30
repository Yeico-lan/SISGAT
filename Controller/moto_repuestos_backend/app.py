from flask import Flask, render_template, request, jsonify, session, redirect, url_for
from functools import wraps
import hashlib
import os
import sys
from functools import wraps 

def login_requerido(f):
    """Decorador para proteger rutas y verificar si hay sesión activa."""
    @wraps(f)
    def decorated_function(*args, **kwargs):
        if 'usuario_id' not in session:
            return redirect(url_for('login_page'))
        return f(*args, **kwargs)
    return decorated_function
# ──────────────────────────────────────────
#  IMPORTAR DB DESDE MODEL
# ──────────────────────────────────────────
sys.path.append(r'C:\Users\javie\Onedrive\Documentos\GitHub\SISGAT\Model')
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
    total_clientes = 0
    total_motos = 0
    total_productos = 0
    total_proveedores = 0
    ultima_moto = None
    ultimo_cliente = None
    ultimo_producto = None

    if conn:
        try:
            cursor = conn.cursor(dictionary=True)

            # ── Contadores ──
            cursor.execute("SELECT COUNT(*) as total FROM clientes")
            total_clientes = cursor.fetchone()['total']

            cursor.execute("SELECT COUNT(*) as total FROM motos")
            total_motos = cursor.fetchone()['total']

            cursor.execute("SELECT COUNT(*) as total FROM productos")
            total_productos = cursor.fetchone()['total']

            cursor.execute("SELECT COUNT(*) as total FROM proveedores")
            total_proveedores = cursor.fetchone()['total']

            # ── Última moto registrada ──
            cursor.execute("""
                SELECT mot_marca, mot_modelo
                FROM motos
                ORDER BY mot_id DESC
                LIMIT 1
            """)
            ultima_moto = cursor.fetchone()

            # ── Último cliente registrado ──
            cursor.execute("""
                SELECT cli_nombre, cli_apellido
                FROM clientes
                ORDER BY cli_id DESC
                LIMIT 1
            """)
            ultimo_cliente = cursor.fetchone()

            # ── Último producto registrado ──
            cursor.execute("""
                SELECT prod_nombre
                FROM productos
                ORDER BY prod_id DESC
                LIMIT 1
            """)
            ultimo_producto = cursor.fetchone()

        except Error as e:
            print(f"[SELECT ERROR DASHBOARD] {e}")
        finally:
            cursor.close()
            conn.close()

    return render_template('dashboard.html',
                           nombre=session.get('usuario_nombre'),
                           rol=session.get('usuario_rol'),
                           total_clientes=total_clientes,
                           total_motos=total_motos,
                           total_productos=total_productos,
                           total_proveedores=total_proveedores,
                           ultima_moto=ultima_moto,
                           ultimo_cliente=ultimo_cliente,
                           ultimo_producto=ultimo_producto)


@app.route('/api/actividad-reciente')
def api_actividad_reciente():
    """Combina los últimos registros de varias tablas y los ordena por fecha."""
    if not session.get('usuario_id'):
        return jsonify([])

    conn = get_connection()
    eventos = []

    if conn:
        try:
            cursor = conn.cursor(dictionary=True)

            # Motos recientes (usa mot_id como proxy de orden ya que no hay fecha)
            cursor.execute("SELECT mot_id, mot_marca, mot_modelo FROM motos ORDER BY mot_id DESC LIMIT 3")
            for m in cursor.fetchall():
                eventos.append({
                    'tipo': 'moto',
                    'texto': f"Nueva moto registrada: {m['mot_marca']} {m['mot_modelo']}",
                    'orden': m['mot_id']
                })

            # Clientes recientes
            cursor.execute("SELECT cli_id, cli_nombre, cli_apellido FROM clientes ORDER BY cli_id DESC LIMIT 3")
            for c in cursor.fetchall():
                eventos.append({
                    'tipo': 'cliente',
                    'texto': f"Nuevo cliente agregado: {c['cli_nombre']} {c['cli_apellido']}",
                    'orden': c['cli_id']
                })

            # Proveedores recientes
            cursor.execute("SELECT prov_id, prov_nombre FROM proveedores ORDER BY prov_id DESC LIMIT 3")
            for p in cursor.fetchall():
                eventos.append({
                    'tipo': 'proveedor',
                    'texto': f"Nuevo proveedor añadido: {p['prov_nombre']}",
                    'orden': p['prov_id']
                })

            # Movimientos recientes (sí tiene fecha real)
            cursor.execute("""
                SELECT mov_id, mov_tipo, mov_motivo, mov_fecha
                FROM movimientos
                ORDER BY mov_id DESC LIMIT 3
            """)
            for mv in cursor.fetchall():
                eventos.append({
                    'tipo': 'movimiento',
                    'texto': f"Movimiento {mv['mov_tipo'].lower()}: {mv['mov_motivo']}",
                    'orden': mv['mov_id']
                })

        except Error as e:
            print(f"[SELECT ERROR ACTIVIDAD] {e}")
        finally:
            cursor.close()
            conn.close()

    # Ordena todo por 'orden' descendente (más reciente primero) y limita a 6
    eventos.sort(key=lambda x: x['orden'], reverse=True)
    return jsonify(eventos[:6])

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
#  PROVEEDORES
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
#  MOVIMIENTOS
# ──────────────────────────────────────────
@app.route('/movimientos')
def movimientos_page():
    if not session.get('usuario_id'):
        return redirect(url_for('login_page'))

    conn = get_connection()
    movimientos = []
    if conn:
        try:
            cursor = conn.cursor(dictionary=True)
            cursor.execute("""
                SELECT m.mov_id, m.mov_tipo, m.mov_motivo,
                       m.mov_fecha, m.prod_id,
                       m.usu_id,
                       CONCAT(u.usu_nombre, ' ', u.usu_apellido) AS usu_nombre
                FROM movimientos m
                LEFT JOIN usuarios u ON u.usu_id = m.usu_id
                ORDER BY m.mov_fecha DESC
            """)
            movimientos = cursor.fetchall()
            # Convertir fechas a string para Jinja2
            for m in movimientos:
                if m['mov_fecha']:
                    m['mov_fecha'] = m['mov_fecha'].strftime('%Y-%m-%d')
        except Error as e:
            print(f"[SELECT ERROR MOVIMIENTOS] {e}")
        finally:
            cursor.close()
            conn.close()

    return render_template('movimientos.html',
                           movimientos=movimientos,
                           nombre=session.get('usuario_nombre'),
                           rol=session.get('usuario_rol'))


@app.route('/guardar_movimiento', methods=['POST'])
def guardar_movimiento():
    if not session.get('usuario_id'):
        return redirect(url_for('login_page'))

    mov_tipo   = request.form.get('mov_tipo', '').strip()
    mov_motivo = request.form.get('mov_motivo', '').strip()
    mov_fecha  = request.form.get('mov_fecha', '').strip()
    usu_id     = request.form.get('usu_id', '').strip()

    if not all([mov_tipo, mov_motivo, mov_fecha, usu_id]):
        return redirect(url_for('movimientos_page'))

    conn = get_connection()
    if conn:
        try:
            cursor = conn.cursor()
            prod_id = request.form.get('prod_id', '1').strip() or '1'
            cursor.execute("""
                INSERT INTO movimientos (mov_tipo, mov_motivo, mov_fecha, usu_id, prod_id)
                VALUES (%s, %s, %s, %s, %s)
            """, (mov_tipo, mov_motivo, mov_fecha, usu_id, prod_id))
            conn.commit()
        except Error as e:
            print(f"[INSERT ERROR MOVIMIENTOS] {e}")
        finally:
            cursor.close()
            conn.close()

    return redirect(url_for('movimientos_page'))


@app.route('/api/movimientos', methods=['GET'])
def api_movimientos():
    if not session.get('usuario_id'):
        return jsonify({'ok': False, 'mensaje': 'No autorizado'}), 401

    conn = get_connection()
    if not conn:
        return jsonify({'ok': False, 'mensaje': 'Error de conexión con la base de datos'}), 500

    try:
        cursor = conn.cursor(dictionary=True)
        cursor.execute("""
            SELECT m.mov_id, m.mov_tipo, m.mov_motivo,
                   CONCAT(u.usu_nombre, ' ', u.usu_apellido) AS usu_nombre,
                   m.mov_fecha, m.prod_id
            FROM movimientos m
            LEFT JOIN usuarios u ON m.usu_id = u.usu_id
            ORDER BY m.mov_id ASC
        """)
        movimientos = cursor.fetchall()
        for m in movimientos:
            if m['mov_fecha']:
                m['mov_fecha'] = m['mov_fecha'].strftime('%d/%m/%Y')
        return jsonify(movimientos)

    except Error as e:
        print(f"[SELECT ERROR MOVIMIENTOS] {e}")
        return jsonify({'ok': False, 'mensaje': 'Error al consultar movimientos'}), 500
    finally:
        cursor.close()
        conn.close()

# =====================================
# API CRUD MOTOS
# =====================================
@app.route('/motos')
def modulo_motos():
    if not session.get('usuario_id'):
        return redirect(url_for('login_page'))

    conn = get_connection()
    cursor = conn.cursor(dictionary=True)

    cursor.execute("""
        SELECT mot_id, mot_placa, mot_marca, mot_modelo, mot_cilindraje, mot_color, mot_estado, cli_id 
        FROM motos 
        ORDER BY mot_id ASC
    """)
    lista_motos = cursor.fetchall()

    cursor.execute("SELECT COUNT(*) AS total FROM motos")
    total_motos = cursor.fetchone()['total']

    cursor.execute("SELECT COUNT(*) AS total FROM motos WHERE mot_estado = 'activo'")
    en_servicio = cursor.fetchone()['total']

    cursor.execute("SELECT COUNT(*) AS total FROM motos WHERE mot_estado = 'reparacion'")
    en_reparacion = cursor.fetchone()['total']

    cursor.execute("SELECT COUNT(*) AS total FROM motos WHERE mot_estado = 'espera'")
    en_espera = cursor.fetchone()['total']

    cursor.close()
    conn.close()

    return render_template(
        'motos.html',
        motos=lista_motos,
        total_motos=total_motos,
        en_servicio=en_servicio,
        en_reparacion=en_reparacion,
        en_espera=en_espera,
        nombre=session.get('usuario_nombre'),
        rol=session.get('usuario_rol')
    )

@app.route('/api/motos', methods=['GET'])
def obtener_motos():
    if not session.get('usuario_id'):
        return jsonify([])

    conn = None
    cursor = None

    try:
        conn = get_connection()
        cursor = conn.cursor(dictionary=True)

        cursor.execute("""
            SELECT mot_id, mot_placa, mot_marca, mot_modelo,
                   mot_cilindraje, mot_color, mot_estado, cli_id
            FROM motos
            ORDER BY mot_id ASC
        """)

        return jsonify(cursor.fetchall())

    except Exception as e:
        print(f"Error en obtener_motos: {e}")
        return jsonify([])

    finally:
        if cursor: cursor.close()
        if conn: conn.close()


@app.route('/api/motos', methods=['POST'])
def crear_moto():
    if not session.get('usuario_id'):
        return jsonify({'ok': False}), 401

    data = request.get_json(force=True)
    conn = None
    cursor = None

    try:
        conn = get_connection()
        cursor = conn.cursor()

        cursor.execute("""
            INSERT INTO motos
            (mot_placa, mot_marca, mot_modelo, mot_cilindraje, mot_color, mot_estado, cli_id)
            VALUES (%s, %s, %s, %s, %s, %s, %s)
        """, (
            data['placa'], data['marca'], data['modelo'],
            data['cilindraje'], data['color'], data['estado'], data['cli_id']
        ))

        conn.commit()
        return jsonify({'ok': True, 'mensaje': 'Moto creada con éxito'})

    except Exception as e:
        print(f"Error en crear_moto: {e}")
        return jsonify({'ok': False, 'mensaje': 'Error al crear moto'})

    finally:
        if cursor: cursor.close()
        if conn: conn.close()


@app.route('/api/motos/<int:id>', methods=['PUT'])
def actualizar_moto(id):
    if not session.get('usuario_id'):
        return jsonify({'ok': False}), 401

    data = request.get_json(force=True)
    conn = None
    cursor = None

    try:
        conn = get_connection()
        cursor = conn.cursor()

        cursor.execute("""
            UPDATE motos
            SET mot_placa=%s, mot_marca=%s, mot_modelo=%s,
                mot_cilindraje=%s, mot_color=%s, mot_estado=%s, cli_id=%s
            WHERE mot_id=%s
        """, (
            data['placa'], data['marca'], data['modelo'],
            data['cilindraje'], data['color'], data['estado'],
            data['cli_id'], id
        ))

        conn.commit()
        return jsonify({'ok': True, 'mensaje': 'Moto actualizada con éxito'})

    except Exception as e:
        print(f"Error en actualizar_moto: {e}")
        return jsonify({'ok': False, 'mensaje': 'Error al actualizar'})

    finally:
        if cursor: cursor.close()
        if conn: conn.close()


@app.route('/api/motos/<int:id>', methods=['DELETE'])
def eliminar_moto(id):
    if not session.get('usuario_id'):
        return jsonify({'ok': False}), 401

    conn = None
    cursor = None

    try:
        conn = get_connection()
        cursor = conn.cursor()
        cursor.execute("DELETE FROM motos WHERE mot_id = %s", (id,))
        conn.commit()
        return jsonify({'ok': True, 'mensaje': 'Moto eliminada con éxito'})

    except Exception as e:
        print(f"Error en eliminar_moto: {e}")
        return jsonify({'ok': False, 'mensaje': 'Error al eliminar'})

    finally:
        if cursor: cursor.close()
        if conn: conn.close()


# ──────────────────────────────────────────
#  MÓDULO PRODUCTOS
# ──────────────────────────────────────────

# 1. ESTA ES LA VISTA (El plato: carga el diseño HTML)
@app.route('/productos')
@login_requerido
def productos():
    return render_template(
        'productos.html',
        nombre=session.get('usuario_nombre'),
        rol=session.get('usuario_rol')
    )


# 2. ESTA ES LA API (La comida: trae los datos de la base de datos)
# ── GET /api/productos  →  lista completa con categoría y proveedor ──
@app.route('/api/productos', methods=['GET'])
@login_requerido
def api_get_productos():
    conn = get_connection()
    if not conn:
        return jsonify({'ok': False, 'mensaje': 'Error de conexión'}), 500
    try:
        cursor = conn.cursor(dictionary=True)
        cursor.execute("""
            SELECT p.prod_id,
                   p.prod_nombre,
                   p.prod_descripcion,
                   p.prod_precio_venta,
                   p.prod_estado,
                   p.prod_stock,
                   p.cat_id,
                   c.cat_nombre,
                   p.prov_id,
                   pr.prov_nombre
            FROM   productos   p
            JOIN   categorias  c  ON c.cat_id   = p.cat_id
            JOIN   proveedores pr ON pr.prov_id  = p.prov_id
            ORDER  BY p.prod_id
        """)
        return jsonify({'ok': True, 'productos': cursor.fetchall()})
    except Error as e:
        print(f"[GET PRODUCTOS] {e}")
        return jsonify({'ok': False, 'mensaje': 'Error al obtener productos'}), 500
    finally:
        cursor.close()
        conn.close()


# ── POST /api/productos  →  crear producto (solo admin) ───────
@app.route('/api/productos', methods=['POST'])
@solo_admin
def api_crear_producto():
    data        = request.get_json(force=True)
    nombre      = data.get('nombre', '').strip()
    descripcion = data.get('descripcion', '').strip()
    precio      = data.get('precio_venta')
    stock       = data.get('stock')
    estado      = data.get('estado', 'Activo').strip()
    cat_id      = data.get('cat_id')
    prov_id     = data.get('prov_id')

    if not all([nombre, precio is not None, stock is not None, cat_id, prov_id]):
        return jsonify({'ok': False, 'mensaje': 'Completa todos los campos obligatorios'}), 400

    conn = get_connection()
    if not conn:
        return jsonify({'ok': False, 'mensaje': 'Error de conexión'}), 500
    try:
        cursor = conn.cursor()
        cursor.execute("""
            INSERT INTO productos
                (prod_nombre, prod_descripcion, prod_precio_venta, prod_estado, prod_stock, cat_id, prov_id)
            VALUES (%s, %s, %s, %s, %s, %s, %s)
        """, (nombre, descripcion or None, precio, estado, stock, cat_id, prov_id))
        conn.commit()
        return jsonify({'ok': True, 'mensaje': f'Producto "{nombre}" creado correctamente'})
    except Error as e:
        print(f"[INSERT PRODUCTO] {e}")
        return jsonify({'ok': False, 'mensaje': 'Error al guardar el producto'}), 500
    finally:
        cursor.close()
        conn.close()


# ── PUT /api/productos/<id>  →  editar producto (solo admin) ──
@app.route('/api/productos/<int:prod_id>', methods=['PUT'])
@solo_admin
def api_editar_producto(prod_id):
    data        = request.get_json(force=True)
    nombre      = data.get('nombre', '').strip()
    descripcion = data.get('descripcion', '').strip()
    precio      = data.get('precio_venta')
    stock       = data.get('stock')
    estado      = data.get('estado', 'Activo').strip()
    cat_id      = data.get('cat_id')
    prov_id     = data.get('prov_id')

    if not all([nombre, precio is not None, stock is not None, cat_id, prov_id]):
        return jsonify({'ok': False, 'mensaje': 'Completa todos los campos obligatorios'}), 400

    conn = get_connection()
    if not conn:
        return jsonify({'ok': False, 'mensaje': 'Error de conexión'}), 500
    try:
        cursor = conn.cursor()
        cursor.execute("""
            UPDATE productos
            SET    prod_nombre       = %s,
                   prod_descripcion  = %s,
                   prod_precio_venta = %s,
                   prod_estado       = %s,
                   prod_stock        = %s,
                   cat_id            = %s,
                   prov_id           = %s
            WHERE  prod_id = %s
        """, (nombre, descripcion or None, precio, estado, stock, cat_id, prov_id, prod_id))
        conn.commit()
        if cursor.rowcount == 0:
            return jsonify({'ok': False, 'mensaje': 'Producto no encontrado'}), 404
        return jsonify({'ok': True, 'mensaje': f'Producto "{nombre}" actualizado correctamente'})
    except Error as e:
        print(f"[UPDATE PRODUCTO] {e}")
        return jsonify({'ok': False, 'mensaje': 'Error al actualizar el producto'}), 500
    finally:
        cursor.close()
        conn.close()


# ── DELETE /api/productos/<id>  →  eliminar producto (solo admin) ──
@app.route('/api/productos/<int:prod_id>', methods=['DELETE'])
@solo_admin
def api_eliminar_producto(prod_id):
    conn = get_connection()
    if not conn:
        return jsonify({'ok': False, 'mensaje': 'Error de conexión'}), 500
    try:
        cursor = conn.cursor(dictionary=True)

        # Verificar que no esté en facturas ni movimientos
        cursor.execute("SELECT COUNT(*) AS total FROM detalle_facturas WHERE prod_id = %s", (prod_id,))
        if cursor.fetchone()['total'] > 0:
            return jsonify({'ok': False, 'mensaje': 'No se puede eliminar: el producto tiene facturas asociadas'}), 409

        cursor.execute("SELECT COUNT(*) AS total FROM detalle_movimientos WHERE prod_id = %s", (prod_id,))
        if cursor.fetchone()['total'] > 0:
            return jsonify({'ok': False, 'mensaje': 'No se puede eliminar: el producto tiene movimientos de inventario'}), 409

        cursor.execute("SELECT prod_nombre FROM productos WHERE prod_id = %s", (prod_id,))
        row = cursor.fetchone()
        if not row:
            return jsonify({'ok': False, 'mensaje': 'Producto no encontrado'}), 404

        cursor.execute("DELETE FROM productos WHERE prod_id = %s", (prod_id,))
        conn.commit()
        return jsonify({'ok': True, 'mensaje': f'Producto "{row["prod_nombre"]}" eliminado correctamente'})
    except Error as e:
        print(f"[DELETE PRODUCTO] {e}")
        return jsonify({'ok': False, 'mensaje': 'Error al eliminar el producto'}), 500
    finally:
        cursor.close()
        conn.close()


# ── GET /api/categorias  →  para poblar selects ───────────────
@app.route('/api/categorias', methods=['GET'])
@login_requerido
def api_get_categorias():
    conn = get_connection()
    if not conn:
        return jsonify({'ok': False, 'mensaje': 'Error de conexión'}), 500
    try:
        cursor = conn.cursor(dictionary=True)
        cursor.execute("SELECT cat_id, cat_nombre FROM categorias ORDER BY cat_nombre")
        return jsonify({'ok': True, 'categorias': cursor.fetchall()})
    except Error as e:
        print(f"[GET CATEGORIAS] {e}")
        return jsonify({'ok': False, 'mensaje': 'Error al obtener categorías'}), 500
    finally:
        cursor.close()
        conn.close()


# ── GET /api/proveedores  →  para poblar selects ──────────────
@app.route('/api/proveedores', methods=['GET'])
@login_requerido
def api_get_proveedores():
    conn = get_connection()
    if not conn:
        return jsonify({'ok': False, 'mensaje': 'Error de conexión'}), 500
    try:
        cursor = conn.cursor(dictionary=True)
        cursor.execute("SELECT prov_id, prov_nombre FROM proveedores ORDER BY prov_nombre")
        return jsonify({'ok': True, 'proveedores': cursor.fetchall()})
    except Error as e:
        print(f"[GET PROVEEDORES] {e}")
        return jsonify({'ok': False, 'mensaje': 'Error al obtener proveedores'}), 500
    finally:
        cursor.close()
        conn.close()

# ──────────────────────────────────────────
#  FACTURACIÓN
# ──────────────────────────────────────────
@app.route('/facturacion', methods=['GET'])
def facturacion_page():
    if not session.get('usuario_id'):
        return redirect(url_for('login_page'))

    conn = get_connection()
    facturas = []
    if conn:
        try:
            cursor = conn.cursor(dictionary=True)
            # Trae todas las facturas con sus detalles en JOIN
            cursor.execute("""
                SELECT
                    f.fac_id,
                    f.fac_fecha_emision,
                    f.fac_total,
                    f.ord_id,
                    f.cli_id,
                    d.det_fact_id,
                    d.prod_id,
                    d.det_fact_cant,
                    d.precio_unitario,
                    d.subtotal,
                    d.det_fact_servicio,
                    d.usu_id
                FROM facturacion f
                LEFT JOIN detalle_facturas d ON d.fac_id = f.fac_id
                ORDER BY f.fac_id DESC, d.det_fact_id ASC
            """)
            rows = cursor.fetchall()

            # Agrupar detalles por factura
            facturas_dict = {}
            for row in rows:
                fid = row['fac_id']
                if fid not in facturas_dict:
                    facturas_dict[fid] = {
                        'fac_id':            row['fac_id'],
                        'fac_fecha_emision': row['fac_fecha_emision'].strftime('%Y-%m-%d') if row['fac_fecha_emision'] else '',
                        'fac_total':         row['fac_total'],
                        'ord_id':            row['ord_id'],
                        'cli_id':            row['cli_id'],
                        'detalles':          []
                    }
                if row['det_fact_id']:
                    facturas_dict[fid]['detalles'].append({
                        'det_fact_id':       row['det_fact_id'],
                        'prod_id':           row['prod_id'],
                        'det_fact_cant':     row['det_fact_cant'],
                        'precio_unitario':   row['precio_unitario'],
                        'subtotal':          row['subtotal'],
                        'det_fact_servicio': row['det_fact_servicio'],
                        'usu_id':            row['usu_id'],
                    })

            facturas = list(facturas_dict.values())

        except Error as e:
            print(f"[SELECT ERROR FACTURAS] {e}")
        finally:
            cursor.close()
            conn.close()

    return render_template('facturacion.html',
                           facturas=facturas,
                           nombre=session.get('usuario_nombre'),
                           rol=session.get('usuario_rol'))


@app.route('/facturacion', methods=['POST'])
def guardar_factura():
    if not session.get('usuario_id'):
        return redirect(url_for('login_page'))

    fecha   = request.form.get('fecha', '').strip()
    total   = request.form.get('total', '').strip()
    orden   = request.form.get('orden', '').strip()
    cliente = request.form.get('cliente', '').strip()

    if not all([fecha, total, orden, cliente]):
        return redirect(url_for('facturacion_page'))

    conn = get_connection()
    if conn:
        try:
            cursor = conn.cursor()
            cursor.execute("""
                INSERT INTO facturacion (fac_fecha_emision, fac_total, ord_id, cli_id)
                VALUES (%s, %s, %s, %s)
            """, (fecha, total, orden, cliente))
            conn.commit()
        except Error as e:
            print(f"[INSERT ERROR FACTURAS] {e}")
        finally:
            cursor.close()
            conn.close()

    return redirect(url_for('facturacion_page'))

# ──────────────────────────────────────────
#  CLIENTES
# ──────────────────────────────────────────
@app.route('/clientes', methods=['GET'])
def clientes_page():
    if not session.get('usuario_id'):
        return redirect(url_for('login_page'))

    conn = get_connection()
    clientes = []
    if conn:
        try:
            cursor = conn.cursor(dictionary=True)
            cursor.execute("""
                SELECT cli_id, cli_nombre, cli_apellido, cli_telefono,
                       cli_correo, cli_direccion
                FROM clientes
                ORDER BY cli_id ASC 
            """)
            clientes = cursor.fetchall()
        except Error as e:
            print(f"[SELECT ERROR CLIENTES] {e}")
        finally:
            cursor.close()
            conn.close()

    return render_template('clientes.html',
                           clientes=clientes,
                           nombre=session.get('usuario_nombre'),
                           rol=session.get('usuario_rol'))


@app.route('/api/clientes', methods=['POST'])
def api_registrar_cliente():
    if not session.get('usuario_id'):
        return jsonify({'ok': False, 'mensaje': 'No autorizado'}), 401

    data      = request.get_json(force=True)
    nombre    = data.get('nombre', '').strip()
    apellido  = data.get('apellido', '').strip()
    telefono  = data.get('telefono', '').strip()
    correo    = data.get('correo', '').strip()
    direccion = data.get('direccion', '').strip()

    if not nombre or not apellido or not telefono:
        return jsonify({'ok': False, 'mensaje': 'Nombre, apellido y teléfono son obligatorios'}), 400

    conn = get_connection()
    if not conn:
        return jsonify({'ok': False, 'mensaje': 'Error de conexión con la base de datos'}), 500

    try:
        cursor = conn.cursor(dictionary=True)
        cursor.execute("""
            INSERT INTO clientes (cli_nombre, cli_apellido, cli_telefono, cli_correo, cli_direccion)
            VALUES (%s, %s, %s, %s, %s)
        """, (nombre, apellido, telefono, correo or None, direccion or None))
        conn.commit()
        return jsonify({'ok': True, 'mensaje': f'Cliente "{nombre} {apellido}" registrado con éxito.'})

    except Error as e:
        print(f"[INSERT ERROR CLIENTE] {e}")
        return jsonify({'ok': False, 'mensaje': 'Error al guardar el cliente'}), 500
    finally:
        cursor.close()
        conn.close()


@app.route('/api/clientes/<int:id>', methods=['PUT'])
def api_actualizar_cliente(id):
    if not session.get('usuario_id'):
        return jsonify({'ok': False, 'mensaje': 'No autorizado'}), 401

    data      = request.get_json(force=True)
    nombre    = data.get('nombre', '').strip()
    apellido  = data.get('apellido', '').strip()
    telefono  = data.get('telefono', '').strip()
    correo    = data.get('correo', '').strip()
    direccion = data.get('direccion', '').strip()

    if not nombre or not apellido or not telefono:
        return jsonify({'ok': False, 'mensaje': 'Nombre, apellido y teléfono son obligatorios'}), 400

    conn = get_connection()
    if not conn:
        return jsonify({'ok': False, 'mensaje': 'Error de conexión con la base de datos'}), 500

    try:
        cursor = conn.cursor()
        cursor.execute("""
            UPDATE clientes
            SET cli_nombre=%s, cli_apellido=%s, cli_telefono=%s,
                cli_correo=%s, cli_direccion=%s
            WHERE cli_id=%s
        """, (nombre, apellido, telefono, correo or None, direccion or None, id))
        conn.commit()

        if cursor.rowcount == 0:
            return jsonify({'ok': False, 'mensaje': 'Cliente no encontrado'}), 404

        return jsonify({'ok': True, 'mensaje': 'Cliente actualizado con éxito'})

    except Error as e:
        print(f"[UPDATE ERROR CLIENTE] {e}")
        return jsonify({'ok': False, 'mensaje': 'Error al actualizar el cliente'}), 500
    finally:
        cursor.close()
        conn.close()


@app.route('/api/clientes/<int:id>', methods=['DELETE'])
def api_eliminar_cliente(id):
    if not session.get('usuario_id'):
        return jsonify({'ok': False, 'mensaje': 'No autorizado'}), 401

    conn = get_connection()
    if not conn:
        return jsonify({'ok': False, 'mensaje': 'Error de conexión con la base de datos'}), 500

    try:
        cursor = conn.cursor()
        cursor.execute("DELETE FROM clientes WHERE cli_id = %s", (id,))
        conn.commit()

        if cursor.rowcount == 0:
            return jsonify({'ok': False, 'mensaje': 'Cliente no encontrado'}), 404

        return jsonify({'ok': True, 'mensaje': 'Cliente eliminado con éxito'})

    except Error as e:
        print(f"[DELETE ERROR CLIENTE] {e}")
        return jsonify({'ok': False, 'mensaje': 'Error al eliminar el cliente'}), 500
    finally:
        cursor.close()
        conn.close()


@app.route('/ordenes')
def modulo_ordenes():
    if not session.get('usuario_id'):
        return redirect(url_for('login_page'))

    conn = get_connection()
    cursor = conn.cursor(dictionary=True)

    cursor.execute("""
        SELECT
            o.ord_id,
            o.ord_fecha_ingreso,
            o.ord_fecha_entrega,
            o.ord_estado,
            o.ord_descripcion,
            m.mot_placa,
            CONCAT(c.cli_nombre, ' ', c.cli_apellido) AS cliente_nombre,
            CONCAT(u.usu_nombre, ' ', u.usu_apellido) AS usuario_nombre
        FROM orden_servicios o
        LEFT JOIN motos m    ON m.mot_id = o.mot_id
        LEFT JOIN clientes c ON c.cli_id = o.cli_id
        LEFT JOIN usuarios u ON u.usu_id = o.usu_id
        ORDER BY o.ord_id DESC
    """)

    ordenes = cursor.fetchall()

    cursor.close()
    conn.close()

    return render_template(
        'orden_servicios.html',
        ordenes=ordenes,
        nombre=session.get('usuario_nombre'),
        rol=session.get('usuario_rol')
    )


@app.route('/guardar_orden', methods=['POST'])
def guardar_orden():
    if not session.get('usuario_id'):
        return redirect(url_for('login_page'))

    ord_estado = request.form['ord_estado']
    ord_descripcion = request.form['ord_descripcion']
    ord_fecha_ingreso = request.form['ord_fecha_ingreso']
    ord_fecha_entrega = request.form['ord_fecha_entrega'] or None
    mot_id = request.form['moto_id']
    cli_id = request.form['cli_id']
    usu_id = request.form['usu_id']

    conn = get_connection()
    cursor = conn.cursor()

    cursor.execute("""
        INSERT INTO orden_servicios (
            ord_fecha_ingreso,
            ord_fecha_entrega,
            ord_estado,
            ord_descripcion,
            mot_id,
            cli_id,
            usu_id
        )
        VALUES (%s,%s,%s,%s,%s,%s,%s)
    """, (
        ord_fecha_ingreso,
        ord_fecha_entrega,
        ord_estado,
        ord_descripcion,
        mot_id,
        cli_id,
        usu_id
    ))

    conn.commit()

    cursor.close()
    conn.close()

    return redirect(url_for('modulo_ordenes'))

if __name__ == '__main__':
    app.run(debug=True, port=5000)

 