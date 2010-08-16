require 'test_helper'

class CustomersControllerTest < ActionController::TestCase
  
  test 'create' do
    Customer.any_instance.expects(:save).returns(true)
    resource = customers(:basic)
    post :create, :resource => resource.attributes
    assert_response :redirect
  end
  
  test 'create with failure' do
    Customer.any_instance.expects(:save).returns(false)
    resource = customers(:basic)
    post :create, :resource => resource.attributes
    assert_template 'new'
  end
  
  test 'update' do
    Customer.any_instance.expects(:save).returns(true)
    resource = customers(:basic)
    put :update, :id => customers(:basic).to_param, :resource => resource.attributes
    assert_response :redirect
  end
  
  test 'update with failure' do
    Customer.any_instance.expects(:save).returns(false)
    resource = customers(:basic)
    put :update, :id => customers(:basic).to_param, :resource => resource.attributes
    assert_template 'edit'
  end
  
  test 'destroy' do
    Customer.any_instance.expects(:destroy).returns(true)
    resource = customers(:basic)
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
    resource = customers(:basic)
    get :edit, :id => resource.to_param
    assert_response :success
  end
  
  test 'show' do
    resource = customers(:basic)
    get :show, :id => resource.to_param
    assert_response :success
  end
  
  test 'index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:customers)
  end
  
end