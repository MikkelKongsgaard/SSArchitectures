# Scheduling

## Core features and responsibilities

### Feature: Creating a ticket

<details>
  <summary><strong>What is a ticket?</strong></summary>
  <span style="color:gray">
      A ticket is a kind of token, that gives it's owner a right to attend some registered event. It holds a:
      - mandatory information about organization or lecturer
      - mandatory time of the event
      - mandatory subject code and info
      - optional room, where the event will take place (the event can also be online, in which case the room is redundant).
  </span>
</details>

<!--
<details>
  <summary><strong>What is a tickets pack?</strong></summary>
  <span style="color:gray">
    For a given subject, there is an organized data structure with tickets. A pack is separated into different events like lectures, practices.... Each event includes tickets, which number can be limited for given event.
  </span>
</details>
-->

As a scheduling committee member I want to be able to create tickets for my subjects, with some basic info. I want to be able to set some maximum capacity that when it is reached, the ticket can't be chosen by students anymore.

#### Feature breakdown

1. A scheduling comittee member ("user") opens the dashboard and clicks on "Ticket Management" button only visible/accessible for *scheduling comittee members*.
2. The user clicks on "Create a new ticket" button.
3. A list of all subjects together with their codes is displayed.
4. The user clicks on the subject for which they want to create a ticket.
5. A form is displayed. The user fills in:
   - day of the week
   - start time
   - type (lecture/tutorial)
   - capacity (number of students allowed to select the ticket)
6. In the form, the user selects a teacher of the subject from
   a dropdown of all teacher names and the room from the list
   of all rooms.
7. The user fills in the form and then clicks on a "Create ticket" button.
8. The validity of the ticket scheduling is checked.
9. If the scheduling is valid, the ticket is created in the system
   and a success message is shown to the user.
10. If the scheduling is invalid, an error message describing the
   problem is shown to the user.

#### Responsibilities

##### Authorization responsibilities

* Ensure that only authorized scheduling comittee members can create tickets.

##### Form editing responsibilities

* Display a ticket editing form.
* Allow picking a day of the week.
* Allow picking a time.
* Fetch a list of all teachers.
* Fetch a list of all rooms.

##### Ticket scheduling validation responsibilities

* Check that the room is empty at the given time.
* Check that the teacher does not teach another class at the same time.

##### Ticket persistence responsibilities

* The created ticket is added to a storage.
