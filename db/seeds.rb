# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
AdminUser.first.update_attributes(enabled: true)
gematic = Client.create(company_name: 'Gematic', address: 'Almafuerte 4277', telephone: '47568012', email: 'info@gematic.com.ar')
gematic_location = Location.create(short_name: 'CASA CENTRAL', address: 'Almafuerte 4277', client: gematic)
Position.create(name: 'STOCK', location: gematic_location)
%w(BEBIDAS_CALIENTES DISPENSER_AGUA SNACKS DISPENSERS_HIGIENICOS).each { |category| Category.create(name: category.split('_').join(' ')) }
