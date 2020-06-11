# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Message.destroy_all
Topic.destroy_all
Theme.destroy_all
Organization.destroy_all
User.destroy_all

breakroom = Organization.create(name: 'BreakRoom', annual_sales_value: 0, industry_type: 'Software')

scott = User.create(nickname: "sbenson", firstname: "Scott", lastname: "Benson", email:"scott.benson96@gmail.com", password: "password1234", admin: true, organization_id: breakroom.id)
janna = User.create(nickname: "jpierre", firstname: "Janna", lastname: "Pierre", email:"jannapierre@gmail.com", password: "password1234", admin: true, organization_id: breakroom.id)
bryan = User.create(nickname: "bbenson", firstname: "Bryan", lastname: "Benson", email:"bryanbenson83@gmail.com", password: "password1234", admin: true, organization_id: breakroom.id)
theme1 = Theme.create(name:"News", organization_id: breakroom.id)
theme2 = Theme.create(name:"Sports", organization_id: breakroom.id)
theme3 = Theme.create(name:"TV Shows", organization_id: breakroom.id)
theme4 = Theme.create(name:"Movies", organization_id: breakroom.id)

topNews = Topic.create(title:"Top News", description: "Top news.", user: bryan, theme_id: theme1.id)
topSports = Topic.create(title:"Top Sports", description: "Top Sports", user: bryan, theme_id: theme2.id)
topTV = Topic.create(title:"Top TV", description: "Top TV Shows.", user: bryan, theme_id: theme3.id)
topMovies = Topic.create(title:"Top Movies", description: "Top Movies", user: bryan, theme_id: theme4.id)
