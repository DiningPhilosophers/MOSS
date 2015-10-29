Feature: add visitor information to the database
 
  As a visitor
  So that I can share my information with the museum
  I want to enter my info to add to the system

Background: I am on the home page

  Given the following countries exist:
    | name           | created_at                 | updated_at                 |
    | USA            | 2015-09-09 21:09:41.580495 | 2015-09-09 21:09:41.580495 |
    | Australia      | 2015-09-09 21:09:41.580495 | 2015-09-09 21:09:41.580495 |
    | Czech Republic | 2015-09-09 21:09:41.580495 | 2015-09-09 21:09:41.580495 |
  
  Given I am on the home page

Scenario: successfully sign in to the database
  When I press "Sign In"
  And I fill in "group_visitors_attributes_0_last_name" with "Novak"
  And I fill in "group_visitors_attributes_0_first_name" with "Josef"
  And I fill in "group_visitors_attributes_0_email" with "josef@novak.cz"
  And I fill in "sign_in_zipcode" with "77840"
  And I select "Czech Republic" from "group_visitors_attributes_0_country_id"
  And I fill in "group_group_size" with "123456789"
  And I press "Submit"
  And I am on the visitor index page

  Then I should see "Novak"
  And I should see "Josef"
  And I should see "josef@novak.cz"
  And I should see "77840"
  And I should see "Czech Republic"
  #And I should see "123456789"