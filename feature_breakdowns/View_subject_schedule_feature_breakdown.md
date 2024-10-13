# Scheduling

## Core features and responsibilities

### Feature: Viewing subject schedule

As a logged-in user, I want to be able to view a schedule for a subject based on its name so that I can consider attending that subject or get basic knowledge about it.

#### Feature breakdown

1. User clicks on the Subjects module on the main page of SIS.
2. The system displays a form where subject name can be entered.
3. User types in the name of the subject to the given field and clicks the Search button.
4. Page with information about desired subject is displayed by the system.
5. User clicks the Schedule button.
6. A table with schedule of the subject for current week is displayed by the system with options to change to prior or next week.

#### Responsibilities

##### User input validation responsibilities

* Ensure that the input given to the Subject name field does not allow any security risk.
* Display an error message to the user if the subject with given name is not found.

##### Security responsibilities

* Ensure that only logged-in users can access provided information.

##### Subject data access responsibilities

* Collect data from subjects database which is internal for this module.
* Check if subject with given name exists.

##### Ticket data access responsibilities

* Collect data from tickets database which is internal for this module.

##### Schedule displaying responsibilities

* Create and display table with lectures and practicals from received data.
* Display and manage function of buttons that change which week is being displayed.
