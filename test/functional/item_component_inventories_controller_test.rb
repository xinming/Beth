require 'test_helper'

class ItemComponentInventoriesControllerTest < ActionController::TestCase
  
  test 'create' do
    ItemComponentInventory.any_instance.expects(:save).returns(true)
    resource = item_component_inventories(:basic)
    post :create, :resource => resource.attributes
    assert_response :redirect
  end
  
  test 'create with failure' do
    ItemComponentInventory.any_instance.expects(:save).returns(false)
    resource = item_component_inventories(:basic)
    post :create, :resource => resource.attributes
    assert_template 'new'
  end
  
  test 'update' do
    ItemComponentInventory.any_instance.expects(:save).returns(true)
    resource = item_component_inventories(:basic)
    put :update, :id => item_component_inventories(:basic).to_param, :resource => resource.attributes
    assert_response :redirect
  end
  
  test 'update with failure' do
    ItemComponentInventory.any_instance.expects(:save).returns(false)
    resource = item_component_inventories(:basic)
    put :update, :id => item_component_inventories(:basic).to_param, :resource => resource.attributes
    assert_template 'edit'
  end
  
  test 'destroy' do
    ItemComponentInventory.any_instance.expects(:destroy).returns(true)
    resource = item_component_inventories(:basic)
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
    resource = item_component_inventories(:basic)
    get :edit, :id => resource.to_param
    assert_response :success
  end
  
  test 'show' do
    resource = item_component_inventories(:basic)
    get :show, :id => resource.to_param
    assert_response :success
  end
  
  test 'index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:item_component_inventories)
  end
  
end