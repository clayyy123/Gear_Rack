# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if(User.destroy_all)
    @user = User.new({name: "Clay", email: "clay@gmail.com", password: "123456"})
    @user.save

    @user2 = User.new({name: "Philippe", email: "philippe@gmail.com", password: "123456"})
    @user2.save

    @user3 = User.new({name: "Katie", email: "katie@gmail.com", password: "123456"})
    @user3.save

end