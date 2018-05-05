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


Category.create(tag: "Tech")
Category.create(tag: "Sports")
Category.create(tag: "Animals")
Category.create(tag: "Geek")


Project.create(title: 'Iphone', description: "An awesome devise for connecting people", goal: '12000', duration: '360', markdown: 'www.google.com', user_id: '1', outstanding: 'false',category_ids:[1])
Project.create(title: 'Lid Helmet', description: " A helmet that its unique design allows it to collapse down to easily fit into a backpack.", goal: '12000', duration: '360', markdown: 'www.google.com', user_id: '2', outstanding: 'false',category_ids:[2])
Project.create(title: 'Catolet', description: "Flushable toilet for cats.", goal: '2000', duration: '362', markdown: 'www.google.com', user_id: '3', outstanding: 'false',category_ids:[3])
Project.create(title: 'Rubbee X', description: "It’s a lightweight conversion device which will give any regular bike an electric makeover.", goal: '22000', duration: '400', markdown: 'www.google.com', user_id: '4', outstanding: 'false',category_ids:[1,2])
Project.create(title: 'Moai', description: "A glass-cleaning robot which autonomously propels itself around your fish tank, scrubbing algae as it goes. It can also monitor tank pH levels, salinity, ORP, temperature, and more.", goal: '2200', duration: '300', markdown: 'www.google.com', user_id: '2', outstanding: 'false',category_ids:[1,3])
Project.create(title: 'Makerbuino', description: "Why buy a handheld video game device when you can build your own? ", goal: '2200', duration: '300', markdown: 'www.google.com', user_id: '3', outstanding: 'false',category_ids:[1,4])
Project.create(title: 'Atari Pong', description: "Coffee table-sized tribute to one of the world’s first video games. Recreating Atari’s classic Pong by way of magnets and metal bars for controlling the physical game pieces.", goal: '2200', duration: '300', markdown: 'www.google.com', user_id: '4', outstanding: 'false',category_ids:[1,4])

ProjectCategory.create(category_id: 1, project_id: 1)
ProjectCategory.create(category_id: 2, project_id: 2)
ProjectCategory.create(category_id: 3, project_id: 3)
ProjectCategory.create(category_id: 1, project_id: 4)
ProjectCategory.create(category_id: 2, project_id: 4)
ProjectCategory.create(category_id: 1, project_id: 5)
ProjectCategory.create(category_id: 3, project_id: 5)

ProjectCategory.create(category_id: 1, project_id: 6)
ProjectCategory.create(category_id: 4, project_id: 6)

ProjectCategory.create(category_id: 1, project_id: 7)
ProjectCategory.create(category_id: 4, project_id: 7)








Favorite.create(user_id: 3, project_id: 5)

Contribution.create(amount: 123, user_id: 1, project_id: 2, status: false )
Contribution.create(amount: 123, user_id: 1, project_id: 3, status: false )
Contribution.create(amount: 123, user_id: 1, project_id: 4, status: false )
Contribution.create(amount: 123, user_id: 1, project_id: 5, status: false )
Contribution.create(amount: 123, user_id: 2, project_id: 6, status: false )
Contribution.create(amount: 123, user_id: 1, project_id: 3, status: true )
Contribution.create(amount: 123, user_id: 1, project_id: 4, status: true )
Contribution.create(amount: 123, user_id: 1, project_id: 5, status: true )
Contribution.create(amount: 123, user_id: 2, project_id: 6, status: true )

Promise.create(title: 'Special Product', description: 'we will send you a customized product only for you', edd: '2018/12/12', amount: 500, project_id: 3)
Promise.create(title: 'Your name in our videos', description: 'we will say your name in one of our videos', edd: '2018/12/12', amount: 1500, project_id: 3)

Finance.create(user_id: 1, promise_id: 1, status: false)
Finance.create(user_id: 1, promise_id: 1, status: true)
Finance.create(user_id: 1, promise_id: 2, status: true)





