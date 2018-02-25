require 'rails_helper'
require 'spec_helper'

def setup
    @user = users(:lj)
end


RSpec.describe "index_path", :type => :request do
	it "index including pagination" do |variable|
		log_in_as(@user)
	end
end