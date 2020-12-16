@feature @smoke @regression @R124
Feature:(Req#124) User wants to perform some transactions in the Savings Deposit Account with the bank.
  @R124_TC001 @P1 @smoke
  Scenario:(TC#001) User wants to deposit some amount in the Savings Deposit Account

    Given the user is on the Home Page
    And   the user clicks on the Transactions Menu
    When  the user clicks on the Deposit link
    And   the user selects 4191 in the Account for Deposit dropdown
    And   the user enters 3000 into the amount textfield
    And   the user clicks on the Submit button
    Then  the amount 3000 is deposited in the selected account.

  @R124_TC002 @P1
  Scenario:(TC#002) User wants to withdraw some amount from the Savings Deposit Account

    Given the user is on the Home Page
    And   the user clicks on the Transactions Menu
    When  the user clicks on the Withdraw link
    And   the user selects 4191 in the Account for Withdraw dropdown
    And   the user enters 2000 into the amount textfield
    And   the user clicks on the Submit button
    Then  the amount 2000 is withdrawn from the selected account.
	
	number 9853109944 Dr. Sachidananda
	
	Given I am a user and I click on the How am I dashboard item, I am presented with a form where I can select my mood from a list of moods, add a description, save it and view my current mood updated in the How Am I section of the dashboard.
	
	
	1.Send confirmation to UXbridge for the layout
	2.Team discussion for the confirmed UI layout
	3.Team Kickoff
	4.Task Plan 
	5.Technical requirement related user stories
	6.Project libre download 
	7.Upload layout related changes in Teams
	
	
	
	