require 'test_helper'

class ServiceObjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @service_object = service_objects(:baroness)
  end

  test "should get index" do
    get service_objects_url
    assert_response :success
  end

  test "should get new" do
    get new_service_object_url
    assert_response :success
  end

  test "should create service_object" do
    assert_difference('ServiceObject.count') do
      post service_objects_url, params: { service_object: service_objects(:complete).attributes }
    end

    assert_redirected_to service_object_url(ServiceObject.last)
  end

  test "should show service_object" do
    get service_object_url(@service_object)
    assert_response :success
  end

  test "should get edit" do
    get edit_service_object_url(@service_object)
    assert_response :success
  end

  test "should update service_object" do
    patch service_object_url(@service_object), params: { service_object: service_objects(:complete).attributes }
    assert_redirected_to service_object_url(@service_object)
  end

  test "should destroy service_object" do
    assert_difference('ServiceObject.count', -1) do
      delete service_object_url(@service_object)
    end

    assert_redirected_to service_objects_url
  end
end
