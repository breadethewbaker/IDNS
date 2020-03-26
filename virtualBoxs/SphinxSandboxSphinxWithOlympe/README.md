BOX LOCATED AT: https://drive.google.com/open?id=1jdckBbTN2ewe5gtRiVPsRXZLyzVF4Et2
Box name : SphinxSandBoxSphinxWithOlympe
OS : ubuntu 18.04 virtual machine
Sudo password : SphinxPassword
Sphinx is a simulator provided by Parrot to work with their drones(docs here : https://developer.parrot.com/docs/sphinx/index.html). Sphinx was successfully installed on this virtual machine. Danyang’s model was imported and runs properly. Additionally, Olympe, a python controller programming interface for the parrot drone(docs here: https://developer.parrot.com/docs/olympe/index.html) is trying to be installed(postponed indefinitely due to preference for ROS). Olympe failed to install on this virtual machine. The issue occurs when running  the command ./products/olympe/linux/env/postinst from https://developer.parrot.com/docs/olympe/installation.html#clone-the-parrot-groundsdk-repo-workspace. It results in this error:
  ![Alt text](READMEimages/error.png?raw=true)
