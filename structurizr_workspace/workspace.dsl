workspace {
    model {
        schedulingModule = softwareSystem "Scheduling Module" {
            description "Responsible for managing subjects, schedules and room reservations"
        }

        peopleModule = softwareSystem "People Module" {
            description "Responsible for keeping information about people at the faculty"
            tags "External System"
        }
        enrollmentModule = softwareSystem "Enrollment Module" {
            description "Responsible for enrollment of students in subjects"
            tags "External System"
        }

        schedulingModule -> peopleModule
        schedulingModule -> enrollmentModule

        student = person "Student"
        teacher = person "Teacher"
        manager = person "Manager"
        schedulingCommitteeMember = person "Scheduling Committee Member"

        student -> schedulingModule
        teacher -> schedulingModule
        manager -> schedulingModule
        schedulingCommitteeMember -> schedulingModule
    }

    views {
        systemContext schedulingModule {
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