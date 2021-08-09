variable "service_principals" {
    default = {
        "sp_1" = {
            "name" = "The Display Name for Sp 1 in Azure AD"
            "role_assignments" = {
                "Reader" = [ "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/RG1", 
                             "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/RG2"]
                "Contributor" = ["/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/RG1"]
            }
        }
        "sp_2" = {
            "name" = "The Display Name for Sp 2 in Azure AD"
            "role_assignments" = {
                "Contributor" = ["/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/RG1"]
                "Network Contributor" = [ "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/RG2"]
            }
        }
    }
}