require 'test_helper'

class IncomingOrdersControllerTest < ActionController::TestCase
  
  test 'create' do
    IncomingOrder.any_instance.expects(:save).returns(true)
    resource = incoming_orders(:basic)
    post :create, :resource => resource.attributes
    assert_response :redirect
  end
  
  test 'create with failure' do
    IncomingOrder.any_instance.expects(:save).returns(false)
    resource = incoming_orders(:basic)
    post :create, :resource => resource.attributes
    assert_template 'new'
  end
  
  test 'update' do
    IncomingOrder.any_instance.expects(:save).returns(true)
    resource = incoming_orders(:basic)
    put :update, :id => incoming_orders(:basic).to_param, :resource => resource.attributes
    assert_response :redirect
  end
  
  test 'update with failure' do
    IncomingOrder.any_instance.expects(:save).returns(false)
    resource = incoming_orders(:basic)
    put :update, :id => incoming_orders(:basic).to_param, :resource => resource.attributes
    assert_template 'edit'
  end
  
  test 'destroy' do
    IncomingOrder.any_instance.expects(:destroy).returns(true)
    resource = incoming_orders(:basic)
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
    resource = incoming_orders(:basic)
    get :edit, :id => resource.to_param
    assert_response :success
  end
  
  test 'show' do
    resource = incoming_orders(:basic)
    get :show, :id => resource.to_param
    assert_response :success
  end
  
  test 'index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:incoming_orders)
  end
  
end