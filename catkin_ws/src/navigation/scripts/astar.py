#!/usr/bin/env python
import numpy as np
import math
import random
import rospy
import tf
from geometry_msgs.msg import Twist
from nav_msgs.msg import Odometry
from std_msgs.msg import Float32
rospy.set_param('startX', -8)
rospy.set_param('startY', -2)
rospy.set_param('goalX', 4)  
rospy.set_param('goalY', 9)  
map = np.array([
       [0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,0],
       [0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,0],
       [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
       [1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
       [0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
       [0,0,1,1,0,0,1,1,1,1,1,1,0,0,0,0,0,0],
       [0,0,1,1,0,0,1,1,1,1,1,1,0,0,0,0,0,0],
       [0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,1,1,0],
       [0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,1,1,1],
       [0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,1,1,1],
       [0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,1,1],
       [0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,1,0],
       [0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0],
       [0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0],
       [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
       [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
       [0,0,0,0,0,0,0,0,1,1,0,0,0,1,1,1,1,0],
       [0,0,0,0,0,0,0,0,1,1,1,0,0,1,1,1,1,0],
       [0,0,0,0,0,0,0,1,1,1,0,0,0,1,1,1,1,0],
       [0,0,0,0,0,0,0,0,1,1,0,0,0,1,1,1,1,1]])
t = Twist()
rot = True  # first time do rotation
idx = 0     # first time at position with index 0
path = []   # store robot path
​
def heapify(path, n, i):
	largest = i
	l = 2 * i + 1
	r = 2 * i + 2
	if l < n and path[i][0] < path[l][0]:
		largest = l
	if r < n and path[largest][0] < path[r][0]:
		largest = r
	if largest != i:
		path[i], path[largest] = path[largest], path[i]
		heapify(path, n, largest)
​
def heapSort(path):
	n = len(path)
	for i in range(n, -1, -1):
		heapify(path, n, i)
	for i in range(n - 1, 0, -1):
		path[i], path[0] = path[0], path[i]
		heapify(path, i, 0)
​
class node(object):
	def __init__(self, wall, x, y):
		self.x = x
		self.y = y
		self.parent = None
		self.wall = wall
		self.g = 0
		self.h = 0
		self.f = 0
#A* algorithm get path 
def a_star_path(input_map, begin, end):
	global node
	open_set = []  
	heapSort(open_set)  
	nodes = [] 
	height = len(input_map)  
	width = len(input_map[0])  
	close = set()
	for i in range(width):
		for j in range(height):
			nodes.append(node(input_map[j][i], i, j))
	begin = nodes[begin[1] + begin[0] * height] 
	end = nodes[end[1] + end[0] * height]
	
	open_set.append((begin.f, begin))
	heapSort(open_set)
	while len(open_set):  
		f, node = open_set[0];  
		del open_set[0]  
		close.add(node)  
		
		if node is not end:
			
			adjacent = []
			
			if node.x < width - 1:  
				adjacent.append(nodes[(node.x + 1) * height + node.y])  
​
			if node.y > 0:  
				adjacent.append(nodes[(node.x) * height + node.y - 1])  
​
			if node.x > 0:  
				adjacent.append(nodes[(node.x - 1) * height + node.y])  
​
			if node.y < height - 1: 
				adjacent.append(nodes[(node.x) * height + node.y + 1])  
​
			if (node.x < width - 1 and node.y < height - 1) and (nodes[(node.x + 1) * height + node.y]).wall == 0 and \
					nodes[(node.x) * height + node.y + 1].wall == 0:  
				adjacent.append(nodes[(node.x + 1) * height + node.y + 1])  
​
			if (node.x < width - 1 and node.y > 0) and (nodes[(node.x + 1) * height + node.y]).wall == 0 and nodes[
				(node.x) * height + node.y - 1].wall == 0:  
				adjacent.append(nodes[(node.x + 1) * height + node.y - 1])  
​
			if (node.x > 0 and node.y < height - 1) and (nodes[(node.x - 1) * height + node.y]).wall == 0 and nodes[
				(node.x) * height + node.y + 1].wall == 0:
				adjacent.append(nodes[(node.x - 1) * height + node.y + 1]) 
​
			if (node.x > 0 and node.y > 0) and (nodes[(node.x - 1) * height + node.y]).wall == 0 and nodes[
				(node.x) * height + node.y - 1].wall == 0:  
				adjacent.append(nodes[(node.x - 1) * height + node.y - 1])  
​
			for adjacent_node in adjacent:
​
				if adjacent_node.wall == 0 and adjacent_node not in close:
​
					if (adjacent_node.f, adjacent_node) in open_set:
​
						if adjacent_node.g > node.g + math.sqrt(pow((adjacent_node.x - node.x), 2) + pow((adjacent_node.y - node.y), 2)):
​
							adjacent_node.g = node.g + math.sqrt(
								pow((adjacent_node.x - node.x), 2) + pow((adjacent_node.y - node.y), 2))
​
							adjacent_node.h = math.sqrt(
								pow((adjacent_node.x - end.x), 2) + pow((adjacent_node.y - end.y), 2))
​
							adjacent_node.parent = node
​
							adjacent_node.f = adjacent_node.h + adjacent_node.g
					else:
						adjacent_node.g = node.g + math.sqrt(
							pow((adjacent_node.x - node.x), 2) + pow((adjacent_node.y - node.y), 2))
​
						adjacent_node.h = math.sqrt(
							pow((adjacent_node.x - end.x), 2) + pow((adjacent_node.y - end.y), 2))
​
						adjacent_node.parent = node
​
						adjacent_node.f = adjacent_node.h + adjacent_node.g
​
						open_set.append((adjacent_node.f, adjacent_node))
​
						heapSort(open_set)
		else:
			node = end 
			path = []
			path.append((end.x,end.y))
			while node.parent is not begin:  
				node = node.parent
				path.append((node.x, node.y))
			path.append((begin.x, begin.y))
			path.reverse()						
									
			return path  
​
def get_x_y(x, y, labmap):
	height = int(len(labmap) / 2)  
	width = int(len(labmap[0]) / 2) 
	return width + x, height - y-1
	
def get_path(labmap,start_x, start_y):
	goal_x, goal_y   = get_x_y(int(rospy.get_param('goalX')),  int(rospy.get_param('goalY')), labmap)
	if labmap[goal_x][goal_y] == 1:  
		rospy.logerr("Please change the goal, because the goal locates the wall area.")
		exit(0)
	path = a_star_path(labmap, (int(start_x), int(start_y)), (int(goal_x), int(goal_y)))
	return path
​
def twist(linear, angular):
	global t
	t.linear.x = linear
	t.angular.z = angular
	return t
​
def get_angle(data):
	trans=data.pose.pose.position
	rot=data.pose.pose.orientation
	angle=tf.transformations.euler_from_quaternion([rot.x,rot.y,rot.z,rot.w])[2]
	x=trans.x
	y=trans.y
	return angle,x,y
​
def get_coordinate(data,ind,x,y,angle):
	nx = data[ind][0]+0.5-9
	ny =-data[ind][1]+10-0.5
	current_angle = math.atan2(ny-y,nx-x)
	change_to = current_angle - angle
	return nx,ny,change_to
​
def rotate(change_to,pub):
	if change_to < 0:
		change_to += math.pi * 2
	elif change_to > math.pi * 2:
		change_to -= math.pi * 2
	if change_to > math.pi:
		pub.publish(twist(0,-0.5))
	else:
		pub.publish(twist(0,0.5))
​
def move(data):
	global rot,idx,path
        path=path
        next=idx
        pub=rospy.Publisher('/cmd_vel',Twist,queue_size=10)
        angle,x,y = get_angle(data)
	nextx,nexty,change_to = get_coordinate(path,next,x,y,angle)
​
        if rot:
            if math.fabs(change_to) > math.radians(3):
	        #rospy.logerr("Rotation")
		rotate(change_to,pub)
            else:
                rot=False #if rotate degree < radians 3->move
        else:
            distance=math.sqrt(pow((nextx-x),2)+pow((nexty-y),2))
            if distance>= 0.7:
                pub.publish(twist(100,0))
            else:
                rot=True
                if next+1<len(path): #move to next
                    idx+=1
# Get cuurent odometry data from subscriber of base_pse_ground_truth 
# Judge if the it is doing rotation
# If so, judge if current angle able to rotate, if so, get rotation data, and publish to the cmd_vel
# Then get Odometry, judge if the current angle able to rotate, if not then change global veriable rot to false
# Then do move, first judge if the distence is long engough to do movement,
# If so,do movement
# Then get Odometry , judge if the current distence able to move
# If not, change rot to True, because next time it will rotate, and change the current index to the next if the next is not the end
# then do this operation again until the robot arrives to the end point.
def astar():
	global path
        path=get_path(map,1,12)
        robot_pos_pub = rospy.Subscriber("/base_pose_ground_truth", Odometry,move)         
​
​
if __name__ == '__main__':
    try:
	rospy.init_node("astar", anonymous=False)
	astar()
	while not rospy.is_shutdown():
		rate = rospy.Rate(10)
		rospy.sleep(1)
​
    except rospy.ROSInterruptException:
        pass 