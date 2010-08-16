require 'test_helper'

class ItemTypesControllerTest < ActionController::TestCase
  
  test 'create' do
    ItemType.any_instance.expects(:save).returns(true)
    resource = item_types(:basic)
    post :create, :resource => resource.attributes
    assert_response :redirect
  end
  
  test 'create with failure' do
    ItemType.any_instance.expects(:save).returns(false)
    resource = item_types(:basic)
    post :create, :resource => resource.attributes
    assert_template 'new'
  end
  
  test 'update' do
    ItemType.any_instance.expects(:save).returns(true)
    resource = item_types(:basic)
    put :update, :id => item_types(:basic).to_param, :resource => resource.attributes
    assert_response :redirect
  end
  
  test 'update with failure' do
    ItemType.any_instance.expects(:save).returns(false)
    resource = item_types(:basic)
    put :update, :id => item_types(:basic).to_param, :resource => resource.attributes
    assert_template 'edit'
  end
  
  test 'destroy' do
    ItemType.any_instance.expects(:destroy).returns(true)
    resource = item_types(:basic)
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
    resource = item_types(:basic)
    get :edit, :id => resource.to_param
    assert_response :success
  end
  
  test 'show' do
    resource = item_types(:basic)
    get :show, :id => resource.to_param
    assert_response :success
  end
  
  test 'index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:item_types)
  end
  
end