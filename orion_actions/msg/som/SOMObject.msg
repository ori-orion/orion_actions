# Required header.
SOMHeader HEADER

# The class/type of an object. (i.e., table, apple, potted plant).
string class_
string colour
string tf_name

# The last observation was made at in the following batch of observations.
int16 last_observation_batch

int16 num_observations

# Apples are fruit are object. This will give one level up (so apple -> fruit).
string category

# Note that for cross referencing, this must be of the same type as that within SOMObservation.msg
geometry_msgs/Pose obj_position

bool pickupable
bool picked_up

# When did the observation happen?
time first_observed_at
time last_observed_at

# Some indication of the object size. (This will be approximate to begin with).
# NOTE: Conventions are as follows: 
# x: width, y: depth, z: height
geometry_msgs/Point size

# Do we expect the object to move?
bool is_static

# float64[] covariance_mat