
workspace {
    model {
        properties {
            "structurizr.groupSeparator" "/"
        }

        peopleModule = softwareSystem "People Module" {
            description "Responsible for keeping information about people at the faculty"
            tags "External System"
        }
        enrollmentModule = softwareSystem "Enrollment Module" {
            description "Responsible for enrollment of students in subjects"
            tags "External System"
        }
        loginModule = softwareSystem "Login Module" {
            description "Responsible for handling login requests"
            tags "External System"
        }
        
        schedulingModule = softwareSystem "Scheduling Module" "Responsible for managing subjects, schedules and room reservations" {
            group "Application Presentation" {
                webapp = container "Web Application" "Delivers the Single-Page Application" "Lightweight HTTP server" {
                    
                }
                singleP = container "Single-Page Application" "Provides UI for the users" "JavaScript" "Web Front-End" {
                    singlePRouter = component "Router" "Routes URL paths to pages"

                    singlePLoginPage = component "Login Page" "Allows user login"

                    singlePSubjectsPage = component "Subjects Page" "Allows browsing and managing subjects"
                    singlePCreateSubjectPage = component "Create Subject Page" "Page for creating a subject"

                    singlePTicketsPage = component "Tickets Page" "Allows managing tickets"
                    singlePCreateTicketPage = component "Create Ticket Page" "Page for creating a ticket"

                    singlePReservationsPage = component "Allows managing reservations"
                    singlePCreateReservationPage = component "Create Reservation Page" "Page for creating a reservation"

                    singlePSchedulesPage = component "Schedules Page" "Allows viewing schedules"
                    singlePStudentSchedulePage = component "Student Schedule Page" "Page for viewing student schedule"
                    singlePTeacherSchedulePage = component "Teacher Schedule Page" "Page for viewing teacher schedule"
                    singlePSubjectSchedulePage = component "Subject Schedule Page" "Page for viewing subject schedule"

                    singlePMenuComponent = component "Menu Component" "Component for website navigation"
                    singlePScheduleTableComponent = component "Schedule Table Component" "Component visualizing a schedule"

                    singlePState = component "State" "Application state like logged-in user info"
                }
            }
            group "Microservices" {
                group "Subjects Microservice" {
                    ServiceSubj = container "Subjects Service" "Manages subjects" {
                        subjectAPIHandler = component "API Handler" "Handles API requests"
                        subjectController = component "Subjects Controller" "Handles subject management business logic"
                        subjectValidator = component "Subject Validator" "Checks whether the subject is valid"
                        subjectVerificator = component "User Verificator" "Verifies user identity"
                        subjectsRepository = component "Subjects repository" "Provides a convenient interface for persisting subjects"
                    }
                    subjectsDatabase = container "Subjects Database" "Persists subjects" "" "Database"
                }

                group "Tickets Microservice" {
                    ServiceTickets = container "Tickets Service" "Manages tickets" {
                        ticketAPIHandler = component "API Handler" "Handles API requests"
                        ticketController = component "Tickets Controller" "Handles ticket management business logic"
                        ticketValidator = component "Ticket Validator" "Validates whether a ticket is valid"
                        ticketCollisionChecker = component "Collision Checker" "Checks whether the room is empty and the ticket teacher is not teaching something else at the same time"
                        ticketVerificator = component "User Verificator" "Verifies user identity"
                        ticketsRepository = component "Tickets repository" "Provides a convenient interface for persisting tickets"
                    }
                    ticketsDatabase = container "Tickets Database" "Persists tickets" "" "Database"
                }

                group "Reservations Microservice" {
                    ServiceReserv = container "Reservations Service" "Manages reservations" {
                        reservAPIHandler = component "API Handler" "Handles API requests"
                        reservController = component "Reservations Controller" "Handles reservation management business logic"
                        reservValidator = component "Reservation Validator" "Checks that the reservation is valid"
                        reservCollisionChecker = component "Collision Checker" "Checks whether the room is empty at the reservation time"
                        reservVerificator = component "User Verificator" "Verifies user identity"
                        reservationsRepository = component "Reservations repository" "Provides a convenient interface for persisting reservations"
                    }
                    reservationsDatabase = container "Reservations Database" "Persists reservations" "" "Database"
                }

                group "Rooms Microservice" {
                    ServiceRooms = container "Rooms Service" "Manages rooms" {
                        roomAPIHandler = component "API Handler" "Handles API requests"
                        roomController = component "Rooms Controller" "Handles room management business logic"
                        roomVerificator = component "User Verificator" "Verifies user identity"
                        roomsRepository = component "Rooms repository" "Provides a convenient interface for persisting rooms"
                    }
                    roomsDatabase = container "Rooms Database" "Persists rooms" "" "Database"
                }
                
                group "Schedule Microservice" {
                    ServiceSchedule = container "Schedule Service" "Provides functionality for retrieving schedules" {
                        scheduleAPIHandler = component "API Handler" "Handles API requests"
                        studentScheduleController = component "Student Schedule Controller" "Handles student schedule retrieval business logic"
                        teacherScheduleController = component "Teacher Schedule Controller" "Handles teacher schedule retrieval business logic"
                        subjectScheduleController = component "Subject Schedule Controller" "Handles subject schedule retrieval business logic"
                        scheduleVerificator = component "User Verificator" "Verifies user identity"
                    }
                }
            }
        }

        webapp -> singleP "Delivers the Single-page to user"

        singlePRouter -> singlePLoginPage "Routes to"
        singlePRouter -> singlePSubjectsPage "Routes to"
        singlePRouter -> singlePCreateSubjectPage "Routes to"
        singlePRouter -> singlePTicketsPage "Routes to"
        singlePRouter -> singlePCreateTicketPage "Routes to"
        singlePRouter -> singlePReservationsPage "Routes to"
        singlePRouter -> singlePCreateReservationPage "Routes to"
        singlePRouter -> singlePSchedulesPage "Routes to"
        singlePRouter -> singlePStudentSchedulePage "Routes to"
        singlePRouter -> singlePTeacherSchedulePage "Routes to"
        singlePRouter -> singlePSubjectSchedulePage "Routes to"

        singlePLoginPage -> singlePMenuComponent "Renders"
        singlePSubjectsPage -> singlePMenuComponent "Renders"
        singlePCreateSubjectPage -> singlePMenuComponent "Renders"
        singlePTicketsPage -> singlePMenuComponent "Renders"
        singlePCreateTicketPage -> singlePMenuComponent "Renders"
        singlePReservationsPage -> singlePMenuComponent "Renders"
        singlePCreateReservationPage -> singlePMenuComponent "Renders"
        singlePSchedulesPage -> singlePMenuComponent "Renders"
        singlePStudentSchedulePage -> singlePMenuComponent "Renders"
        singlePTeacherSchedulePage -> singlePMenuComponent "Renders"
        singlePSubjectSchedulePage -> singlePMenuComponent "Renders"

        singlePMenuComponent -> singlePLoginPage "Links to"
        singlePMenuComponent -> singlePSubjectsPage "Links to"
        singlePMenuComponent -> singlePTicketsPage "Links to"
        singlePMenuComponent -> singlePReservationsPage "Links to"
        singlePMenuComponent -> singlePSchedulesPage "Links to"

        singlePLoginPage -> loginModule "Requests JWT token"
        singlePLoginPage -> singlePState "Accesses and updates user information"

        singlePSubjectsPage -> singlePState "Checks user role"
        singlePSubjectsPage -> subjectAPIHandler "Uses API to fetch subject list"
        singlePSubjectsPage -> singlePCreateSubjectPage "Links to"

        singlePCreateSubjectPage -> singlePState "Checks user role"
        singlePCreateSubjectPage -> subjectAPIHandler "Uses API to create subject"
        singlePCreateSubjectPage -> peopleModule "Uses API to list teachers"

        singlePTicketsPage -> singlePState "Checks user role"
        singlePTicketsPage -> ticketAPIHandler "Uses API to list tickets"
        singlePTicketsPage -> singlePCreateTicketPage "Links to"

        singlePCreateTicketPage -> singlePState "Checks user role"
        singlePCreateTicketPage -> ticketAPIHandler "Uses API to create new ticket"
        singlePTicketsPage -> peopleModule "Uses API to list teachers"
        singlePTicketsPage -> roomAPIHandler "Uses API to list rooms"

        singlePReservationsPage -> singlePState "Checks user role"
        singlePReservationsPage -> reservAPIHandler "Uses API to list reservations"
        singlePReservationsPage -> singlePCreateReservationPage "Links to"

        singlePCreateReservationPage -> singlePState "Checks user role"
        singlePCreateReservationPage -> reservAPIHandler "Uses API to create reservation"
        singlePCreateReservationPage -> roomAPIHandler "Uses API to list rooms"

        singlePSchedulesPage -> singlePState "Checks user role"
        singlePSchedulesPage -> singlePStudentSchedulePage "Links to"
        singlePSchedulesPage -> singlePTeacherSchedulePage "Links to"
        singlePSchedulesPage -> singlePSubjectSchedulePage "Links to"

        singlePStudentSchedulePage -> scheduleAPIHandler "Uses API to get student schedule"
        singlePStudentSchedulePage -> singlePScheduleTableComponent "Renders"

        singlePTeacherSchedulePage -> scheduleAPIHandler "Uses API to get teacher schedule"
        singlePTeacherSchedulePage -> peopleModule "Uses API to list teachers"
        singlePTeacherSchedulePage -> singlePScheduleTableComponent "Renders"

        singlePSubjectSchedulePage -> scheduleAPIHandler "Uses API to get teacher schedule"
        singlePSubjectSchedulePage -> subjectAPIHandler "Uses API to list subjects"
        singlePSubjectSchedulePage -> singlePScheduleTableComponent "Renders"


        subjectAPIHandler -> subjectController "Uses to process request"
        ticketAPIHandler -> ticketController "Uses to process request"
        reservAPIHandler -> reservController "Uses to process request"
        roomAPIHandler -> roomController "Uses to process request"
        scheduleAPIHandler -> studentScheduleController "Uses to process request"
        scheduleAPIHandler -> teacherScheduleController "Uses to process request"
        scheduleAPIHandler -> subjectScheduleController "Uses to process request"

        studentScheduleController -> enrollmentModule "Uses API to get enrolled tickets"
        studentScheduleController -> ticketAPIHandler "Uses API to get ticket information"

        teacherScheduleController -> ticketAPIHandler "Uses API to get taught tickets"

        subjectScheduleController -> ticketAPIHandler "Uses API to get subject tickets"

        subjectValidator -> peopleModule "Uses API to validate teacher"
        ticketValidator -> roomAPIHandler "Uses API to validate room"
        ticketValidator -> ticketCollisionChecker "Checks collisions"
        ticketValidator -> peopleModule "Uses API to validate teacher"

        ticketCollisionChecker -> ticketsRepository "Gets overlapping tickets"
        ticketCollisionChecker -> reservAPIHandler "Uses API to get overlapping reservations"

        group "Users" {
            student = person "Student"
            teacher = person "Teacher"
            manager = person "Manager"
            schedulingCommitteeMember = person "Scheduling Committee Member"
        }
        
        student -> webapp "Visits module domain" "HTTPS"
        teacher -> webapp "Visits module domain" "HTTPS"
        manager -> webapp "Visits module domain" "HTTPS"
        schedulingCommitteeMember -> webapp "Visits module domain" "HTTPS"

        teacher -> singleP "Changes schedule state"
        teacher -> singleP "Views their schedule"
        manager -> singleP "Changes schedule state"
        schedulingCommitteeMember -> singleP "Changes schedule state"
        student -> singleP "Views their schedule"

        roomsRepository -> roomsDatabase "Persists in"
        subjectsRepository -> subjectsDatabase "Persists in"
        reservationsRepository -> reservationsDatabase "Persists in"
        ticketsRepository -> ticketsDatabase "Persists in"

        roomController -> roomsRepository "Stores and retrieves rooms"
        
        reservController -> reservValidator "Validates reservations"
        reservController -> reservationsRepository "Stores and retrieves reservations"

        reservValidator -> ServiceRooms "Uses API to check room validity"
        reservValidator -> reservCollisionChecker "Checks collisions"
        
        reservCollisionChecker -> reservationsRepository "Gets conflicting reservations"
        reservCollisionChecker -> ticketAPIHandler "Uses API to get conflicting tickets"
        
        ticketController -> ticketValidator "Validates ticket"
        ticketController -> ticketsRepository "Stores and retrieves tickets"
        
        subjectController -> subjectValidator "Validates subject"
        subjectController -> subjectsRepository "Stores and retrieves subjects"

        subjectAPIHandler -> subjectVerificator "Verifies user JWT token"
        scheduleAPIHandler -> scheduleVerificator "Verifies user JWT token"
        roomAPIHandler -> roomVerificator "Verifies user JWT token"
        reservAPIHandler -> reservVerificator "Verifies user JWT token"
        ticketAPIHandler -> ticketVerificator "Verifies user JWT token"
    }

    views {
        systemContext schedulingModule {
            include *
            autoLayout tb 
        }
        
        container schedulingModule {
            include *
        }
        
        component singleP {
            include *
        }

        component ServiceSubj {
            include *
            autoLayout tb
        }
        component ServiceTickets {
            include *
        }
        component ServiceReserv {
            include *
        }
        component ServiceRooms {
            include *
            autoLayout tb
        }
        component ServiceSchedule {
            include *
            autoLayout tb
        }

        styles {
            element "Element" {
                background "#1168bd"
                color "#ffffff"
            }

            element "Component" {
                background "#90d5ff"
                color "#444444"
                shape RoundedBox
            }

            element "External System" {
                background "#aaaaaa"
            }

            element "Person" {
                shape person
            }

            element "Web Front-End"  {
                shape WebBrowser
            }

            element "Database"  {
                shape Cylinder
            }
        }

        dynamic schedulingModule {
            title "Dynamic diagram of Create a room reservation feature"
            description "Shows the sequence of interactions for creating a reservation for room."

            teacher -> webapp "Visits Room reservation module"
            webapp -> singleP "Delivers the single-page application"
            singleP -> teacher "Displays room reservation form"
            teacher -> singleP "Submits filled form"
            singleP -> ServiceReserv "Sends reservation request"
            ServiceReserv -> ServiceRooms "Requests room validity"
            ServiceRooms -> ServiceReserv "Returns if room is valid"
            ServiceReserv -> ServiceTickets "Requests conflicting tickets"
            ServiceTickets -> ServiceReserv "Returns conflicting tickets" 
            ServiceReserv -> reservationsDatabase "Retrieves conflicting reservations or adds reservation to the database"
            reservationsDatabase -> ServiceReserv "Returns whether the reservation was made or if there are conflicts"
            ServiceReserv -> singleP "Sends response to display"
            singleP -> teacher "Shows whether the reservation was made successfully, errors or conflicting reservations"
        }

        dynamic schedulingModule {
            title "Dynamic diagram of Create a subject feature"
            description "Shows the sequence of interactions for creating a new subject."

            manager -> webapp "Visits Subject creation module"
            webapp -> singleP "Delivers the single-page application"
            singleP -> ServiceSubj "Request subject list to display for prerequisites/corequisities"
            ServiceSubj -> singleP "Sends list of subjects"
            singleP -> manager "Displays subject creation form"
            manager -> singleP "Submits filled form"
            ServiceSubj -> peopleModule "Requests data to validate filled values"
            peopleModule -> ServiceSubj "Returns whether the validation was successful"
            ServiceSubj -> subjectsDatabase "Adds new subject to database if validation was successful"
            ServiceSubj -> singleP "Sends response to display to user"
            singleP -> manager "Shows whether the creation was successful or where it failed"
        }

        dynamic schedulingModule {
            title "Dynamic diagram of Creating a ticket feature"
            description "Shows the sequence of interactions for creating a new ticket."

            schedulingCommitteeMember -> webapp "Visits Ticket creation module"
            webapp -> singleP "Delivers the single-page application"
            singleP -> ServiceSubj "Requests list of subjects to display"
            ServiceSubj -> singleP "Returns list of all subjects"
            singleP -> schedulingCommitteeMember "Displays all subjects to choose from"
            schedulingCommitteeMember -> singleP "Selects subject to add new ticket for"
            singleP -> ServiceRooms "Requests list of rooms to choose from"
            ServiceRooms -> singleP "Returns list of all rooms"
            singleP -> peopleModule "Requests list of all teachers"
            peopleModule -> singleP "Returns list of all teachers"
            singleP -> schedulingCommitteeMember "Displays form to fill after subject is chosen"
            schedulingCommitteeMember -> singleP "Fill the form including teacher to teach the ticket and room to hold it"
            singleP -> ServiceTickets "Sends data requested for ticket creation"
            ServiceTickets -> ServiceRooms "Request room validation"
            ServiceRooms -> ServiceTickets "Returns whether the ticket is valid"
            ServiceTickets -> ServiceReserv "Request overlapping reservations validation"
            ServiceReserv -> ServiceTickets "Returns whether the ticket does not collide with other resrvations"
            ServiceTickets -> ticketsDatabase "Retrieves conflicting tickets or add new ticktes if none are found"
            ticketsDatabase -> ServiceTickets "Returns whether the ticket was created or colliding tickets"
            ServiceTickets -> singleP "Sends result to display to user"
            singleP -> schedulingCommitteeMember "Shows whether the creation was successful or indicates where it failed"
        }

        dynamic schedulingModule {
            title "Dynamic Diagram of Viewing student schedule"
            description "Shows the process for a student to view his/her schedule and plan activities accordingly"

            student -> webapp "Accesses student schedule functionality"
            webapp -> singleP "Loads Single-Page Application"
            student -> singleP "Opens student schedule page"
            singleP -> ServiceSchedule "Requests schedule data for the student"
            ServiceSchedule -> enrollmentModule "Retrieves student's enrolled subjects/tickets"
            ServiceSchedule -> ServiceTickets "Fetches relevant ticket details"
            ServiceTickets -> ticketsDatabase "Queries for ticket data"
            ticketsDatabase -> ServiceTickets "Returns ticket data"
            ServiceSchedule -> singleP "Returns student's schedule data"
            singleP -> student "Displays schedule to the user"

            autoLayout
        }

        dynamic schedulingModule {
            title "Dynamic Diagram of Viewing subject schedule"
            description "Shows the process for a student to view a subject's schedule."

            student -> webapp "Accesses Subjects functionality via dashboard"
            webapp -> singleP "Loads Single-Page Application"
            singleP -> ServiceSubj "Sends request to search for a subject by name"
            ServiceSubj -> subjectsDatabase "Queries for subject details"
            subjectsDatabase -> ServiceSubj "Returns subject data"
            ServiceSubj -> singleP "Returns subject details to display"
            student -> singleP "User clicks 'View Schedule' button for the subject"
            singleP -> ServiceSchedule "Requests schedule for the selected subject"
            ServiceSchedule -> ServiceTickets "Fetches tickets related to the subject"
            ServiceTickets -> ticketsDatabase "Queries for ticket data"
            ticketsDatabase -> ServiceTickets "Returns ticket data"
            ServiceTickets -> ServiceSchedule "Returns ticket data"
            ServiceSchedule -> singleP "Returns schedule data for the subject"
            singleP -> student "Displays schedule table with navigation options for weeks"

            autoLayout
        }

        dynamic schedulingModule {
            title "Dynamic Diagram of Viewing teacher schedule"
            description "Shows the process for a teacher to view their weekly schedule."

            teacher -> webapp "Accesses 'Teacher Schedule' functionality via dashboard"
            webapp -> singleP "Loads Single-Page Application"
            teacher -> singleP "Opens teacher schedule page"
            singleP -> ServiceSchedule "Requests teacher's schedule for the current week"
            ServiceSchedule -> ServiceTickets "Fetches tickets associated with teacher"
            ServiceTickets -> ticketsDatabase "Queries for ticket data based on teacher ID"
            ticketsDatabase -> ServiceTickets "Returns ticket data"
            ServiceTickets -> ServiceSchedule "Returns schedule data"
            ServiceSchedule -> singleP "Returns teacher's schedule data"
            singleP -> teacher "Displays schedule table with navigation options for weeks"

            autoLayout
        }       
    }
}

