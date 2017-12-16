require "rails_helper"
require "spec_helper"

def setup
	@base_title = "Deliver"
end

RSpec.describe "help page", :type => :request do


	it "should get help" do
		get "/static_pages/help"
		assert_response :success
	end

	it "should get home ii" do
		get "/static_pages/help"
		assert_select "title", "Help | Deliver"
	end
end