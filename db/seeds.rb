# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Carrier.create({name: 'FEDEX'})

DistanceUnit.create({key:'CM', name:'Centimeters', description: 'Centimeters'})
DistanceUnit.create({key:'IN', name:'Inches', description: 'Inches'})

MassUnit.create({key:'KG', name:'Kilograms', description: 'Kilograms'})
MassUnit.create({key:'LB', name:'Pounds', description: 'Pounds'})
