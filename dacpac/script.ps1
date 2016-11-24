# Prerequisites: DACPAC project and publishing profile

$sqlpackage = "C:\Program Files (x86)\Microsoft Visual Studio 12.0\Common7\IDE\Extensions\Microsoft\SQLDB\DAC\120\sqlpackage.exe"

$dbserver = "<Azure DB Location>"  
$database = "<name of DB on Server>"

# UNC Paths

$dbProfile = "<Path to your Publish Profile>"
$mydacpac = "<location of the dacpac>" 

# Publish Command

& $sqlpackage /Action:Publish /tsn:$dbServer /tdn:$database /sf:$mydacpac /pr:$dbProfile /variables:myVariable=1


##### EXAMPLE

$sqlpackage = "C:\Program Files (x86)\Microsoft Visual Studio 14.0\Common7\IDE\Extensions\Microsoft\SQLDB\DAC\130\sqlpackage.exe"

$dbserver = "eteller.database.windows.net"  
$database = "testdb"

# UNC Paths
$dbProfile = "C:\MariuszStuff\sampleDbPRoject\sampleDbPRoject\sampleDbPRoject.azure.publish.xml"
$mydacpac = "C:\MariuszStuff\sampleDbPRoject\sampleDbPRoject\bin\Debug\sampleDbPRoject.dacpac" 

# Publish Command
& $sqlpackage /Action:Publish /tsn:$dbServer /tdn:$database /sf:$mydacpac /pr:$dbProfile