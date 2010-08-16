require 'test_helper'

class ContactsControllerTest < ActionController::TestCase
  
  test 'create' do
    Contact.any_instance.expects(:save).returns(true)
    resource = contacts(:basic)
    post :create, :resource => resource.attributes
    assert_response :redirect
  end
  
  test 'create with failure' do
    Contact.any_instance.expects(:save).returns(false)
    resource = contacts(:basic)
    post :create, :resource => resource.attributes
    assert_template 'new'
  end
  
  test 'update' do
    Contact.any_instance.expects(:save).returns(true)
    resource = contacts(:basic)
    put :update, :id => contacts(:basic).to_param, :resource => resource.attributes
    assert_response :redirect
  end
  
  test 'update with failure' do
    Contact.any_instance.expects(:save).returns(false)
    resource = contacts(:basic)
    put :update, :id => contacts(:basic).to_param, :resource => resource.attributes
    assert_template 'edit'
  end
  
  test 'destroy' do
    Contact.any_instance.expects(:destroy).returns(true)
    resource = contacts(:basic)
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
    resource = contacts(:basic)
    get :edit, :id => resource.to_param
    assert_response :success
  end
  
  test 'show' do
    resource = contacts(:basic)
    get :show, :id => resource.to_param
    assert_response :success
  end
  
  test 'index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:contacts)
  end
  
end