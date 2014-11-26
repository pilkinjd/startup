Given 'there are some users' do
  User.create!(name: 'Fred', email: 'fred@example.com', password: 'secret', password_confirmation: 'secret')
  User.create!(name: 'Bert', email: 'bert@example.com', password: 'secret', password_confirmation: 'secret')
end

When 'I go to the users page' do
  visit users_path
end

Then 'I should see the users' do
  expect(page).to have_content('Users')
end
