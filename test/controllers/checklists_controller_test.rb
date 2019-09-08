require 'test_helper'

class ChecklistsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get checklists_index_url
    assert_response :success
  end

end
