@ignore
Feature: create a new movie
 
  As an avid moviegoer
  So that I can quickly add movies
  I want to add movie

Background: I have a database
  
  Given I am on the RottenPotatoes home page

Scenario: add movie
  When I follow "Add new movie"
  When I fill in "movie_title" with "Test Movie"
  When I press "Save Changes"
  Then I should see "Test Movie"