# Network Performance Tuning

First use this [Desuboptimation](https://github.com/MysticFoxDE/WINDOWS-OPTIMIZATIONS/blob/main/W10ANDW11-NETWORK-TCP-DESUBOPTIMIZATION.ps1) and then as follows or use the batch file linked at the bottom.

The registry entries that may be added/changed by this “General Tuning” procedure are:

Disable TCP selective acks option for better cpu utilization

Under HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters
                            
- SackOpts, type REG_DWORD, value set to 0.


Enable fast datagram sending for UDP traffic

Under HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\AFD\Parameters
                            
- FastSendDatagramThreshold, type REG_DWORD, value set to 64000.


# Batchfile for install

- I made a .bat file for this [Network Performance Tuning](https://github.com/moffa89/Windows-Gaming-Tweaks/blob/main/Network%20Performance%20Tuning/Network%20Performance%20Tuning.bat)
