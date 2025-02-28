

By "user" here I mean a *user of the system*, not necessarily a physical person.

## RBAC
Role based access control.  
If a user has a specific role assigned, then it can do an action.  




Should a user be able to see this resource?  
If no, then return 404 NotFound.

If a user *is able to see this resource* but *it is not editable* (at this time),  
then 403 Forbidden.  
This might be if resource is: soft-deleted, locked in some way, or in-the-middle-of-something (like creating).



