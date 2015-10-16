Feature: get raw data from the database
 
  As an administrator
  So that I can verify summary statistics
  I want to be able to see the raw data entered by visitors

Background: I am on the home page and visitors have been added to database

  Given the following visitors exist:
    | last_name | first_name | group_id | email            | contact | zip_code | country_id | created_at                 |
    | Doe       | Joe        | 1        | joe@doe.com      | true    | 77840    | 12         | 2015-09-09 21:09:41.580495 |
    | Bond      | James      | 2        | james@bond.co.uk | false   | 77830    | 45         | 2015-09-11 13:23:45.347628 |
    | Presley   | Elvis      | 2        | elvis@singer.com | true    | 77836    | 28         | 2014-09-09 01:03:23.137289 |

  Given I am on the visitor index page

Scenario: I can see all visitors
  Then I should see "Doe"
  And I should see "Joe"
  And I should see "1"
  And I should see "joe@doe.com"
  And I should see "true"
  And I should see "77840"
  And I should see country with ID "12"

Scenario: I should see all the visitors
  Then I should see all the visitors

# TODO Search field not working yet
#Scenario: I can search for visitors
#  When I fill in "search_visitor" with "Bond"
#  Then I should see "Bond"
#  And I should not see "Doe"
#  And I should not see "Presley"