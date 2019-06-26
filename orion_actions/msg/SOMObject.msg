Header header

string obj_id  		#### id of the object that is inserted. Useful for identifying objects. SOMA2 delete service use this id to delete objects from DB.

string map_name 	#### the global map that the object belongs. Automatically filled.

string meta_properties 		#### arbitrary string of data

string type 		#### type of the object

geometry_msgs/Point size  #### approximate size of object

float32 weight   #### weight in kilograms

string task_role

PoseEstimate pose_estimate

geometry_msgs/Pose robot_pose 	#### The pose of the robot during observation

sensor_msgs/PointCloud2 cloud 	#### The 3D cloud of the object

string colour   #### colour of object

string room_name

uint32 waypoint #### waypoint associated with this object

geometry_msgs/Polygon room_geometry

uint32 timestamp

geometry_msgs/Pose pose_observation

bool observed #### if an object is not observed the estimate is based only on prior knowledge


#### human specific

string name   #### name if person

uint32 age  #### age if person

string posture  #### posture if human using enum

string gender   #### gender if human using enum

string shirt_colour    #### color of shirt using enum

string coat_colour

string drink
