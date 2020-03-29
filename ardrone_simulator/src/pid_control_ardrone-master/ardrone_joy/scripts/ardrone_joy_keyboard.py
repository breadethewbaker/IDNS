#!/usr/bin/env python

import rospy
import roslib; #roslib.load_manifest('ardrone_python')
from std_msgs.msg import Empty, Bool
from geometry_msgs.msg import Twist, Vector3
from Drone import Drone
from ardrone_joy.msg import AutoPilotCmd
import math
import pygame
from nav_msgs.msg import Odometry
from sensor_msgs.msg import Image
import matplotlib.pyplot as plt
import matplotlib.animation as animation
from matplotlib import style
import cv2
from cv_bridge import CvBridge, CvBridgeError
import sys
from pyzbar.pyzbar import decode
# Controls:
# Return - Take-off/stop autopilot
# Space - Land/stop autopilot
# W - move front
# S - move back
# A - move left
# D - move right
# LEFT - Turn left
# RIGHT - Turn right
# C - capture current position and store in memory
# V - go to capture point(s)
# X - clear all captured points
# L - print list of captured points
# M - Stop navigation and clear all captured points
# Keypad PLUS - increase keyboard control speed
# Keypad MINUS - decrease keyboard control speed
# Keypad 1 - plot a circular path
# Keypad 2 - plot a figure-8 path
# TAB - change navigation method

def main(drone):

    global navigate
    global record
    global point_array
    global orient_array
    global no_of_points
    global speed
    global mode
    pygame.init()

    W, H = 320, 240
    screen = pygame.display.set_mode((W, H))
    clock = pygame.time.Clock()
    running = True
    rate = rospy.Rate(100)
    record = False
    point_array = ()
    orient_array = ()
    no_of_points = 0
    print 'Return - Take-off/stop autopilot\nSpace - Land/stop autopilot\nW - move front\nS - move back\nA - move left\nD - move right\nLEFT - Turn left\nRIGHT - Turn right\nC - capture current position and store in memory\nV - go to capture point(s)\nX - clear all captured points\nL - print list of captured points\nM - Stop navigation and clear all captured points\nKeypad PLUS - increase keyboard control speed\nKeypad MINUS - decrease keyboard control speed\nKeypad 1 - plot a circular path\nKeypad 2 - plot a figure-8 path\nTAB - change navigation method'
    print '>>Manual Controller Started\n\tManual Control Speed:',speed,'\n\tAutopilot Mode:',mode
    while running:
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                drone.land()
                running = False 
            elif event.type == pygame.KEYUP:
                drone.hover()
            elif event.type == pygame.KEYDOWN:# if there is a key pressed down, not that the down key is pressed
                if event.key == pygame.K_RETURN:
                    print 'takeoff()'
                    drone.takeOff()
                    rospy.Subscriber("odom",Odometry,odom_loc)
                    rospy.Subscriber("/ground_truth/state",Odometry,state_loc)
                    if navigate == True:
                        stopper = AutoPilotCmd(True,setpoint,setorient,1,mode)
                        stoppilotpub.publish(stopper)
                        navigate = False
                        print 'manually stopped autopilot'
                elif event.key == pygame.K_SPACE:
                    drone.land()
		    rospy.Subscriber("odom",Odometry,odom_loc)
                    rospy.Subscriber("/ground_truth/state",Odometry,state_loc)
                    print 'landing'
                    if navigate == True:
                        stopper = AutoPilotCmd(True,setpoint,setorient,1,mode)
                        stoppilotpub.publish(stopper)
                        print 'manually stopped autopilot'
                        navigate = False
                elif event.key == pygame.K_w:
                    drone.moveLinear(0.1*speed,0,0)
		    rospy.Subscriber("odom",Odometry,odom_loc)
                    rospy.Subscriber("/ground_truth/state",Odometry,state_loc)
                elif event.key == pygame.K_s:
                    drone.moveLinear(-0.1*speed,0,0)
		    rospy.Subscriber("odom",Odometry,odom_loc)
                    rospy.Subscriber("/ground_truth/state",Odometry,state_loc)
                elif event.key == pygame.K_a:
                    drone.moveLinear(0,0.1*speed,0)
		    rospy.Subscriber("odom",Odometry,odom_loc)
                    rospy.Subscriber("/ground_truth/state",Odometry,state_loc)
                elif event.key == pygame.K_d:
                    drone.moveLinear(0,-0.1*speed,0)
		    rospy.Subscriber("odom",Odometry,odom_loc)
                    rospy.Subscriber("/ground_truth/state",Odometry,state_loc)
                elif event.key == pygame.K_UP:
                    drone.moveLinear(0,0,0.1*speed)
		    rospy.Subscriber("odom",Odometry,odom_loc)
                    rospy.Subscriber("/ground_truth/state",Odometry,state_loc)
                elif event.key == pygame.K_DOWN:
                    drone.moveLinear(0,0,-0.1*speed)
		    rospy.Subscriber("odom",Odometry,odom_loc)
                    rospy.Subscriber("/ground_truth/state",Odometry,state_loc)
                elif event.key == pygame.K_RIGHT:
                    drone.moveAngular(0,0,-0.2*speed)
		    rospy.Subscriber("odom",Odometry,odom_loc)
                    rospy.Subscriber("/ground_truth/state",Odometry,state_loc)
                elif event.key == pygame.K_LEFT:
                    drone.moveAngular(0,0,speed*0.2)
		    rospy.Subscriber("odom",Odometry,odom_loc)
                    rospy.Subscriber("/ground_truth/state",Odometry,state_loc)
                elif event.key == pygame.K_q:
                    if drone.hasTakenOff:
                        if navigate == False:
                            navigate = True
                            autopilot_start_p = AutoPilotCmd(False,(0.0,0.75,1.5),(0.0,0.0,-20*math.pi/180),1,mode)
                            startpilotpub.publish(autopilot_start_p)
                            print 'starting autopilot to coordinates',(0.0,0.75,1.5)
                        else:
                            print 'Cancel current navigation first'
                    else:
                        print 'Spinny has not taken off yet'
                elif event.key == pygame.K_p:
                    if drone.hasTakenOff:
                        if navigate == False:
                            navigate = True
                            autopilot_start_p = AutoPilotCmd(False,setpoint,setorient,1,mode)
                            startpilotpub.publish(autopilot_start_p)
                            print 'starting autopilot to coordinates',setpoint
                        else:
                            print 'Cancel current navigation first'
                    else:
                        print 'Spinny has not taken off yet'
                elif event.key == pygame.K_c:
                    if navigate == False:
                        record = False
                        rospy.Subscriber("odom",Odometry,capture_pos)
                        rospy.Subscriber("/ground_truth/state",Odometry,capture_pos_from_sim)              ####for simulator
                    else:       
                        print 'Cancel current navigation first'
