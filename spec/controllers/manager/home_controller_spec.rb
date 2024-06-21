require 'rails_helper'

RSpec.describe Manager::HomeController, type: :controller do
  let(:user) { FactoryBot.create(:user) }

  before(:each) do
    allow_any_instance_of(InternalController)
      .to receive(:authenticate_user!).and_return(true)
    allow_any_instance_of(ApplicationController)
      .to receive(:current_user).and_return(user)
  end

  describe 'GET #index' do
    pending "add some examples to controller #{__FILE__}"
  end
end
