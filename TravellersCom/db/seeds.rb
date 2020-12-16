# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(first_name: 'John', last_name: 'Doe', gender: 'male', dob: email: 'admin@example.com', 
  password: '123456789', password_confirmation: '123456789', role_id: '1') if Rails.env.development?