#                elif event.key == pygame.K_KP1:
                elif event.key == pygame.K_f:
                    print "Keypad f"
                    if navigate == False:
                        record = False
                        # ----------- Change as required
                        r = 5
#                        phi = math.pi/6
                        phi = 0.0
                        steps = 30
                        # ----------
                        rospy.Subscriber("odom",Odometry,circle_trajectory,(r,phi,steps))
                        rospy.Subscriber("/ground_truth/state",Odometry,circle_trajectory,(r,phi,steps))


                elif event.key == pygame.K_g:
                    print "straight line trajectory"
                    if navigate == False:
                        record = False
                        # ----------- Change as required

                        steps = 3
                        # ----------
                        rospy.Subscriber("odom",Odometry,line_trajectory,(steps))
                        rospy.Subscriber("/ground_truth/state",Odometry,line_trajectory,(steps))

                elif event.key == pygame.K_h:
                    print "square trajectory"
                    if navigate == False:
                        record = False
                        # ----------- Change as required

                        sidelen = 0.2
                        iterations = 1
                        # ----------
                        rospy.Subscriber("odom",Odometry,square_trajectory,(sidelen,iterations))
                        rospy.Subscriber("/ground_truth/state",Odometry,square_trajectory,(sidelen,iterations))

                elif event.key == pygame.K_KP2:
		    print "keypad 2"
                    if navigate == False:
                        record = False
                        steps = 20

                elif event.key == pygame.K_v:
                    if drone.hasTakenOff:
                        if navigate == False:
                            if record == True:
                                navigate = True
                                if no_of_points == 1:
                                    pointarray = (point_array[0],point_array[1]+1,point_array[2])        ##########
                                    autopilot_to_saved_point = AutoPilotCmd(False,pointarray,(0,0,0*math.pi/180),1,'turn&move') ############
                                    startpilotpub.publish(autopilot_to_saved_point)                               
                                    print "point_array[1]",pointarray[1]
				    rospy.Subscriber("odom",Odometry,odom_loc)
				    rospy.Subscriber("/ground_truth/state",Odometry,state_loc)
                                else:
                                    autopilot_to_saved_point = AutoPilotCmd(False,point_array,orient_array,no_of_points,mode)
                                    startpilotpub.publish(autopilot_to_saved_point) 
				    rospy.Subscriber("odom",Odometry,odom_loc)
				    rospy.Subscriber("/ground_truth/state",Odometry,state_loc)
                                    print "points and mode are:", no_of_points,mode
                                for i in range(1,no_of_points+1):
                                    n = 3*i-1
                            else:
                                print 'No coordinates recorded'
                        else:
                            print 'Cancel current navigation first'
                    else:
                        print 'Spinny has not taken off yet'
                elif event.key == pygame.K_b:
                    print 'navigation state',navigate
                    print 'no of captured points', no_of_points
                    print 'autopilot mode', mode
                elif event.key == pygame.K_l:
                    if no_of_points==0:
                        print 'No captured points'
                    else:
                        for i in range(0,len(point_array),3):
                            print (point_array[i],point_array[i+1],point_array[i+2]),(orient_array[i+2]*180/math.pi)
                elif event.key == pygame.K_x:
                    if record == True:
                        point_array = ()
                        orient_array = ()
                        no_of_points = 0
                        print 'Cleared all recorded coordinates'
                    else:
                        print 'No captured points'
                elif event.key == pygame.K_m:
                    if record == True:
                        point_array = ()
                        orient_array = ()
                        no_of_points = 0
                        stopper = AutoPilotCmd(True,setpoint,setorient,1,mode)
                        stoppilotpub.publish(stopper)
                        navigate = False
                        print 'Cleared all recorded coordinates and stopped navigations'
                elif event.key == pygame.K_KP_PLUS:
                    if speed <=6:
                        speed += 1
                        print 'Speed increased to:',speed
                    else:   
                        print 'At max speed!'
                elif event.key == pygame.K_KP_MINUS:
                    if speed >=1:
                        speed -= 1
                        print 'Speed decreased to:',speed
                    else:
                        print 'At min speed'
                elif event.key == pygame.K_TAB:
                    for i in range(len(mode_list)):
                        if mode == mode_list[i]:
                            if i == len(mode_list)-1:
                                mode = mode_list[0]
                            else:
                                mode = mode_list[i+1]
                            print 'Autopilot Mode:',mode
                            break
                elif event.key == pygame.K_z:   ###  Zhu Chen, press z to check the odom data from mocap
                    print "subscribe to odom"
                    rospy.Subscriber("odom",Odometry,print_odom)

                elif event.key == pygame.K_o:   ### Danyang Luo, press o to open camera
                    print "Open camera"    
                    rospy.Subscriber("/ardrone/image_raw",Image, show_camera)



        pygame.display.flip()
        clock.tick(50)
        pygame.display.set_caption("FPS: %.2f" % clock.get_fps())
        rate.sleep()   
    stopper = AutoPilotCmd(True,setpoint,setorient,1,mode)
    if navigate == True:
        stoppilotpub.publish(stopper)
        navigate = False
        print 'stopping autopilot'   
    print 'shutting down...'

