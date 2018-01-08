require "rails_helper"
require "spec_helper"

RSpec.describe "model", :type => :request do
	it "should be valid" do
		@user = User.new(name: "Example User", email: "user@example.com")
		expect(@user).to be_valid
	end

	it "name should be present" do
		@user = User.new(name: "Example User", email: "user@example.com")
		@user.name = "     "
		expect(@user).not_to be_valid
	end

	it "email should be present" do
		@user = User.new(name: "Example User", email: "user@example.com")
		@user.email = "     "
		expect(@user).not_to be_valid
	end

	it "name should not be too long" do
		@user = User.new(name: "Example User", email: "user@example.com")
		@user.name = "a" * 51
		expect(@user).not_to be_valid
	end

	it "email should not be too long" do
		@user = User.new(name: "Example User", email: "user@example.com")
		@user.email = "a" * 244 + "@example.com"
		expect(@user).not_to be_valid
	end
end
