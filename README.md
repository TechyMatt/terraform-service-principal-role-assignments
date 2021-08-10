# terraform-service-principal-role-assignments
## Overview
This terraform code provides a sample script that creates azure ad applications and assigns multiple roles to the applications. Rather than having to create custom variables, the solution leverages maps to easily extend scope without having to modify any code.

In order to execute, a terraform.tfvars should be created with a content similar to the following
```terraform
service_principals = {
        "The Display Name for Sp 1 in Azure AD" = {
            "role_assignments" = {
                "Reader" = [ "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/RG1", 
                             "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/RG2"]
                "Contributor" = ["/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/RG1"]
            }
        }
        "The Display Name for Sp 2 in Azure AD" = {
            "role_assignments" = {
                "Contributor" = ["/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/RG1"]
                "Network Contributor" = [ "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/RG2"]
            }
        }
    }
```

This solution assumes that any scopes that are defined already exist in the environment.
