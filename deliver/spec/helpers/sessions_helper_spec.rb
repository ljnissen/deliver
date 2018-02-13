require 'rails_helper'
require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the SessionsHelper. For example:
#
# describe SessionsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe SessionsHelper, type: :helper do
  pending "add some examples to (or delete) #{__FILE__}"

  def setup
  	@user = users(:lj)
  	remember(@user)
  end

  #it "current_user returns right user when session is nil" do
  #	expect(@user).to equal current_user
  #	assert is_logged_in?
  #end

  #it "current_user returns nil when remember digest is wrong" do
  #	@user.update_attribute(:remember_digest, User.digest(User.new_token))
  #	expect(current_user).to be_nil
  #end
end
