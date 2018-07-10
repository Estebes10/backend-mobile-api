# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Crear los 3 tipos de solicitudes por default
load File.expand_path('../seeds/requests.rb', __FILE__)

# Crear los difernetes tipos de eventos por tipo solicitud
load File.expand_path('../seeds/events.rb', __FILE__)

# Crear las diferentes situaciones, las cuales se mostraran como un selector en
# el formulario para generar los diferentes reportes, incidencias o solicitudes.
load File.expand_path('../seeds/situations.rb', __FILE__)
