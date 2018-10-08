# Test Runa

ruby version 2.5.1p57  
rails version 5.1.3

----

## EndPoints
Ruta HTTP | funcionalidad | Usuario
-- | -- | --
POST /auth/login | login | admin/empleado
GET /users | lista todo los usuarios | admin
GET /users/:id | muestra al usuario seleccionado | admin
POST /users | crea un usuario | admin
PUT/PATCH /user/:id | modifica el usuario seleccionado | admin
DELETE /users/:id | Borra el usuario seleccionado | admin
GET /users/:user_id/entry_times | lista las horas de entrada para ese usuario | admin/employee 
GET /users/:user_id/entry_times/:id | Muestra la una hora de entrada para un usuario | admin/employee
POST /users/:user_id/entry_times| Crea una hora de entrada | admin
PUT/PATCH /users/user_id/entry_times/:id | Modifica una hora de entrada | admin
DELETE /PATCH /users/user_id/entry_times/:id | borra una hora de entrada | admin
GET /users/:user_id/off_times | Lista las horas de salida para un usuario | admin/empleado
GET /users/:user_id/off_times/:id | Muestra una hora especifica de salida | admin/empleado
POST /users/:user_id/off_times | Crea una hora de salida | admin
PUT/PATCH /users/:user_id/off_times | Modifica una hora de salida | admin
DELETE /users/:user_id/off_times/:id | Elimina una hora de salida | admin
GET /employee_records | Muestra un conjunto con la fecha y las horas de entrada | admin/empleado

**Nota:** la ruta para cerrar sesión no existe. Se usó JWT como servicio para validar al usuario,
este no provee un método para destruir el token, pero si un tiempo activo. Para este caso se uso un
tiempo de expiración de 24 horas.

## Descripcion de los EndPoints
### POST /auth/login 
Genera un toquen de autenticidad.
{
	"auth_token": "token_generado"
}
### GET /users
Retorna
[  	
	{  
		{  
			'id': '1'  
			'email': 'myemail1@mail.com',  
	        'name': 'Juan',  
	        'lastName': 'perez',  
		    'docId': 'v-1234456',  
	        'phone': '123-456-789',  
	        'address': 'my direccion'  
		}  
		{  
			'id': '2'  
			'email': 'myemail2@mail.com',  
	        'name': 'Pedro',  
	        'lastName': 'Rodriguez',  
		    'docId': 'v-987653',  
	        'phone': '123-456-987',  
	        'address': 'my direccion 2'  
		}  
	}  
]  

### POST /users
Recibe como atributos:
Atributo | Tipo | Formato  
email | String | myemail@mail.com
password | String 
name | String 
lastName | String
docId | String
phone | String
address | String
admin | String | 'true' / 'false'

### GET /users/:user:id/entry_times
Retorna  
[  
	{  
		'id': '1',  
		recordEntry: '07:30:00'  
	}  
	{  
		'id': '2',  
		recordEntry: '07:30:00'  
	}  
]

### POST /users/:user:id/entry_times
Recine como atributos:  
recordEntry

### GET /users/:user:id/off_times
### POST /users/:user:id/off_times
Funcionan analogamente a las dos rutas antes descritas 
