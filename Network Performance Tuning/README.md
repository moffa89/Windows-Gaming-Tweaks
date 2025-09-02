# #1 Desuboptimization

First use this [Desuboptimation](https://github.com/MysticFoxDE/WINDOWS-OPTIMIZATIONS/blob/main/W10ANDW11-NETWORK-TCP-DESUBOPTIMIZATION.ps1) and then as follows.

# #2 Network Performance Tuning

Second I made a .bat file for this [Network Performance Tuning](https://github.com/moffa89/Windows-Gaming-Tweaks/blob/main/Network%20Performance%20Tuning/Network%20Performance%20Tuning.bat)

The registry entries that may be added/changed by this “General Tuning” procedure are:

Disable TCP selective acks option for better cpu utilization

Under HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters
                            
- SackOpts, type REG_DWORD, value set to 0.


Enable fast datagram sending for UDP traffic

Under HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\AFD\Parameters
                            
- FastSendDatagramThreshold, type REG_DWORD, value set to 64000.


# #3 Realtek Ethernet Settings

Third open the .reg file [Realtek Ethernet Settings](https://github.com/moffa89/Windows-Gaming-Tweaks/blob/main/Network%20Performance%20Tuning/Realtek%20Ethernet%20Settings.reg) and click on yes to deactivate GigabitLite, Green Ethernet and Wake-on-Lan settings.

# Now your ethernet is optimized for gaming ;-)
