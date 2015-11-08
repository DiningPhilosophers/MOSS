Feature: view visitors by date

  As an administrator
  So that I can see who registered within two given dates
  I want to be able to see the list of all visitors that were registered within a given period

  Background: I am on the home page and visitors have been added to database

    Given the following admins exist:
      | id | user_name      | password | password_confirmation | created_at                 | updated_at                 |
      | 1  | dufek@tamu.edu | aaaaaa   | aaaaaa                | 2015-09-09 21:09:41.580495 | 2015-09-09 21:09:41.580495 |

    Given the following groups exist:
      | id | group_size | created_at                 | updated_at                 |
      | 1  | 1          | 2015-09-09 21:09:41.580495 | 2015-09-09 21:09:41.580495 |
      | 2  | 1          | 2015-09-11 13:23:45.347628 | 2015-09-11 13:23:45.347628 |
      | 3  | 1          | 2014-09-09 01:03:23.137289 | 2014-09-09 01:03:23.137289 |

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
      | last_name | first_name | group_id | email            | contact | zip_code | country_id | created_at                 |
      | Doe       | Joe        | 1        | joe@doe.com      | true    | 77840    | 1          | 2015-09-09 21:09:41.580495 |
      | Bond      | James      | 2        | james@bond.co.uk | false   | 77840    | 1          | 2015-09-11 13:23:45.347628 |
      | Presley   | Elvis      | 3        | elvis@singer.com | true    | 77836    | 2          | 2014-09-09 01:03:23.137289 |

    Given I am on the home page
    And I follow "Administration"
    And I fill in "session_password" with "aaaaaa"
    And I press "log_in_button"
    And I follow "Table"

  Scenario: I can filter visitors by date range
    When I fill in "start_date" with "09/08/2015"
    And I fill in "end_date" with "09/10/2015"
    Then I should be on the visitors index page
    When I click on "Submit"
    Then I should see "Doe"
    And I should not see "Bond"
    And I should not see "Presley"