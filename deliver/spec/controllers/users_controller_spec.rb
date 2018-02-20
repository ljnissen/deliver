require 'rails_helper'
require 'spec_helper'

def setup
	@user 		= users(:lj)
	@other_user = users(:archer)
end

RSpec.describe UsersController, type: :controller do

  describe "GET  users new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end
end