def show_camera(data):
    ###print "show camera"
    try:
        cv_image = CvBridge().imgmsg_to_cv2(data,"bgr8")
        cv2.imshow("Image",cv_image)
        cv2.waitKey(3)
        decode_data = decode(cv_image)
        ###print "Current location"
        for obj in decode_data:
            print obj.data
        ###print "success"
    except CvBridgeError as e:
        print e
    ###print cv_image.shape

def square_trajectory(data,(sidelen,iterations)): # get destination points on an inclined circular trajectory with centre at current position of drone
    global record
    global point_array
    global orient_array
    global no_of_points

    if record == False:

        point_array = ()
        orient_array = ()
        no_of_points = 0
        c = (data.pose.pose.position.x,data.pose.pose.position.y,data.pose.pose.position.z)
        ds = 0.05
        steps = int(sidelen/ds)  ## here the steps must be integer

        print 'Creating square trajectory with sidelen %f, start point (%f,%f,%f)'%(sidelen,c[0],c[1],c[2])
        for iter in range(iterations):
            for step in range(steps):
                x = (step+1)*ds+c[0]
                y = 0+c[1]
                z = 1

                yaw = 0
                point_array+=((x,y,z))
                orient_array+=((0,0,yaw))
                no_of_points += 1
                print "len1 waypoints x,y,z,yaw: ",[x,y,z,yaw]
            endpointx=x
            endpointy=y
            endpointz=z
            for step in range(steps):
                x = 0+endpointx
                y = (step+1)*ds+endpointy
                z = 1
                yaw = 0
                point_array+=((x,y,z))
                orient_array+=((0,0,yaw))
                no_of_points += 1
                print "len2 waypoints x,y,z,yaw: ",[x,y,z,yaw]

            endpointx=x
            endpointy=y
            endpointz=z
            for step in range(steps):
                x = -(step+1)*ds+endpointx
                y = 0+endpointy
                z = 1
                yaw = 0
                point_array+=((x,y,z))
                orient_array+=((0,0,yaw))
                no_of_points += 1
                print "len3 waypoints x,y,z,yaw: ",[x,y,z,yaw]

            endpointx=x
            endpointy=y
            endpointz=z
            for step in range(steps):
                x = 0+endpointx
                y = -(step+1)*ds+endpointy
                z = 1
                yaw = 0
                point_array+=((x,y,z))
                orient_array+=((0,0,yaw))
                no_of_points += 1
                print "len4 waypoints x,y,z,yaw: ",[x,y,z,yaw]



        record = True



