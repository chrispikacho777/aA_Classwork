# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Cat.destroy_all

a = Cat.create([birth_date: '2000/01/01', color: 'white', name: 'a', sex: 'F'])
b = Cat.create([birth_date: '2001/01/01', color: 'black', name: 'b', sex: 'M'])
c = Cat.create([birth_date: '2002/01/01', color: 'brown', name: 'c', sex: 'F'])
d = Cat.create([birth_date: '2003/01/01', color: 'orange', name: 'd', sex: 'M'])
e = Cat.create([birth_date: '2004/01/01', color: 'white', name: 'e', sex: 'F'])
f = Cat.create([birth_date: '2005/01/01', color: 'brown', name: 'f', sex: 'M'])