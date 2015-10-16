Feature: get raw data from the database
 
  As an administrator
  So that I can verify summary statistics
  I want to be able to see the raw data entered by visitors

Background: I am on the home page and visitors have been added to database

  Given the following visitors exist:
    | last_name | first_name | group_id | email | contact | zip_code | country_id |
    | Doe | Joe | 1 | joe@doe.com | true | 77840 | 12 |

  Given I am on the visitor index page

Scenario: I can see visitors
  Then I should see "Doe"
  And I should see "Joe"
  And I should see "1"
  And I should see "joe@doe.com"
  And I should see "true"
  And I should see "77840"
  And I should see country with ID "12"
