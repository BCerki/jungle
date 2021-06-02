require 'rails_helper'

RSpec.feature "users can login successfully and are taken to the home page once they are signed in", type: :feature, js: true do

  # SETUP
  before :each do
    @user = User.create!(
      first_name: 'Natasha',
      last_name: 'Pulley',
      email: 'email@email.com',
      password: 'password',
      password_confirmation: 'password'
    )
  end

  scenario "user can get to the login page" do
    # ACT
    visit root_path
    click_link("Login")

    # VERIFY
    expect(page).to have_text "Email"

    # DEBUG
    save_screenshot 'login-page.png'
  end

  scenario "user can enter credentials and login" do
    # ACT
    visit login_path
    puts page.html
    fill_in "email", with: "email@email.com"
    fill_in "password", with: "password"
    click_button

    # VERIFY
    expect(page).to have_css "section.products-index"

    # DEBUG
    save_screenshot 'redirect-to-home-page.png'
  end

  scenario "user can enter credentials and login" do
    # ACT
    visit login_path
    puts page.html
    fill_in "email", with: @user.email
    fill_in "password", with: @user.password
    click_button

    # VERIFY
    expect(page).to have_css "section.products-index"
    expect(page).to have_content "Logout"

    # DEBUG
    save_screenshot 'redirect-to-home-page.png'
  end

  scenario "user stays on login page if wrong crendentials" do

    # ACT
    visit login_path
    # puts page.html
    fill_in "email", with: @user.email
    fill_in "password", with: "wrong"
    click_button

    # VERIFY
    expect(page).to have_content "Invalid credentials"

    # DEBUG
    save_screenshot 'stay-on-login.png'
  end

end
