require "rails_helper"

RSpec.describe "root", :type => :request do
	it "should get root" do
		get "/"
		assert_response :success
	end
	
end