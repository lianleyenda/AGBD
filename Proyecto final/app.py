import mysql.connector
from flask import Flask, g, request, jsonify

app = Flask(__name__)



#crea la conxion
def get_db():
    conn = mysql.connector.connect(**data)
    return conn





@app.route('/stock', methods=['GET'])
def listar_usuarios():
 db = get_db()
 cursor = db.cursor(dictionary=True)  # dictionary=True para obtener diccionarios
 cursor.execute('SELECT * FROM Stock')
 resultado = cursor.fetchall()
 return jsonify({'Stock': resultado})
   


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




@app.route('/registro', methods=['POST'])
def registrar_usuario():
   data = request.get_json()
   if not data or 'Usuario' not in data or 'Email' not in data or 'Password' not in data:
       return {'mensaje': 'Faltan datos'}, 400


   nombre = data['Usuario']
   email = data['Email']
   password = ['Password']

   db = get_db()
   
   cursor = db.cursor()
   cursor.execute('INSERT INTO usuarios (Usuario, Email, Password) VALUES (?, ?, ?)',
                      (nombre, email, password))
   db.commit()
    
   return {'mensaje': 'El email ya está registrado'}, 400






