
# Scheduling

## Core features and responsibilities

### Feature: Viewing teacher schedule

As a logged-in user, I want to view my schedule for the current week to plan my activities accordingly.

#### Feature breakdown

1. A teacher opens the dashboard and clicks on "Teacher schedule" button.
2. The system displays a dashboard with a "View schedule" button.
3. The user clicks the "View schedule" button.
4. The system fetches the schedule for the logged-in teacher from the database for the current weak.
5. A table with the teacher's schedule (including lectures and labs hosted by the teacher) for the current week is displayed.
6. The teacher can navigate between weeks using buttons for "Next week" or "Previous week" to view past or future schedules.

#### Responsibilities

##### Authorization responsibilities

* Ensure that only authenticated and authorized teachers are able to view their own schedule.

##### Student data access responsibilities

* Collect teachers schedule data based on the logged-in user's ID.

##### Schedule displaying responsibilities

* Display the teacher's schedule in a table format, which is easy to interpret.
* Show clear labels for days of the week and time slots for each event.
* Display and manage the function of buttons that change which week is being displayed.

##### Error handling responsibilities

* Provide an appropriate error message when no schedule is found for the teacher.
