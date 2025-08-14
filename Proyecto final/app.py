import sqlite3
from flask import Flask, g, request, jsonify

app = Flask(__name__)
app.config['DATABASE'] = 'hamburgueseria.db'

def get_db():
    if 'db' not in g:
        g.db = sqlite3.connect(
            app.config['DATABASE'],
            detect_types=sqlite3.PARSE_DECLTYPES
        )
        g.db.row_factory = sqlite3.Row  # devuelve filas como diccionarios
    return g.db

# Cierra la conexión cuando termina la petición
def close_db(e=None):
    db = g.pop('db', None)

    if db is not None:
        db.close()





@app.route('/stock', methods=['GET'])
def listar_usuarios():
    db = get_db()
    resultado = db.execute('SELECT * FROM Stock').fetchall()
    return {
        'Stock': [dict(row) for row in resultado]
    }

if __name__ == '__main__':
    app.run(debug=True)



@app.route('/stock/agregar', methods=['POST'])
def agregar():
    data = request.get_json()#Le envia el request en formato json
    db = get_db()
    cursor = db.cursor()# el cursor es para ejecutar mejor las sentencias de sql 
    cursor.execute(   'INSERT INTO Stock (Producto, Cantidad) VALUES (?, ?)',
        (data['Producto'], data['Cantidad']))
    
    db.commit()#para guardar los cambios
    return "funciono"


@app.route('/stock/<int:stock_id>', methods=['DELETE'])
def eliminar_stock(stock_id):
    db = get_db()
    cursor = db.execute('DELETE FROM Stock WHERE id_Stock = ?', (stock_id,))
    db.commit()  # Guardar cambios en la base de datos

    if cursor.rowcount == 0:
        return {'mensaje': 'No se encontró el registro'}, 404

    return {'mensaje': f'Stock con ID {stock_id} eliminado correctamente'}



# mas adelante modificar la ruta por que son las misma que la de borrar



from flask import request

@app.route('/stock/<int:stock_id>', methods=['PUT']) 
def modificar_stock(stock_id):
    datos = request.get_json()  # Recibe datos en formato JSON

    # Validar que vengan los datos necesarios
    if not datos or 'cantidad' not in datos:
        return {'mensaje': 'Falta el campo cantidad'}, 400

    nueva_cantidad = datos['cantidad']

    db = get_db()
    cursor = db.execute(
        'UPDATE Stock SET cantidad = ? WHERE id_Stock = ?',
        (nueva_cantidad, stock_id)
    )
    db.commit()

    if cursor.rowcount == 0:
        return {'mensaje': 'No se encontró el registro'}, 404

    return {'mensaje': f'Stock con ID {stock_id} actualizado correctamente'}





