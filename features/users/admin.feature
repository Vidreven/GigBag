Feature: Admin
	As an administrator
	I want to be able to administer the site

	Scenario: Not signed in as admin
	  Given I exist as a user
	  When I sign in with valid credentials
	  Then I should not be admin
	
	@wip
	Scenario: Sign in as admin
	  Given I am not logged in
	  When I sign in as admin
	  Then I should see admin panel

	@wip
	Scenario: List all users
	  Given I am logged in as admin
	  When I click show users
	  Then I should see a list of all users

	 @wip
	 Scenario: Delete a user