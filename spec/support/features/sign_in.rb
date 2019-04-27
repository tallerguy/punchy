module Features
  def sign_in
    sign_in_as('abhilash198712@gmail.com', 'password')
  end

  def sign_in_as(email, password)
    visit '/'

    fill_in 'user_email', with: email
    fill_in 'user_password', with: 'password'

    click_on "Login"
  end
end