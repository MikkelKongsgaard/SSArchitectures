# L1 Documentation - System Context

## Overview

The L1 diagram provides a high-level overview of the system and how the different modules interact with each other. It shows the interactions between the Scheduling Module and other external systems such as the People Module, Enrollment Module, and Login Module.

## System Context

### Scheduling Module

- **Description:** Responsible for managing subjects, schedules, and room reservations.
- **Interactions:**
  - **People Module:** Keeps information about people at the faculty.
  - **Enrollment Module:** Manages the enrollment of students in subjects.
  - **Login Module:** Handles login requests.

### External Systems

- **People Module:**
  - **Description:** Responsible for keeping information about people at the faculty.

- **Enrollment Module:**
  - **Description:** Responsible for enrollment of students in subjects.


- **Login Module:**
  - **Description:** Responsible for handling login requests.

### Users

- **Student:** Visits the module domain via HTTPS.
- **Teacher:** Visits the module domain via HTTPS.
- **Manager:** Visits the module domain via HTTPS.
- **Scheduling Committee Member:** Visits the module domain via HTTPS.

For more detailed interactions and relationships, refer to the L2 and L3 documentation.