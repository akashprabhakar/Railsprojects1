Feature: Creating a blog post
  before(:each) do
        @post = Post.new
      end
  In order to make a blog post
  As an author
  I want to make an post with title First Blog posts
  
  Scenario: Creating a blog posts
    Given I am on the posts index page
    And I should see the content Learn Rails
    When I click on the link New Post
    And I should see the form for creating the posts
    And I fill in "post_title" with "Spuds"
    And I fill in "post_sdesc" with " Delicioudfbdhf"
    And I fill in "post_body" with "Spuds sdfkhgjs shlkfgkdhgb dkfhgd kfghdfkghdf hkjfdg kh"
    And I click the button save
    Then I should see the content Post was successfully created.

 