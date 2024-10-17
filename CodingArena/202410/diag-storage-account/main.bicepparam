using './main.bicep'

param stoAccountName = 'tncasto1csnjwi'
param tagCreator = 'jwiedemann@baggenstos.ch'
param tagCreationDate = '17.10.2024'
param privateEndpointName = 'pnca-sto1-pe-csn-jwi'
param tagEnvironment = 'Production'
param tagDescription = 'Storage Account for diagnostics and auditing'
param location = 'switzerlandnorth'
param vNetRGNameConnectedToPrivateEndpoint = 'tnca-vnet99-csn-rg'
param vNetNameConnectedToPrivateEndpointNic = 'tnca-vnet99-csn'
param vNetSubnetNameConnectedToPrivateEndpointNic = 'codingArena'
param privateDNSZoneRGNameConnectedToPrivateEndpoint = 'pnca-dns1-csn-rg'
param privateDNSZoneNameConnectedToPrivateEndpoint = 'privatelink.blob.core.windows.net'
param publicIPToWhitelist = []

