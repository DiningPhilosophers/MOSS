Feature: get raw data from the database

  As an administrator
  So that I can verify summary statistics
  I want to be able to see the raw data entered by visitors

Background: I am on the visitor index page and visitors have been added to database

  Given the following admins exist:
    | id | user_name      | password | password_confirmation | created_at                 | updated_at                 |
    | 1  | dufek@tamu.edu | aaaaaa   | aaaaaa                | 2015-09-09 21:09:41.580495 | 2015-09-09 21:09:41.580495 |

  Given the following groups exist:
    | group_size | created_at                 | updated_at                 |
    | 1          | 2015-09-09 21:09:41.580495 | 2015-09-09 21:09:41.580495 |
    | 1          | 2015-09-11 13:23:45.347628 | 2015-09-11 13:23:45.347628 |
    | 1          | 2014-09-09 01:03:23.137289 | 2014-09-09 01:03:23.137289 |

  Given the following countries exist:
    | id | name        |
    | 1  | USA         |
    | 2  | Australia   |

  Given the following zipcodes exist:
    | zip_code | city            | state |
    | 75007    | Carrollton      | Texas |
    | 77840    | College Station | Texas |
    | 00000    | N/A             | N/A   |

  Given the following visitors exist:
    | last_name | first_name | group_id | email            | contact | country_id | created_at                 | updated_at                 | zip_code |
    | Doe       | Joe        | 1        | joe@doe.com      | true    | 1          | 2015-09-09 21:09:41.580495 | 2015-09-09 21:09:41.580495 | 77840    |
    | Bond      | James      | 2        | james@bond.co.uk | false   | 1          | 2015-09-11 13:23:45.347628 | 2015-09-11 13:23:45.347628 | 77840    |
    | Presley   | Elvis      | 3        | elvis@singer.com | true    | 2          | 2014-09-09 01:03:23.137289 | 2014-09-09 01:03:23.137289 | 00000    |

Given I am on the visitor index page
  When I fill in "session_password" with "aaaaaa"
  And I check "session_remember_me"
  And I press "log_in_button"
  And I follow "Table"
  And I fill in "start_date" with "09/08/2010"
  And I fill in "end_date" with "10/30/2015"
  And I press "submit_btn"

Scenario: I can see all visitors
  And I should be on the visitor index page
  And I should see "Doe"
  And I should see "Joe"
  And I should see "Bond"
  And I should see "James"
  And I should see "Presley"
  And I should see "Elvis"

Scenario: I should see all the visitors
    Then I should see all the visitors

# TODO Search field not working yet
#Scenario: I can search for visitors
#  When I fill in "search_visitor" with "Bond"
#  Then I should see "Bond"
#  And I should not see "Doe"
#  And I should not see "Presley"
