feature "bookmarks page" do
  scenario "shows some bookmarks" do

    Bookmark.create('http://www.makersacademy.com')
    Bookmark.create('http://www.destroyallsoftware.com')
    Bookmark.create('http://www.google.com')

    visit "/bookmarks"

    expect(page).to have_content "http://www.makersacademy.com"
    expect(page).to have_content "http://www.destroyallsoftware.com"
    expect(page).to have_content "http://www.google.com"
  end

  scenario "adding a bookmark" do
    visit "/bookmarks"
    fill_in "url", with: "http://www.facebook.com"
    fill_in "title", with: "Facebook"
    click_button "Add bookmark"
    expect(page).to have_content "Facebook"
  end

end
