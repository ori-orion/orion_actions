# Required header
int16 SESSION_NUM
string UID

# When was this recorded?
time timestamp
# update_type can be "remove_knowledge", "add_knowledge"
string update_type 
# identifier for the action whose effect is this knowledge item, it is the number of the action within the plan (order)
int16 action_id
rosplan_knowledge_msgs/KnowledgeItem knowledgeItem