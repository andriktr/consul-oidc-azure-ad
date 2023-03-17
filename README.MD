# Terraform modules to configure authentication with OIDC and Azure AD for Consul Enterprise (WORK IN PROGRESS - NOT READY FOR USE)

## Table of Contents

* [Description](#description)
* [Prerequisites](#prerequisites)
* [Configuration](#configuration)
  * [Variables for azure-ad-app-for-oidc module](#variables-for-azure-ad-app-for-oidc-module)
  * [Variables for oidc-auth-method module](#variables-for-oidc-auth-method-module)
  * [Variables for oidc-auth-binding module](#variables-for-oidc-auth-binding-module)

## Description

Repository contains Terraform modules which will allow to quickly deploy Consul Enterprise with OIDC authentication method configured to use Azure AD as an identity provider.

## Prerequisites

* OIDC authentication is supported in Consul Enterprise only.
* Make sure you have appropriate permissions to create Azure AD applications and service principals.
* Admin consent is required for the application to access the Microsoft Graph API. This is required for the application to be able to read the user's profile information. The admin consent can be granted by an Azure AD global administrator or by a user with the Global Administrator role assigned in the Azure portal.
* Current configuration allows bind Azure AD groups to Consul ACL roles. Role will have a policy attached to it. Make sure you have appropriate permissions to create Azure AD security groups and ensure that token used to authenticate to Consul during the deployment has permissions to create ACL policies and roles.

## Configuration

Solution contains the following modules:

* [azure-ad-app-for-oidc](./modules/azure-ad-app-for-oidc) - module to configure Consul OIDC integration with Azure AD.
* [oidc-auth-method](./modules/oidc-auth-method) - module to configure Consul OIDC authentication method.
* [oidc-auth-binding](./modules/oidc-auth-binding) - module to bind Consul OIDC authentication method with ACL role and AAD group.

### Variables for azure-ad-app-for-oidc module

Name | Description | Type |
---- | ----------- | ---- |

### Variables for oidc-auth-method module

Name | Description | Type |
---- | ----------- | ---- |

### Variables for oidc-auth-binding module

Name | Description | Type |
---- | ----------- | ---- |

## Deployment

In order to deploy the solution you need to run the following commands:

```bash
# Initialize Terraform
terraform init
# Plan the deployment
terraform plan -var-file="environments/dev/variables.tfvars"
# Apply configuration
terraform apply -var-file="environments/test/variables.tfvars" 
```

## Usage

## Recommendations

## Cleanup

## Useful Documentation

[OpenID Connect (OIDC) Auth Method](https://developer.hashicorp.com/consul/docs/security/acl/auth-methods/oidc)

[Authenticate Users with Single Sign-On (SSO) and Auth0](https://developer.hashicorp.com/consul/tutorials/datacenter-operations/single-sign-on-auth0)