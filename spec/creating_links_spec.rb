feature 'creating links' do
  scenario 'I will be able to submit a new link' do
    visit('/links/new')
    fill_in :title, with: "Test"
    fill_in :url, with: "http://www.google.com/"
    click_button 'submit'
  end
end
