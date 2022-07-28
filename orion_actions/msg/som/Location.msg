# Required headers.
int16 SESSION_NUM
string UID

float64 x
float64 y



# BELOW ARE NOTES AND IDEAS FOR ROSPLAN messages
# Required headers.
#int16 SESSION_NUM
#string UID

# can be inspired by SOMObject.msg???


# FACT
#cf ROS_INFO("KCL: (%s) Adding fact (%s%s, %i)", ros::this_node::getName().c_str(), msg.attribute_name.c_str(), param_str.c_str(), msg.is_negative);
# e.g. (robot_at_wp tiago wp1) ; 
#      (wp_visited wp2) ; 
#      (box_at_wp greenbox wp1)

#FUNCTION
#ROS_INFO("KCL: (%s) Increasing function (= (%s%s) %f)", ros::this_node::getName().c_str(), msg.attribute_name.c_str(), param_str.c_str(), pit->function_value);
# e.g. (=(success_count) 1.0)




# other messages to be added
# potentially: plan generated, plan dispatched, plan received?


# in ActionInterface.cpp s:
# ROS_ERRORS like Fail to recognise cube... --
# ROS_INFO("KCL: (%s) action completed successfully", params.name.c_str()); 
# or else just : ROS_INFO_STREAM("PICK_INTERFACE: Action completed with success = " << response << " and message " << srv.response.message)