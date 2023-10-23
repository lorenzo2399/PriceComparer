Given('I am a modeator') do
    @user=FactoryBot.create(:moderator)
end
  
  Given('I am on the Sign in Page moderator') do
    visit "http://127.0.0.1:3000/users/sign_in"

end
  
  When('I insert email email and password moderator') do
    fill_in("user_email", with: @user.email)
    fill_in("user_password", with: @user.password)
end
  
  When('I click button {string} moderator') do |string|
    click_button(string)

end
  
  Then('I am redirected to Home Page moderator') do
    expect(current_path).to eq(root_path)
end
  
Given('there is a user in the site') do
    @user=FactoryBot.create(:user)
end
  
And('I m on moderator board') do
    visit "http://127.0.0.1:3000/admin_board"
end
  
  When('i click delete for this user') do
    click_button("Elimina", match: :first)
end
  
  Then('i should not see the user anymore') do
    expect(page).not_to have_text(@user.email)
end
  
  Then('the user should be removed from database also') do
    user=User.find_by(id: @user.id)
    expect(user).to be_nil
end

Given('there is a user and has a eview') do
    @utente=FactoryBot.create(:usera)
    @rewa=FactoryBot.create(:rewa)
end
  
  Given('I m on moderato board') do
    visit "http://127.0.0.1:3000/admin_board"

end
  
  When('i click on the user profile') do
    click_link("Profilo", match: :first)

end
  
  Then('i am redirect to the page {string}') do |string|
    expect(current_url).to match("http://127.0.0.1:3000/users/2")

end
  
  When('i click modify button  on the page') do
    click_link("Modifica", match: :first)

end
  
  Then('i am redirect to page edit page') do 
    expect(page).to have_content("Modifica")
end
  
And('i fill the form with {int} and {string} also') do |int, string|
    fill_in 'review_rating', with: int
    fill_in 'review_comment', with: string
    end

  When('I press the button Invia also') do
    click_button("Invia")

end
  
  Then('i should not see {int} rating anymore') do |int|
    expect(page).not_to have_text(int.to_s)

  end
  
  Then('i should not see {string} rating anymore') do |string|
    expect(page).not_to have_text(string)

end
  
  Then('i should see {int} rating instead') do |int|
    expect(page).to have_text(int)

  end
  
  Then('i should see {string}  instead') do |string|
    expect(page).to have_text(string)
end
  
  