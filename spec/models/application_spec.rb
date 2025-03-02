 require 'rails_helper'

 RSpec.describe Application, type: :model do
   context 'relationships' do
     it { should have_many(:pet_applications) }
     it { should have_many(:pets).through(:pet_applications) }
   end

   context 'validations' do
     it { should validate_presence_of(:name) }
     it { should validate_presence_of(:street_address) }
     it { should validate_presence_of(:city) }
     it { should validate_presence_of(:state) }
     it { should validate_presence_of(:description).on(:update) }
     it { should validate_numericality_of(:zip_code) }
   end
 end
