# spec/models/project_simulation_spec.rb
require 'rails_helper'

RSpec.describe ProjectSimulation, type: :model do
  describe 'associations' do
    it { should have_and_belong_to_many(:users) }
  end

  describe 'factory' do
    it 'has a valid factory' do
      expect(FactoryBot.build(:project_simulation)).to be_valid
    end
  end
end
