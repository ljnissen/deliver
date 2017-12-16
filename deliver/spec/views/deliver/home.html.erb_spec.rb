require "rails_helper"
require "spec_helper"

def setup
	@base_title = "Deliver"
end

# spec/support/assert_select_root.rb

module AssertSelectRoot
  def document_root_element
    html_document.root
  end
end

RSpec.configure do |config|
    config.include AssertSelectRoot, :type => :request
end

RSpec.describe "home page", :type => :request do
	it "should get home" do
		get "/static_pages/home"
		assert_response :success
	end

	it "should get home ii" do
		get "/static_pages/home"
		assert_select "title", "Deliver"
	end
	
end