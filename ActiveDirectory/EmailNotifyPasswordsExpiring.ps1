#Add the Quest PowerShell snapin
Add-PsSnapIn Quest.ActiveRoles.ADManagement -ErrorAction SilentlyContinue
Get-QADUser -SizeLimit 0 | Select-Object samAccountName,mail,PasswordStatus | 
Where-Object {$_.PasswordStatus -ne "Password never expires" -and $_.PasswordStatus -ne "Expired" -and $_.PasswordStatus -ne "User must change password at next logon." -and $_.mail -ne $null} | 
ForEach-Object {
  $today = Get-Date
  $logdate = Get-Date -format yyyyMMdd
  $samaccountname = $_.samAccountName
  $mail = $_.mail 
  $passwordstatus = $_.PasswordStatus
  $passwordexpiry = $passwordstatus.Replace("Expires at: ","")
  $passwordexpirydate = Get-Date $passwordexpiry
  $daystoexpiry = ($passwordexpirydate - $today).Days
  $smtpserver = "mailserver.yourdomain.com"
  $attachment = "X:\Instructions\PasswordChange.doc"
  $emailFrom = "yourhelpdesk@yourdomain.com"
  $body = "Please change your password to prevent loss of access to your *Your Company Name* systems`n`n"
  $body += "If you are unable to change your password, please contact the help desk at ext #### or ###.###.####"
  if ($daystoexpiry -lt 9 ) {
    $emailTo = "$mail"
    $subject = "Your Network password will expire in $daystoexpiry day(s) please change your password."    
    Send-MailMessage -To $emailTo -From $emailFrom -Subject $subject -Body $body -Attachments $attachment -SmtpServer $smtpserver
    Write-Host "Email was sent to $mail on $today"
    Add-Content X:\logs\maillog$logdate.txt  "Email was sent to $mail on $today"
  }
}
Send-MailMessage -To "yourhelpdesk@yourdomain.com" -From "yourhelpdesk@yourdomain.com" -Subject "Password change log for $today" -Body "This is the log from $today" -Attachments "X:\logs\maillog$logdate.txt" -SmtpServer $smtpserver
