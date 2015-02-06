Feature: Manage Post
  In order to make a blog
  As an author
  I want to create and manage posts
  
  Scenario: Posts List
    Given I have Post titled First Blog Post, Second Post
    When I go to the list of posts
    Then I should see "First Blog Post"
    And I should see "Second Post"