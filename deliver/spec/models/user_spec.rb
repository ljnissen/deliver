require "rails_helper"
require "spec_helper"



RSpec.describe "model", :type => :request do



	it "should be valid" do
		@user = User.new(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar")
		expect(@user).to be_valid
	end

	it "name should be present" do
		@user = User.new(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar")
		@user.name = "     "
		expect(@user).not_to be_valid
	end

	it "email should be present" do
		@user = User.new(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar")
		@user.email = "     "
		expect(@user).not_to be_valid
	end

	it "name should not be too long" do
		@user = User.new(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar")
		@user.name = "a" * 51
		expect(@user).not_to be_valid
	end

	it "email should not be too long" do
		@user = User.new(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar")
		@user.email = "a" * 244 + "@example.com"
		expect(@user).not_to be_valid
	end

	it "email validation should accept valid addresses" do
		@user = User.new(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar")
    	valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    	valid_addresses.each do |valid_address|
	      	@user.email = valid_address
	      	expect(@user).to be_valid, "#{valid_address.inspect} should be valid"
    	end
  	end

  	it "email validation should reject invalid addresses" do
  		@user = User.new(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar")
	    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
	                           foo@bar_baz.com foo@bar+baz.com]
	    invalid_addresses.each do |invalid_address|
	      @user.email = invalid_address
	      expect(@user).not_to be_valid, "#{invalid_address.inspect} should be invalid"
    	end
  	end

  	it "email addresses should be unique" do
  		@user = User.new(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar")
	    duplicate_user = @user.dup
	    @user.save
	    expect(duplicate_user).not_to be_valid
  	end

  	it "email addresses should be case insensitive" do
  		@user = User.new(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar")
  		duplicate_user = @user.dup
	    duplicate_user.email = @user.email.upcase
	    @user.save
	    expect(duplicate_user).not_to be_valid
  	end

  	it "email addresses should be saved as lower-case" do
  		@user = User.new(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar")
  		mixed_case_email = "Foo@ExAMPle.CoM"
	    @user.email = mixed_case_email
	    @user.save
	    expect(mixed_case_email.downcase).to eq(@user.email)
  	end

  	it "password should be present (nonblank)" do
  		@user = User.new(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar")
	    @user.password = @user.password_confirmation = " " * 6
	    expect(@user).not_to be_valid
	end

	it "password should have a minimum length" do
		@user = User.new(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar")
		@user.password = @user.password_confirmation = "a" * 5
		expect(@user).not_to be_valid
	end

	it "authenticated? should return false for a user with nil digest" do
		@user = User.new
		expect(@user.authenticated?('')).to be_falsy
	end

end
