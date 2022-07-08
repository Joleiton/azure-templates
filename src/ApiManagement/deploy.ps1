
######################################################################################################
#  Created by joleiton
#  5/10/2021
#  v1.0
######################################################################################################

#1  Create a Resource Group for Resource Manager 

#Step1 - Login to Azure 

#Connect-AzAccount


#Step2 - Select target subscription Id 

#$subscriptionId = $_subscriptionId

#Get-AzSubscription -Subscriptionid $subscriptionId | Select-AzSubscription

#Step3 - Create Resource Group in target subscription id

$_deployment_name = "105_Batch_Public_Pool_VNET"
$_rgname = "105_Batch_Public_Pool_VNET_v1"
$_location = "East Us"


$resourceGroupName =  $_rgname

$location = $_location

New-AzResourceGroup -Name $resourceGroupName -Location $location

New-AzResourceGroupDeployment -Name 105_Batch_Public_Pool_VNET -ResourceGroupName $_rgname -TemplateFile template.json -TemplateParameterFile parameters.json