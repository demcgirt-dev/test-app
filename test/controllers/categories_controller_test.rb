require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
  
  def setup
    @category = Category.create(name: "sports")
    @user = User.create(username: "Davy Linez", email: "davylinez@gmail.com", password: "password", admin: true)
  end
  
  test "should get categories index" do
    get :index
    assert_response :success
  end
  
  test "should get categories new" do
    session[:user_id] = @user.id
    get :new
    assert_response :success
  end
  
  test "should get categories show" do
    get(:show, {'id' => @category.id })
    assert_response :success
  end
  
  test "should redirect create when admin is not logged in" do
    assert_no_difference 'Category.count' do
      post :create, category: { name: "sports" }
    end
    assert_redirected_to categories_path
  end
  
end