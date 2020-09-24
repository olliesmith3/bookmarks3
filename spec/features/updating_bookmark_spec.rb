feature "Update a bookmark" do
  scenario "user updates a bookmark from their list to change the title" do
    clear_table()
    add_bookmarks
    first('.bookmark').click_button 'Edit Bookmark'
    fill_in :title, with: ""
    fill_in :title, with: "BBC Homepage"
    click_button 'Save Changes'
    expect(page).to have_link("BBC Homepage", href: "https://www.bbc.com")
  end

  scenario "user updates a bookmark from their list to change the url" do
    clear_table()
    add_bookmarks
    first('.bookmark').click_button 'Edit Bookmark'
    fill_in :url, with: ""
    fill_in :url, with: "https://www.bbc.co.uk/sport"
    click_button 'Save Changes'
    expect(page).to have_link("The BBC Website", href: "https://www.bbc.co.uk/sport")
  end
end