
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

$_location = "East Us"

$datetime = Get-Date -Format "MM_dd_yyyy-HH_mm"

$resourceGroupName =  $_deployment_name + "-" + $datetime 

$location = $_location

New-AzResourceGroup -Name $resourceGroupName -Location $location

New-AzResourceGroupDeployment -Name $_deployment_name -ResourceGroupName $resourceGroupName -TemplateFile template.json -TemplateParameterFile parameters.json