
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Design.destroy_all
count = 0 
designs = 501

count = 0

designs.times do 
    system('clear')
    puts "Seeding designs Data"
    puts "-----------------"
    count += 1
    puts "#{count/designs.to_f*100}%"
    Design.create(created_at: (0..3).to_a.sample.days.ago, design_url: "https://loremflickr.com/320/240?random=#{(0...999).to_a.sample}", title: Faker::Movie.title, description: Faker::Lorem.paragraph(sentence_count: 3, supplemental: false, random_sentences_to_add: 4))
end
puts "-----------------"
puts "Design Data: 100%"
puts "Data Sucessfully Seeded!"
puts "-----------------"