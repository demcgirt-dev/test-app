require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  
  def setup
    @category = Category.new(name: "sports")
  end
  
  test "category should be valid" do
    assert @category.valid?
  end
  
  test "name should be present" do
    @category.name = " "
    assert_not @category.valid?
  end
  
  test "name should be unique" do
    @category.save
    category2 = Category.new(name: "sports")
    assert_not category2.valid? 
  end
  
  test "name should not be more than 20 characters" do
    @category.name = "D" * 25
    assert_not @category.valid?
  end
  
  test "name should not be less than 3 characters" do
    @category.name = "M" * 2
    assert_not @category.valid?
  end
  
end