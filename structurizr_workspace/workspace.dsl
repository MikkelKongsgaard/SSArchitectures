
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
            viewing = container "ScheduleViewing" "Provides services for viewing schedules" {
                
            }
            modf = container "Schedule Modification" "Provides services for modifying scheduling" {
                group "Presentation layer" {
                    modifyScheduleHTML = component "Modify schedule HTML" "" "" "Web Front-End"
                }
                group "Business layer" {
                    modifyScheduleValidator = component "Modify schedule validator" "" "" "Component element"
                    modifySubjectController = component "Modify subject controller" "" "" "Component element"
                }
            }
            persist = container "Persistence" "Takes care of application state persistence" {
                group "Persistence layer" {
                    database = component "Database" "Stores all the data at one place" "" "Database"
                }
                group "Business layer" {
                    ticketsRepository = component "Tickets repository" "" "" "Component element"
                    reservationsRepository = component "Reservations repository" "" "" "Component element"
                    subjectsRepository = component "Subjects repository" "" "" "Component element"
                    roomsRepository = component "Roooms repository" "" "" "Component element"
                }
            }
        }

        viewing -> persist ""
        modf -> persist "Requests data and data modifications"
        viewing -> enrollmentModule ""
        modf -> peopleModule ""

        student = person "Student"
        teacher = person "Teacher"
        manager = person "Manager"
        schedulingCommitteeMember = person "Scheduling Committee Member"

        teacher -> modf "Change schedule state"
        teacher -> viewing "view my schedule"
        manager -> modf "Change schedule state"
        schedulingCommitteeMember -> modf "Change schedule state"
        student -> viewing "view my schedule"

        modifyScheduleHTML -> modifySubjectController "Sends requests to"
        modifySubjectController -> modifyScheduleHTML "Delivers content to"
        modifySubjectController -> modifyScheduleValidator "Request validation"
        modifyScheduleValidator -> persist "Request data to validate subject modification"
        modifySubjectController -> persist "Request schedule change"

        roomsRepository -> database "Gets rooms"
        subjectsRepository -> database "Gets subjects"
        reservationsRepository -> database "Gets reservations"
        ticketsRepository -> database "Gets tickets"
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
        
        component viewing {
            include *
            autoLayout tb 
        }
        component modf {
            include *
            autoLayout tb 
        }
        component persist {
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
