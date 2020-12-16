@feature @regression @R123
Feature:(Req#123) User wants to open and maintain Savings Deposit Account with the bank.
    @R123_TC001 @P1
    Scenario:(TC#001) User wants to open a new Savings Account for Individual Ownership

    Given the user is on the Home Page
    And   the user clicks on the savings-menu Menu
    When  the user clicks on the new-savings-menu-option link
    And   the user clicks on Savings in the Select Checking Account Type radio button
    And   the user clicks on Individual in the Select Account Ownership radio button
    And   the user enters Ash01121995 into the name textfield
    And   the user enters 250 into the openingBalance textfield
    And   the user clicks on the newSavingsSubmit button
    Then  the Savings Account is opened successfully

    @R123_TC002 @P2
    Scenario:(TC#002) User wants to open a new Savings Account for Joint Ownership

    Given the user is on the Home Page
    And   the user clicks on the savings-menu Menu
    When  the user clicks on the new-savings-menu-option link
    And   the user clicks on Savings in the Select Checking Account Type radio button
    And   the user clicks on Joint in the Select Account Ownership radio button
    And   the user enters JointAccount into the name textfield
    And   the user enters 100 into the openingBalance textfield
    And   the user clicks on the newSavingsSubmit button
    Then  the Savings Account is opened successfully




