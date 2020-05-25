# PS-SearchVMSettingsforApp or Searching for Applications and Services by targeting guestinfo.appinfo information

#### What the script does

This script searches the values contained within the VM advanced setting guestinfo.appinfo for requested applications and services 

1. The Application or service variable is set as part of the script
2. The Cluster to target is set as part of the script
3. Simple logic checks if the Application or Service exists in the advanced setting of the Virtual Centre Virtual Machine object.
4. If the Application or Service referenced does not exist this is written out by the script
5. If the Application or Service referenced does exist this is written out alongside version information

#### Requirements

1. This script requires VMware PowerCLI
2. An existing connection to Virtual Centre
3. VMware Tools 11 or higher
3. guestinfo.appinfo information is only collected when configured further information about VMware Tools 11 can be found [here](https://docs.vmware.com/en/VMware-Tools/11.0.0/com.vmware.vsphere.vmwaretools.doc/GUID-3A8089F6-CAF6-43B9-BD9D-B1081F8D64E2.html)

#### Ouput Example

##### Windows Guest

![PowerShell Output Example](https://raw.githubusercontent.com/sconyard/PS-SearchVMSettingsforApp/master/images/GuestTypeWindows.png)

##### Linux Guest

![vROps Output Example](https://raw.githubusercontent.com/sconyard/PS-SearchVMSettingsforApp/master/images/GuestTypeLinux.png)

#### Support

No support offered or liability accepted use this script at your own risk.

This script was built and tested using;

1. VMware Tools 11
2. Vmware.VimAutomation.Core version 12.0.0.15939655.
3. VMware ESXi 7.0.0 15843807
4. VMware vCenter 7.0.0 15952599
