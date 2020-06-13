# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Message.destroy_all
Conversation.destroy_all
Topic.destroy_all
Organization.destroy_all
User.destroy_all

breakroom = Organization.create(name: 'BreakRoom', annual_sales_value: 0, industry_type: 'Software')

scott = User.create(nickname: "sbenson", firstname: "Scott", lastname: "Benson", email:"scott.benson96@gmail.com", password: "password1234", admin: true, organization_id: breakroom.id)
janna = User.create(nickname: "jpierre", firstname: "Janna", lastname: "Pierre", email:"jannapierre@gmail.com", password: "password1234", admin: true, organization_id: breakroom.id)
bryan = User.create(nickname: "bbenson", firstname: "Bryan", lastname: "Benson", email:"bryanbenson83@gmail.com", password: "password1234", admin: true, organization_id: breakroom.id)
topic1 = Topic.create(name:"News", organization_id: breakroom.id)
topic2 = Topic.create(name:"Sports", organization_id: breakroom.id)
topic3 = Topic.create(name:"TV Shows", organization_id: breakroom.id)
topic4 = Topic.create(name:"Movies", organization_id: breakroom.id)

topNews = Conversation.create(title:"Top News", description: "Top news.", user: bryan, topic_id: topic1.id)
topSports = Conversation.create(title:"Top Sports", description: "Top Sports", user: bryan, topic_id: topic2.id)
topTV = Conversation.create(title:"Top TV", description: "Top TV Shows.", user: bryan, topic_id: topic3.id)
topMovies = Conversation.create(title:"Top Movies", description: "Top Movies", user: bryan, topic_id: topic4.id)
