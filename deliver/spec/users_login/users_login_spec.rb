require 'rails_helper'
require 'spec_helper'

def setup
    @user = users(:michael)
end

RSpec.describe "signup_path", :type => :request do
  it "login with invalid information" do
    get login_path
    expect do
    	assert_template 'sessions/new'
    	post login_path, session: { email: "", password: "" }
    	assert_template 'sessions/new'
    	expect(@flash).not_to be.empty?
    	get root_path
    	assert flash.empty?
    end
  end
end
