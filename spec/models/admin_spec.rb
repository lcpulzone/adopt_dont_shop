require 'rails_helper'

RSpec.describe Admin, type: :model do
  before :each do
    @cascade = Shelter.create!(foster_program: false, name: 'Cascade', city: 'Sherbert', rank: 2)
    @green = Shelter.create!(foster_program: true, name: 'Green Lakes', city: 'Vanilla', rank: 4)
    @zether = Shelter.create!(foster_program: true, name: 'Zether Home', city: 'Tacoma', rank: 3)
    @jelly = Shelter.create!(foster_program: false, name: 'Jelly Belly Shelter', city: 'Boring', rank: 1)
  end

  context 'shelters in order' do
  end
end
