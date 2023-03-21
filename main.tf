# Loading modules which will create the Azure AD App and the Consul OIDC Auth Binding
# module "demo_azure_ad_app_for_oidc" {
#   source = "./modules/azure-ad-app-for-oidc"
#   azure_ad_app_name = "consul-oidc-demo-aad-app"
#   azure_ad_app_owners = []
#   azure_ad_app_redirect_uri = []
#   azure_ad_app_access_token_issuance_enabled = true
#   azure_ad_app_id_token_issuance_enabled = true
#   azure_ad_app_group_membership_claims = ["All"]
# }

# Loading modules which will enable the Consul OIDC Auth method 
# configured with Azure AD identity provider
# module "demo_oidc_auth_method" {
#   source = "./modules/oidc-auth-method"
# }


# Loading modules which will create the Consul ACL Policy 
# and the Consul ACL Role and bind them together after that
# the ACL role will be attached to the Consul OIDC Auth method
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
  consul_auth_method_name = "azure"
  binding_rule_description = "Basic Readers Binding Rule created for demo purposes. Created with Terraform."
  binding_rule_name = "basic-readers-demo-binding-rule"
  aad_group_object_id = "a4afa3ff-b450-4943-a492-c9d2232ef95b"
  #aad_group_object_id = "00000000-0000-0000-0000-000000000000"
}

