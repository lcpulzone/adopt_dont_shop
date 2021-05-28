require 'rails_helper'

RSpec.describe 'admin shelter index' do
  before :each do
    @cascade = Shelter.create!(foster_program: false, name: 'Cascade', city: 'Sherbert', rank: 2)
    @green = Shelter.create!(foster_program: true, name: 'Green Lakes', city: 'Vanilla', rank: 4)
    @zether = Shelter.create!(foster_program: true, name: 'Zether Home', city: 'Tacoma', rank: 3)
    @jelly = Shelter.create!(foster_program: false, name: 'Jelly Belly Shelter', city: 'Boring', rank: 1)
  end

  context 'lists shelters' do
    it 'can list shelters in reverse alphabetical order' do
      visit shelters_path

      within("#shelter-#{@zether.id}") do
        expect(page).to have_content(@zether.name)
        expect(page).to_not have_content(@cascade.name)
      end

      within("#shelter-#{@jelly.id}") do
        expect(page).to have_content(@jelly.name)
      end

      within("#shelter-#{@green.id}") do
        expect(page).to have_content(@green.name)
      end

      within("#shelter-#{@cascade.id}") do
        expect(page).to have_content(@cascade.name)
      end
    end
  end
end
