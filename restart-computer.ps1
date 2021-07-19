# Sets the location to execution location.
set-location $PSScriptRoot

# Lets set some static variables.
$logdir = "$PSScriptRoot\log\"
$logfile = "$PSScriptRoot\log\log.log"
$dateofexecution = get-date

# Lets test the log directory
$log = test-path $logdir
while("True" -notcontains "$log")
{
    write-host
    write-host "The log directory doesn't exist"
    write-host "Attempting to create log directory in $psscriptroot"
    write-host
    new-item $logdir -itemtype directory > $null
    $log = test-path $logdir
    write-host "Creation of log directory successful. Moving on"
    write-host
}

# Lets test the log file location
$log = test-path $logfile
while("True" -notcontains "$log")
{
    write-host
    write-host "The log file doesn't exist"
    write-host "Attempting to create log directory in $psscriptroot"
    write-host
    new-item $logfile -itemtype file > $null
    $log = test-path $logfile 
    write-host "Creation of log file successful. Moving on"
    write-host
}

write-host "Starting to count down" 
add-content -path "$logfile" "Last restart was $dateofexecution."
start-sleep 30
#write-host "PC Restarts... :)"
restart-computer -force
