require 'test_helper'

class InventoryLogsControllerTest < ActionController::TestCase
  
  test 'create' do
    InventoryLog.any_instance.expects(:save).returns(true)
    resource = inventory_logs(:basic)
    post :create, :resource => resource.attributes
    assert_response :redirect
  end
  
  test 'create with failure' do
    InventoryLog.any_instance.expects(:save).returns(false)
    resource = inventory_logs(:basic)
    post :create, :resource => resource.attributes
    assert_template 'new'
  end
  
  test 'update' do
    InventoryLog.any_instance.expects(:save).returns(true)
    resource = inventory_logs(:basic)
    put :update, :id => inventory_logs(:basic).to_param, :resource => resource.attributes
    assert_response :redirect
  end
  
  test 'update with failure' do
    InventoryLog.any_instance.expects(:save).returns(false)
    resource = inventory_logs(:basic)
    put :update, :id => inventory_logs(:basic).to_param, :resource => resource.attributes
    assert_template 'edit'
  end
  
  test 'destroy' do
    InventoryLog.any_instance.expects(:destroy).returns(true)
    resource = inventory_logs(:basic)
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
    resource = inventory_logs(:basic)
    get :edit, :id => resource.to_param
    assert_response :success
  end
  
  test 'show' do
    resource = inventory_logs(:basic)
    get :show, :id => resource.to_param
    assert_response :success
  end
  
  test 'index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:inventory_logs)
  end
  
end