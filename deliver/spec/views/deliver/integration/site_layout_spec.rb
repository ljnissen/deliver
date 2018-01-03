require 'rails_helper'
require 'spec_helper'

module AssertSelectRoot
	def document_root_element
	  html_document.root
	end
end

RSpec.configure do |config|
    config.include AssertSelectRoot, :type => :request
end

RSpec.describe "layout page", :type => :request do
	it "should get layout links" do
		get root_path
		assert_template 'static_pages/home' 
	end

	it "should get root link" do
		get root_path
		assert_select "a[href=?]", root_path, count: 2
	end 

	it "should get help link" do
		get help_path
		assert_select "a[href=?]", help_path
	end 

	it "should get about link" do
		get about_path
		assert_select "a[href=?]", about_path
	end 

	it "should get contact link" do
		get contact_path
		assert_select "a[href=?]", contact_path
	end 
end