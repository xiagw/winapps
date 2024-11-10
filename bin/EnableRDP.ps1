# 需要管理员权限运行此脚本
#Requires -RunAsAdministrator

# 设置终端服务器应用程序允许列表
$tsAppAllowListPath = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Terminal Server\TSAppAllowList"
if (!(Test-Path $tsAppAllowListPath)) {
    New-Item -Path $tsAppAllowListPath -Force | Out-Null
}
Set-ItemProperty -Path $tsAppAllowListPath -Name "fDisabledAllowList" -Value 1 -Type DWord

# 设置终端服务策略
$tsPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services"
if (!(Test-Path $tsPath)) {
    New-Item -Path $tsPath -Force | Out-Null
}
Set-ItemProperty -Path $tsPath -Name "fAllowUnlistedRemotePrograms" -Value 1 -Type DWord

Write-Host "RDP application access has been configured successfully."