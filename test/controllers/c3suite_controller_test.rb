require 'test_helper'

class C3suiteControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get c3suite_index_url
    assert_response :success
  end

end
