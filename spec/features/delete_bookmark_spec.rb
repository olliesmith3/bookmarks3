feature "Delete a bookmark" do
  scenario "user deletes a bookmark from their list" do
    clear_table()
    visit("/")
    click_button "Go to Bookmarks"
    fill_in :title, with: "The BBC Website"
    fill_in :url, with: "https://www.bbc.com"
    click_button "Add Bookmark"
    expect(page).to have_link("The BBC Website", href: "https://www.bbc.com")
    fill_in :title, with: "My Favourite Cats"
    fill_in :url, with: "https://www.cats.com"
    click_button "Add Bookmark"
    first(".bookmark").click_button "Delete Bookmark"
    expect(page).not_to have_link("The BBC Website", href: "https://www.bbc.com")
    expect(page).to have_link("My Favourite Cats", href: "https://www.cats.com")
  end
end
