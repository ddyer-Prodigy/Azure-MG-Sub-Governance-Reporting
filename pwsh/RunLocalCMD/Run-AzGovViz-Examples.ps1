## This will not run as a single command in this form due to line continuation limitations. This file is meant to provide an example of possible parameters.
& "..\AzGovVizParallel.ps1" -ManagementGroupId '95933331-9c40-4ebf-9199-cd4c72f03a84' -OutputPath 'C:\_Code\_Working\UCANR-AzGovViz' `
    # -DoNotShowRoleAssignmentsUserData ` # Scrub personally identifiable information (PII)
    # -LimitCriticalPercentage  80 ` # Limit warning level, default is 80%
    # -HierarchyMapOnly ` # Output only the HierarchyMap for Management Groups including linked Subscriptions
    # -SubscriptionQuotaIdWhitelist "" ` # Process only Subscriptions with defined QuotaId(s). Example: .\AzGovVizParallel.ps1 -SubscriptionQuotaIdWhitelist MSDN_,Enterprise_
    # -NoResourceProvidersDetailed ` # Disables output for ResourceProvider states for all Subscriptions in the TenantSummary section, in large Tenants this can become time consuming
    # -NoMDfCSecureScore ` # Disables Microsoft Defender for Cloud Secure Score request for Subscriptions and Management Groups.
    # -NoPolicyComplianceStates ` # Will not query policy compliance states. You may want to use this parameter to accellerate script execution or when receiving error 'ResponseTooLarge'.
    # -NoResourceDiagnosticsPolicyLifecycle ` # Disables Resource Diagnostics Policy Lifecycle recommendations
    # -NoAADGroupsResolveMembers ` # Disables resolving Azure Active Directory Group memberships
    # -AADServicePrincipalExpiryWarningDays 14 ` # Define warning period for Service Principal secret and certificate expiry; default is 14 days
    -DoAzureConsumption ` # Azure Consumption data should be collected/reported
    # -AzureConsumptionPeriod 1 ` # Define for which time period Azure Consumption data should be gathered; default is 1 day
    # -NoAzureConsumptionReportExportToCSV ` # Azure Consumption data should not be exported (CSV)
    # -NoScopeInsights ` # Q: Why would you want to do this? A: In larger tenants the ScopeInsights section blows up the html file (up to unusable due to html file size). Use -LargeTenant to further reduce the output.
    # -ThrottleLimit 10 ` # leveraging PowerShell´s parallel capability you can define the ThrottleLimit (default=5)
    # -DoTranscript ` # Log the console output
    -SubscriptionId4AzContext '785bf68a-c2db-4efc-9b39-fa9343552022' ` # Define the Subscription Id to use for AzContext (default is to use a random Subscription Id)
    # -PolicyAtScopeOnly $false ` # Removing 'inherited' lines in the HTML file for 'Policy Assignments'; use this parameter if you run against a larger tenants. Note using parameter -LargeTenant will set -PolicyAtScopeOnly $true
    # -RBACAtScopeOnly $false ` # Removing 'inherited' lines in the HTML file for 'Role Assignments'; use this parameter if you run against a larger tenants. Note using parameter -LargeTenant will set -RBACAtScopeOnly $true
    # -NoCsvExport $false ` # Do not export enriched data for 'Role assignments', 'Policy assignments' data and 'all Resources' (subscriptionId, managementGroup path, resourceType, id, name, location, tags, createdTime, changedTime)
    # -DoNotIncludeResourceGroupsOnPolicy ` # Do not include Policy assignments on ResourceGroups
    # -DoNotIncludeResourceGroupsAndResourcesOnRBAC ` # Do not include Role assignments on ResourceGroups and Resources
    # -ChangeTrackingDays 14 ` # Define the period for Change tracking on newly created and updated custom Policy, PolicySet and RBAC Role definitions and Policy/RBAC Role assignments (default is '14')
    # -FileTimeStampFormat yyyyMMdd_HHmmss ` # Define the time format for the output files (default is yyyyMMdd_HHmmss)
    # -NoJsonExport ` # Do not enable export of ManagementGroup Hierarchy including all MG/Sub Policy/RBAC definitions, Policy/RBAC assignments and some more relevant information to JSON
    # -JsonExportExcludeResourceGroups ` # JSON Export will not include ResourceGroups (Policy & Role assignments)
    # -JsonExportExcludeResources ` # JSON Export will not include Resources (Role assignments)
    # -LargeTenant ` # A large tenant is a tenant with more than ~500 Subscriptions - the HTML output for large tenants simply becomes too big. Using this parameter the following parameters will be set: -PolicyAtScopeOnly $true, -RBACAtScopeOnly $true, -NoResourceProvidersDetailed $true, -NoScopeInsights $true
    # -HtmlTableRowsLimit 20000 ` # Although the parameter -LargeTenant was introduced recently, still the html output may become too large to be processed properly. The new parameter defines the limit of rows - if for the html processing part the limit is reached then the html table will not be created (csv and json output will still be created). Default rows limit is 20000
    # -AADGroupMembersLimit 500 ` # Defines the limit (default=500) of AAD Group members; For AAD Groups that have more members than the defined limit Group members will not be resolved
    # -NoResources ` # Will speed up the processing time but information like Resource diagnostics capability, resource type stats, UserAssigned Identities assigned to Resources is excluded (featured for large tenants)
    # -StatsOptOut $false # Opt out sending stats
    # -NoSingleSubscriptionOutput ` # Single Scope Insights output per Subscription should not be created
    # -ManagementGroupsOnly ` # Collect data only for Management Groups (Subscription data such as e.g. Policy assignments etc. will not be collected)
    # -ShowMemoryUsage ` # Shows memory usage at memory intense sections of the scripts, this shall help you determine if the the worker is well sized for AzGovViz
    # -CriticalMemoryUsage 90 ` # Define at what percentage of memory usage the garbage collection should kick in (default=90)
    # -ExcludedResourceTypesDiagnosticsCapable ` # Input Array - Resource Types to be excluded from processing analysis for diagnostic settings capability (default: microsoft.web/certificates)
    -DoPSRule ` # Execute PSRule for Azure. Aggregated results are integrated in the HTML output, detailed results (per resource) are exported to CSV
    # -PSRuleVersion latest ` # Define the PSRule..Rules.Azure PowerShell module version, if undefined then 'latest' will be used
    # -PSRuleFailedOnly ` # PSRule for Azure will only report on failed resource (may save some space/noise). (e.g. .\pwsh\AzGovVizParallel.ps1 -DoPSRule -PSRuleFailedOnly)
    -NoPIMEligibility #` # Do not report on PIM eligible Role assignments
    # -PIMEligibilityIgnoreScope ` # By default will only report for PIM Elibility for the scope (ManagementGroupId) that was provided. If you use the new switch parameter then PIM Eligibility for all onboarded scopes (Management Groups and Subscriptions) will be reported
    # -NoPIMEligibilityIntegrationRoleAssignmentsAll ` # Prevent integration of PIM eligible assignments with RoleAssignmentsAll (HTML, CSV)
    # -NoDefinitionInsightsDedicatedHTML ` # DefinitionInsights will be written to a separate HTML file *_DefinitionInsights.html. If you want to keep DefinitionInsights in the main html file then use this parameter
    # -NoALZEvergreen ` # Do not execute the ALZ EverGreen feature
