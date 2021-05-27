# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Need to have .destroy_all if I put things in here
# It will destroy everything first so that I don't have two everything
PetApplication.destroy_all
Application.destroy_all
Pet.destroy_all
Shelter.destroy_all

matt = Application.create!(name: 'Matt Wesley', street_address: '456 Orange RD', city: 'Vanilla', state: 'Oregon', zip_code: 97701)
annie = Application.create!(name: 'Annie Pulzone', street_address: '123 Lava LN', city: 'Sherbert', state: 'Oregon', zip_code: 97703)

green = Shelter.create!(foster_program: true, name: 'Green Lakes', city: 'Vanilla', rank: 4)
cascade = Shelter.create!(foster_program: false, name: 'Cascade', city: 'Sherbert', rank: 2)

derby = green.pets.create!(adoptable: true, age: 8, breed: 'Terrier', name: 'Derby')
drake = green.pets.create!(adoptable: true, age: 1, breed: 'Pointer', name: 'Drake')
zeppe = green.pets.create!(adoptable: false, age: 13, breed: 'Border Collie', name: 'Zeppe')
hawk = cascade.pets.create!(adoptable: true, age: 6, breed: 'Aussie', name: 'Hawk')
dalia = cascade.pets.create!(adoptable: false, age: 1, breed: 'American Short Hair', name: 'Dalia')
ted = cascade.pets.create!(adoptable: false, age: 1, breed: 'Golden', name: 'Ted')
