Dog.destroy_all
Owner.destroy_all
Vet.destroy_all
Instruction.destroy_all
Patient.destroy_all

ActiveRecord::Base.connection.execute("UPDATE sqlite_sequence SET seq = (SELECT MAX(id) FROM dogs) WHERE name = \"dogs\";")
ActiveRecord::Base.connection.execute("UPDATE sqlite_sequence SET seq = (SELECT MAX(id) FROM owners) WHERE name = \"owners\";")
ActiveRecord::Base.connection.execute("UPDATE sqlite_sequence SET seq = (SELECT MAX(id) FROM vets) WHERE name = \"vets\";")
ActiveRecord::Base.connection.execute("UPDATE sqlite_sequence SET seq = (SELECT MAX(id) FROM instructions) WHERE name = \"instructions\";")
ActiveRecord::Base.connection.execute("UPDATE sqlite_sequence SET seq = (SELECT MAX(id) FROM patients) WHERE name = \"patients\";")

shaggy = Owner.create(first_name: "Shaggy", last_name: "Rogers", phone_num: "555-867-5309", email: "shaggy@gmail.com")
charlie = Owner.create(first_name: "Charlie", last_name: "Muntz", phone_num: "555-867-5443", email: "charlie@gmail.com")

scooby_doo = Dog.create(name: "Scooby Doo", breed: "Great Dane", birthday: Date.new(1969,1,1), img_url: "https://www.partyrama.co.uk/wp-content/uploads/2014/05/scooby-doo-133cms-lifesize-cardboard-cutout-product-image.jpg", owner_id: shaggy.id, size: "large", username: "scoobydoo")
dug = Dog.create(name: "Dug", breed: "Golden Retriever", birthday: Date.new(2009,5,29), img_url: "https://vignette.wikia.nocookie.net/disney/images/3/35/Dug-up.jpg/revision/latest?cb=20150611174103", owner_id: charlie.id, size: "medium", username: "dug")

dr_kim = Vet.create(first_name: "Jenny", last_name: "Kim", address: "11 Broadway", phone_num: "123-456-7890", email: "drkim@gmail.com")
dr_phillips = Vet.create(first_name: "Jack", last_name: "Phillips", address: "12 Broadway", phone_num: "123-456-7899", email: "drphillips@gmail.com")

Patient.create(vet_id: dr_kim.id, dog_id: scooby_doo.id)
Patient.create(vet_id: dr_phillips.id, dog_id: dug.id)

Instruction.create(header: "Feeding Instructions", content: "Eats 10 times a day. Gets angry if you forget to feed him.", dog_id: scooby_doo.id)
Instruction.create(header: "Walking Instructions", content: "Walk him near crime spots.", dog_id: scooby_doo.id)
Instruction.create(header: "Feeding Instructions", content: "Loves to eat bacon.", dog_id: dug.id)
Instruction.create(header: "Walking Instructions", content: "Plays only with his tennis ball while walking.", dog_id: dug.id)
