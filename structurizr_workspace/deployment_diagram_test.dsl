// i can not make the style work..
// i am not sure this i the right way to do it but i tried to follow the slides 15 from NSWI130_05_L_styles_introduction 
workspace {
    model {
        u = person "User"
        
        s = softwareSystem "Software System" {
            webapp = container "Web Application" "Delivers the Single-page app" "Lightweight HTTP server" 
            singleP = container "Single-Page Application" "Provides Schedule functionality to User" "Client-side HTML page"
            
            ServiceSubj = container "Subject Service" "Handles subject-related functionality" "Microservice" {
                subjectController = component "Subjects Controller" "Manages subject requests"
                subjectValidator = component "Validator" "Validates subject data"
                subjectVerification = component "User Verification" "Verifies user identity"
                subjectsRepository = component "Subjects Repository" "Stores subjects data" "Database repository"
            }

            database = container "Database" "Stores all the data at one place" "MySQL Database"
        }
    
        u -> webapp "Uses"
        webapp -> singleP "Delivers the Single-page app"
        singleP -> ServiceSubj "Interacts with subject service"
        ServiceSubj -> database "Reads from and writes to"
        
        deployment = deploymentEnvironment "Deployment diagram" {
            deploymentNode "User Laptop" {
                containerInstance webapp
                containerInstance singleP
            }
            
            deploymentNode "Server" {   
                deploymentNode "Application Server" {
                    containerInstance ServiceSubj
                }
        
                deploymentNode "MySQL Server" {
                    containerInstance database
                }
            }
        }
    }
    
    views {
        deployment * deployment {
            include *
            autoLayout lr
        }

    }
}
