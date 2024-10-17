
$UserEmail = "t-john.doe@netcom.ch"
$StorageAccountName = "tncasto1csnjwi"
$ResourceGroupName = "tnca-sto1-csn-rg-jwi"

## MAIN
Connect-AzAccount -Subscription b619294f-d8b7-4ffa-b56a-1c27346f1bf7
$User = Get-AzADUser -UserPrincipalName $UserEmail
$StorageAccount = Get-AzStorageAccount -ResourceGroupName $ResourceGroupName -Name $StorageAccountName
New-AzRoleAssignment -ObjectId $User.Id -RoleDefinitionName "Reader" -Scope $StorageAccount.Id
