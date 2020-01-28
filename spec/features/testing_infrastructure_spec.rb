feature '/' do
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

  scenario 'will show listing of properties' do
    visit '/'
    expect(page).to have_content '20 test avenue'
  end

  scenario 'will show post code on page' do
    visit '/'
    expect(page).to have_content '20TE5T'
  end

  # scenario 'will show post code on page' do
  #   visit '/'
  #   expect(page).to have_content 'https://www.homesud.co.uk/rentals/fotos/2/1449730608e751943fdac459e3553b15523549ad43/1479152770e7045c48ff0a57756b17c9b41bd5295c.jpg'
  # end

end
