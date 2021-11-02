feature 'views bookmarks' do
  scenario 'user views list of bookmarks' do
    visit '/'
    expect(page).to have_content 'Bookmark Manager'  
  end

  scenario 'user views list of bookmarks' do
    visit '/bookmarks'
    expect(page).to have_content "www.adobe.com"
    expect(page).to have_content "www.google.com"
  end
end

