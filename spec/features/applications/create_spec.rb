require 'rails_helper'

RSpec.describe 'application creation' do
  before :each do
    @application_1 = Application.create!(name: 'Matt Wesley', street_address: '456 Orange RD', city: 'Sherbert', state: 'Oregon', zip_code: 97701)
    @application_2 = Application.create!(name: 'Annie Pulzone', street_address: '123 Lava LN', city: 'Pilot', state: 'Oregon', zip_code: 97703)
  end

  context 'application set up' do
    it 'has a welcome message' do
      visit '/applications/new'

      expect(page).to have_content('Fill out the form below')
    end

    it 'renders a new form' do
      visit '/applications/new'

      expect(find('form')).to have_content('Name')
      expect(find('form')).to have_content('Street address')
      expect(find('form')).to have_content('City')
      expect(find('form')).to have_content('State')
      expect(find('form')).to have_content('Zip code')
    end
  end

  context 'application creation' do
    it 'creates the application and redirects to the applicaiton show page' do
      visit '/applications/new'

      fill_in 'Name', with: "Madeline Sibley"
      fill_in 'Street address', with: "789 Sugar LN"
      fill_in 'City', with: "Sweets"
      fill_in 'State', with: "Oregon"
      fill_in 'Zip code', with: "12345"
      click_button 'commit'

      expect(current_path).to eq("/applications/#{Application.last.id}")
      expect(page).to have_content("Madeline Sibley")
    end
  end

  context 'invalid application' do
    it 'gives an error message when application not filled out correctly' do
      visit '/applications/new'

      click_button 'commit'
      
      expect(page).to have_content("Error: Name can't be blank, Street address can't be blank, City can't be blank, State can't be blank, Zip code is not a number")
    end
  end
end
