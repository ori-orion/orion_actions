# Did we observe the object in this session or a different one?
int16 SESSION_NUM
string UID

# What batch was this observed in?
int16 observation_batch_num

# Which object is this linked with?
string OBJ_UID

# The class/type of an object. (i.e., table, apple, potted plant).
string class_
string colour

# Apples are fruit are object. This will give one level up (so apple -> fruit).
string category

geometry_msgs/Point obj_position

bool pickupable

# Give the pose information necessary for full identification.
# (For testing purposes, if tf can't be found, this will be set to NAN).
geometry_msgs/Pose base_pose
geometry_msgs/Pose head_pose

# When did the observation happen?
time observed_at

# Some indication of the object size. (This will be approximate to begin with).
geometry_msgs/Point size

# Do we expect the object to move?
bool static


