variable "consul_token" {
  description = "The Consul ACL token which will be used to access Consul API"
  type        = string
  sensitive   = true
}

variable "consul_datacenter" {
  description = "The name of the Consul datacenter to use."
  type = string
  default = "azure-dc-test"
}