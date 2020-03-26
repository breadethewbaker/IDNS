BOX LOCATED AT: https://drive.google.com/open?id=1CUiOZRtN429uElBi1zvLYoPtVas0TN0l
Box name : SphinxSandBoxSphinxOnly
OS : ubuntu 18.04 virtual machine
Sudo password : SphinxPassword
Sphinx is a simulator provided by Parrot to work with their drones(docs here : https://developer.parrot.com/docs/sphinx/index.html). Sphinx was successfully installed on this virtual machine. Danyang’s model was imported and runs properly.
To run:
1.import the virtual machine.
2. navigate to the SphinxSandbox
	cd sphinxSandbox
3. startup firmware service(required to run the program):
	sudo systemctl start firmwared.service
	check its on using: fdc ping
3. start sphinx:
	To test drone: sphinx drone/drone.drone
	![Alt text](READMEimages/drone.png?raw=true)
	To test drone in model: sphinx drone/drone.drone world/ardrone_testworld.world
  ![Alt text](READMEimages/droneWithModel.png?raw=true)

Known issues:
Stolen Interface Error:
[Err] [Machine.cc:959] Failed to start anafi4k : net.hook/assign failed.
[Err] [Machine.cc:966] Probable cause for this error: the requested stolen interface (enp0s3:eth0:192.168.42.1/24) does not exist
the .drone file needs the name of the wifi interface, the box tends to change it from enp0s3 to eth0, to make it work, check if the interface is enp0s3 or eth0(use command iwconfig). Then go to the drone.drone file and find this line : <stolen_interface>enp0s3:eth0:192.168.42.1/24</stolen_interface>. Replace with <stolen_interface><<INTERFACE_NAME>>:eth0:192.168.42.1/24</stolen_interface>.
