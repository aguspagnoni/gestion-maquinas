# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
gematic = Client.create(company_name: 'Gematic', address: 'Almafuerte 4277', telephone: '47568012', email: 'info@gematic.com.ar')
Location.create(short_name: 'STOCK', address: 'Almafuerte 4277', client: gematic)
