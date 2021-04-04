# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

usuario = Usuario.create({username: "juan", email: "juan@gmail.com", password: "123456"})
puts "Usuario creado."

productos = [
  { nombre: "Mofle 1", codigo: "mofle_1", existencia: 20, precio_de_compra: 10,
    type: "Mofle", usuario: usuario },
  { nombre: "Junta 1", codigo: "junta_1", existencia: 5, precio_de_compra: 10,
    type: "Junta", usuario: usuario },
  { nombre: "Aro 1", codigo: "aro_1", existencia: 10, precio_de_compra: 10,
    type: "Aro", usuario: usuario },
]
Producto.create(productos)
puts "Productos creados."
