Feature: single administrator login
 
  As an administrator
  So that I have acces to all information that users entered
  I want to be able to login as an administrator

Background: I am on the home page and I have a user account in the database

  Given the following admins exist:
    | id | user_name      | password | password_confirmation | created_at                 | updated_at                 |
    | 1  | dufek@tamu.edu | aaaaaa   | aaaaaa                | 2015-09-09 21:09:41.580495 | 2015-09-09 21:09:41.580495 |

  Given the following groups exist:
    | group_size | visit_date                 | created_at                 | updated_at                 |
    | 1          | 2015-09-09 21:09:41.580495 | 2015-09-09 21:09:41.580495 | 2015-09-09 21:09:41.580495 |
    | 1          | 2015-09-11 13:23:45.347628 | 2015-09-11 13:23:45.347628 | 2015-09-11 13:23:45.347628 |
    | 1          | 2014-09-09 01:03:23.137289 | 2014-09-09 01:03:23.137289 | 2014-09-09 01:03:23.137289 |

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
    | last_name | first_name | group_id | email            | contact | country_id | created_at                 | updated_at                 | zip_code |
    | Doe       | Joe        | 1        | joe@doe.com      | true    | 1          | 2015-09-09 21:09:41.580495 | 2015-09-09 21:09:41.580495 | 77840    |
    | Bond      | James      | 2        | james@bond.co.uk | false   | 1          | 2015-09-11 13:23:45.347628 | 2015-09-11 13:23:45.347628 | 77840    |
    | Presley   | Elvis      | 3        | elvis@singer.com | true    | 2          | 2014-09-09 01:03:23.137289 | 2014-09-09 01:03:23.137289 | 00000    |

  Given I am on the home page

Scenario: I log in with the correct password
  When I follow "Administration"
  And I fill in "session_password" with "aaaaaa"
  And I press "log_in_button"
  Then I should be on visitors statistics page

Scenario: I log in with the incorrect password
  When I follow "Administration"
  And I fill in "session_password" with "bbbbbb"
  And I press "log_in_button"
  Then I should be on login page