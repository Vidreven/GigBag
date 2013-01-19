Feature: Band and users
  As a visitor to the website
  I want to see registered bands listed on the homepage
  so I can know if the site has bands

    Scenario: Viewing bands
      Given I am signed up
      When I look at the list of bands
      Then I should see all of them

    Scenario: Viewing band details

    Scenario: Adding bands
