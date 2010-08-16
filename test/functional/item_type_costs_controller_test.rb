require 'test_helper'

class ItemTypeCostsControllerTest < ActionController::TestCase
  
  test 'create' do
    ItemTypeCost.any_instance.expects(:save).returns(true)
    resource = item_type_costs(:basic)
    post :create, :resource => resource.attributes
    assert_response :redirect
  end
  
  test 'create with failure' do
    ItemTypeCost.any_instance.expects(:save).returns(false)
    resource = item_type_costs(:basic)
    post :create, :resource => resource.attributes
    assert_template 'new'
  end
  
  test 'update' do
    ItemTypeCost.any_instance.expects(:save).returns(true)
    resource = item_type_costs(:basic)
    put :update, :id => item_type_costs(:basic).to_param, :resource => resource.attributes
    assert_response :redirect
  end
  
  test 'update with failure' do
    ItemTypeCost.any_instance.expects(:save).returns(false)
    resource = item_type_costs(:basic)
    put :update, :id => item_type_costs(:basic).to_param, :resource => resource.attributes
    assert_template 'edit'
  end
  
  test 'destroy' do
    ItemTypeCost.any_instance.expects(:destroy).returns(true)
    resource = item_type_costs(:basic)
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
    resource = item_type_costs(:basic)
    get :edit, :id => resource.to_param
    assert_response :success
  end
  
  test 'show' do
    resource = item_type_costs(:basic)
    get :show, :id => resource.to_param
    assert_response :success
  end
  
  test 'index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:item_type_costs)
  end
  
end