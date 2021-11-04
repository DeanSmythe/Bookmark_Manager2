feature 'add bookmarks' do
  scenario 'can add bookmark' do
    
    visit '/bookmarks'
    click_button('Add new bookmark')
    fill_in 'add_new_bookmark', with: 'Test url'
    click_button('Submit')
    expect(page).to have_content 'Test url'

  end
end