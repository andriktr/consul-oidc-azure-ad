# Create Consul ACL Policy 
resource "consul_acl_policy" "oidc_policy" {
  datacenters = [var.consul_datacenter]
  name        = var.acl_policy_name
  description = var.acl_policy_description
  rules       = var.acl_policy_rules
}
# Create Consul ACL Role and Assign the Policy to it
resource "consul_acl_role" "oidc_role" {
  name        = var.acl_role_name
  description = var.acl_role_description
  policies    = [consul_acl_policy.oidc_policy.id]
}

# Create Consul ACL Binding rule
