require 'test_helper'

class UsersIndexTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:joseph)
    @other_user = users(:michael)
  end

  test "index including pagination" do
    log_in_as(@user)
    get users_path
    assert_template 'users/index'
    assert_select 'div.pagination'
  end

  test "admin user can delete other user" do
    log_in_as(@user)
    assert_difference 'User.count', -1 do
      delete user_path(@other_user)
    end
    assert_redirected_to users_path
  end
end
