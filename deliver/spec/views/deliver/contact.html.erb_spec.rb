require "rails_helper"
require "spec_helper"

def setup
	@base_title = "Deliver"
end

RSpec.describe "contact page", :type => :request do
	it "should get contact" do
		get "/contact"
		assert_response :success
	end

	it "should get contact ii" do
		get "/contact"
		assert_select "title", "Contact | Deliver"
	end
	
end