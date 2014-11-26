Given 'I am logged in' do
  visit sessions_new_path
  within('#login_form') do
    fill_in('Email',    with: 'fred@example.com')
    fill_in('Password', with: 'secret')
    click_on('Log in')
  end
end

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
  expect(page).to have_content('Log out')
  expect(page).to have_content('Fred')
end

When 'I log out' do
  click_on 'Log out'
end

Then 'I should see the user is logged out' do
  expect(page).to have_content('Log in')
end
