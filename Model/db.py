# ──────────────────────────────────────────
#  CONFIGURACIÓN DE BASE DE DATOS
#  Archivo: Model/db.py
# ──────────────────────────────────────────
import mysql.connector
from mysql.connector import Error

DB_CONFIG = {
    'host':      'localhost',
    'port':       3306,
    'user':      'root',         # Cambia por tu usuario MySQL
    'password':  'javier9089',             # Cambia por tu contraseña MySQL
    'database':  'moto_repuestos_leon',
    'charset':   'utf8mb4',
    'collation': 'utf8mb4_general_ci',
}

def get_connection():
    """Retorna una conexión activa a MySQL."""
    try:
        return mysql.connector.connect(**DB_CONFIG)
    except Error as e:
        print(f"[DB ERROR] {e}")
        return None