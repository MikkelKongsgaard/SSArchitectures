# Scheduling Module - Level 2/3 Documentation
![](embed:L2_Diagram)
## Overview
The **Scheduling Module** is responsible for managing subjects, schedules, room reservations, and associated functionalities. It is divided into two main groups: **Application Presentation** and **Microservices**.

---

## Architecture

### 1. **Application Presentation**
The **Application Presentation** layer is responsible for the user interface and user interactions. It consists of:

#### a. **Web Application**
- **Description**: A lightweight HTTP server delivering the Single-Page Application.
- **Technology**: Runs on a lightweight HTTP server.

#### b. **Single-Page Application**
- **Description**: Front-end interface for the users.
- **Technology**: Built with JavaScript.
- **Components**:
  - **Router**: Handles URL path routing to appropriate pages.
  - **Pages**:
    - **Login Page**: Allows user login.
    - **Subjects Page**: Browsing and managing subjects.
    - **Create Subject Page**: Page for creating a subject.
    - **Tickets Page**: Managing tickets.
    - **Create Ticket Page**: Page for creating a ticket.
    - **Reservations Page**: Managing reservations.
    - **Create Reservation Page**: Page for creating a reservation.
    - **Schedules Pages**:
      - **Schedules Page**: Viewing schedules.
      - **Student Schedule Page**: Viewing student schedules.
      - **Teacher Schedule Page**: Viewing teacher schedules.
      - **Subject Schedule Page**: Viewing subject schedules.
  - **Menu Component**: For website navigation.
  - **Schedule Table Component**: Visualizes schedules.
  - **State**: Maintains the application state, such as logged-in user information.

---

### 2. **Microservices**
The **Microservices** layer is divided into several services, each responsible for specific business logic and persistence.

#### a. **Subjects Microservice**
- **Purpose**: Manages subjects.
- **Components**:
  - **API Handler**: Handles API requests.
  - **Subjects Controller**: Manages business logic for subject operations.
  - **Subject Validator**: Ensures subject validity.
  - **User Verificator**: Verifies user identity.
  - **Subjects Repository**: Interface for persisting subjects.
- **Database**: Stores subject data.

#### b. **Tickets Microservice**
- **Purpose**: Manages tickets.
- **Components**:
  - **API Handler**: Handles API requests.
  - **Tickets Controller**: Manages ticket-related business logic.
  - **Ticket Validator**: Ensures ticket validity.
  - **Collision Checker**: Ensures room availability and teacher's schedule consistency.
  - **User Verificator**: Verifies user identity.
  - **Tickets Repository**: Interface for persisting tickets.
- **Database**: Stores ticket data.

#### c. **Reservations Microservice**
- **Purpose**: Manages reservations.
- **Components**:
  - **API Handler**: Handles API requests.
  - **Reservations Controller**: Manages reservation-related business logic.
  - **Reservation Validator**: Ensures reservation validity.
  - **Collision Checker**: Checks room availability for reservation times.
  - **User Verificator**: Verifies user identity.
  - **Reservations Repository**: Interface for persisting reservations.
- **Database**: Stores reservation data.

#### d. **Rooms Microservice**
- **Purpose**: Manages rooms.
- **Components**:
  - **API Handler**: Handles API requests.
  - **Rooms Controller**: Manages room-related business logic.
  - **User Verificator**: Verifies user identity.
  - **Rooms Repository**: Interface for persisting rooms.
- **Database**: Stores room data.

#### e. **Schedule Microservice**
- **Purpose**: Provides schedule retrieval functionalities.
- **Components**:
  - **API Handler**: Handles API requests.
  - **Controllers**:
    - **Student Schedule Controller**: Retrieves student schedules.
    - **Teacher Schedule Controller**: Retrieves teacher schedules.
    - **Subject Schedule Controller**: Retrieves subject schedules.
  - **User Verificator**: Verifies user identity.

