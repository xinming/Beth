require 'test_helper'

class FabricsControllerTest < ActionController::TestCase
  
  test 'create' do
    Fabric.any_instance.expects(:save).returns(true)
    resource = fabrics(:basic)
    post :create, :resource => resource.attributes
    assert_response :redirect
  end
  
  test 'create with failure' do
    Fabric.any_instance.expects(:save).returns(false)
    resource = fabrics(:basic)
    post :create, :resource => resource.attributes
    assert_template 'new'
  end
  
  test 'update' do
    Fabric.any_instance.expects(:save).returns(true)
    resource = fabrics(:basic)
    put :update, :id => fabrics(:basic).to_param, :resource => resource.attributes
    assert_response :redirect
  end
  
  test 'update with failure' do
    Fabric.any_instance.expects(:save).returns(false)
    resource = fabrics(:basic)
    put :update, :id => fabrics(:basic).to_param, :resource => resource.attributes
    assert_template 'edit'
  end
  
  test 'destroy' do
    Fabric.any_instance.expects(:destroy).returns(true)
    resource = fabrics(:basic)
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
    resource = fabrics(:basic)
    get :edit, :id => resource.to_param
    assert_response :success
  end
  
  test 'show' do
    resource = fabrics(:basic)
    get :show, :id => resource.to_param
    assert_response :success
  end
  
  test 'index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:fabrics)
  end
  
end