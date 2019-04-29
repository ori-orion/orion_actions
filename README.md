# orion_actions
This repo will contain all of the rosmsgs, actions

Please add all actions and message definitions to this folder.

PickUpObject.action has been added as an example in the 'action' folder. To enable this to be built, you must also modify the CMakeLists.txt file accordingly. You will need to make sure all valid actions are passed into the add_action_files function as demonstrated below:

add_action_files(DIRECTORY 
		action 
		FILES 
		PickUpObject.action
)
