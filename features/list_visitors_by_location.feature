Feature: list visitors by location (ZIP codes)

  As an administrator
  So that I can know who comes from out of town or in town
  I want to be able to view the list of visitor's by location

  Background: I am on the home page and visitors have been added to database

    Given the following admins exist:
      | id | user_name      | password | password_confirmation | created_at                 | updated_at                 |
      | 1  | dufek@tamu.edu | aaaaaa   | aaaaaa                | 2015-09-09 21:09:41.580495 | 2015-09-09 21:09:41.580495 |

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
      | zip_code  | city            | county     | created_at                 | updated_at                 |
      | 75007     | Carrollton      | Denton     | 2015-09-09 21:09:41.580495 | 2015-09-09 21:09:41.580495 |
      | 77840     | College Station | Brazos     | 2015-09-09 21:09:41.580495 | 2015-09-09 21:09:41.580495 |
      | 73301     | Austin          | Texas Hill | 2015-09-09 21:09:41.580495 | 2015-09-09 21:09:41.580495 |
      | 77001     | Houston         | Harris     | 2015-09-09 21:09:41.580495 | 2015-09-09 21:09:41.580495 |
      | 75201     | Dallas          | Dallas     | 2015-09-09 21:09:41.580495 | 2015-09-09 21:09:41.580495 |
      | 77801     | San Antonio     | Bexar      | 2015-09-09 21:09:41.580495 | 2015-09-09 21:09:41.580495 |
      | 10001     | New York        | N/A        | 2015-09-09 21:09:41.580495 | 2015-09-09 21:09:41.580495 |
      | 00000     | N/A             | N/A        | 2015-09-09 21:09:41.580495 | 2015-09-09 21:09:41.580495 |

    Given the following visitors exist:
      | last_name | first_name | group_id | email                | contact | country_id | created_at                 | updated_at                 | zip_code |
      | Jacobs    | Juana      | 2        | Fooster35@gustr.com  | true    | 1          | 2015-09-11 13:23:45.347628 | 2015-09-11 13:23:45.347628 | 75007    |
      | Roberson  | Ana        | 1        | 5dps6z1@prpyb2.com   | false   | 1          | 2015-09-11 13:23:45.347628 | 2015-09-11 13:23:45.347628 | 77840    |
      | Kelley    | Hazel      | 1        | yvb@uj73h40gqwds.com | true    | 1          | 2015-09-11 13:23:45.347628 | 2015-09-11 13:23:45.347628 | 73301    |
      | Pittman   | Tami       | 3        | vwx3@6wom4i.com      | true    | 1          | 2015-09-11 13:23:45.347628 | 2015-09-11 13:23:45.347628 | 77001    |
      | Castro    | Lynn       | 1        | gtjup@xhsw191.com    | false   | 1          | 2015-09-11 13:23:45.347628 | 2015-09-11 13:23:45.347628 | 75201    |
      | Vasquez   | Bradford   | 3        | x3mhy.s@qn2larh.com  | true    | 1          | 2015-09-11 13:23:45.347628 | 2015-09-11 13:23:45.347628 | 77801    |
      | Coleman   | Freda      | 2        | james@bond.co.uk     | false   | 1          | 2015-09-11 13:23:45.347628 | 2015-09-11 13:23:45.347628 | 10001    |
      | Valdez    | Ervin      | 3        | elvis@singer.com     | true    | 2          | 2014-09-09 01:03:23.137289 | 2014-09-09 01:03:23.137289 | 00000    |

    Given I am on the home page
      And I follow "Administration"
      And I fill in "session_password" with "aaaaaa"
      And I press "log_in_button"
      And I follow "Table"
      And I fill in "start_date" with "09/08/2010"
      And I fill in "end_date" with "10/30/2015"
      And I click on "Submit"

  Scenario: I can see all visitors by default
    Then I should see "Jacobs"
    And I should see "Roberson"
    And I should see "Kelley"
    And I should see "Pittman"
    And I should see "Castro"
    And I should see "Vasquez"
    And I should see "Coleman"
    And I should see "Valdez"

  Scenario: I can see visitors from Austin
    Then I should see "Choose Area:"
    When I click on "None selected "
    And I click on "Austin"
    Then I should be on the visitors index page
    And I should see "Kelley"
    And I should not see "Jacobs"
    And I should not see "Roberson"
    And I should not see "Pittman"
    And I should not see "Castro"
    And I should not see "Vasquez"
    And I should not see "Coleman"
    And I should not see "Valdez"

  Scenario: I can see visitors from Austin
    When I select "Austin" from "sel_area"
    Then I should be on the visitors index page
    Then I should see "Kelley"
    And I should not see "Jacobs"
    And I should not see "Roberson"
    And I should not see "Pittman"
    And I should not see "Castro"
    And I should not see "Vasquez"
    And I should not see "Coleman"
    And I should not see "Valdez"

  Scenario: I can see visitors from Houston
    When I select "Houston" from "sel_area"
    Then I should not see "Pittman"
    And I should not see "Jacobs"
    And I should not see "Roberson"
    And I should not see "Kelley"
    And I should not see "Castro"
    And I should not see "Vasquez"
    And I should not see "Coleman"
    And I should not see "Valdez"

  Scenario: I can see visitors from Bryan/College Station
    When I select "Bryan/College Station" from "sel_area"
    Then I should not see "Roberson"
    And I should not see "Jacobs"
    And I should not see "Kelley"
    And I should not see "Pittman"
    And I should not see "Castro"
    And I should not see "Vasquez"
    And I should not see "Coleman"
    And I should not see "Valdez"

  Scenario: I can see visitors from Dallas/Fort Worth
    When I select "Dallas/Fort Worth" from "sel_area"
    Then I should not see "Castro"
    And I should not see "Jacobs"
    And I should not see "Roberson"
    And I should not see "Kelley"
    And I should not see "Pittman"
    And I should not see "Vasquez"
    And I should not see "Coleman"
    And I should not see "Valdez"

  Scenario: I can see visitors from San Antonio
    When I select "San Antonio" from "sel_area"
    Then I should not see "Vasquez"
    And I should not see "Jacobs"
    And I should not see "Roberson"
    And I should not see "Kelley"
    And I should not see "Pittman"
    And I should not see "Castro"
    And I should not see "Coleman"
    And I should not see "Valdez"