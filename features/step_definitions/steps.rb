Given('I am a registered User') do
  @user = FactoryBot.create(:user)
end

And  ("I am on the Sign in Page") do
  visit "http://127.0.0.1:3000/users/sign_in"
end

When('I insert email email and password') do
  fill_in("user_email", with: @user.email)
  fill_in("user_password", with: @user.password)
end

When('I click button {string}') do |string|
  click_button(string)
end

Then('I am redirected to Home Page') do
  expect(current_path).to eq(root_path)
end

Given("I am on the Home Page") do
  visit "http://127.0.0.1:3000/"
end

When('I fill the keyword space with {string}') do |string|
  fill_in("keyword", with: string)
end


And ('I select the option filter {string}') do |string|
  select(string, from: "sort_order")
end

And('i fill the Price min with {int} and Price max with {int}') do |int, int2|
  fill_in("minprice", with: int)
  fill_in("maxprice", with: int2)
  fill_in("minf", with: 1)
  fill_in("maxtime", with: 30)
end



And ('I press cerca button') do 
    click_button("commit")
end

Then('I should be on {string}') do |string|
  expect(page).to have_current_path(string)
end

And ('I should see some results with name {string} in it') do |string|
  elementi=all("div."+"result-item")
  regex=/#{Regexp.quote(string)}/i
  elementi.each do |element|
    expect(element.text).to match(regex)
  end
end

And ('the results should be ordere by price') do
  @elementi=all("div."+"result-item").map do |element|
    text=element.text
    prezzo=text.match(/Prezzo:(\d+)USD/)
    prezzo ? prezzo[1].to_i : nil
  end
    @elementi.compact! 
    expect(@elementi).to match(@elementi.sort)
  end

  
  Given ('I am on the Search Page') do
    visit "http://127.0.0.1:3000/pages/search?keyword=harry&minprice=1&maxprice=10000&minf=1&place=&maxtime=30&sort_order=&commit=Cerca"
  end
  

And ('I Click on Save link') do
  click_link("Salva", match: :first)
  end

And ('I am redirected to a {string}') do |string|
  expect(current_url).to match(string)
 end

 When('I press Save button') do
  click_button("Invia")
end

And ('I am redirected to {string}') do |string|
  expect(current_url).to match(string)
end


Then('i should see on my personal page {string}') do |string|
  expect(page).to have_text(string)
end

Then('i Research should be added to database') do
      research=Research.last
      expect(research).not_to be_nil
end

Given ('I am on a Search Page') do
  visit "http://127.0.0.1:3000/pages/search?keyword=harry&minprice=1&maxprice=10000&minf=1&place=&maxtime=30&sort_order=&commit=Cerca"
end

When('I click on Review button') do
    click_link("Fai una recensione", match: :first)
end

Then('I am redirected to review page {string}') do |string|
  expect(current_url).to match(string)
end

And('I fill the form with {int} and {string} comment') do |int, string|
  fill_in 'review_rating', with: int
  fill_in 'review_comment', with: string
end
  
When('I press the submit button') do
  click_button("Invia")
end

Then('I am redirected to personal page {string}') do |string|
  expect(current_url).to match(string)
end

And('i should see the Review {string} on personale page') do |string|
  expect(page).to have_content(string)
end

And('i should see the rating {int} on personal page') do |int|
 expect(page).to have_content(int)
end

And ("A review should be added to database") do
  review=Review.last
  expect(review).not_to be_nil
end

Given('I have a review') do
  @review=Review.new(title: "Rocky",rating: 35, comment: "Top", item_id: 555 ,negozio: "Ebay", user_id: @user.id)
  @review.save
end


And('i am on my personal page') do
  visit "http://127.0.0.1:3000/users/1"
end

When('i click modify button') do
  click_link("Modifica", match: :first)

end

Then('i am redirect to {string}') do |string|
  expect(current_url).to match(string)
end

And('i fill the form with {int} and {string}') do |int, string|
  fill_in 'review_rating', with: int
  fill_in 'review_comment', with: string
  end
  
  

When('I press the button Invia') do
  click_button("Invia")
end

Then('i m redirected to {string}') do |string|
  expect(current_url).to match(string)
end

And('i should not see {int} rating') do |int|
  expect(page).not_to have_text(int.to_s)
end

And('i should not see {string} rating') do |string|
  expect(page).not_to have_text(string)
end


And('i should see {string} comment') do |string|
  expect(page).to have_text(string)
end

And ("i should see {int} rating") do |int|
  expect(page).to have_text(int.to_s)
end


