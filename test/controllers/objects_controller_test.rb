require "test_helper"

class ObjectsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get objects_index_url
    assert_response :success
  end
end
