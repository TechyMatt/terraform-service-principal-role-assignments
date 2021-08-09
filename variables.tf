variable "service_principals" {
    default = {
        "sp_bootstrap" = {
            "name" = "SP For Bootstrap"
            "role_assignments" = {
                "Reader" = [ "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/RG1", 
                             "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/RG2"]
                "Contributor" = ["/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/RG1"]
            }
        }
        "sp_networking" = {
            "name" = "SP For Networking"
            "role_assignments" = {
                "Contributor" = ["/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/RG1"]
                "Network Contributor" = [ "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/RG2"]
            }
        }
    }
}