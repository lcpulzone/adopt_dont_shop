require 'rails_helper'

RSpec.describe PetApplication, type: :model do
  context 'relationships' do
    it { should belong_to(:application) }
    it { should belong_to(:pet) }
  end

  context 'joining pets and applications' do
    it 'can redirect to the application show page' do

      
    end
  end
end
