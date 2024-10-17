@description('Name of the diagnostic storage account')
param stoAccountName string

@description('Name of the resource creator')
param tagCreator string

@description('Resource creation date')
param tagCreationDate string

@description('Name of the privateEndpoint')
param privateEndpointName string

@description('Resource environment')
@allowed([
  'Production'
  'Development'
  'Test'
])
param tagEnvironment string = 'Production'

@description('Description of the deployed resource')
param tagDescription string = 'Storage Account for diagnostics and auditing'

param location string  = resourceGroup().location

@description('Name of resource group of the vnet which is connected to the private endpoint')
param vNetRGNameConnectedToPrivateEndpoint string

@description('Name of the vNet which is connected to the private endpoint')
param vNetNameConnectedToPrivateEndpointNic string

@description('Name of the Subnet which is connected to the private endpoint')
param vNetSubnetNameConnectedToPrivateEndpointNic string

@description('Name of the resource group of private DNS Zone which is connected to the private endpoint')
param privateDNSZoneRGNameConnectedToPrivateEndpoint string

@description('Name of the private DNS Zone which is connected to the private endpoint')
param privateDNSZoneNameConnectedToPrivateEndpoint string

@description('Whitelist Public IP for AzFiles Share Configuration')
param publicIPToWhitelist array

var privateEndpointNICName = '${privateEndpointName}-nic1'

resource stoAccountName_resource 'Microsoft.Storage/storageAccounts@2019-06-01' = {
  name: stoAccountName
  tags: {
    Environment: tagEnvironment
    Creator: tagCreator
    CreationDate: tagCreationDate
    Description: tagDescription
  }
  location: location
  properties: {
    accessTier: 'Hot'
    minimumTlsVersion: 'TLS1_2'
    supportsHttpsTrafficOnly: true
    networkAcls: {
      defaultAction: 'Deny'
      ipRules: [for publicIP in publicIPToWhitelist: {
        value: publicIP
        action: 'Allow'
      }]
    }
  }
  kind: 'StorageV2'
  sku: {
    name: 'Standard_LRS'
  }
}

resource stoAccountName_privateEndpoint 'Microsoft.Network/privateEndpoints@2022-01-01' = {
  name: privateEndpointName
  tags: {
    Environment: tagEnvironment
    Creator: tagCreator
    CreationDate: tagCreationDate
    Description: tagDescription
  }
  location: location
  properties: {
    subnet: {
      id: resourceId(vNetRGNameConnectedToPrivateEndpoint, 'Microsoft.Network/virtualNetworks/Subnets', vNetNameConnectedToPrivateEndpointNic, vNetSubnetNameConnectedToPrivateEndpointNic)
    }
    privateLinkServiceConnections: [
      {
        properties: {
          privateLinkServiceId: stoAccountName_resource.id
          groupIds: [
            'blob'
          ]
        }
        name: '${stoAccountName}-Connection'
      }
    ]
    customNetworkInterfaceName: privateEndpointNICName
    
  }
}

resource stoAccountName_privateEndpoint_privateDnsZoneGroup 'Microsoft.Network/privateEndpoints/privateDnsZoneGroups@2021-03-01' = {
  name: '${stoAccountName_privateEndpoint.name}/dnsgroupname'
  properties: {
    privateDnsZoneConfigs: [
      {
        name: 'config1'
        properties: {
          privateDnsZoneId: resourceId(privateDNSZoneRGNameConnectedToPrivateEndpoint, 'Microsoft.Network/privateDnsZones', privateDNSZoneNameConnectedToPrivateEndpoint)
        }
      }
    ]
  }
}
