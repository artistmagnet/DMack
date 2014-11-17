# require 'rails_helper'
#
# RSpec.describe "rtables/new", :type => :view do
#   before(:each) do
#     assign(:rtable, Rtable.new(
#       :title => "MyString",
#       :columns => "MyString",
#       :positions => 1,
#       :type => ""
#     ))
#   end
#
#   it "renders new rtable form" do
#     render
#
#     assert_select "form[action=?][method=?]", rtables_path, "post" do
#
#       assert_select "input#rtable_title[name=?]", "rtable[title]"
#
#       assert_select "input#rtable_columns[name=?]", "rtable[columns]"
#
#       assert_select "input#rtable_positions[name=?]", "rtable[positions]"
#
#       assert_select "input#rtable_type[name=?]", "rtable[type]"
#     end
#   end
# end