def odom_loc(data):
    global record
    if record == False:
	write_x_y = open("odom_location.txt","a")
	write_z = open("height.txt","a")
        write_x_y.write(str(data.pose.pose.position.x))
        write_x_y.write(",")
        write_x_y.write(str(data.pose.pose.position.y))
        write_x_y.write("\n")	
	write_x_y.close()
	write_z.close()
	

def state_loc(data):
    global record
    if record == False:
	write_x_y = open("state_location.txt","a")
        write_x_y.write(str(data.pose.pose.position.x))
        write_x_y.write(",")
        write_x_y.write(str(data.pose.pose.position.y))
        write_x_y.write("\n")
	write_x_y.close()



def line_trajectory(data,(steps)):
    global record
    global point_array
    global orient_array
    global no_of_points

    if record == False:
        point_array = ()
        orient_array = ()
        no_of_points = 0
        c = (data.pose.pose.position.x,data.pose.pose.position.y,data.pose.pose.position.z)
        for step in range(steps):         
            x = 1*step+c[0]
            y = c[1]
            #z = r*math.cos(theta)*math.sin(phi)+c[2]
            z = 1

            yaw = 0
            point_array+=((x,y,z))
            orient_array+=((0,0,yaw))
            no_of_points += 1
            print "straight line waypoints x,y,z: ",x,y,z
#            write_x_y = open("trajectry","a")
#            write_x_y.write(str(x))
#            write_x_y.write(",")
#            write_x_y.write(str(y))
#            write_x_y.write("\n")
#            print 'Position captured: (%f,%f,%f); Orientation: %f'%(x,y,z,yaw*180/math.pi)
#            write_x_y.close()
        record = True



def circle_trajectory(data,(r,phi,steps)): # get destination points on an inclined circular trajectory with centre at current position of drone
    global record
    global point_array
    global orient_array
    global no_of_points

    if record == False:
	
        point_array = ()
        orient_array = ()
        no_of_points = 0
        c = (data.pose.pose.position.x,data.pose.pose.position.y,data.pose.pose.position.z)
        # c = (0.7,0.7,0.7)

        print 'Creating circular trajectory with radius %f, centre (%f,%f,%f), and inclined at %f degrees to the horizontal'%(r,c[0],c[1],c[2],phi*180/math.pi)
        for step in range(1,steps):
            theta = 2*math.pi - (2*step*math.pi/steps) - math.pi
            x = r*math.cos(theta)*math.cos(phi)+c[0]+r ###### Zhu Chen, the center is the first point to start, shift the original circle to the positive x axis.
            y = r*math.sin(theta)*math.cos(phi)+c[1]
            #z = r*math.cos(theta)*math.sin(phi)+c[2]
            z = 1
            print "circle waypoints x,y,z: ",[x,y,z]
            yaw = theta-(math.pi)/2
            yaw = 0 ######### Zhu Chen, don't change yaw first
            point_array+=((x,y,z))
            orient_array+=((0,0,yaw))
            no_of_points += 1
        x = c[0]
        y = c[1]
        z = 1
        yaw = 0
        print "circle waypoints x,y,z: ",[x,y,z]
        point_array+=((x,y,z))
        orient_array+=((0,0,yaw))
        no_of_points += 1
        record = True ##### Zhu Chen, here to plan the waypoints only once, because next time when received odom msg, the circle_trajectory() will be executed again, but not wo plan new waypoints again do the the record flag is false.






