
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

#$_deployment_name = "100_Storage_Account_Container"

$_deployment_name = Split-Path -Path (Get-Location) -Leaf  #Get current folder 

$_location = "East Us" #Default test Location

$datetime = Get-Date -Format "MM_dd_yyyy-HH_mm"

$resourceGroupName =  $_deployment_name + "-" + $datetime 

$location = $_location

$target = "Test"

$product = "EventHub"

New-AzResourceGroup -Name $resourceGroupName -Location $location -Tag @{Target=$target; Product=$product}

New-AzResourceGroupDeployment -Name $_deployment_name -ResourceGroupName $resourceGroupName -TemplateFile template.json -TemplateParameterFile parameters.json #-debug

