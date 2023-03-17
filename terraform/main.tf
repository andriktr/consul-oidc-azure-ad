module "demo_oidc_auth_binding" {
  source = "./modules/oidc-auth-binding"
  consul_datacenter = var.consul_datacenter
  acl_policy_name = "basic-readers-demo-policy"
  acl_policy_description = "Basic Readers Policy created for demo purposes. Created with Terraform."
  acl_policy_rules = <<-EOF
    node_prefix "" {
      policy = "read"
    }
    service_prefix "" {
      policy = "read"
    }
    EOF
  acl_role_name = "basic-readers-demo-role"
  acl_role_description = "Basic Readers Role created for demo purposes. Created with Terraform."
}