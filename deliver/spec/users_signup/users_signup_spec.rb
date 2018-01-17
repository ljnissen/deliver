require 'rails_helper'
require 'spec_helper'

RSpec.describe "signup page", :type => :request do

  describe "invalid signup information" do
    it "invalid signup" do
    	get signup_path
    	before_count = User.count
        post users_path, user: { name:  "",
                                 email: "user@invalid",
                                 password:              "foo",
                                 password_confirmation: "bar" } 
        after_count  = User.count
		assert_equal before_count, after_count
    end

    it "verifying that users/new is valid" do
    	get signup_path
        assert_response :success
    end
    
  end
end
