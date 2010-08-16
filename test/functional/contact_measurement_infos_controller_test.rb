require 'test_helper'

class ContactMeasurementInfosControllerTest < ActionController::TestCase
  
  test 'create' do
    ContactMeasurementInfo.any_instance.expects(:save).returns(true)
    resource = contact_measurement_infos(:basic)
    post :create, :resource => resource.attributes
    assert_response :redirect
  end
  
  test 'create with failure' do
    ContactMeasurementInfo.any_instance.expects(:save).returns(false)
    resource = contact_measurement_infos(:basic)
    post :create, :resource => resource.attributes
    assert_template 'new'
  end
  
  test 'update' do
    ContactMeasurementInfo.any_instance.expects(:save).returns(true)
    resource = contact_measurement_infos(:basic)
    put :update, :id => contact_measurement_infos(:basic).to_param, :resource => resource.attributes
    assert_response :redirect
  end
  
  test 'update with failure' do
    ContactMeasurementInfo.any_instance.expects(:save).returns(false)
    resource = contact_measurement_infos(:basic)
    put :update, :id => contact_measurement_infos(:basic).to_param, :resource => resource.attributes
    assert_template 'edit'
  end
  
  test 'destroy' do
    ContactMeasurementInfo.any_instance.expects(:destroy).returns(true)
    resource = contact_measurement_infos(:basic)
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
    resource = contact_measurement_infos(:basic)
    get :edit, :id => resource.to_param
    assert_response :success
  end
  
  test 'show' do
    resource = contact_measurement_infos(:basic)
    get :show, :id => resource.to_param
    assert_response :success
  end
  
  test 'index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:contact_measurement_infos)
  end
  
end