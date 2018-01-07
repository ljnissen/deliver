require "rails_helper"
require "spec_helper"

RSpec.describe "model", :type => :request do
	it "should be valid" do
		@user = User.new(name: "Example User", email: "user@example.com")
		expect(@user).to be_valid
	end
end
