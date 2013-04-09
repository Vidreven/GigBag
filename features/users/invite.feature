Feature: Invite
  In order to invite users to the site
  A user
  Should be able to invite friends

  
  @wip
  Scenario: Invite option exists
  	Given I am on profile page
  	Then I should see invite friends option

  @wip
  Scenario: Invite page exists
  	Given I am on profile page
      And  no emails have been sent
    When I invite a user
    Then I should see send invitation message

  @wip
  Scenario: User sends an invite
    Given I am on invitation page
    When I enter friend's email
      And I click send button
    Then I should see invitation sent message
      And they should receive an email
  
  @wip
  Scenario: Friend receives an invite