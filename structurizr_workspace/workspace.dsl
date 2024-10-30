
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
                
            }
            persist = container "Persistence" "Takes care of application state persistence" "Database" {
                
            }
        }

        viewing -> persist ""
        modf -> persist ""
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

            element "External System" {
                background "#aaaaaa"
            }

            element "Person" {
                shape person
            }
        }
    }
}
