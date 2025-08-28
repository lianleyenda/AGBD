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
    cursor.execute(   'INSERT INTO Stock (Producto, Cantidad) VALUES (%s, %s)',
        (data['Producto'], data['Cantidad']))
    
    db.commit()#para guardar los cambios
    return "funciono"


@app.route('/stock/<int:stock_id>', methods=['DELETE'])
def eliminar_stock(stock_id):
    db = get_db()
    cursor = db.execute('DELETE FROM Stock WHERE id_Stock = %s', (stock_id,))
    db.commit()  # Guardar cambios en la base de datos

    if cursor.rowcount == 0:
        return {'mensaje': 'No se encontró el registro'}, 404

    return {'mensaje': f'Stock con ID {stock_id} eliminado correctamente'}



# mas adelante modificar la ruta por que son las misma que la de borrar



from flask import request

@app.route('/stock/<int:stock_id>', methods=['PUT']) 
def modificar_stock(stock_id):
    data = request.get_json()  # Recibe datos en formato JSON

    # Validar que vengan los datos necesarios
    if not data or 'cantidad' not in data:
        return {'mensaje': 'Falta el campo cantidad'}, 400

    nueva_cantidad = data['cantidad']

    db = get_db()
    cursor = db.execute(
        'UPDATE Stock SET cantidad = %s WHERE id_Stock = %s',
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
   password = data['Password']

   db = get_db()
   
   cursor = db.cursor()
   cursor.execute('INSERT INTO Usuarios (Usuario, Email, Password) VALUES (%s, %s, %s)',
                      (nombre, email, password))
   db.commit()
    
   return {'mensaje': 'El email se registro registrado'}, 400



@app.route('/inicio', methods=['POST'])
def inicio():
   data = request.get_json()


   if not data or 'Email' not in data or 'Password' not in data:
       return {'mensaje': 'Faltan datos'}, 400


   email = data['Email']
   password = data['Password']


   db = get_db()
   cursor = db.cursor(dictionary=True)
# Usamos diccionario=True para acceder a los campos por nombre en lugar de por índice
# Sin esto, el cursor devuelve tuplas y habría que usar usuario[0], usuario[1], etc.




   cursor.execute("SELECT * FROM Usuarios WHERE Email = %s AND Password = %s", (email, password))
   usuario = cursor.fetchone()


   cursor.close()
   db.close()


   if usuario:
       return {'mensaje': 'Inicio de sesión exitoso', 'usuario': usuario}, 200
   else:
       return {'mensaje': 'Email o contraseña incorrectos'}, 401
   



@app.route('/inicio/cambiar/<int:id_Usuarios>', methods=['PUT'])
def modificar(id_Usuarios):
    data = request.get_json()
    if not data:
        return {'mensaje': 'Faltan llenar Usuario, Password o Email'}, 400

    mod_Usuario = data['Usuario']
    mod__Password = data['Password']
    mod_Email = data['Email']

    db = get_db()  # ejecutar la función
    cursor = db.cursor()
    cursor.execute(
        'UPDATE Usuarios SET Usuario = %s, Email = %s, Password = %s WHERE id_usuarios = %s',
        (mod_Usuario, mod_Email, mod__Password, id_Usuarios)
    )
    db.commit()

    if cursor.rowcount == 0:
        cursor.close()
        return {'mensaje': 'No se encuentra tu sesión'}, 404  

    return {'mensaje': f'Usuario con ID {id_Usuarios} actualizado correctamente: {mod_Usuario}, {mod__Password}, {mod_Email}'}













