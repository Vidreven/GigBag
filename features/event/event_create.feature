Feature: Create event
	In order to organize a concert
	a promotor
	should be able to create an event for a chosen band

	Scenario: A user is not signed in
		Given I am not logged in
		When I visit the site
		Then I should not see create event link

	Scenario: A user is signed in
		Given I am logged in
		When I visit the site
		Then I should see create event link