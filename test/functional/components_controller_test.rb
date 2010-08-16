require 'test_helper'

class ComponentsControllerTest < ActionController::TestCase
  
  test 'create' do
    Component.any_instance.expects(:save).returns(true)
    resource = components(:basic)
    post :create, :resource => resource.attributes
    assert_response :redirect
  end
  
  test 'create with failure' do
    Component.any_instance.expects(:save).returns(false)
    resource = components(:basic)
    post :create, :resource => resource.attributes
    assert_template 'new'
  end
  
  test 'update' do
    Component.any_instance.expects(:save).returns(true)
    resource = components(:basic)
    put :update, :id => components(:basic).to_param, :resource => resource.attributes
    assert_response :redirect
  end
  
  test 'update with failure' do
    Component.any_instance.expects(:save).returns(false)
    resource = components(:basic)
    put :update, :id => components(:basic).to_param, :resource => resource.attributes
    assert_template 'edit'
  end
  
  test 'destroy' do
    Component.any_instance.expects(:destroy).returns(true)
    resource = components(:basic)
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
    resource = components(:basic)
    get :edit, :id => resource.to_param
    assert_response :success
  end
  
  test 'show' do
    resource = components(:basic)
    get :show, :id => resource.to_param
    assert_response :success
  end
  
  test 'index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:components)
  end
  
end