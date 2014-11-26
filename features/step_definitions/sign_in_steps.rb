When 'the user goes to log in' do
  visit users_path
  click_on 'Log in'
end

When 'they complete the login form' do
  within('#login_form') do
    fill_in('Email',    with: 'fred@example.com')
    fill_in('Password', with: 'secret')
    click_on('Log in')
  end
end

Then 'they should see they are logged in' do
  expect(page).to have_content('Fred')
  expect(page).to have_content('Log out')
end
