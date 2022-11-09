# Required header.
SOMHeader HEADER

# The batch the observation was made in.
int16 observation_batch_num

# Which SOM object is this linked with? Links observation to Object
string CRSS_REF_UID

# The class/type of an object. (i.e., table, apple, potted plant).
string class_
string colour

# Apples are fruit are object. This will give one level up (so apple -> fruit).
string category

geometry_msgs/Pose obj_position

bool pickupable
bool picked_up

# Give the pose information necessary for full identification.
# (For testing purposes, if tf can't be found, this will be set to NAN).
geometry_msgs/Pose base_pose
geometry_msgs/Pose camera_pose

# When did the observation happen?
time observed_at

# Some indication of the object size. (This will be approximate to begin with).
geometry_msgs/Point size

# Do we expect the object to move?
bool static

float64[] covariance_mat
# We're already going to know the transform to get the covariance matrix to diagonal form, so why not use this?
float64[] transform_cov_to_diagonal