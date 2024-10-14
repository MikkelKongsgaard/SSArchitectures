# Scheduling

## Core features and responsibilities

### Feature: Creating a room reservation

As a professor, I want to be able to reserve a room for a specific date and time so that I can ensure availability for lectures and meetings.

#### Feature breakdown

1. A professor opens the dashboard and clicks on "Room Reservations" button.
2. The system displays a form where room details (such as room number, date, time, and purpose) can be entered.
3. User enters the room number, date, time, and purpose of the reservation, then clicks the Reserve button.
4. The system checks if the room is available for the specified time and date.
5. If the room is available, the system creates the reservation and displays a confirmation message to the user.
6. If the room is not available, the system displays an error message indicating the conflict and suggests alternative available slots.

#### Responsibilities

##### User input validation responsibilities

* Ensure that the input fields for room number, date, and time are properly formatted.
* Validate that the room number is a valid identifier from the database.
* Check that the selected date and time are not in the past.

##### Authorization responsibilities

* Ensure that only authorized professors can access the room reservation form and functionalities.

##### Room reservation data access responsibilities

* Check if a reservation for the specified room, date, and time already exists.
* If a reservation exists, display it to the user and prevent overlapping reservations.
* Check if there are any restrictions for the room (e.g., accessible only for large meetings, restricted hours).
