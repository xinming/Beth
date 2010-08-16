require 'test_helper'

class UnitConversionsControllerTest < ActionController::TestCase
  
  test 'create' do
    UnitConversion.any_instance.expects(:save).returns(true)
    resource = unit_conversions(:basic)
    post :create, :resource => resource.attributes
    assert_response :redirect
  end
  
  test 'create with failure' do
    UnitConversion.any_instance.expects(:save).returns(false)
    resource = unit_conversions(:basic)
    post :create, :resource => resource.attributes
    assert_template 'new'
  end
  
  test 'update' do
    UnitConversion.any_instance.expects(:save).returns(true)
    resource = unit_conversions(:basic)
    put :update, :id => unit_conversions(:basic).to_param, :resource => resource.attributes
    assert_response :redirect
  end
  
  test 'update with failure' do
    UnitConversion.any_instance.expects(:save).returns(false)
    resource = unit_conversions(:basic)
    put :update, :id => unit_conversions(:basic).to_param, :resource => resource.attributes
    assert_template 'edit'
  end
  
  test 'destroy' do
    UnitConversion.any_instance.expects(:destroy).returns(true)
    resource = unit_conversions(:basic)
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
    resource = unit_conversions(:basic)
    get :edit, :id => resource.to_param
    assert_response :success
  end
  
  test 'show' do
    resource = unit_conversions(:basic)
    get :show, :id => resource.to_param
    assert_response :success
  end
  
  test 'index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:unit_conversions)
  end
  
end