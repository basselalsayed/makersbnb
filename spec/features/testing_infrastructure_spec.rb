xfeature '/' do
  scenario 'contains info and buttons required' do 
    visit '/'
    expect(page).to have_button 'Sign Up'
    expect(page).to have_content 'BnB'
  end

  scenario 'clicking Sign Up shows the Form' do
    visit '/'
    click_button('Sign Up')
    expect(page).to have_button 'Submit'
  end
end