feature "View bookmarks" do
  scenario "user navigates to /bookmarks and can view a list of their bookmarks" do
    visit("/")
    click_button 'Go to Bookmarks'
    fill_in :url, with: "https://www.bbc.com"
    click_button 'Add Bookmark'
    fill_in :url, with: "https://www.cats.com"
    click_button 'Add Bookmark'
    expect(page).to have_content "https://www.bbc.com"
    expect(page).to have_content "https://www.cats.com"
  end
end
