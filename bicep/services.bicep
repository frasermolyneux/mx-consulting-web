targetScope = 'resourceGroup'

// Parameters
param parLocation string
param parEnvironment string

param parConnectivitySubscriptionId string
param parFrontDoorResourceGroupName string
param parDnsResourceGroupName string
param parFrontDoorName string
param parPublicWebAppDnsPrefix string
param parParentDnsName string

param parStrategicServicesSubscriptionId string
param parWebAppsResourceGroupName string
param parAppServicePlanName string

param parTags object

// Variables
var varDeploymentPrefix = 'mxConsultingServices' //Prevent deployment naming conflicts
var varKeyVaultName = 'kv-mxcon-${parEnvironment}-${parLocation}'
var varAppInsightsName = 'ai-mxconsulting-${parEnvironment}-${parLocation}'

module consultingWebApp 'services/consultingWebApp.bicep' = {
  name: '${varDeploymentPrefix}-consultingWebApp'

  params: {
    parLocation: parLocation
    parEnvironment: parEnvironment
    parKeyVaultName: varKeyVaultName
    parAppInsightsName: varAppInsightsName
    parConnectivitySubscriptionId: parConnectivitySubscriptionId
    parFrontDoorResourceGroupName: parFrontDoorResourceGroupName
    parDnsResourceGroupName: parDnsResourceGroupName
    parFrontDoorName: parFrontDoorName
    parPublicWebAppDnsPrefix: parPublicWebAppDnsPrefix
    parParentDnsName: parParentDnsName
    parStrategicServicesSubscriptionId: parStrategicServicesSubscriptionId
    parWebAppsResourceGroupName: parWebAppsResourceGroupName
    parAppServicePlanName: parAppServicePlanName
    parTags: parTags
  }
}
