require 'test_helper'

class PaymentsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get payment_new_url
    assert_response :success
  end

end
