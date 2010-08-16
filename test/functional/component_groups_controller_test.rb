require 'test_helper'

class ComponentGroupsControllerTest < ActionController::TestCase
  
  test 'create' do
    ComponentGroup.any_instance.expects(:save).returns(true)
    resource = component_groups(:basic)
    post :create, :resource => resource.attributes
    assert_response :redirect
  end
  
  test 'create with failure' do
    ComponentGroup.any_instance.expects(:save).returns(false)
    resource = component_groups(:basic)
    post :create, :resource => resource.attributes
    assert_template 'new'
  end
  
  test 'update' do
    ComponentGroup.any_instance.expects(:save).returns(true)
    resource = component_groups(:basic)
    put :update, :id => component_groups(:basic).to_param, :resource => resource.attributes
    assert_response :redirect
  end
  
  test 'update with failure' do
    ComponentGroup.any_instance.expects(:save).returns(false)
    resource = component_groups(:basic)
    put :update, :id => component_groups(:basic).to_param, :resource => resource.attributes
    assert_template 'edit'
  end
  
  test 'destroy' do
    ComponentGroup.any_instance.expects(:destroy).returns(true)
    resource = component_groups(:basic)
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
    resource = component_groups(:basic)
    get :edit, :id => resource.to_param
    assert_response :success
  end
  
  test 'show' do
    resource = component_groups(:basic)
    get :show, :id => resource.to_param
    assert_response :success
  end
  
  test 'index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:component_groups)
  end
  
end