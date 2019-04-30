# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

grant = User.create(name: "Grant Smith", password: "Purple Reign", bio: "I love to workout, program and make memories")
fitness = List.create(title: "Fitness")
workout = Task.create(content:"Work out at 7:00pm", status: "incomplete")
