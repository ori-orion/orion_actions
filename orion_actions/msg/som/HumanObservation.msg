# Required header.
SOMHeader HEADER

# What batch was this observed in?
int16 observation_batch_num

# Which SOM human is this linked with? Links human observations to Humans (Needs testing)
string CRSS_REF_UID

string task_role
float64 height

geometry_msgs/Pose obj_position

string object_uid


# When did the observation happen?
time observed_at

# Person Identifiers
string name
string gender
string pronouns

# Facial Recognition
string face_id
string[] face_attributes


byte spoken_to_state