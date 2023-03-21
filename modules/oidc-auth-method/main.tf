resource "consul_acl_auth_method" "minikube" {
  name          = var.consul_auth_method_name
  type          = "oidc"
  description   = var.consul_auth_method_description
  max_token_ttl = var.consul_acl_auth_method_max_token_ttl

  config_json = jsonencode({
    Host              = "https://192.0.2.42:8443"
    CACert            = "-----BEGIN CERTIFICATE-----\n...-----END CERTIFICATE-----\n"
    ServiceAccountJWT = "eyJhbGciOiJSUzI1NiIsImtpZCI6IiJ9..."
  })
}


#shell: consul acl auth-method create -name azure -type oidc -max-token-ttl=5m -config="@{{ consul_oidc_config_dir }}/{{ consul_oidc_config_file_name }}" -token="{{ master_token.stdout }}"
