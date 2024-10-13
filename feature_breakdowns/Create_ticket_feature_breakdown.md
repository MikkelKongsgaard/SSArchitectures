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

<details>
  <summary><strong>What is a tickets pack?</strong></summary>
  <span style="color:gray">
    For a given subject, there is an organized data structure with tickets. A pack is separated into different events like lectures, practices.... Each event includes tickets, which number can be limited for given event.
  </span>
</details>

As a teacher I want to be able to create tickets for my subjects, with some basic info. I want to be able to set some maximum capacity that when it is reached, the ticket can't be created anymore by students.

As a student when I enroll into an subject, I want to be able to pick the concreate lecture that I will be attending.

#### Feature breakdown

Issuing Tickets:

1. There is a **Management tab** on dashboard only visible/accessible for *manager and study department officer*.
2. The *manager and study department officer* can use this tab to issue **tickets pack for given subject** including lectures with given time, room... (more in [What is a ticket?](https://github.com/MikkelKongsgaard/SSArchitectures/new/main/feature_breakdowns#feature-creating-a-ticket)).
3. They can also limit the number of tickets being issued for a tickets pack events.

Getting tickets:

1. There is a **Tickets selection tab** in the Schedule tab on dashboard. There *students* can request a ticket for subjects, they are enrolled to.
2. If there still are tickets for given subject, a ticket from the subject's ticket pack event is granted, otherwise it is denied.
3. In granting, the ticket is included to the accounts data.

#### Responsibilities

##### Creating a ticket pack responsibilities

* Ticket packs can be created by given roles.

##### Ticket packs persistence responsibilities

* The created ticket packs are added to a storage.
* There Packs can be modified, deleted, added.

##### Ticket requests responsibilities

* Certain users can create a request for a ticket in given subject.

##### Ticket requests resolution responsibilities

* Request ticket for given subject.
* Request is evaluated based on its validity and restrictions of the tickets count.
