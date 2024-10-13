
# Scheduling

## Core features and responsibilities

### Feature: Viewing teacher schedule

As a logged-in user, I want to view my schedule for the current week to plan my activities accordingly.

#### Feature breakdown

1. The user logs in to SIS and navigates to the Teacher Schedule module from the main page.
2. The system displays a dashboard with a "View Schedule" button.
3. The user clicks the "View Schedule" button.
4. The system fetches the schedule for the logged-in teacher from the database for the current weak.
5. A table with the teacher's schedule (including lectures and labs hosted by the teacher) for the current week is displayed.
6. The teacher can navigate between weeks using buttons for "Next week" or "Previous week" to view past or future schedules.

#### Responsibilities

#### User input validation responsibilities

* Ensure that only logged-in teacher's ID is used to retrieve their schedule.
* Prevent unauthorized users from viewing other teacher's schedules.

#### Security responsibilities

* Ensure that only authenticated and authorized users have access.

##### Student data access responsibilities

* Collect teachers schedule data  based on the logged-in user's ID.

##### Schedule displaying responsibilities

* Display the teacher's schedule in a table format, which is easy to interpret.
* Show clear labels for days of the week and time slots for each event.
* Display and manage the function of buttons that change which week is being displayed.

##### Error handling responsibilities

* Provide an appropriate error message when no schedule is found for the teacher.
