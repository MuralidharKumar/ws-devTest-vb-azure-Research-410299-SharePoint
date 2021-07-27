# ws-stage-vb-azure-core-prod-logging
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 2.64.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 2.64.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_tags"></a> [tags](#module\_tags) | tfe.farmersinsurance.com/fi-prod/stage-tags/azurerm | ~> 1.0.0 |
| <a name="module_tlz_core_logging_resource_group_primary"></a> [tlz\_core\_logging\_resource\_group\_primary](#module\_tlz\_core\_logging\_resource\_group\_primary) | tfe.farmersinsurance.com/fi-prod/stage-resource-group/azurerm | ~> 1.0.0 |
| <a name="module_tlz_core_logging_subnet_primary"></a> [tlz\_core\_logging\_subnet\_primary](#module\_tlz\_core\_logging\_subnet\_primary) | tfe.farmersinsurance.com/fi-prod/stage-subnet/azurerm | ~> 1.0.0 |
| <a name="module_tlz_core_logging_virtual_logging_primary"></a> [tlz\_core\_logging\_virtual\_logging\_primary](#module\_tlz\_core\_logging\_virtual\_logging\_primary) | tfe.farmersinsurance.com/fi-prod/stage-virtual-logging/azurerm | ~> 1.0.0 |
| <a name="tlz_core_logging_nsg_primary"></a> [tlz\_core\_logging\_nsg\_primary](#module\_tlz\_core\_logging\_nsg\_primary) | tfe.farmersinsurance.com/fi-prod/stage-nsg/azurerm | ~> 1.0.0 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_tags"></a> [tags](#input\_tags) | Additional tags. Overwrite module-generated tags | `map` | `{}` | no |
| <a name="input_region_primary"></a> [region\_primary](#input\_region\_primary) | (Required) The primary region in which resources will be deployed. | `string` | `"centralus"` | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_nsg_id"></a> [nsg\_id](#output\_nsg\_id) | The id of the logging security group. |
| <a name="output_resource_group"></a> [resource\_group](#output\_resource\_group) | The name of the Resource Group. |
| <a name="output_subnet_id"></a> [subnet\_id](#output\_subnet\_id) | The list of subnet ids of the subnets. |
| <a name="output_vnet"></a> [vnet](#output\_vnet) | The name of the virtual logging. |
<!-- END_TF_DOCS -->
