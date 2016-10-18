feature 'list added links' do
  scenario 'added link appears on homepage' do
    Link.create(title: "Facebook", url: 'http://www.facebook.com')
    visit '/'
    within 'ul#links' do
    expect(page).to have_content "Facebook"
   end
	end
end


feature 'creating links' do
  scenario 'add a new link' do
    visit '/'
    click_button 'Add New Link'
    fill_in :title, with: 'Facebook'
    fill_in :url, with: 'http://www.facebook.com'
    click_button 'Submit'
    within 'ul#links' do
    expect(page).to have_content "Facebook"
   end
	end
end

feature 'adding tags to links' do
  scenario 'add a link with a tag' do
    visit '/'
    click_button 'Add New Link'
    fill_in :title, with: 'Facebook'
    fill_in :url, with: 'http://www.facebook.com'
    fill_in :tags, with: 'social-media'
    click_button 'Submit'
    link = Link.last
    expect(link.tags.map(&:tag_name)).to include("social-media")
  end
end