#Finding Active Directory FSMO Role Holders with PowerShell

Get-ADDomain | Select-Object InfrastructureMaster, RIDMaster, PDCEmulator

Get-ADForest | Select-Object DomainNamingMaster, SchemaMaster

Get-ADDomainController -Filter * |

     Select-Object Name, Domain, Forest, OperationMasterRoles |

     Where-Object {$_.OperationMasterRoles} |

     Format-Table -AutoSize