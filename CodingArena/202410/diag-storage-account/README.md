# Diag Storage Account

## Parameters

Parameter name | Required | Description
-------------- | -------- | -----------
stoAccountName | Yes      | Name of the diagnostic storage account
tagCreator     | Yes      | Name of the resource creator
tagCreationDate | Yes      | Resource creation date
privateEndpointName | Yes      | Name of the privateEndpoint
tagEnvironment | No       | Resource environment
tagDescription | No       | Description of the deployed resource
location       | No       |
vNetRGNameConnectedToPrivateEndpoint | Yes      | Name of resource group of the vnet which is connected to the private endpoint
vNetNameConnectedToPrivateEndpointNic | Yes      | Name of the vNet which is connected to the private endpoint
vNetSubnetNameConnectedToPrivateEndpointNic | Yes      | Name of the Subnet which is connected to the private endpoint
privateDNSZoneRGNameConnectedToPrivateEndpoint | Yes      | Name of the resource group of private DNS Zone which is connected to the private endpoint
privateDNSZoneNameConnectedToPrivateEndpoint | Yes      | Name of the private DNS Zone which is connected to the private endpoint
publicIPToWhitelist | Yes      | Whitelist Public IP for AzFiles Share Configuration

### stoAccountName

![Parameter Setting](https://img.shields.io/badge/parameter-required-orange?style=flat-square)

Name of the diagnostic storage account

### tagCreator

![Parameter Setting](https://img.shields.io/badge/parameter-required-orange?style=flat-square)

Name of the resource creator

### tagCreationDate

![Parameter Setting](https://img.shields.io/badge/parameter-required-orange?style=flat-square)

Resource creation date

### privateEndpointName

![Parameter Setting](https://img.shields.io/badge/parameter-required-orange?style=flat-square)

Name of the privateEndpoint

### tagEnvironment

![Parameter Setting](https://img.shields.io/badge/parameter-optional-green?style=flat-square)

Resource environment

- Default value: `Production`

- Allowed values: `Production`, `Development`, `Test`

### tagDescription

![Parameter Setting](https://img.shields.io/badge/parameter-optional-green?style=flat-square)

Description of the deployed resource

- Default value: `Storage Account for diagnostics and auditing`

### location

![Parameter Setting](https://img.shields.io/badge/parameter-optional-green?style=flat-square)



- Default value: `[resourceGroup().location]`

### vNetRGNameConnectedToPrivateEndpoint

![Parameter Setting](https://img.shields.io/badge/parameter-required-orange?style=flat-square)

Name of resource group of the vnet which is connected to the private endpoint

### vNetNameConnectedToPrivateEndpointNic

![Parameter Setting](https://img.shields.io/badge/parameter-required-orange?style=flat-square)

Name of the vNet which is connected to the private endpoint

### vNetSubnetNameConnectedToPrivateEndpointNic

![Parameter Setting](https://img.shields.io/badge/parameter-required-orange?style=flat-square)

Name of the Subnet which is connected to the private endpoint

### privateDNSZoneRGNameConnectedToPrivateEndpoint

![Parameter Setting](https://img.shields.io/badge/parameter-required-orange?style=flat-square)

Name of the resource group of private DNS Zone which is connected to the private endpoint

### privateDNSZoneNameConnectedToPrivateEndpoint

![Parameter Setting](https://img.shields.io/badge/parameter-required-orange?style=flat-square)

Name of the private DNS Zone which is connected to the private endpoint

### publicIPToWhitelist

![Parameter Setting](https://img.shields.io/badge/parameter-required-orange?style=flat-square)

Whitelist Public IP for AzFiles Share Configuration

