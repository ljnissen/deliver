require "rails_helper"

RSpec.describe "home page", :type => :request do
	it "should get home" do
		get "/static_pages/home"
		assert_response :success
		


	end
	
end