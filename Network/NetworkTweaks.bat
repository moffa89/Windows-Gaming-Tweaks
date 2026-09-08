@echo off
@echo Network Tweaks Script by moffa89
@echo =============================================

echo Looking for Admin rights
net session >nul 2>&1 || (powershell start -verb runas '"%~0"' &exit /b)

echo Optimize TCP Registry
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v SackOpts /t reg_dword /d 0 /f

echo Optimize UDP Registry
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v FastSendDatagramThreshold /t reg_dword /d 1492 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v DynamicBacklogGrowthDelta /t reg_dword /d 10 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v EnableDynamicBacklog /t reg_dword /d 1 /f

echo Additional TCP Optimizer Settings
netsh int tcp set global autotuninglevel=disabled
netsh int tcp set global ecncapability=disabled
netsh int tcp set global rss=enabled
netsh int tcp set global rsc=disabled
netsh int ip set global taskoffload=disabled
netsh int tcp set global nonsackrttresiliency=disabled
netsh int tcp set global timestamps=disabled
