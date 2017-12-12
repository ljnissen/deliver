require "rails_helper"
require "spec_helper"



RSpec.describe "help page", :type => :request do

	it "should get help" do
		get "/static_pages/help"
		assert_response :success
		assert_select "title", text: "Help | Deliver"
	end
end