require 'rails_helper'
require 'spec_helper'

def setup
    @user = users(:lj)
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
        delete logout_path
        follow_redirect!
        assert_select "a[href=?]", login_path
        assert_select "a[href=?]", logout_path, count: 0
        assert_select "a[href=?]", user_path(@user), count: 0
    end
  end

  it "login with valid information followed by logout" do
    get login_path
    post login_path, session: { email: "lj.nissen@gmail.com", password: 'plm123!!' }
    expect do
        follow_redirect!
        delete logout_path

    end
  end
end

RSpec.describe "integration tests", type: :request do

  it "login with remembering" do
    @user = User.new(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar")
    log_in_as(@user, remember_me: '1')
    # The following test is wrong because it tests nil == nil
    expect(cookies['remember_token']).to equal @user.remember_token
  end

   it "login without remembering" do
    @user = User.new(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar")
    # Log in to set the cookie.
    log_in_as(@user, remember_me: '1')
    # Log in again and verify that the cookie is deleted.
    log_in_as(@user, remember_me: '0')
    # The following test is wrong because it tests nil == nil
    expect(cookies['remember_token']).to be_nil
  end
end
