# Required headers.
int16 SESSION_NUM
string UID

# Which SOM object is this linked with? Links human observations to Humans (Needs testing)
string CRSS_REF_UID

string task_role
float64 height

geometry_msgs/Pose obj_position

string object_uid


# When did the observation happen?
time observed_at

