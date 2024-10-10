# Scheduling

## Core features and responsibilities

### Feature: Creating a Ticket

<details>
  <summary><strong>What is a Ticket?</strong></summary>
  <span style="color:gray">
      A Ticket is a kind of Token, that gives it's owner a right to attend some registered event. It holds a:
      - mandatory information about organization or lecturer
      - mandatory time of the event
      - mandatory subject code and info
      - optional room, where the event will take place (the event can also be online, in which case the room is redundant).
  </span>
</details>

<details>
  <summary><strong>What is a Tickets Pack?</strong></summary>
  <span style="color:gray">
    For a given subject, there is an organized Data structure with Tickets. A Pack is separated into different Events like lectures, practices.... Each event includes Tickets, which number can be limited for given event.
  </span>
</details>

As a Teacher I want to be able to Create a Tickets for my Subjects, with some basic info. I want to be able to set some maximum Capacity that when it is reached, the ticket can't be created anymore by students.

As a student when I enroll into an subject, I want to be able to pick the concreate lecture that I will be attending.

#### Feature breakdown

Issuing Tickets:
1. There is a **Management tab** on dashboard only visible/accessible for *Manager and Study department officer*
2. There *Manager and Study department officer* can use this tab to issue **Tickets Pack for given subject** including lectures with given time, room... (more in [What is Ticket?](https://github.com/MikkelKongsgaard/SSArchitectures/new/main/feature_breakdowns#feature-creating-a-ticket))
3. They can also limit the number of tickets being issued for a Tickets Pack Events.

Getting Tickets:
1. There is a **Tickets selection tab** in the Schedule tab on dashboard. There *Students* can request a ticket for subjects, they are enrolled to.
2. if there still are tickets for given subject, a ticket from the subjects Ticket pack event is granted, otherwise it is denied.
3. In granting, the ticket is included to the accounts data. 

#### Responsibilities

##### Creating Ticket Pack
* Ticket Packs can be created by given Roles

##### Ticket Packs Persistence
* The created Ticket Packs are added to a storage
* There Packs can be modified, deleted, added 

##### Ticket Requests
* Certain Users can create a Request for a Ticket in given subject  

##### Ticket Requests Resolution
* Request Ticket for given subject
* Request is evaluated based on its validity and restrictions of the Tickets count
