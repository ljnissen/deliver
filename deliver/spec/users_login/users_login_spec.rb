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

  it "login with valid information followed by logout" do
    get login_path
    post login_path, session: { email: "lj.nissen@gmail.com", password: 'plm123!!' }
    expect do
        assert is_logged_in?
        assert_redirected_to @user
        
        assert_template 'users/show'
        assert_select "a[href=?]", login_path, count: 0
        assert_select "a[href=?]", logout_path
        assert_select "a[href=?]", user_path(@user)
        delete logout_path
        assert !is_logged_in?
        assert_redirected_to root_url
        follow_redirect!
        assert_select "a[href=?]", login_path
        assert_select "a[href=?]", logout_path, count: 0
        assert_select "a[href=?]", user_path(@user), count: 0
    end
  end
end