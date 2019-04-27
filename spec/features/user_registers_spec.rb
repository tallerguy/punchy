require 'rails_helper'

feature "User Registers" do
  scenario 'successfully' do
    visit "/users/sign_up"

    fill_in "user_email", with: 'test@example.com'
    fill_in "user_first_name", with: "test"
    fill_in "user_last_name", with: "user"
    fill_in "registraion-password", with: "password"
    fill_in "user_password_confirmation", with: "password"

    click_on 'Register'

    user = User.find_by(email: 'test@example.com')

    expect(user).not_to be_nil
  end
end
