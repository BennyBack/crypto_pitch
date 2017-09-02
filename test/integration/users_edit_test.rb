require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
 
  def setup
    @user = users(:zannain)
  end

  test 'unsuccessful edit' do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), params: {
      user: {
        phone_number: " ",
        email: "foo@invalid",
        password: "foobar",
        password_confirmation: "bar"
      }
    }
    assert_template 'users/edit'
  end

  test 'successful edit' do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    email = 'test@example.com'
    phone_number = '123456790'
    patch user_path(@user), params: {
      user: {
        phone_number: phone_number,
        email: email,
        password: 'password',
        password_confirmation: "password"
      }
    }
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
    assert_equal phone_number, @user.phone_number
    assert_equal email, @user.email
  end

end
