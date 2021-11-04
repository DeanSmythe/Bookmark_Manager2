feature 'add bookmarks' do
  scenario 'can add bookmark' do
    
    # Visit the webpage
    # click a button to add a new message on a new page
    # fill in the messgae and submit it
    # see the new message on teh message board
    visit '/bookmarks'
    click_button('Add new bookmark')
    fill_in 'bookmark', with: 'Test url'
    click_button('submit')
    expect(page).to have_content 'Test url'

  end
end