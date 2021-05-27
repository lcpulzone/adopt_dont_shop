require 'rails_helper'

RSpec.describe 'application show page' do
  before :each do
    @application_1 = Application.create!(name: 'Matt Wesley', street_address: '456 Orange RD', city: 'Vanilla', state: 'Oregon', zip_code: 97701)
    @application_2 = Application.create!(name: 'Annie Pulzone', street_address: '123 Lava LN', city: 'Sherbert', state: 'Oregon', zip_code: 97703)

    @shelter = Shelter.create(name: 'Aurora shelter', city: 'Aurora, CO', foster_program: false, rank: 9)

    @pet_1 = Pet.create(adoptable: true, age: 1, breed: 'sphynx', name: 'Lucille Bald', shelter_id: @shelter.id)
    @pet_2 = Pet.create(adoptable: true, age: 3, breed: 'doberman', name: 'Lobster', shelter_id: @shelter.id)
  end

  context 'applicant' do
    it 'shows the applicants attributes' do
      visit "/applications/#{@application_1.id}"

      expect(page).to have_content("#{@application_1.name}")
      expect(page).to have_content("#{@application_1.street_address}")
      expect(page).to have_content("#{@application_1.city}, #{@application_1.state} #{@application_1.zip_code}")
    end

    it 'shows the status of the application' do
      visit "/applications/#{@application_1.id}"

      expect(page).to have_content("#{@application_1.status}")
    end
  end

  context 'pets on applications' do
    it 'shows a search box' do
      visit "/applications/#{@application_1.id}"

      click_button 'Search'

      expect(page).to have_button('Search')
    end

    it 'has a button to adopt a pet' do
      visit "/applications/#{@application_1.id}"

      fill_in 'Search', with: "#{@pet_2.name}"
      click_button 'Search'

      expect(page).to have_content("#{@pet_2.name}")
      expect(page).to have_button('Adopt this Pet')
    end

    it 'shows a description of applicants ability to care for a pet' do
      @application_1.pets << @pet_1

      visit "/applications/#{@application_1.id}"

      within("section#applicant_description") do
        expect(page).to have_button('Submit Application')
        click_button 'Submit Application'
      end
        expect(page).to_not have_button('Submit Application')
    end
  end
end
