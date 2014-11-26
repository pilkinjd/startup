When 'I go to the home page' do
  visit root_path
end
Then 'I should see the home page content' do
  expect(page).to have_content('Welcome to the startup app')
end
