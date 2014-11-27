def login_as(user)
  visit sessions_new_path
  within('#login_form') do
    fill_in('Email',    with: "#{user}@example.com")
    fill_in('Password', with: 'secret')
    click_on('Log in')
  end
end

Given 'I am logged in' do
  login_as('fred')
end

Given 'I am logged in as an admin' do
  login_as('bert')
end

When 'the user goes to the log in page' do
  visit sessions_new_path
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

When 'I go to a protected page' do
  user = User.find_by(email: 'fred@example.com')
  visit user_path(user)
end

Then 'I should be redirected to the login page' do
  expect(page).to have_content('Please log in')
end

When 'I go to an admin only page' do
  user = User.find_by(email: 'fred@example.com')
  page.driver.submit :delete, "/users/#{user.id}", {}
end

Then 'I should see the admin only page' do
  expect(page).to have_content('User was successfully destroyed')
end

Then 'I should see I am not authorised' do
  expect(page).to have_content('You are not authorised to do that')
end
