require 'rails_helper'
require 'spec_helper'

RSpec.describe SessionsController, type: :request do

  describe "login_path" do
    it "should get new" do
      get login_path
      expect(response).to have_http_status(:success)
    end
  end

end
