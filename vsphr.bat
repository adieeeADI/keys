VMWARE AND VSPHERE
CREATE A NEW VM IN WORKSTATION PRO
TYPICAL> BROWSE ISO SELECT ESXI CUSTOM ISO>PROVIDE STORAGE SELECT SPLIT VIRTUAL DISK IN MULTIPLE FILES>
CLICK NEXT ENTER WHEN PASSWORD TYPR Root@123
>INSTALL USING F11 NOTE DOWN THE IP KEEP IT RUNNING
OPEN THE VMWARE VSPHERE CLIENT
TYPE OUT THE NOTED IP ADDRESS ALONG USERNMAE NAME AND PASSWORD 
username : Root@123
passwd: Root@123
>Click Ignore
Go into inventory then go into configuration and then> storage
click on datastore and browse datastore
from the above logo option see the upload files to the database options
click on upload file and upload a file of winserver
come back to home page now and then on the left side ip is listed right click on it click on New Virtual Machine Option
>Typical
>Give Name
>Now in Guest operating system tab choose version win server 2012 64 bit
>now in create a disk part click on thin provision
>click on the checkbox edit the virtual machine and then continue optin will be listed
>go into the option NEW CD/DVD > click on datastore ISO file browse and select the win server iso> click on connect at power on >finish
server gets added we can  see the listing
>clcick on edit the virtual machine settings 
>Set this to 2gb 
>now power on this machine and then go into the console
done
