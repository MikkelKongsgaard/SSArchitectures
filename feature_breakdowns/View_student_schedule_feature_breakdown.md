# Scheduling

## Core features and responsibilities

### Feature: Viewing student schedule

As a logged-in user, I want to view my schedule for the current week to plan my activities accordingly.

#### Feature breakdown

1. The user logs in to the system and navigates to the Student Schedule module from the main page.
2. The system displays a dashboard with a "View Schedule" button.
3. The user clicks the "View Schedule" button.
4. The system fetches the schedule for the logged-in student from the database for the current weak.
5. A table with the student's schedule (including lectures, labs, and practicals) for the current week is displayed.
6. The student can navigate between weeks using buttons for "Next week" or "Previous week" to view past or future schedules.

#### Responsibilities

##### User input validation responsibilities

* Ensure that only logged-in student's schedule is retrieved.
* Prevent unauthorized users from viewing other students' schedules.

##### Authorization responsibilities

* Ensure that only authenticated and authorized users have access.

##### Student data access responsibilities

* Collect student schedule data  based on the logged-in user's ID.

##### Schedule displaying responsibilities

* Display the student's schedule in a table format, which is easy to interpret.
* Show clear labels for days of the week and time slots for each event.
* Display and manage the function of buttons that change which week is being displayed.

##### Error handling responsibilities

* Provide an appropriate error message when no schedule is found for the student.
