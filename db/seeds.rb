# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(first_name: 'Max', last_name: 'Brijido', email: 'mbrijido@miuandes.cl', admin: true, phone: '666666661', address: 'Casa de Max 69', country: 'Chile', city: 'San Bernando', password: '123456')
User.create(first_name: 'Juanito', last_name: 'Perez', email: 'jperez@miuandes.cl', admin: false, phone: '666666661', address: 'Casa de Juan 69', country: 'Chile', city: 'San Miguel', password: '123456')
User.create(first_name: 'Alfonso', last_name: 'Zuniga', email: 'ajzuniga1@miuandes.cl', admin: false, phone: '666666661', address: 'Casa de Alf 69', country: 'Bolivia', city: 'Bolivian depa', password: '123456')
User.create(first_name: 'Jenifer', last_name: 'Lopez', email: 'jlo@miuandes.cl', admin: false, phone: '666666661', address: 'Casa de Jen 69', country: 'America', city: 'New York', password: '123456')

Project.create(title: 'Iphone', description: "An awesome devise for connecting people", goal: '12000', duration: '360', markdown: 'www.google.com', user_id: '1', outstanding: 'false')
Project.create(title: 'Lid Helmet', description: " A helmet that its unique design allows it to collapse down to easily fit into a backpack.", goal: '12000', duration: '360', markdown: 'www.google.com', user_id: '2', outstanding: 'false')
Project.create(title: 'Catolet', description: "Flushable toilet for cats.", goal: '2000', duration: '362', markdown: 'www.google.com', user_id: '3', outstanding: 'false')
Project.create(title: 'Rubbee X', description: "It’s a lightweight conversion device which will give any regular bike an electric makeover.", goal: '22000', duration: '400', markdown: 'www.google.com', user_id: '4', outstanding: 'false')
Project.create(title: 'Moai', description: "A glass-cleaning robot which autonomously propels itself around your fish tank, scrubbing algae as it goes. It can also monitor tank pH levels, salinity, ORP, temperature, and more.", goal: '2200', duration: '300', markdown: 'www.google.com', user_id: '2', outstanding: 'false')
Project.create(title: 'Makerbuino', description: "Why buy a handheld video game device when you can build your own? ", goal: '2200', duration: '300', markdown: 'www.google.com', user_id: '3', outstanding: 'false')
Project.create(title: 'Atari Pong', description: "Coffee table-sized tribute to one of the world’s first video games. Recreating Atari’s classic Pong by way of magnets and metal bars for controlling the physical game pieces.", goal: '2200', duration: '300', markdown: 'www.google.com', user_id: '4', outstanding: 'false')
