feature 'add bookmarks' do
  scenario 'can add bookmark' do
    
    visit '/bookmarks'
    click_button('Add new bookmark')
    fill_in 'add_new_bookmark', with: 'Test url'
    fill_in 'add_new_title', with: 'Test title'
    click_button('Submit')
    expect(page).to have_content 'Test title'

  end
end