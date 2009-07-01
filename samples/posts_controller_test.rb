require 'test_helper'

class PostsControllerTest < ActionController::TestCase

  test "should create post" do
    Post.any_instance.expects(:save).returns(true)
    post :create, :post => { }
    assert_response :redirect
  end

  test "should handle failure to create post" do
    Post.any_instance.expects(:save).returns(false)
    post :create, :post => { }
    assert_template "new"
  end

  test "should destroy post" do
    Post.any_instance.expects(:destroy).returns(true)
    delete :destroy, :id => posts(:one).to_param
    assert_not_nil flash[:notice]    
    assert_response :redirect
  end

  test "should handle failure to destroy post" do
    Post.any_instance.expects(:destroy).returns(false)    
    delete :destroy, :id => posts(:one).to_param
    assert_not_nil flash[:error]
    assert_response :redirect
  end

  test "should get edit for post" do
    get :edit, :id => posts(:one).to_param
    assert_response :success
  end

  test "should get index for posts" do
    get :index
    assert_response :success
    assert_not_nil assigns(:posts)
  end

  test "should get new for post" do
    get :new
    assert_response :success
  end

  test "should get show for post" do
    get :show, :id => posts(:one).to_param
    assert_response :success
  end

  test "should update post" do
    Post.any_instance.expects(:save).returns(true)
    put :update, :id => posts(:one).to_param, :post => { }
    assert_response :redirect
  end

  test "should handle failure to update post" do
    Post.any_instance.expects(:save).returns(false)
    put :update, :id => posts(:one).to_param, :post => { }
    assert_template "edit"
  end

end