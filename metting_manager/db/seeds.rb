seed_file = File.join(Rails.root, 'db', 'seeds.yml')
config = YAML::load_file(seed_file)
binding.pry
admin = Role.create(name: "admin", desc: "abc")
employer = Role.create(name: "employer", desc: "nguoi dung")
teamleader = Role.create(name: "teamleader", desc: "teamleader")
User.create!(config["user_list"])
Room.create(name: "H20", user_id: "1")
Room.create!(config["room_list"])
Group.create!(config["group_list"])
Memberlist.create!(config["memberlist_list"])
Order.create!(config["order_list"])
Assigment.create!(config["assigment_list"])

