Feature: login as an administrator
 
  As an administrator
  So that I can securely see private data from the database
  I want to be able to login to the system with a password

Background: I am on the home page and I have a user account in the database

  Given the following groups exist:
    | id | group_size | visit_date                 | created_at                 | updated_at                 |
    | 1  | 1          | 2015-09-09 21:09:41.580495 | 2015-09-09 21:09:41.580495 | 2015-09-09 21:09:41.580495 |
    | 2  | 1          | 2015-09-11 13:23:45.347628 | 2015-09-11 13:23:45.347628 | 2015-09-11 13:23:45.347628 |
    | 3  | 1          | 2014-09-09 01:03:23.137289 | 2014-09-09 01:03:23.137289 | 2014-09-09 01:03:23.137289 |

  Given the following countries exist:
    | id | name        | created_at                 | updated_at                 |
    | 1  | USA         | 2015-09-09 21:09:41.580495 | 2015-09-09 21:09:41.580495 |
    | 2  | Australia   | 2015-09-09 21:09:41.580495 | 2015-09-09 21:09:41.580495 |

  Given the following zipcodes exist:
    | zip_code  | city            | county | created_at                 | updated_at                 |
    | 75007     | Carrollton      | Denton | 2015-09-09 21:09:41.580495 | 2015-09-09 21:09:41.580495 |
    | 77840     | College Station | Brazos | 2015-09-09 21:09:41.580495 | 2015-09-09 21:09:41.580495 |
    | 00000     | N/A             | N/A    | 2015-09-09 21:09:41.580495 | 2015-09-09 21:09:41.580495 |

  Given the following visitors exist:
    | last_name | first_name | group_id | email            | contact | zip_code | country_id | created_at                 |
    | Doe       | Joe        | 1        | joe@doe.com      | true    | 77840    | 1          | 2015-09-09 21:09:41.580495 |
    | Bond      | James      | 2        | james@bond.co.uk | false   | 77830    | 1          | 2015-09-11 13:23:45.347628 |
    | Presley   | Elvis      | 3        | elvis@singer.com | true    | 77836    | 2          | 2014-09-09 01:03:23.137289 |

  Given I am on the visitor index page

Scenario: I can filter visitors by date range
  When I fill in "start_date" with "09/08/2015"
  And I fill in "end_date" with "09/10/2015"
  And I press "Submit"
  Then I should see "Doe"
  And I should not see "Bond"
  And I should not see "Presley"