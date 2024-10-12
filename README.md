### Disable Wi-Fi and Create Scheduled Task Script
### Created by ANONYMOUSx46

This batch script performs the following actions to disable Wi-Fi access and ensure it remains disabled on startup:

1) **Release IP Address**: The script starts by releasing the current IP address assigned to the computer. This action disconnects the computer from the network.
   ```batch
   ipconfig /release

Disable Wi-Fi Interface: The script disables the specified Wi-Fi interface, preventing network access via Wi-Fi.

Create Scheduled Task: A scheduled task is created to ensure the Wi-Fi interface remains disabled on startup. This task runs the same script to disable Wi-Fi.

Disable Firewall Temporarily: The script temporarily disables the firewall to ensure that the network changes are applied without interference.

Re-enable Firewall: After a short delay, the firewall is re-enabled to restore network security.

Pause for User Review: The script pauses at the end, allowing the user to review the output and any error messages.

This script is useful for securing environments by disabling Wi-Fi access during specific periods, such as exams or restricted sessions.

 Remember in the scheduled script to change the drive letterr to whatever drive you have the files saved to, as well as changing the folder name that you have the scripts saved in, to whatever you'd like.
      
      "E:\WifiScripts\disable_wifi.bat"

 Remember that the interface name is the same interrface name of your Wi-Fi
   Check with this command.
   
      
         netsh interface show interface

 Replace it here:

       
       netsh interface set interface "Wi-Fi" admin=disabled 2>>

 After running the enable script just reconnect to your wifi network and your good to go.




