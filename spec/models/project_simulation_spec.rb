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

  describe 'validations' do
    it { should validate_presence_of(:difficulty) }
    it { should validate_presence_of(:complexity) }

    it "should allow valid values for difficulty" do
      expect(ProjectSimulation.new(difficulty: 'easy', complexity: 'low')).to be_valid
      expect(ProjectSimulation.new(difficulty: 'medium', complexity: 'low')).to be_valid
      expect(ProjectSimulation.new(difficulty: 'hard', complexity: 'low')).to be_valid
    end

    it "should not allow invalid values for difficulty" do
      expect(ProjectSimulation.new(difficulty: 'invalid_value', complexity: 'low')).not_to be_valid
    end

    it "should allow valid values for complexity" do
      expect(ProjectSimulation.new(difficulty: 'easy', complexity: 'low')).to be_valid
      expect(ProjectSimulation.new(difficulty: 'easy', complexity: 'medium')).to be_valid
      expect(ProjectSimulation.new(difficulty: 'easy', complexity: 'high')).to be_valid
    end

    it "should not allow invalid values for complexity" do
      expect(ProjectSimulation.new(difficulty: 'easy', complexity: 'invalid_value')).not_to be_valid
    end
  end

  describe 'scopes' do
    before do
      create(:project_simulation, difficulty: 'easy', complexity: 'medium')
      create(:project_simulation, difficulty: 'medium', complexity: 'medium')
      create(:project_simulation, difficulty: 'hard', complexity: 'high')
    end

    it 'returns projects with easy difficulty' do
      expect(ProjectSimulation.where(difficulty: 'easy').count).to eq(1)
    end

    it 'returns projects with medium complexity' do
      expect(ProjectSimulation.where(complexity: 'medium').count).to eq(2)
    end
  end
end