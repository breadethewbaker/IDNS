# IDNS
Indoor Drone Navigation System

Instruction to start ardrone autonomy
#Installation steps
1. Go to website: https://github.com/eborghi10/AR.Drone-ROS 

	1. This website is tum simulator on kinetic
	2. Installing steps:
		mkdir -p ~/ardrone_simulator/src
		cd  ~/ardrone_simulator/src
		catkin_init_workspace
		git clone https://github.com/iolyp/ardrone_simulator_gazebo7
		cd ..
		catkin_make
	3. Start steps
		source devel/setup.bash
		roslaunch cvg_sim_gazebo ardrone_testworld.launch


2. Go to website: https://github.com/AutonomyLab/ardrone_autonomy-release

	1. Find the corresponding version of ROS
		1. eg. Kinetic: website: https://github.com/AutonomyLab/ardrone_autonomy
		2. Donwload this file and store into the src file of the workspace
		3. Using catkin_make compile this file

4. Go to website https://github.com/justagist/pid_control_ardrone

	1. Download master file and store it into the workspace's src file
	2. Compile it

#to run simulator:
1. start roscore
cd
cd IDNS/catkin_ws
export ROS_HOSTNAME=localhost
ROS_MASTER_URI=http://localhost:11311
roscore

2. start world
cd
cd IDNS/catkin_ws
export ROS_HOSTNAME=localhost
ROS_MASTER_URI=http://localhost:11311
source devel/setup.bash
roslaunch cvg_sim_gazebo ardrone_warehouse2.launch

##No need, just for test
##3. run one command
cd
cd IDNS/catkin_ws
export ROS_HOSTNAME=localhost
ROS_MASTER_URI=http://localhost:11311
source devel/setup.bash
rostopic pub /ardrone/takeoff std_msgs/Empty


4. Start controller
cd
cd IDNS/catkin_ws
export ROS_HOSTNAME=localhost
ROS_MASTER_URI=http://localhost:11311
source devel/setup.bash
cd ~/IDNS/catkin_ws/src/controller/instructor/scripts
./instructor.py 

5. Start keyboard
cd
cd IDNS/catkin_ws
export ROS_HOSTNAME=localhost
ROS_MASTER_URI=http://localhost:11311
source devel/setup.bash
cd ~/IDNS/catkin_ws/src/controller/executor/scripts/
    ./executor.py
    OR
    ./executorVer2.py

#NOTES:
debugging(using visual studio code) is setup with executer.py executerVer2.py and instructor.py.

creating a new .world file:
    go to src/ardrone_simulator_gazebo7/cvg_sim_gazebo/
        cd
        cd catkin_ws/src/ardrone_simulator_gazebo7/cvg_sim_gazebo/
    in the world directory:
        make a copy of ardrone_testworld.world
            ex: myworld.world
    in the launch directory:
        make a copy of ardrone_testworld.launch
            ex: myworld.launch
        inside it modify node -> value to the path of your .world file
            ex: value="$(find cvg_sim_gazebo)/worlds/myworld.world"
    to launch use the following:
        roslaunch cvg_sim_gazebo myworld.launch
        
Astar should be implented in:
    src/controller/executor/scripts/executerVer2.py around line 125

# Control the real drone

# steps here:
	#-2	Using ifconfig check the ip address
	#-1     connect to drone wifi
	#0	roscore
	#0.1	
		cd
		cd ardrone_simulator
		source devel/setup.bash
		roslaunch ardrone_autonomy ardrone.launch

	#1.  ################not need
		cd
		cd ardrone_simulator
		source devel/setup.bash
		cd src/pid_control_ardrone-master/mocap_odometry/scripts
		./mocap_odometry.py
	#2.
		cd
		cd ardrone_simulator
		source devel/setup.bash
		cd src/pid_control_ardrone-master/pid_ardrone/src
		./controller.py
	#3.  
		cd
		cd ardrone_simulator
		source devel/setup.bash
		cd src/pid_control_ardrone-master/ardrone_joy/scripts
		./ardrone_joy_keyboard.py

	#python ardrone_joy_keyboard.py




# stop here for control the real drone

	#4. Track the trajectory of the drone
		cd
		cd ardrone_simulator
		source devel/setup.bash
		cd src/pid_control_ardrone-master/ardrone_joy/scripts
		./plot.py

#Way to check the node-topic graph
	1. rosrun rqt_graph rqt_graph

#Open camera: http://wiki.ros.org/tum_simulator
#1	# The output camera
	rosrun image_view image_view image:=/ardrone/image_raw

	# The front camera
	rosrun image_view image_view image:=/ardrone/front/image_raw

	# The buttom camera
	rosrun image_view image_view image:=/ardrone/bottom/image_raw

	# The height sensor
	rostopic echo /sonar_height

	#The navigation info
	rostopic echo /ardrone/navdata

	#A launch file for joystick drivers and image view nodes
	roslaunch cvg_sim_test demo_tool.launch