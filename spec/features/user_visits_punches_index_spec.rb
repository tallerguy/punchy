require 'rails_helper'

feature "User visits punches index page" do

  subject {
    create(:user,
      email: 'abhilash198712@gmail.com',
      password: 'password',
      password_confirmation: 'password'
    )
  }

  scenario 'successfully' do
    sign_in_as subject.email, 'password'
    visit '/punches/'

    expect(page).to have_css 'div.card-header', text: 'Punches'
  end

  scenario 'sees only own punches' do
    user = create(:user)
    punch = create(:punch, user_id: user.id)

    sign_in_as subject.email, 'password'
    visit '/punches/'

    expect(page).to have_css 'p', text: 'No Puches Recorded'
  end
end
