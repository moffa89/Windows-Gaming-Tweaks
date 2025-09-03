# #1 Backsuboptimization

First download and open the .ps1 file with Powershell/Terminal [Backsuboptimization](https://github.com/MysticFoxDE/WINDOWS-OPTIMIZATIONS/blob/main/W10ANDW11-NETWORK-TCP-BACKSUBOPTIMIZATION.ps1) from MysticFoxDE.

# #2 Network Performance Tuning

Second download and open the .bat file [Network Performance Tuning](https://github.com/moffa89/Windows-Gaming-Tweaks/blob/main/Network%20Performance%20Tuning/Network%20Performance%20Tuning.bat) or do it manually in regedit:

The registry entries that may be added/changed by this “General Tuning” procedure are:

Disable TCP selective acks option for better cpu utilization

Under HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters
                            
- SackOpts, type REG_DWORD, value set to 0.


Enable fast datagram sending for UDP traffic

Under HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\AFD\Parameters
                            
- FastSendDatagramThreshold, type REG_DWORD, value set to 64000.


# #3 Realtek Ethernet Settings

Third download & open the .reg file [Realtek Ethernet Settings](https://github.com/moffa89/Windows-Gaming-Tweaks/blob/main/Network%20Performance%20Tuning/Realtek%20Ethernet%20Settings.reg) and click on yes for gaming settings.

# Now your ethernet is optimized for gaming ;-)
