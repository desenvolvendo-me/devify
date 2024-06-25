require 'rails_helper'

RSpec.describe "manager/students/profiles/evaluate", type: :view do
  let(:student_profile) { FactoryBot.create(:student_profile) }

  before do
    assign(:student_profile, student_profile)
    render
  end

  it "displays the evaluation form" do
    expect(rendered).to have_selector('form')
  end

  it "displays the correct labels" do
    expect(rendered).to have_content("What is your instagram?")
    expect(rendered).to have_content("What technologies have you taken a course?")
    expect(rendered).to have_content("Which programming language did you study the most?")
    expect(rendered).to have_content("How long did you study your language?")
    expect(rendered).to have_content("What web framework in your programming language did you study?")
    expect(rendered).to have_content("How long did you study the web framework?")
    expect(rendered).to have_content("How much do you like talking to people?")
    expect(rendered).to have_content("How much do you like to expose yourself?")
  end
end
