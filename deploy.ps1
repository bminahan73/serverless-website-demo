Param ( $StackName = 'hello-serverless-demo' )
$Stack = Get-CFNStack -StackName $StackName
If ($Stack) {
  Write-Host ("updating stack $StackName...")
  $Stack = Update-CFNStack -StackName $StackName -Capability CAPABILITY_NAMED_IAM -TemplateBody (Get-Content -Raw 'serverless-website.yml')
}
Else {
  Write-Host ("creating stack $StackName...")
  $Stack = New-CFNStack -StackName $StackName -Capability CAPABILITY_NAMED_IAM -TemplateBody (Get-Content -Raw 'serverless-website.yml')
}
While (($Stack.StackStatus -Ne 'CREATE_COMPLETE') -And ($Stack.StackStatus -Ne 'UPDATE_COMPLETE')) {
  Write-Host ("stack $StackName is in status $($Stack.StackStatus)....")
  Start-Sleep 10
  $Stack = Get-CFNStack -StackName $StackName
}
Write-Host ("stack is in status $($Stack.StackStatus).")
Write-S3Object -BucketName $Stack.Outputs["WebContentBucket"] -Prefix / -Folder www -Recurse
Write-Host ("visit https://$($Stack.Outputs["DistributionDomainName"]) to view the site!")
