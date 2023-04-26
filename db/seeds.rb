# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create(username: "root",email: "root@email.com", password: "asdfasdf", admin: true)
User.create(username: "test",email: "test@email.com", password: "asdfasdf")
User.create(username: "user",email: "user@email.com", password: "asdfasdf")
User.create(username: "carlos",email: "carlos@email.com", password: "asdfasdf")
