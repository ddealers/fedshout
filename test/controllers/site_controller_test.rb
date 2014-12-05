require 'test_helper'

class SiteControllerTest < ActionController::TestCase
  test "should get scrap" do
    get :scrap
    assert_response :success
  end

end
