variable "consul_datacenter" {
    description = "The name of the Consul datacenter to use."
    type = string
}
variable "acl_policy_name" {
    description = "The name of the ACL policy to create."
    type = string
}
variable "acl_policy_rules" {
    description = "The rules of the ACL policy to create."
    type = string
}

variable "acl__policy_description" {
    description = "The description of the ACL policy to create."
    type = string
}

variable "acl_role_name" {
    description = "The name of the ACL role to create."
    type = string
}
variable "acl_role_description" {
    description = "The description of the ACL role to create."
    type = string
}