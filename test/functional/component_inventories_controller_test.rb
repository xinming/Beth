require 'test_helper'

class ComponentInventoriesControllerTest < ActionController::TestCase
  
  test 'create' do
    ComponentInventory.any_instance.expects(:save).returns(true)
    resource = component_inventories(:basic)
    post :create, :resource => resource.attributes
    assert_response :redirect
  end
  
  test 'create with failure' do
    ComponentInventory.any_instance.expects(:save).returns(false)
    resource = component_inventories(:basic)
    post :create, :resource => resource.attributes
    assert_template 'new'
  end
  
  test 'update' do
    ComponentInventory.any_instance.expects(:save).returns(true)
    resource = component_inventories(:basic)
    put :update, :id => component_inventories(:basic).to_param, :resource => resource.attributes
    assert_response :redirect
  end
  
  test 'update with failure' do
    ComponentInventory.any_instance.expects(:save).returns(false)
    resource = component_inventories(:basic)
    put :update, :id => component_inventories(:basic).to_param, :resource => resource.attributes
    assert_template 'edit'
  end
  
  test 'destroy' do
    ComponentInventory.any_instance.expects(:destroy).returns(true)
    resource = component_inventories(:basic)
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
    resource = component_inventories(:basic)
    get :edit, :id => resource.to_param
    assert_response :success
  end
  
  test 'show' do
    resource = component_inventories(:basic)
    get :show, :id => resource.to_param
    assert_response :success
  end
  
  test 'index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:component_inventories)
  end
  
end