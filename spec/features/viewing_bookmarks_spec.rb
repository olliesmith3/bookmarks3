feature "View bookmarks" do
  scenario "user navigates to /bookmarks and can view a list of their bookmarks" do
    visit("/bookmarks")
    expect(page).to have_content "https://www.bbc.com"
    expect(page).to have_content "https://www.cats.com"
  end
end
