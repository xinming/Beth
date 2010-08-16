require 'test_helper'

class ItemsControllerTest < ActionController::TestCase
  
  test 'create' do
    Item.any_instance.expects(:save).returns(true)
    resource = items(:basic)
    post :create, :resource => resource.attributes
    assert_response :redirect
  end
  
  test 'create with failure' do
    Item.any_instance.expects(:save).returns(false)
    resource = items(:basic)
    post :create, :resource => resource.attributes
    assert_template 'new'
  end
  
  test 'update' do
    Item.any_instance.expects(:save).returns(true)
    resource = items(:basic)
    put :update, :id => items(:basic).to_param, :resource => resource.attributes
    assert_response :redirect
  end
  
  test 'update with failure' do
    Item.any_instance.expects(:save).returns(false)
    resource = items(:basic)
    put :update, :id => items(:basic).to_param, :resource => resource.attributes
    assert_template 'edit'
  end
  
  test 'destroy' do
    Item.any_instance.expects(:destroy).returns(true)
    resource = items(:basic)
    delete :destroy, :id => resource.to_param
    assert_not_nil flash[:notice] 
    assert_response :redirect
  end
  
  # Not possible: destroy with failure
  
  test 'new' do
    get :new
    assert_response :success
  end
  
  test 'edit' do
    resource = items(:basic)
    get :edit, :id => resource.to_param
    assert_response :success
  end
  
  test 'show' do
    resource = items(:basic)
    get :show, :id => resource.to_param
    assert_response :success
  end
  
  test 'index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:items)
  end
  
end