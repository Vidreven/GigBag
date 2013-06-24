Feature: Create event
	In order to organize a concert
	a promotor
	should be able to create an event for a chosen band

	Scenario: A user is not logged in
		Given I am not logged in
		When I visit the site
		Then I should not see create event link

	Scenario: A user is logged in and has no fan profile
		Given I am logged in
		When I visit the site
		Then I should not see create event link

	Scenario: A user is logged in and has a fan profile
		Given I am logged in
		And I have a fan profile
		When I visit the site
		Then I should see create event link

	@wip
	Scenario: A user clicks create event link
		Given I am logged in
		When I click create event link
		Then I should see create event dialog

	@wip
	Scenario: A user creates an event
		Given I am on create event page
		When I fill in the event details
		Then I should see event created message