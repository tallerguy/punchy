require 'rails_helper'

feature "User logs in" do
  scenario 'successfully' do
    sign_in

    expect(page).to have_link("Punchy", href: authenticated_root_path)
  end
end
