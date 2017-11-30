require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium, using: :chrome, screen_size: [1400, 1400]

  def login(email, password)
    visit root_path
    click_link "Prijavi se"
    fill_in "Email", with: email
    fill_in "Lozinka", with: password
    click_button "Prijavi se"
  end
end
