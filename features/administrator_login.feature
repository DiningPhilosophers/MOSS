Feature: single administrator login

  As an administrator
  So that I have access to all information that users entered
  I want to be able to login as an administrator

Background: I am on the home page and I have a user account in the database

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

Scenario: I log out from the administration section and attempt to access it without beeing logged in
  When I follow "Administration"
  And I fill in "session_password" with "aaaaaa"
  And I press "log_in_button"
  And I follow "logout"
  Then I should be on the home page

Scenario: I should not be able to access a protected page without being logged in
  When I go to the visitors statistics page
  Then I should be on the login page

Scenario: I should be able to access a protected page being logged in
  When I follow "Administration"
  And I fill in "session_password" with "aaaaaa"
  And I press "log_in_button"
  And I go to the visitors index page
  Then I should be on the visitors index page

Scenario: I should be able to change my password
  When I follow "Administration"
  And I fill in "session_password" with "aaaaaa"
  And I press "log_in_button"
  And I follow "settings"
  Then I should be on admin password change page
  When I fill in "admin_password" with "cccccc"
  And I fill in "admin_password_confirmation" with "cccccc"
  And I press "Change password"
  Then I should be on visitors statistics page
  When I follow "logout"
  And I follow "Administration"
  And I fill in "session_password" with "cccccc"
  And I press "log_in_button"
  Then I should be on visitors statistics page

Scenario: I should not be able to change my password to a password of less than 6 characters
  When I follow "Administration"
  And I fill in "session_password" with "aaaaaa"
  And I press "log_in_button"
  And I follow "settings"
  Then I should be on admin password change page
  When I fill in "admin_password" with "ccccc"
  And I fill in "admin_password_confirmation" with "ccccc"
  And I press "Change password"
  Then I should see "Password is too short"

Scenario: I should not be able to change my password when password confirmation does not match
  When I follow "Administration"
  And I fill in "session_password" with "aaaaaa"
  And I press "log_in_button"
  And I follow "settings"
  Then I should be on admin password change page
  When I fill in "admin_password" with "cccccc"
  And I fill in "admin_password_confirmation" with "dddddd"
  And I press "Change password"
  Then I should see "Password confirmation doesn't match Password"
