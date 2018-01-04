require 'rails_helper'
require 'spec_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET  users new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

end
