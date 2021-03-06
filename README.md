# Prueba Técnica Beetrack - Tomás Burotto

Esta app fue hecha con el objetivo de demostrar conocimientos en RoR. Esta simple app permite entrar ubicaciones GPS por vehículos segun su matricula. Estos se despliegan en un mapa en la ruta /show.

## Versiones de Ruby y Rails
Esta app está basada en ruby 2.6.3 y rails 6.0.2

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

## GIT
La aplicación fue desarrollada usando GIT, para esto se uso la rama master desde la cual se crearon subramas para cada feature de la app. Los commit siguen la guia de estilo usando git emoji commit. Se usó GitHub para almacenar el código remotamente. El link del repositorio es: https://github.com/tburotto/test-app-beetrack

## Instalación
Es necesario para usar localmente esta app en primer lugar tener instalado ruby 2.6.3 y rails 6.0.2. Luego es necesario usar yarn para instalar componentes node para esto correr el comando yarn install. Luego es necesario crear la base de datos usando rails db:create, a continuación debemeos correr las migraciones usando rails db:migrate en consola. Finalmente corremos el servidor de rails usando rails s. Nos dirigimos a localhost:3000/show para visualizar la vista del mapa.
