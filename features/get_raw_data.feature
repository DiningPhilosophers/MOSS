Feature: get raw data from the database
 
  As an administrator
  So that I can verify summary statistics
  I want to be able to see the raw data entered by visitors

Background: I am on the home page and visitors have been added to database

  Given the following visitors exist:
    | last_name | first_name | group_id | email | contact | zip_code | country_id | created_at |
    | Doe | Joe | 1 | joe@doe.com | true | 77840 | 12 | 2015-09-09 21:09:41.580495                         |
    | Bond | James | 2 | james@bond.co.uk | false | 77830 | 45 | 2015-09-11 13:23:45.347628                        |

  Given I am on the visitor index page

Scenario: I can see visitors
  Then I should see "Doe"
  And I should see "Joe"
  And I should see "1"
  And I should see "joe@doe.com"
  And I should see "true"
  And I should see "77840"
  And I should see country with ID "12"

Scenario: I can filter visitors by date range
  When I fill in "start_date" with "09/08/2015"
  And I fill in "end_date" with "09/10/2015"
  And I press "Submit"
  Then I should see "Doe"
  And I should not see "Bond"