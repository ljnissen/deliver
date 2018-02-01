require 'rails_helper'
require 'spec_helper'

#RSpec.describe "signup page", :type => :request do

#  describe "invalid signup information" do
#    it "invalid signup" do
#    	get signup_path
    	#before_count = User.count
        #post users_path, user: { name:  "",
        #                         email: "user@invalid",
        #                         password:              "foo",
        #                         password_confirmation: "bar" } 
        #after_count  = User.count
		    #assert_equal before_count, after_count
#        assert_no_difference 'User.count' do
#          post users_path, user: { name:  "",
#                                               email: "user@invalid",
#                                               password:              "foo",
#                                               password_confirmation: "bar" }
#       end
#    end

#    it "verifying that users/new is valid" do
#    	get '/users/new'
#        assert_response :success
#    end
    
#  end
#end

module AssertSelectRoot
  def document_root_element
    html_document.root
  end
end

RSpec.configure do |config|
    config.include AssertSelectRoot, :type => :request
end

RSpec.describe "UsersSignups", type: :request do
  describe "signing up with invalid information" do
    it "should not work and should go back to the signup form" do
      get signup_path
      expect do
        post users_path, user: { 
          name:                  "",
          email:                 "user@triculi",
          password:              "buajaja",
          password_confirmation: "juababa" 
        }
      end.to_not change{ User.count }
    end
  end

  describe "signing up with valid information" do
    it "should work" do
      get signup_path
      expect do
        post users_path, user: { 
          name:                  "Julito Triculito",
          email:                 "triculito@mail.com",
          password:              "worldtriculi",
          password_confirmation: "worldtriculi"
        }
      end.to change{ User.count }.from(0).to(1)
    end
  end
end


RSpec.describe "signup_path", :type => :request do
  it "should get users/new" do
    get signup_path
    assert_template 'users/new'
  end

  it "should get CSS id for error explanation" do
    get signup_path
    post users_path, user: { 
          name:                  "",
          email:                 "user@triculi",
          password:              "buajaja",
          password_confirmation: "juababa" 
        }
    assert_select 'div#error_explanation'
  end

  it "should get CSS class for field with errors" do
    get signup_path
    post users_path, user: { 
          name:                  "",
          email:                 "user@triculi",
          password:              "buajaja",
          password_confirmation: "juababa" 
        }
    assert_select 'div.field_with_errors'
  end

  it "should render show template after successful signup" do
    get signup_path
        post users_path, user: { 
          name:                  "Julito Triculito",
          email:                 "triculito@mail.com",
          password:              "worldtriculi",
          password_confirmation: "worldtriculi"
        }
    expect(response.code).to eq("302")
  end

  it "should render show template after successful signup ii" do
    get signup_path
        post users_path, user: { 
          name:                  "Julito Triculito",
          email:                 "triculito@mail.com",
          password:              "worldtriculi",
          password_confirmation: "worldtriculi"
        }
    #expect(response).to render_template(user_path(user))
  end

  

  it "should render show template after successful signup iii" do
    get signup_path
        post users_path, user: { 
          name:                  "Julito Triculito",
          email:                 "triculito@mail.com",
          password:              "worldtriculi",
          password_confirmation: "worldtriculi"
        }
    expect(response).to redirect_to('/users/1')
  end

  it "should be logged in after successful signup" do
    get signup_path
        post users_path, user: { 
          name:                  "Julito Triculito",
          email:                 "triculito@mail.com",
          password:              "worldtriculi",
          password_confirmation: "worldtriculi"
        }
    assert is_logged_in?
  end
  
end