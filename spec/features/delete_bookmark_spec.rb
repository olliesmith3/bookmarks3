feature "Delete a bookmark" do
  scenario "user deletes a bookmark from their list" do
    clear_table()
    add_bookmarks
    expect(page).to have_link("The BBC Website", href: "https://www.bbc.com")
    first(".bookmark").click_button "Delete Bookmark"
    expect(page).not_to have_link("The BBC Website", href: "https://www.bbc.com")
    expect(page).to have_link("My Favourite Cats", href: "https://www.cats.com")
  end
end
