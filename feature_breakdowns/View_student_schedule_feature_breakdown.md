# Scheduling

## Core features and responsibilities

### Feature: Viewing student schedule

As a logged-in user, I want to view my schedule for the current week to plan my activities accordingly.

#### Feature breakdown

1. The user opens dashboard and clicks on "Student schedule" button.
2. The system displays a dashboard with a "View schedule" button.
3. The user clicks the "View schedule" button.
4. The system fetches the schedule for the logged-in student from the database for the current weak.
5. A table with the student's schedule (including lectures, labs, and practicals) for the current week is displayed.
6. The student can navigate between weeks using buttons for "Next week" or "Previous week" to view past or future schedules.

#### Responsibilities

##### Authorization responsibilities

* Ensure that only authenticated and authorized users have access to their own schedule.

##### Student data access responsibilities

* Collect student schedule data based on the logged-in user's ID.

##### Schedule displaying responsibilities

* Display the student's schedule in a table format, which is easy to interpret.
* Show clear labels for days of the week and time slots for each event.
* Display and manage the function of buttons that change which week is being displayed.

##### Error handling responsibilities

* Provide an appropriate error message when no schedule is found for the student.
