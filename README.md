# Terraform State

```sh
module "example" {
    source          = "git::https://gitlab.woopidi.net/woopidi/terraform-modules/terraform-state.git"
    account_name    = "example"
}
```

## Outputs

```sh
{
    certificate_arn = module.example.certificate_arn
}
```