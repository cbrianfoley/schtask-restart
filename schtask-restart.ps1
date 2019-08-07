Unregister-ScheduledTask -TaskName 'Restart'
$RestartTime = Get-Date
$RestartTime = $RestartTime.AddMinutes(10)
$RestartTime = $RestartTime.ToString("hh:mmtt")
$Action = New-ScheduledTaskAction -Execute 'shutdown.exe'-Argument '-r -t 60'
$Trigger = New-ScheduledTaskTrigger -Once -At $RestartTime
$Principal = New-ScheduledTaskPrincipal -RunLevel Highest -UserId SYSTEM
$Task = New-ScheduledTask -Action $Action -Trigger $Trigger -Settings $Settings
Register-ScheduledTask -TaskName 'Restart' -InputObject $Task -User 'SYSTEM'