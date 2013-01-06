require 'integration_test_helper' 
 
class UserTest < ActionController::IntegrationTest
 
  test "edit User profile" do
    visit('my/users/sign_up')
    assert page.has_content?('Sign up')
    fill_in 'Email', :with => 'John.Tolkien@a1.net'
    fill_in 'Password', :with => 'Tolkien'
    fill_in 'Passowrd confirmation', :with => 'Tolkien'
    click_button 'Sign up'
    assert page.has_content?('PRODUCT')
    click_link 'Edit profile'
    assert page.has_content?('Edit User')
    fill_in 'First name', :with => 'John'
    fill_in 'Last name', :with => 'Tolkien'
    fill_in 'Roomnumber', :with => '152'
    fill_in 'Current password', :with => 'Tolkien'
    click_button 'Update'
    assert page.has_content?('PRODUCT')
  end
end

