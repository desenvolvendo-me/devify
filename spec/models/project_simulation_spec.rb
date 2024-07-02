# == Schema Information
#
# Table name: project_simulations
#
#  id               :bigint           not null, primary key
#  complexity       :string
#  description      :text
#  difficulty       :string
#  expected_results :text
#  objectives       :text
#  title            :string
#  tools            :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
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

    it 'should allow valid values for difficulty' do
      expect(ProjectSimulation.new(difficulty: 'Fácil', complexity: 'Baixa')).to be_valid
      expect(ProjectSimulation.new(difficulty: 'Média', complexity: 'Baixa')).to be_valid
      expect(ProjectSimulation.new(difficulty: 'Difícil', complexity: 'Baixa')).to be_valid
    end

    it 'should not allow invalid values for difficulty' do
      expect(ProjectSimulation.new(difficulty: 'invalid_value', complexity: 'Baixa')).not_to be_valid
    end

    it 'should allow valid values for complexity' do
      expect(ProjectSimulation.new(difficulty: 'Fácil', complexity: 'Baixa')).to be_valid
      expect(ProjectSimulation.new(difficulty: 'Fácil', complexity: 'Média')).to be_valid
      expect(ProjectSimulation.new(difficulty: 'Fácil', complexity: 'Alta')).to be_valid
    end

    it 'should not allow invalid values for complexity' do
      expect(ProjectSimulation.new(difficulty: 'Fácil', complexity: 'invalid_value')).not_to be_valid
    end
  end

  describe 'scopes' do
    before do
      create(:project_simulation, difficulty: 'Fácil', complexity: 'Média')
      create(:project_simulation, difficulty: 'Média', complexity: 'Média')
      create(:project_simulation, difficulty: 'Difícil', complexity: 'Alta')
    end

    it 'returns projects with easy difficulty' do
      expect(ProjectSimulation.where(difficulty: 'Fácil').count).to eq(1)
    end

    it 'returns projects with medium complexity' do
      expect(ProjectSimulation.where(complexity: 'Média').count).to eq(2)
    end
  end
end
