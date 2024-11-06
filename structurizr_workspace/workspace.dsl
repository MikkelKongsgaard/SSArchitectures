
workspace {
    model {
        peopleModule = softwareSystem "People Module" {
            description "Responsible for keeping information about people at the faculty"
            tags "External System"
        }
        enrollmentModule = softwareSystem "Enrollment Module" {
            description "Responsible for enrollment of students in subjects"
            tags "External System"
        }
        
        schedulingModule = softwareSystem "Scheduling Module" "Responsible for managing subjects, schedules and room reservations" {
            group "Application Presentaoitn" {
                webapp = container "Web Application" "Deliveres the Single page app" "lightweight HTTP server" {
                    
                }
                singleP = container "Single-Page Application" "Provides Schedule functionality to User" "client-side HTML page" {
                    
                }
            }
            group "Microservices" {
                ServiceSubj = container "Subject Service" "" {
                    subjectController = component "Subjects Controller" ""
                    subjectValidator = component "Validator" 
                    subjectVerification = component "User Verification" "Verifies user identity"
                    subjectsRepository = component "Subjects repository" "" "" "Component element"
                }
                ServiceTickets = container "Tickets Service" "" {
                    ticketController = component "Tickets Controller" ""
                    ticketValidator = component "Validator"
                    ticketVerification = component "User Verification" "Verifies user identity"
                    ticketsRepository = component "Tickets repository" "" "" "Component element"
                }
                ServiceReserv = container "Reservations Service" "" {
                    reservController = component "Reservation Retrieval Controller" ""
                    reservValidator = component "Validator" 
                    reservVerification = component "User Verification" "Verifies user identity"
                    reservationsRepository = component "Reservations repository" "" "" "Component element"
                }
                ServiceRooms = container "Rooms Service" "" {
                    roomController = component "Room Controller" ""
                    roomValidator = component "Validator"
                    roomVerification = component "User Verification" "Verifies user identity"
                    roomsRepository = component "Roooms repository" "" "" "Component element"
                }
                
                ServiceSchedual = container "Schedule Service" "Provides services for viewing schedules" {
                    schedualController = component "Schedule Retrieval Controller" ""
                    schedualValidator = component "Validator"
                    schedualVerification = component "User Verification" "Verifies user identity"
                    schedualLoader = component "Loader" "Loads schedule data"
                }
            }
            database = container "Database" "Stores all the data at one place" "" "Database"
        }

        webapp -> singleP "Delivers the Single-page to user"
        
        singleP -> subjectController "API call" "JSON/HTTPS"
        singleP -> ticketController "API call" "JSON/HTTPS"
        singleP -> reservController "API call" "JSON/HTTPS"
        singleP -> roomController "API call" "JSON/HTTPS"
        singleP -> schedualController "API call" "JSON/HTTPS"

        schedualController -> enrollmentModule ""
        ticketController -> peopleModule ""

        group "Users" {
            student = person "Student"
            teacher = person "Teacher"
            manager = person "Manager"
            schedulingCommitteeMember = person "Scheduling Committee Member"
        }
        
        student -> webapp "visit domain" "HTTPS"
        teacher -> webapp "visit domain" "HTTPS"
        manager -> webapp "visit domain" "HTTPS"
        schedulingCommitteeMember -> webapp "visit domain" "HTTPS"

        teacher -> singleP "Change schedule state"
        teacher -> singleP "view my schedule"
        manager -> singleP "Change schedule state"
        schedulingCommitteeMember -> singleP "Change schedule state"
        student -> singleP "view my schedule"

        teacher -> singleP ""
        manager -> singleP ""
        schedulingCommitteeMember -> singleP ""
        # modifySubjectController -> modifyScheduleHTML "Delivers content to"
        # modifySubjectController -> modifyScheduleValidator "Request validation"

        roomsRepository -> database "Gets rooms"
        subjectsRepository -> database "Gets subjects"
        reservationsRepository -> database "Gets reservations"
        ticketsRepository -> database "Gets tickets"

        # components for schedule viewing
        schedualController -> schedualValidator ""
        schedualController -> schedualVerification ""
        schedualController -> schedualLoader ""
        
        roomController -> roomValidator ""
        roomController -> roomVerification ""
        roomController -> roomsRepository ""
        
        reservController -> reservValidator ""
        reservController -> reservVerification ""
        reservController -> reservationsRepository ""
        
        ticketController -> ticketValidator ""
        ticketController -> ticketVerification ""
        ticketController -> ticketsRepository ""
        
        subjectController -> subjectValidator ""
        subjectController -> subjectVerification ""
        subjectController -> subjectsRepository ""
    }

    views {
        systemContext schedulingModule {
            include *
            autoLayout tb 
        }
        
        container schedulingModule {
            include *
            autoLayout tb 
        }
        
        component ServiceSubj {
            include *
            autoLayout tb
        }
        component ServiceTickets {
            include *
            autoLayout tb
        }
        component ServiceReserv {
            include *
            autoLayout tb
        }
        component ServiceRooms {
            include *
            autoLayout tb
        }
        component ServiceSchedual {
            include *
            autoLayout tb
        }

        styles {
            element "Element" {
                background "#1168bd"
                color "#ffffff"
                shape RoundedBox
            }

            element "Component element" {
                background "#90d5ff"
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
    }
}