def figure8_trajectory(data,steps): # get destination points on a figure 8 trajectory with centre at current position of drone
    global record
    global point_array
    global orient_array
    global no_of_points
    if record == False:
        point_array = ()
        orient_array = ()
        no_of_points = 0
        c = (data.pose.pose.position.x,data.pose.pose.position.y,data.pose.pose.position.z)
        # c = (0.7,0.7,0.7)
        for i in range(steps):
            theta = i*((3*math.pi/2)+math.pi/2)/(steps)-math.pi
            x = 0.5*math.cos(theta) + c[0]
            y = math.cos(theta)*math.sin(theta) + c[1]
            z = c[2]
            point_array += ((x,y,z))
            orient_array += ((0,0,theta))
            no_of_points+=1
            print 'Position captured: (%f,%f,%f); Orientation: %f'%(x,y,z,theta*180/math.pi)
        record = True


def capture_pos(data):  
    global record
    global point_array
    global orient_array
    global no_of_points
    if record == False:
        print 'here'
        capture_point = (data.pose.pose.position.x,data.pose.pose.position.y,data.pose.pose.position.z)
        curr_orient = data.pose.pose.orientation
        yaw_angle = math.atan2(2 * ((-curr_orient.x) * (-curr_orient.y) + curr_orient.w * (-curr_orient.z)),curr_orient.w * curr_orient.w + (-curr_orient.x) * (-curr_orient.x) - (-curr_orient.y) * (-curr_orient.y) - (-curr_orient.z) * (-curr_orient.z))
        capture_orient = (0,0,yaw_angle)
        point_array+=(capture_point)
        orient_array+=(capture_orient)
        no_of_points +=1
        print 'Position captured:',capture_point,'orientation',capture_orient[2]*180/math.pi,'no of points captured:',no_of_points
        record = True

def capture_pos_from_sim(data):  
    global record
    global point_array
    global orient_array
    global no_of_points
    if record == False:
        print 'here'
        capture_point = (data.pose.pose.position.x,data.pose.pose.position.y,data.pose.pose.position.z)
        curr_orient = data.pose.pose.orientation
        yaw_angle = math.atan2(2 * (curr_orient.x * curr_orient.y + curr_orient.w * curr_orient.z),curr_orient.w * curr_orient.w + curr_orient.x * curr_orient.x - curr_orient.y * curr_orient.y - curr_orient.z * curr_orient.z)
        capture_orient = (0,0,yaw_angle)
        point_array+=(capture_point)
        orient_array+=(capture_orient)
        no_of_points +=1
        print 'Position captured:',capture_point,'orientation',capture_orient[2]*180/math.pi,'no of points captured:',no_of_points
        record = True

def print_odom(data):
    print '\n'
    print "odom.position from mocap:\n",(data.pose.pose.position)
    print 'odom.orientation from mocap\n',(data.pose.pose.orientation)
        
if __name__ == '__main__':
    rospy.init_node('master_mover',anonymous=True)
    startpilotpub = rospy.Publisher('/autopilot_start_cmd',AutoPilotCmd,queue_size=10)
    stoppilotpub = rospy.Publisher('/autopilot_stop_cmd',AutoPilotCmd, queue_size=10)
#    rospy.Subscriber("odom",Odometry,print_odom)
    drone = Drone()
    speed = 5
    navigate = False
    setpoint = (1.0,0.5,1.0)
    setorient = (0.0,0.0,30*math.pi/180)
    mode_list = ('reach&turn','move+turn','turn&move','no_turn')
    mode = mode_list[0]
    print 'Starting Keyboard Controller...'
    main(drone)
