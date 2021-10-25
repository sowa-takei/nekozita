require 'test_helper'

class PublicControllerTest < ActionDispatch::IntegrationTest
  test "should get PostComments" do
    get public_PostComments_url
    assert_response :success
  end

end
