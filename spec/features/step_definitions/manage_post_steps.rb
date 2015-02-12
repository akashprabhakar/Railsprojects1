def create_post
  @post = Post.create( :title => "Testy McUserton", :sdesc => "example@example.com",
    :body => "changemechangemechangemechangemechangemechangemechangemechangemechangemechangemechangeme")
end

Given(/^I am on the posts index page$/) do
 	visit '/posts'
end

Given(/^I should see the content Learn Rails$/) do
	expect(page).to have_content("Learn Rails ")
end

When(/^I click on the link New Post$/) do
 click_link "New Post"
end

And(/^I should see the form for creating the posts$/) do
  expect(page).to have_content("New post")
end


And(/^I fill in "(.*?)" with "(.*?)"$/) do |field, value|
   fill_in field, :with => value
end


And(/^I click the button save$/) do

  click_button "Save"
end


Then(/^I should see the content Post was successfully created\.$/) do
  expect(page).to have_content("Post was successfully created.")
end

#Before do
 # 		Post.create!(:title => "Test post", :sdesc => "short description for post", :body => "markdowndfdf dfdfdfdf")
#end
Given(/^A blog named First Blog Post$/) do
 @post = Post.first
 expect(page).to have_content("First Blog Post")
end



When(/^I click on the link Edit$/) do
	expect(page).to have_content("Spuds")

end





Then(/^I should see the content Editing post$/) do
 expect(page).to have_content("Editing post")
end