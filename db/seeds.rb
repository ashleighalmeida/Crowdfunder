20.times do
  Project.create(title: Faker::Company.name, description: Faker::Company.bs, funding_goal: rand(1000-10000), start_date: Date.today, end_date: Date.tomorrow)
end


  Category.create(name: "Music")

  Category.create(name: "Architecture")

  Category.create(name: "Healthcare")

  Category.create(name: "Psychology")

  Category.create(name: "Real estate")
  
# [1..20].each do |number|
#   Reward.create(name: name, project_id: number)
# end