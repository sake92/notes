

https://expeditedsecurity.com/aws-in-plain-english/

First understand differences between **regions**, **VPC-s** and **avaliability zones**:  
https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-regions-availability-zones.html

## Region

Geographical area, independent from other regions.  
Data is not replicated between them.

Examples: us-east-1, eu-central-1.



## Availability zone (AZ)


Each Region has **multiple, isolated locations** known as Availability Zones.  
The code for Availability Zone is its Region code *followed by a letter identifier*. For example, us-east-1a.

Sooo, AZ ~= data center


## Virtual Private Cloud (VPC)
https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html

A VPC is a **virtual network that closely resembles a traditional network** that you'd operate in your own data center.  
After you create a VPC, you can add **subnets**.

So it's your own cloud that contains your infrastrucure, subnets etc.



## Users

https://www.youtube.com/watch?v=VclOgMtBXN4
https://www.archerimagine.com/articles/aws/aws-iam-roles.html
https://www.freecodecamp.org/news/aws-iam-explained/

An IAM user can be a "real" user or an app.  
Every user needs to have some *policies* assigned, things that it can do.  

You can create user groups, so that you can assign policies more easily.  
Then you dont have to add policies one by one..

Roles.. are a bit weird.  
Users(services like EC2, SQS, EventBridge) need to "assume a role" **temporarily**.  
This is a way of authenticating that service.









