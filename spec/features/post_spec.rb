require 'spec_helper'

feature 'Create Posts' do
  before :each do
    @post = FactoryGirl.create :post
  end
  scenario 'Creating a blog posts' do
    visit posts_path
    expect(page).to have_content("Learn Rails ")
    click_on 'New Post'

    expect(page).to have_content("New post")
   
    fill_in 'post_title', with: @post.title
    fill_in 'post_sdesc', with: @post.sdesc
    fill_in 'post_body', with: @post.body

    click_on 'Save'

    expect(page).to have_content("Post was successfully created.")
    expect(page).to have_content(@post.title)

    visit posts_path

    expect(page).to have_content("First Blog Post")
    visit edit_post_path(@post)

    expect(page).to have_content("Editing post")
    
  end

  scenario 'Editing a blog posts' do 
    visit posts_path

    expect(page).to have_content(@post.title)
    click_on 'Edit'

    expect(page).to have_content("Editing post")

    fill_in 'post_title', with: "Second edit"
    fill_in 'post_sdesc', with: @post.sdesc
    fill_in 'post_body', with: @post.body

    click_on 'Save'

    expect(page).to have_content("Post was successfully updated.")
    expect(page).to have_content("Second edit")

  end

  scenario 'Deleting a blog posts' do 
    visit posts_path

    expect(page).to have_content(@post.title)
    click_on 'Destroy'


    expect(page).to_not have_content(@post.title)
  end

  scenario 'Displays an error when there is no title while creating posts' do 
    visit posts_path

    expect(page).to have_content("Learn Rails ")
    click_on 'New Post'

    expect(page).to have_content("New post")
   
    
    fill_in 'post_title', with: ""
    fill_in 'post_sdesc', with: "dgsf sdfhgsd"
    fill_in 'post_body', with: "sdhjfgsd fsdjhfg shdfgkshdjfg"

    click_on 'Save'

    expect(page).to_not have_content("Post was successfully created.")
    expect(page).to have_content("error")

  end

  scenario 'Displays an error when there is no title while editing posts' do 
   visit posts_path

    expect(page).to have_content(@post.title)
    click_on 'Edit'

    expect(page).to have_content("Editing post")

    fill_in 'post_title', with: ""
    fill_in 'post_sdesc', with: @post.sdesc
    fill_in 'post_body', with: @post.body

    click_on 'Save'

    expect(page).to_not have_content("Post was successfully updated.")
    expect(page).to have_content("error")

  end
  
end