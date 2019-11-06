# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Tattoo.destroy_all

tattoos = [
    {
        title: 'title1',
        description: 'desc1'
    },
    {
        title: 'title2',
        description: 'desc2'
    }
]
users = [
    {
        email: 'carl@carl.com', 
        username: 'carl', 
        password: 'pass123', 
        password_confirmation: 'pass123'
        },
    {
        email: 'phil@phil.com',
        username: 'phil', 
        password: 'pass123', 
        password_confirmation: 'pass123'
    }
]

User.create(users)
Tattoo.create(tattoos)

