# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

seed_file = Rails.root.join('db', 'seeds', 'seeds.yml')
my_hash = HashWithIndifferentAccess.new(YAML::load_file(seed_file))
my_hash["projects"].each do |project|
  db_project = Project.create(title: project["title"])
  project["todos"].each do |todo|
    db_project.todos << Todo.create(text:todo["text"], is_completed:todo["isCompleted"])
  end
end