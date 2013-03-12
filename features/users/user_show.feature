Feature: Show Users
  As a visitor to the website
  I want to see registered users listed on the homepage
  so I can know if the site has users

    Scenario: Viewing users
      Given I exist as a user
       And I sign in with valid credentials
      When I look at the list of users
      Then I should be redirected to home page

    @wip
    Scenario: Viewing profiles
      Given I exist as a user
       And I sign in with valid credentials
      When I visit other peoples user profiles
      Then I should be redirected to home page
