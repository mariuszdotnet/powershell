# Prerequisites: DACPAC project and publishing profile

$sqlpackage = "<Location of sqlpackage.exe>"

$dbserver = "<Azure DB Location>"  
$database = "<name of DB on Server>"

# UNC Paths

$dbProfile = "<Path to your Publish Profile>"
$mydacpac = "<location of the dacpac>" 


##### EXAMPLE 1 - Publish with a publishing profile with Active Directory Integrated/Password

$sqlpackage = "C:\Program Files (x86)\Microsoft Visual Studio 14.0\Common7\IDE\Extensions\Microsoft\SQLDB\DAC\130\sqlpackage.exe"

$dbserver = "mktestdbserver.database.windows.net"  
$database = "mktestdb"

# UNC Paths

$dbProfile = "C:\Users\makolo\git\dacpactestproject\dacpactestproject\dacpactestproject.publish.xml"
$mydacpac = "C:\Users\makolo\git\dacpactestproject\dacpactestproject\bin\Debug\dacpactestproject.dacpac" 

# Publish Command

& $sqlpackage /Action:Publish /tsn:$dbServer /tdn:$database /sf:$mydacpac /pr:$dbProfile