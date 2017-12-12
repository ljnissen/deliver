require "rails_helper"

RSpec.describe "about page", :type => :request do
	it "should get about" do
		get "/static_pages/about"
		assert_response :success
		assert_select "title", "About | Deliver"
	end
	
end