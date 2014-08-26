Feature: Manage proposition units
  In order to locate propositions
  An organization owner
  wants to manage proposition units
  
  Background:
  
    Given a user named "user"
    And an organization named "organization 1" assigned to me
    And I log in as "user"
    
  Scenario: Create unit
    Given I am on the new proposition unit page
    When I fill in "Name" with "Dummy"
    And I press "Create Proposition Unit"
    Then I should see "Creation successful"
    
  Scenario: Edit unit
    Given a proposition unit named "Dummy" assigned to my organization
    And I am on the edit proposition unit page
    When I fill in "Name" with "Dummy 2"
    And I press "Update Proposition Unit"
    Then I should see "Update successful"
    
  Scenario: Destroy unit
    Given a proposition unit named "Dummy" assigned to my organization
    And I am on the proposition unit page
    When I follow "Actions"
    And I follow "Destroy"
    Then I should see "Resource destroyed successfully."