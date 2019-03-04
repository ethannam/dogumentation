# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
shaggy = Owner.create(first_name: "Shaggy", last_name: "Rogers", phone_num: "555-867-5309", email: "shaggy@gmail.com")
charlie = Owner.create(first_name: "Charlie", last_name: "Muntz", phone_num: "", email: "")

scooby_doo = Dog.create(name: "Scooby Doo", breed: "Great Dane", birthday: Date.new(1969,1,1), img_url: "", owner_id: shaggy.id)
dug = Dog.create(name: "Dug", breed: "Golden Retriever", birthday: Date.new(2009,5,29), img_url: "", owner_id: charlie.id)

dr_kim = Vet.create(first_name: "Jenny", last_name: "Kim", address: "11 Broadway", phone_num: "123-456-7890", email: "drkim@gmail.com")
dr_phillips = Vet.create(first_name: "Jack", last_name: "Phillips", address: "12 Broadway", phone_num: "123-456-7899", email: "drphillips@gmail.com")

Patient.create(vet_id: dr_kim.id, dog_id: scooby_doo.id)
Patient.create(vet_id: dr_phillips.id, dog_id: dug.id)

instruction1 = Instruction.create(header: "Feeding Instructions", content: "Eats 10 times a day. Gets angry if you forget to feed him.", dog_id: scooby_doo.id)
instruction2 = Instruction.create(header: "Walking Instructions", content: "Walk him near crime spots.", dog_id: scooby_doo.id)
instruction3 = Instruction.create(header: "Feeding Instructions", content: "Loves to eat bacon.", dog_id: dug.id)
instruction4 = Instruction.create(header: "Walking Instructions", content: "Plays only with his tennis ball while walking.", dog_id: dug.id)
