feature 'view homepage' do
  scenario 'user navigates to /' do
    visit('/')
    expect(page).to have_content "Hello world!"
  end
end