Feature: Validate provider information cards

  Scenario Outline: User verifies provider information matches on opened drawer on resources page
    Given a user navigates to UniteUS resource page
    When a user searches for "<keyword>"
    And a user clicks first provider card
    Then Verify that an opened drawer with detailed information about the same provider you clicked on is displayed
    Examples:
      | keyword |
      | service |