Feature: Invite
  In order to invite users to the site
  A user
  Should be able to invite friends

  Scenario: User sends an invite
    Given no emails have been sent
    When I invite a user
    Then I should see send invitation message