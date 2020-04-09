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

# last modified by: danny delannes-molka
# SUMMERY: This is a modification of the executer code.
# NOTE: Some functionality from executer was removed for simplifcation purposes.
# If they are nessary refer to the origonal executer.py file in this directory.
# CODE WILL:
# Will automatically make drone takeoff.
# will then create a set of points, defined in generatePreplannedCapturePoints
# print those points to console 
# wait for the controls below to be used. to have it run over all points press V.
# behavier after clicking v is defined in line 125
# Controls:
# Return - Take-off/stop autopilot
# Space - Land/stop autopilot
# W - move front
# S - move back
# A - move left
# D - move right
# LEFT - Turn left
# RIGHT - Turn right
# V - run astar and move to new locaction
# L - print list of captured points
# Keypad PLUS - increase keyboard control speed
# Keypad MINUS - decrease keyboard control speed

def main(drone):
  
    global navigate
    global record
    global point_array	    #Using point array to store the destination location. You can use it to implement a star algo
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
    print 'Return - Take-off/stop autopilot\nSpace - Land/stop autopilot\nW - move front\nS - move back\nA - move left\nD - move right\nLEFT - Turn left\nRIGHT - Turn right\nC - capture current position and store in memory\nV - go to capture point(s)\nX - clear all captured points\nL - print list of captured points\nM - Stop navigation and clear all captured points\nKeypad PLUS - increase keyboard control speed\nKeypad MINUS - decrease keyboard control speed\nKeypad 1 - plot a square path\nTAB - change navigation method'
    print '>>Manual Controller Started\n\tManual Control Speed:',speed,'\n\tAutopilot Mode:',mode
    takeOffProcedure()
    generatePreplannedCapturePoints()
    printPoints()
    while running:
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                drone.land()
                running = False 
            elif event.type == pygame.KEYUP:
                drone.hover()
            elif event.type == pygame.KEYDOWN:
                # takeoff/landing
                if event.key == pygame.K_RETURN:
                    takeOffProcedure()
                elif event.key == pygame.K_SPACE:
                    drone.land()
                    print 'landing'
                    if navigate == True:
                        stopper = AutoPilotCmd(True,setpoint,setorient,1,mode)
                        stoppilotpub.publish(stopper)
                        print 'manually stopped autopilot'
                        navigate = False
                # drone movement
                elif event.key == pygame.K_w:
                    drone.moveLinear(0.1*speed,0,0)
                elif event.key == pygame.K_s:
                    drone.moveLinear(-0.1*speed,0,0)
                elif event.key == pygame.K_a:
                    drone.moveLinear(0,0.1*speed,0)
                elif event.key == pygame.K_d:
                    drone.moveLinear(0,-0.1*speed,0)
                elif event.key == pygame.K_UP:
                    drone.moveLinear(0,0,0.1*speed)
                elif event.key == pygame.K_DOWN:
                    drone.moveLinear(0,0,-0.1*speed)
                elif event.key == pygame.K_RIGHT:
                    drone.moveAngular(0,0,-0.2*speed)
                elif event.key == pygame.K_LEFT:
                    drone.moveAngular(0,0,speed*0.2)
                # idk what this does
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
                # moves drone to all points in the list
                elif event.key == pygame.K_v:
                    if drone.hasTakenOff:
                        if navigate == False:
                            if record == True:
                                navigate = True
                                if no_of_points == 1:
            
                                    pointarray = (point_array[0],point_array[1]+1,point_array[2])       
                                    autopilot_to_saved_point = AutoPilotCmd(False,pointarray,(0,0,30*math.pi/180),1,'turn&move') 
                                    startpilotpub.publish(autopilot_to_saved_point)                               
                                    print point_array[1],pointarray[1] 
                                else:
                                    # implemennt aster alg here
                                    temp_point_array = point_array   
                                    temp_orient_array = orient_array           
                                    temp_no_of_points = no_of_points
                                    # this line sends the list of points to the drone. the drone will go to each in sequence
                                    autopilot_to_saved_point = AutoPilotCmd(False,temp_point_array,temp_orient_array,temp_no_of_points,mode)
                                    startpilotpub.publish(autopilot_to_saved_point) 
                                for i in range(1,no_of_points+1):
                                    n = 3*i-1
                            else:
                                print 'No coordinates recorded'
                        else:
                            print 'Cancel current navigation first'
                    else:
                        print 'Spinny has not taken off yet'
                # prints all points
                elif event.key == pygame.K_l:
                    printPoints()
                # speed up/slow down
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

# procetures to make drone take off
def takeOffProcedure():
    global navigate
    global setpoint
    global setpoint
    global mode
    drone.takeOff()
    if navigate == True:
        stopper = AutoPilotCmd(True,setpoint,setorient,1,mode)
        stoppilotpub.publish(stopper)
        navigate = False
        print 'manually stopped autopilot'

# prints all points in the point_array
def printPoints():
    if no_of_points==0:
        print 'No captured points'
    else:
        for i in range(0,len(point_array),3):
            print (point_array[i],point_array[i+1],point_array[i+2]),(orient_array[i+2]*180/math.pi)

# adds the odomery point to the point_array and orient_array(just use (0,0,0,0))
# odometry need the following format: ((x,y,z),(x,y,z,w))
def addCapturePoint(odometry):
    global point_array
    global orient_array
    global no_of_points
    global record
    if record == False:
        capture_point = odometry[0]
        curr_orient = odometry[1]

        yaw_angle = math.atan2(2 * (curr_orient[0] * curr_orient[1] + curr_orient[3] * curr_orient[2]),curr_orient[3] * curr_orient[3] + curr_orient[0] * curr_orient[0]- curr_orient[1] * curr_orient[1] - curr_orient[2] * curr_orient[2])
        capture_orient = (0,0,yaw_angle)
        orient_array+=(capture_orient)
        no_of_points= no_of_points+1
        point_array+=(capture_point)

# generates Preplanned Capture Points
def generatePreplannedCapturePoints():
    global record
    for i in range(0,5):
        for j in range(0,5):
            odometry=((i,j,1),(0,0,0,0))
            record = False
            addCapturePoint(odometry)
    record = True
    print("grid created")

if __name__ == '__main__':
    rospy.init_node('master_mover',anonymous=True)
    startpilotpub = rospy.Publisher('/autopilot_start_cmd',AutoPilotCmd,queue_size=10)
    stoppilotpub = rospy.Publisher('/autopilot_stop_cmd',AutoPilotCmd, queue_size=10)
    drone = Drone()
    speed = 5               
    navigate = False
    setpoint = (1.0,0.5,1.0) 
    setorient = (0.0,0.0,30*math.pi/180)
    mode_list = ('move+turn','no_turn','reach&turn','turn&move')
    mode = mode_list[0]
    print 'Starting Keyboard Controller...'
    main(drone)
