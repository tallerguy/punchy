require 'rails_helper'

feature "User Punches" do
  subject {
    create(:user,
      email: 'abhilash198712@gmail.com',
      password: 'password',
      password_confirmation: 'password'
    )
  }

  scenario "punches in" do
    sign_in_as subject.email, 'password'

    click_on "Clock In"

    last_punch = subject.punches.last

    expect(last_punch.punch_type).to eq(Punch::TYPES[:clock_in])
    expect(subject.state).to eq('clocked_in')

  end
  scenario "punches out"
end
