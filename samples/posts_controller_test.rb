require 'test_helper'

class PostsControllerTest < ActionController::TestCase

  def test_create
    Post.any_instance.expects(:save).returns(true)
    post :create, :post => { }
    assert_response :redirect
  end

  def test_create_with_failure
    Post.any_instance.expects(:save).returns(false)
    post :create, :post => { }
    assert_template "new"
  end

  def test_destroy
    Post.any_instance.expects(:destroy).returns(true)
    delete :destroy, :id => posts(:one).to_param
    assert_not_nil flash[:notice]    
    assert_response :redirect
  end

  def test_destroy_with_failure
    Post.any_instance.expects(:destroy).returns(false)    
    delete :destroy, :id => posts(:one).to_param
    assert_not_nil flash[:error]
    assert_response :redirect
  end

  def test_edit
    get :edit, :id => posts(:one).to_param
    assert_response :success
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:posts)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_show
    get :show, :id => posts(:one).to_param
    assert_response :success
  end

  def test_update
    Post.any_instance.expects(:save).returns(true)
    put :update, :id => posts(:one).to_param, :post => { }
    assert_response :redirect
  end

  def test_update_with_failure
    Post.any_instance.expects(:save).returns(false)
    put :update, :id => posts(:one).to_param, :post => { }
    assert_template "edit"
  end

end