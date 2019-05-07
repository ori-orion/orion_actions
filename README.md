# orion_actions
This repo will contain all of the rosmsgs, actions

Please add all actions, messages and service definitions to this folder. These should also be documented in the readme.

## Example of adding actions to the repo
PickUpObject.action has been added as an example in the 'action' folder. To enable this to be built, you must also modify the CMakeLists.txt file accordingly. You will need to make sure all valid actions are passed into the add\_action\_files function as demonstrated below:

```
add_action_files(DIRECTORY 
		action 
		FILES 
		PickUpObject.action
)
```

## To do:
- [ ] Add Listen.action and DetectNoiseDirection.action (speech)
- [ ] Add Navigation + Semantic mapping + high-level actions
- [ ] Document the vision actions in the readme

## Action information

### Manipulation Actions
* OpenDoor.action
	- input: N/A
	- result: _result_ (**bool**)
	- feedback: N/A
	- notes: Expects to be called when in front of the door and will use point clouds to find handle and open

* OpenFurnitureDoor.action
	- input: _goal\_tf_ (**string**)
	- result: _result_ (**bool**)
	- feedback: N/A
	- notes: Will use the goal tf to locate the surface of the door and use point clouds to find the handle

* OpenDrawer.action
	- input: _goal\_tf_ (**string**)
	- result: _result_ (**bool**)
	- feedback: N/A
	- notes: Will use the goal tf to locate the surface of the door and use point clouds to find the handle

* CloseDrawer.action
	- input: _goal\_tf_ (**string**)
	- result: _result_ (**bool**)
	- feedback: N/A
	- notes: Will use the goal tf to locate the surface of the door and use point clouds to find the handle

* PickUpObject.action
	- input: _goal\_tf_ (**string**)
	- result: _goal_complete_ (**bool**)
	- feedback: N/A
	- notes: Will pick up the object and stay in the grasp pose. Note it will not return to a default pose. A different action must be called.

* CloseFurnitureDoor.action
	- input: _goal\_tf_ (**string**)
	- result: _result_ (**bool**)
	- feedback: N/A
	- notes: Will use the goal tf to locate the surface of the door and use point clouds to find the handle

* PointToObject.action
	- input: _object\_tf\_frame_ (**string**)
	- result: _result_ (**bool**)
	- feedback: N/A
	- notes: Will use the object tf frame to determine 3D position to point to

* PourInto.action
	- input: _goal\_tf\_frame_ (**string**)
	- result: _result_ (**bool**)
	- feedback: N/A
	- notes: Assumes the object with liquid in has already been grasped. The goal tf specifies the container to pour into

* PutObjectOnFloor.action
	- input: N/A
	- result: _result_ (**bool**)
	- feedback: N/A
	- notes: Will place the object on the floor directly in front. 

* GiveObjectToOperator.action
	- input: N/A
	- result: _result_ (**bool**)
	- feedback: N/A
	- notes: Will present object in front of the HSR 

* PutObjectOnSurface.action
	- input: N/A
	- result: _result_ (**bool**)
	- feedback: N/A
	- notes: Assumes already in front of a table like surface and will place the object on the surface in front

* GrabBothBinBags.action
	- input: N/A
	- result: _result_ (**bool**)
	- feedback: N/A
	- notes: Unsure how this will work yet!

* ReceiveObjectFromOperator.action
	- input: N/A
	- result: _result_ (**bool**)
	- feedback: N/A
	- notes: Hold on the arm directly in front and opens the gripper

* TurnOnBlender.action
	- input: _button\_tf\_frame_ (**string**)
	- result: _result_ (**bool**)
	- feedback: N/A
	- notes: Will attempt to use the gripper to push the input button tf frame location

* OpenBinLid.action
	- input: N/A
	- result: _result_ (**bool**)
	- feedback: N/A
	- notes: Assumes that the robot is in front of a bin and will use point clouds to determine the bin lid handle. The action will lift up the lid. Must use additional actions to move back and place on floor etc.

* PlaceObjectRelative.action
	- input: goal_tf, x, y, z (**string, float32, float32, float32**)
	- result: _result_ (**bool**)
	- feedback: N/A
	- notes: This action will place an object relative to another object seen on tf server. Please ensure that x,y,z are given in standard robot axis convention (base_footprint) i.e x in front, y to left and z up. 


### Speech Actions
* Speak.action
	- input: sentence (**string**)
	- result: succeeded (**bool**)
	- feedback: N/A
	- notes: Speaks out the sentence given

* SpeakAndListen.action
	- input: question (**string**), candidates (**string[]**), params (**string[]**), timeout (**float32**),
	- result: answer (**string**), param (**string**), confidence (**float32**), succeeded (**bool**)
	- feedback: remaining (**float32**)
	- notes: Given an array of candiate answers, choose the best guess based on the voice input. Up to one parameter with multiple options could be given as a separate array.
	
* HotwordListen.action
	- input: timeout (**float32**),
	- result: confidence (**float32**), succeeded (**bool**)
	- feedback: remaining (**float32**)
	- notes: Detects a hotword (predefined)
	

