require "rails_helper"
require "spec_helper"

def setup
	@base_title = "Deliver"
end

RSpec.describe "about page", :type => :request do
	it "should get about" do
		get "/about"
		assert_response :success
	end

	it "should get home ii" do
		get "/about"
		assert_select "title", "About | Deliver"
	end
	
end