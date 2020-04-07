from math import sqrt, floor

"""
A* Algorithm

Modified from Shane Griffin's CSE468 Project 2

How to use:

Import function a_star from this file.
Specify a starting point, goal point, and obstacles. 
First element in each point is column, second is row
Bottom left corner is (0,0), top right is (max col, max row).

Obstacle map can be any size. Min size is 1 row by 1 col.
Every row must have the same number of elements.

Example:

# First elem is col, second is row
start = (0,0)
goal = (3,0)
obs = [
        [0,0,0,1], # 2
        [0,1,0,1], # 1
        [0,1,0,0], # 0
 # col   0 1 2 3     row
]

# [(0, 0), (0, 1), (1, 2), (2, 1), (3, 0)]
path = a_star(start, goal, obs)

"""

# Increase this value to reduce runtime
# May result in suboptimal path if > 1
epsilon = 1

def a_star(start, goal, obstacles):
    """
    0,0 is bottom left of map
    Parameters:
    start (tuple) start location
    goal (tuple) end location
    map (list) 2D list of obstacles (1) and open spaces (0).
               Each row must have the same number of elements.
    Returns:
    list: List of tuples representing path 
    """
    map = Map(obstacles)

    start_node = Node(
        coord=start,
        goal=goal
    )
    
    nodes = { start_node.coord : start_node }     
    to_visit = [start_node]  

    while to_visit != []:
        current = to_visit.pop()
        if current.coord == goal:
            return construct_path(nodes, current)
        current.visited = True

        for node in neighbors(current, goal, map):
            if node.coord in nodes:
                if nodes[node.coord].visited: continue
                nodes[node.coord].copy_lt(node)
            else:
                nodes[node.coord] = node
                to_visit.append(node)
                
        to_visit.sort(key=lambda node: (node.f,node.h), reverse=True)

    return [] # No path found

class Map:
    def __init__(self, map):
        self.map = map
        self.max_col = len(map[0]) - 1
        self.max_row = len(map) - 1

    def is_obstacle(self, curr, diff):
        """
        True if map contains 1 at curr 
        or location is out of bounds
        """
        new = sum_t(curr, diff)
        # Left & bottom bounds
        if new[0] < 0 or new[1] < 0: return True
        # Right bound
        if new[0] > self.max_col: return True
        # Top bound
        if new[1] > self.max_row: return True
        # Corner is blocked case
        if diff in corner_diffs:
            a_diff, b_diff = corner_diffs[diff]
            a = sum_t(curr, a_diff)
            b = sum_t(curr, b_diff)
            if self.is_wall(a) and self.is_wall(b):
                return True
        return self.is_wall(new)

    def is_wall(self, coord):
        return 1 == self.map[self.max_row - coord[1]][coord[0]] 

class Node:
    visited = False
    def __init__(self, prev=None, coord=None, goal=None, prev_dist=0):
        """
        Parameters:
        prev (tuple) previous coordinates (or None if start)
        coord (tuple) current coordinates
        goal (tuple) goal coordinates
        prev_dist (float)
        """
        self.coord = coord
        self.prev = prev
        self.goal = goal
        self.g = prev_dist
        self.h = dist(self.coord, self.goal)
        self.f = self.g + epsilon * self.h

    def copy_lt(self, node):
        # Copy node if it's path is shorter
        if node.g < self.g:
            self.coord = node.coord
            self.prev = node.prev
            self.g = node.g
            self.h = node.h
            self.f = node.f

    def __str__(self):
        return str(self.coord) + " " + "f: " + str(self.f)

def neighbors(node, goal, map):
    retVal = []
    for diff, dist in neighbor_diffs.items():
        if map.is_obstacle(node.coord, diff): continue
        retVal.append(Node(
            prev=node.coord,
            coord=sum_t(node.coord, diff),
            goal=goal,
            prev_dist=node.g + dist
        ))
    return retVal

def construct_path(nodes, node):
    # Convert graph of nodes to list of points
    retVal = [node.coord]
    while node.prev != None:
        node = nodes[node.prev]
        retVal.append(node.coord)
    return retVal[::-1]

neighbor_diffs = {
    (-1, 1) : 1.4, (0, 1) : 1, (1, 1) : 1.4,
    (-1, 0) : 1,               (1, 0) : 1,
    (-1,-1) : 1.4, (0,-1) : 1, (1,-1) : 1.4
}

corner_diffs = {
    (-1, 1) : (( 0,1),(-1,0)), (1, 1) : ((0,1),(1,0)),
    (-1,-1) : ((-1,0),(0,-1)), (1,-1) : ((1,0),(0,-1))
}

def sum_t(a, b):
    # sum tuples of length 2
    return (a[0] + b[0], a[1] + b[1])

def dist(a, b):
    # distance between tuples of length 2
    return sqrt(
        (b[0] - a[0])**2 + (b[1] - a[1])**2
    )
