Feature: Low transparency
  In order to show/hide costs in Launchpad
  As a dashboard creator
  I want to be able to set the client's transparency

  Scenario: Turn low transparency on
    Given I visit the dashboard edit page
    And I click on the 'low transparency' toggle
    When I click 'Save'
    Then I should see 'Success'
