@echo off
@echo Network Performance Tuning Script by moffa89
@echo =============================================

echo Looking for Admin rights
net session >nul 2>&1 || (powershell start -verb runas '"%~0"' &exit /b)

echo Reset ethernet settings
netsh winsock reset
netsh int ip reset
netsh advfirewall reset
ipconfig /flushdns
ipconfig /release
ipconfig /renew 

echo Disable TCP selective acks option for better cpu utilization
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v SackOpts /t reg_dword /d 0 /f
echo Enable fast datagram sending for UDP traffic
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v FastSendDatagramThreshold /t reg_dword /d 64000 /f

echo Add optimized Realtek Ethernet Settings to registry
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000" /v *EEE /t reg_sz /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000" /v *FlowControl /t reg_sz /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000" /v *InterruptModeration /t reg_sz /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000" /v *IPChecksumOffloadIPv4 /t reg_sz /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000" /v *JumboPacket /t reg_sz /d 1514 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000" /v *LsoV2IPv4 /t reg_sz /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000" /v *LsoV2IPv6 /t reg_sz /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000" /v *PMARPOffload /t reg_sz /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000" /v *PMNSOffload /t reg_sz /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000" /v *PriorityVLANTag /t reg_sz /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000" /v *ReceiveBuffers /t reg_sz /d 512 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000" /v *RscIPv4 /t reg_sz /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000" /v *RscIPv6 /t reg_sz /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000" /v *SpeedDuplex /t reg_sz /d 6 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000" /v *TCPChecksumOffloadIPv4 /t reg_sz /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000" /v *TCPChecksumOffloadIPv6 /t reg_sz /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000" /v *TransmitBuffers /t reg_sz /d 128 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000" /v *UDPChecksumOffloadIPv4 /t reg_sz /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000" /v *UDPChecksumOffloadIPv6 /t reg_sz /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000" /v *WakeOnMagicPacket /t reg_sz /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000" /v *WakeOnPattern /t reg_sz /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000" /v AdvancedEEE /t reg_sz /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000" /v EnableGreenEthernet /t reg_sz /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000" /v GigaLite /t reg_sz /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000" /v PowerSavingMode /t reg_sz /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000" /v RegVlanid /t reg_sz /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000" /v S5WakeOnLan /t reg_sz /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0000" /v WolShutdownLinkSpeed /t reg_sz /d 2 /f

echo Optimize MTU
set /a MTU=1500

:testmtu
ping 8.8.8.8 /f /n 1 /w 500 /l %MTU% >> nul

if %MTU% LSS 68 (
  set /a MTU=1500
  goto:done
)

if %ERRORLEVEL% EQU 1 (
  set /a MTU=%MTU%-2
  goto:testmtu
)

if %ERRORLEVEL% EQU 0 (
  set /a MTU=%MTU%+28
  goto:done
)

:done
cls
echo new MTU %MTU%

for /f "skip=3 tokens=4*" %%a in ('netsh interface IPv4 show interfaces ^| findstr /v "Loop"') do (
  netsh interface ipv4 set subinterface "%%b" mtu=%MTU% store=persistent
)

if "%1"=="pause" pause
exit /b %MTU%