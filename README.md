# Heimdall

## What?

A project aiming to make mobile UI Tests visible to stakeholders, enabling more collaboration between POs and developers so that the organization can benefit for better and more reliable test cases and test coverage.

## Why?

- In the current workflow, developers write the UI Tests they think are necessary. There is not check of what is being tested done by a PO.
- Every release demands manual regression tests from POs that could be automated and in some cases are even already automated but without visibility.
- There is no collaboration between POs and developers to tweak the test case or add edge cases.
- Tests are written and only updated if they fail. Sometimes the test doesn't make sense anymore.
- Allows the organization to identify gaps in the tests.
- Creates a stronger testing culture and shares the test responsibility between POs and developers.

## How?

Adding metadata to tests so that the test is explained in plain English using BDD methodology and exporting this data to a website that can be accessed by stakeholders.

### What is BDD?

BDD (Behavior-Driven Development) is a software development approach that focuses on defining the behavior of a system from the perspective of its stakeholders. It promotes collaboration between developers, testers, and business representatives to create a shared understanding of the system's requirements and expected behavior.

In BDD, the desired behavior of the system is described using a specific format called "Gherkin." Gherkin is a plain-text language that uses a set of keywords to define the structure and elements of the behavior scenarios. The key components of Gherkin are:

- Feature: A high-level description of the functionality or feature being tested.
- Scenario: A specific example or use case that illustrates the behavior of the system.
- Given: The preconditions or initial state of the system before the scenario begins.
- When: The action or event that triggers the behavior being tested.
- Then: The expected outcome or result of the behavior.

Here's an example of a Gherkin scenario:

```gherkin
  Feature: User Login
    As a registered user
    I want to log in to the system
    So that I can access my account

    Scenario: Successful Login
      Given I am on the login page
      When I enter my valid username and password
      And I click the login button
      Then I should be redirected to my account dashboard
```

In BDD, these behavior scenarios serve as a living documentation of the system's requirements and act as executable specifications. The scenarios are written in a way that is easily understandable by all stakeholders, including non-technical individuals.

To automate the testing of these scenarios, BDD frameworks like Cucumber or SpecFlow are commonly used. These frameworks allow developers to write code that maps the Gherkin steps to actual test implementations. The test implementations interact with the system under test to perform the specified actions and verify the expected outcomes.

The BDD testing process typically involves the following steps:

- Collaboration: Stakeholders, including business representatives, developers, and testers, collaborate to define the desired behavior of the system using Gherkin scenarios.
- Automation: Developers write code to automate the test scenarios. They map the Gherkin steps to corresponding test implementations that interact with the system under test.
- Execution: The automated tests are executed against the system to verify its behavior. The BDD framework reads the Gherkin scenarios, matches the steps with the corresponding test implementations, and executes them.
- Reporting: The BDD framework generates test reports that provide information about the test execution results, including which scenarios passed or failed.
- BDD testing helps ensure that the system behaves as expected from the perspective of its stakeholders. It promotes a shared understanding of the requirements, improves communication between team members, and enables the creation of a comprehensive and maintainable test suite.
- By focusing on the behavior and outcomes rather than the implementation details, BDD testing helps catch defects early, ensures the system meets the desired functionality, and provides confidence in the quality of the software being developed.
