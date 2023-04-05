



Separate a core/domain module that contains your core/domain/business logic.  
It must not have any dependencies on other libraries or modules.  
If you can publish it as a standalone library without ANY DEPENDENCIES then you are in goood place!

It has to be separate from HTTP stuff, library stuff etc.

# Example code

## Core/domain code

- MyData
- MyDataRepository interface
    - create(MyData data)
- MyDataService class
    - create(MyData data)
        - does validation
        - calls MyDataRepository


## Application code

- http layer
    - Controller POST /my-data
        - converts HTTP model to domain model
        - calls domain code MyDataService.create
    - MyDataRepositorySQL implements MyDataRepository
        - implements the real thing..




