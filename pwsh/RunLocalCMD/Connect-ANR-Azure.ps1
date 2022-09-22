<#

Name                                 Id                                   TenantId                             State
----                                 --                                   --------                             -----  
Microsoft Azure Enterprise           7588957b-7cde-4f07-b7c8-fe7150e07cb2 95933331-9c40-4ebf-9199-cd4c72f03a84 Enabled
UCANR-DEV                            50bcc060-37cd-474e-840b-70164d854ae4 95933331-9c40-4ebf-9199-cd4c72f03a84 Enabled
Microsoft Azure Enterprise           4956da06-8488-4c33-93d8-baa6b40e4f51 95933331-9c40-4ebf-9199-cd4c72f03a84 Enabled
UCANR-PROD                           ac421dff-99d9-4269-bf13-15963e6bc970 95933331-9c40-4ebf-9199-cd4c72f03a84 Enabled
Microsoft Azure Enterprise           f6fb1ffa-b519-43ce-9027-2a11edfa77e2 95933331-9c40-4ebf-9199-cd4c72f03a84 Enabled
ANR-Platform-SharedServices-Prod-001 785bf68a-c2db-4efc-9b39-fa9343552022 95933331-9c40-4ebf-9199-cd4c72f03a84 Enabled

#>

Get-AzContext

Connect-AzAccount -Tenant '95933331-9c40-4ebf-9199-cd4c72f03a84' -Subscription '785bf68a-c2db-4efc-9b39-fa9343552022'

## ANR-Platform-SharedServices-Prod-001
Select-AzSubscription -Tenant '95933331-9c40-4ebf-9199-cd4c72f03a84' -Subscription '785bf68a-c2db-4efc-9b39-fa9343552022'

## UCANR-PROD - Legacy
Select-AzSubscription -Tenant 'ac421dff-99d9-4269-bf13-15963e6bc970' -Subscription '785bf68a-c2db-4efc-9b39-fa9343552022'

## UCANR-Dev - Legacy
Select-AzSubscription -Tenant '50bcc060-37cd-474e-840b-70164d854ae4' -Subscription '785bf68a-c2db-4efc-9b39-fa9343552022'
