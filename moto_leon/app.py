from flask import Flask, render_template, request
import mysql.connector

app = Flask(__name__)

# CONEXION MYSQL
conexion = mysql.connector.connect(
    host="localhost",
    user="root",
    password="",
    database="moto_repuestos_leon"
)

cursor = conexion.cursor(dictionary=True)

# PAGINA PRINCIPAL
@app.route("/")
def inicio():
    return render_template("pagina.html")


# FACTURACION
@app.route("/facturacion", methods=["GET", "POST"])
def facturacion():

    # GUARDAR FACTURA
    if request.method == "POST":

        fecha = request.form.get("fecha")
        total = request.form.get("total")
        orden = request.form.get("orden")
        cliente = request.form.get("cliente")

        sql = """
        INSERT INTO facturas
        (fac_fecha_emision, fac_total, ord_id, cli_id)
        VALUES (%s, %s, %s, %s)
        """

        valores = (fecha, total, orden, cliente)

        cursor.execute(sql, valores)
        conexion.commit()

    # MOSTRAR FACTURAS
    cursor.execute("""
        SELECT * FROM facturas
        ORDER BY fac_id DESC
    """)

    facturas = cursor.fetchall()

    return render_template(
        "facturacion.html",
        facturas=facturas
    )


# EJECUTAR SERVIDOR
if __name__ == "__main__":
    app.run(
        host="0.0.0.0",
        port=5000,
        debug=True
    )