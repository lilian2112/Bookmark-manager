feature 'list added links' do
  scenario 'added link appears on homepage' do
    Link.create(title: "Facebook", url: 'http://www.facebook.com')
    visit '/links'
    within 'ul#links' do
    expect(page).to have_content "Facebook"
   end
end
end
