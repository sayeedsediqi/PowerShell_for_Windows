$computers=import-csv C:\Temp11\servers.csv
foreach($computer in $computers){
$info=get-adcomputer $computer.Servername -Properties * |select Name,application, businesscatagory, department, description, environment, OperatingSystem, Managedby 
$name = $info.name
$application = $info.application
$environment = $info.environment
$dept = $info.department
$ContactEmail = $info.Managedby
$bcat = $info.businesscatagory
$ostype= $info.OperatingSystem
$newline="$name,$application,$bcat,$dept,$environment,$ostype,$ContactEmail"
$newline | add-content "c:\temp11\testblabla18.csv"

}
