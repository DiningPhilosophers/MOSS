Feature: add visitor information to the database

  As a visitor
  So that I can share my information with the museum
  I want to enter my info to add to the system

  Background: I am on the home page and administrators, countries, and zip codes are in the database

    Given the following admins exist:
      | id | user_name      | password | password_confirmation | created_at                 | updated_at                 |
      | 1  | dufek@tamu.edu | aaaaaa   | aaaaaa                | 2015-09-09 21:09:41.580495 | 2015-09-09 21:09:41.580495 |

    Given the following groups exist:
      | group_size | created_at                 | updated_at                 |
      | 1          | 2015-09-09 21:09:41.580495 | 2015-09-09 21:09:41.580495 |
      | 1          | 2015-09-11 13:23:45.347628 | 2015-09-11 13:23:45.347628 |
      | 1          | 2014-09-09 01:03:23.137289 | 2014-09-09 01:03:23.137289 |

    Given the following countries exist:
      | id | name           |
      | 1  | USA            |
      | 2  | Australia      |
      | 3  | Czech Republic |

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

    Given the following questions exist:
      | id | question                                 | typ    |
      | 1  | Did you stay in a hotel?                 | choice |
      | 2  | How many nights did you stay in a hotel? | number |
      | 3  | How many times did you eat out?          | number |
      | 4  | How did you hear about us?               | choice |
      | 5  | What other museums have you visited?     | choice |

    Given the following answers exist:
      | question_id | answer                                      |
      | 1           | Yes                                         |
      | 1           | No                                          |
      | 4           | Internet                                    |
      | 4           | Newspaper                                   |
      | 4           | Friend's Recommendation                     |
      | 5           | None                                        |
      | 5           | George Bush Presidential Library and Museum |
      | 5           | Brazos Valley Museum of Natural History     |
      | 5           | Children's Museum of the Brazos Valley      |

    Given I am on the home page

  Scenario: visitor can successfully sign in and an administrator can see all the data visitor entered
    And I fill in "group_visitors_attributes_0_first_name" with "Josef"
    And I fill in "group_visitors_attributes_0_last_name" with "Novak"
    And I fill in "group_visitors_attributes_0_email" with "josef@novak.cz"
    And I fill in "sign_in_zipcode" with "77840"
    And I select "USA" from "group_visitors_attributes_0_country_id"
    And I fill in "group_group_size" with "123456789"
    And I select "No" from "group_surveys_attributes_0_answer"
    And I fill in "group_surveys_attributes_1_answer" with "741"
    And I fill in "group_surveys_attributes_2_answer" with "908"
    And I select "Newspaper" from "group_surveys_attributes_3_answer"
    And I select "Brazos Valley Museum of Natural History" from "group_surveys_attributes_4_answer"
    And I press "Submit"

    And I go to the visitor index page
    And I fill in "session_password" with "aaaaaa"
    And I check "session_remember_me"
    And I press "log_in_button"
    And I follow "Table"
    And I fill in "start_date" with "09/08/2010"
    And I fill in "end_date" with "10/30/2200"
    And I press "submit_btn"

    Then I am on the visitor index page
    And I should see "Novak"
    And I should see "Josef"
    And I should see "josef@novak.cz"
    And I should see "College Station"
    And I should see "77840"
    And I should see "Texas"
    And I should see "USA"
    
    When I view details for "Novak"

    # TODO capybara has problem with JavaScript pop-out window
    #Then I should see "Novak"
    #And I should see "Josef"
    #And I should see "123456789"
    #And I should see "josef@novak.cz"
    #And I should see "College Station"
    #And I should see "77840"
    #And I should see "Texas"
    #And I should see "USA"
    #And I should see "No"
    #And I should see "Did you stay in a hotel?"
    #And I should see "741"
    #And I should see "908"
    #And I should see "Newspaper"
    #And I should see "Brazos Valley Museum of Natural History"
