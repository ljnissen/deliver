require 'rails_helper'
#require 'spec_helper'

		def setup
			@user = users :lj 
		end

RSpec.describe "Invalid edits", type: :request do	

	it "unsuccessful edit" do

		# chapter 10.1.3
		get edit_user_path(@user)
		#assert_template 'users/edit'
		#patch user_path(@user), user: {  name: "",
		#								email: "foo@invalid",
		#								password: "foo",
		#								password_confirmation: "bar" }
		#assert_template 'users/edit'
	end
end