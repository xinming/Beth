require 'test_helper'

class CostsControllerTest < ActionController::TestCase
  
  test 'create' do
    Cost.any_instance.expects(:save).returns(true)
    resource = costs(:basic)
    post :create, :resource => resource.attributes
    assert_response :redirect
  end
  
  test 'create with failure' do
    Cost.any_instance.expects(:save).returns(false)
    resource = costs(:basic)
    post :create, :resource => resource.attributes
    assert_template 'new'
  end
  
  test 'update' do
    Cost.any_instance.expects(:save).returns(true)
    resource = costs(:basic)
    put :update, :id => costs(:basic).to_param, :resource => resource.attributes
    assert_response :redirect
  end
  
  test 'update with failure' do
    Cost.any_instance.expects(:save).returns(false)
    resource = costs(:basic)
    put :update, :id => costs(:basic).to_param, :resource => resource.attributes
    assert_template 'edit'
  end
  
  test 'destroy' do
    Cost.any_instance.expects(:destroy).returns(true)
    resource = costs(:basic)
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
    resource = costs(:basic)
    get :edit, :id => resource.to_param
    assert_response :success
  end
  
  test 'show' do
    resource = costs(:basic)
    get :show, :id => resource.to_param
    assert_response :success
  end
  
  test 'index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:costs)
  end
  
end