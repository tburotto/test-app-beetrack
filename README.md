# Prueba Tecnica Beetrack - Tomas Burotto

Esta app fue hecha con el objetivo de demostrar conocimientos en RoR. Esta simple app permite entrar ubicaciones GPS por vehículos segun su matricula. Estos se despliegan en un mapa en la ruta /show.

## Versiones
Esta app está basada en ruby 2.6.3 y rails 6.0

## Modelo
La base de datos se configuró en PostgreSQL. Existen dos entidades principales que se relacionan 1:N. Estados entidades son las siguientes:
- Vehicles, posee los atributos (id: integer, identifier: string). 
- Tracks, posee los atributos (id: integer, latitude: float, longitude: float, send_at: timestamp). Esta entidad pertenece a Vehicles.

## API
Esta aplicación cuenta con dos endpooints de API
1. El primero es el endpoint GET en la ruta /api/v1/gps. Este endpoint no requiere de credenciales ni headers. Retorna un array de JSON con los tracks GPS que existen en la base de datos. Los JSON de los tracks GPS son de la forma:

{id: integer, latitude: float, longitude: float, send_at: timestamp}

2. El segundo endpoint es un POST en la ruta /api/v1/gps. Este enpoint tiene como por objetivo registrar los puntos GPS introducidos según la matrícula que se introduzca. Requiere los suiguientes parámetros para crear un track nuevo.
{latitude: float, longitude: float, send_at: timestamp(str), vehicle_identifier: string}
Si se crea correctamente el track, se retorna un JSON con el track y el status 201 (creado)

## Vista Mapa
Se creó una vista en la ruta /show para mostrar la última posición GPS introducida de los vehículos. Para realizar esto se utilizó Leaflet en conjunto con los mapas de Open Street Map. Esta vista consulta los vehículos existentes y su último track registrado segun los timestamps y los despliega sobre el mapa como puntos GPS. 

## Controladores
Existen dos controladores dentro de la app en RoR. El primero dentro de la carpeta api/v1/gps se encarga de manejar el backend de la API. Para esto estan los metodos index y create. Index controla el método GET de la API. Crate controla el metodo POST de la API. El segundo controlador es show. Este envía los datos necesarios para la vista que despliega los puntos GPS en el mapa. Solo posee el método index que busca todos los vehiculos y el último track GPS por vehículo existente. 

## Producción
La aplicación fue montada en ambiente de producción usando heroku: https://whispering-harbor-60707.herokuapp.com/show