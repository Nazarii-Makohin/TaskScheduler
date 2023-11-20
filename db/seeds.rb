Goal.delete_all

titles = %w[Learn_ruby Ruby_on_Rails PragProg ChadFauler DHH Rails6 Rails7 Turbo_Rails Stimulus Javascript Saas_bootstrap Learn_Grape]

20.times do |i|
    rand_date = (DateTime.now + (rand * 21)).strftime("%Y-%m-%d")
    Goal.create!(title: titles.sample, description: "21312312423432414321423", priority: rand(0..2),
     due_date: rand_date, completed: rand(0..1).zero?, user_id: User.all.sample.id)
end