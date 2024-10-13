# Scheduling

## Core features and responsibilities

### Feature: Creating a subject

As a study branch coordinator, I need to add new subjects that are taught at
the faculty and information about them to the system.

#### Feature breakdown

1. A study branch coordinator ("user") opens the system dashboard.
2. The user clicks on "Subjects" button.
3. The user clicks on "Create new subject" button that is only visible
    to the study branch coordinator.
4. A form shows up. The user fills in:
   - subject code
   - subject name
   - subject description
   - subject syllabus
   - conditions for passing the subject
   - number of credits for the subject
   - number of hours for lectures and number of hours for tutorials
5. In the form, the user selects the garant of the subject from a dropdown
   with all teacher names.
6. For every prerequisite/corequisite of the subject, the user clicks on
   "Add prerequisite"/"Add corequisite" button and selects the prerequisite/corequisite
   from a displayed dropdown of all subject codes and names.
7. The user clicks on "Submit subject".
8. The system validates the subject information.
9. If the subject is valid:
   1. The new subject is registered into the system.
   2. A confirmation that the subject was successfully registered is shown to the user.
10. If a subject is invalid, an error message is shown to the user.

#### Responsibilities

##### Authorization responsibilities

- Check if the current user is a study branch coordinator.

##### Form editing responsibilities

- Display a subject creation form.
- Fetch a list of teachers.
- Fetch a list of subjects.

##### Subject validation responsibilities

- Check if all fields are filled in.
- Check if a subject with the same code exists.

##### Subject creation responsibilities

- Store the new subject information.
