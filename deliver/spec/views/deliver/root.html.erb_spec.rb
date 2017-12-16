require "rails_helper"
require "spec_helper"

def setup
	@base_title = "Deliver"
end

RSpec.describe "root", :type => :request do
	it "should get root" do
		get "/"
		assert_response :success
	end
	
end