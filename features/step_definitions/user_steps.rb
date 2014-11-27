Given 'there are some users' do
  User.create!(name: 'Fred', email: 'fred@example.com', password: 'secret', password_confirmation: 'secret')
  User.create!(name: 'Bert', email: 'bert@example.com', password: 'secret', password_confirmation: 'secret', admin: true)
end

When 'I go to the users page' do
  visit users_path
end

Then 'I should see the users' do
  expect(page).to have_content('Users')
end

When 'I fill in the new user form' do
  click_link('New User')
  fill_in('Name',         with: 'Barney Rubble')
  fill_in('Email',        with: 'barney@example.com')
  fill_in('Password',     with: 'secret')
  fill_in('Confirmation', with: 'secret')
  click_on('Create User')
end

Then 'I should see the new user is created' do
  expect(page).to have_content('User was successfully created.')
  expect(User.find_by(email: 'barney@example.com')).to be_truthy
end

When 'I edit an existing user' do
  user = User.find_by(name: 'Fred')

  click_link("edit_#{user.id}")

  fill_in('Name', with: 'Betty')
  click_on('Update User')
end

Then 'I should see the user has been updated' do
  expect(page).to have_content('User was successfully updated.')
  expect(User.find_by(email: 'fred@example.com').name).to eq('Betty')
end

When 'I delete an existing user' do
  user = User.find_by(name: 'Bert')

  click_link("delete_#{user.id}")
end

Then 'I should see the user has been deleted' do
  expect(page).to have_content('User was successfully destroyed.')
  expect(User.find_by(email: 'bert@example.com')).to be_nil
end
