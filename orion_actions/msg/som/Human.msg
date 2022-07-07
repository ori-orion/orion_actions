# Required headers.
int16 SESSION_NUM
string UID

# The last observation was made at in the following batch of observations.
int16 last_observation_batch

string task_role
float64 height

geometry_msgs/Pose obj_position

# When did the observation happen?
time first_observed_at
time last_observed_at

# The corresponding uid for the SOM objects.
string object_uid

# Person Name
string name

# Facial Recognition
string face_id
string[] face_attributes

byte NULL = 0
byte NOT_SPOKEN_TO = 1
byte SPOKEN_TO = 2
byte spoken_to_state