# == Schema Information
#
# Table name: project_simulations
#
#  id               :bigint           not null, primary key
#  complexity       :integer
#  description      :text
#  difficulty       :integer
#  expected_results :text
#  objectives       :text
#  title            :string
#  tools            :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
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

  describe 'enums' do
    it { should define_enum_for(:difficulty).with_values(easy: 0, medium: 1, hard: 2).with_prefix }
    it { should define_enum_for(:complexity).with_values(low: 0, medium: 1, high: 2).with_prefix }
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
      expect { ProjectSimulation.new(difficulty: 'invalid_value', complexity: 'low') }.to raise_error(ArgumentError)
    end

    it "should allow valid values for complexity" do
      expect(ProjectSimulation.new(difficulty: 'easy', complexity: 'low')).to be_valid
      expect(ProjectSimulation.new(difficulty: 'easy', complexity: 'medium')).to be_valid
      expect(ProjectSimulation.new(difficulty: 'easy', complexity: 'high')).to be_valid
    end

    it "should not allow invalid values for complexity" do
      expect { ProjectSimulation.new(difficulty: 'easy', complexity: 'invalid_value') }.to raise_error(ArgumentError)
    end
  end

  describe 'instance methods' do
    let(:project_simulation) { build(:project_simulation) }

    it 'should return correct difficulty' do
      project_simulation.difficulty = :medium
      expect(project_simulation.difficulty).to eq('medium')
      expect(project_simulation.difficulty_medium?).to be_truthy
    end

    it 'should return correct complexity' do
      project_simulation.complexity = :high
      expect(project_simulation.complexity).to eq('high')
      expect(project_simulation.complexity_high?).to be_truthy
    end
  end

  describe 'scopes' do
    before do
      create(:project_simulation, difficulty: :easy, complexity: :medium)
      create(:project_simulation, difficulty: :medium, complexity: :medium)
      create(:project_simulation, difficulty: :hard, complexity: :high)
    end

    it 'returns projects with easy difficulty' do
      expect(ProjectSimulation.difficulty_easy.count).to eq(1)
    end

    it 'returns projects with medium complexity' do
      expect(ProjectSimulation.complexity_medium.count).to eq(2)
    end
  end
end
