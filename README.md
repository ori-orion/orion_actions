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
- [ ] Add KnockListen.action and DetectNoiseDirection.action (speech)
- [ ] Add Navigation + Semantic mapping + high-level actions
- [ ] Document the vision actions in the readme

## Action information

### Manipulation Actions
* OpenDoor.action
	- input: _goal\_tf_ (**string**) indicating where the door is (provisional)
	- result: _result_ (**bool**) indicating whether the action succeeded
	- feedback: N/A
	- notes: Will use the goal tf to locate the surface of the door and use point clouds to find the handle

* OpenFurnitureDoor.action
	- input: _goal\_tf_ (**string**) indicating where the door is (provisional)
	- result: _result_ (**bool**) indicating whether the action succeeded
	- feedback: N/A
	- notes: Will use the goal tf to locate the surface of the door and use point clouds to find the handle

* OpenDrawer.action
	- input: _goal\_tf_ (**string**) indicating where the drawer is (provisional)
	- result: _result_ (**bool**) indicating whether the action succeeded
	- feedback: N/A
	- notes: Will use the goal tf to locate the surface of the drawer and use point clouds to find the handle

* CloseDrawer.action
	- input: _goal\_tf_ (**string**) indicating where the drawer is (provisional)
	- result: _result_ (**bool**) indicating whether the action succeeded
	- feedback: N/A
	- notes: Will use the goal tf to locate the surface of the drawer and use point clouds to find the handle

* PickUpObject.action
	- input: _goal\_tf_ (**string**) specifying the object to be picked up. Should be as close as possible to the object.
	- result: _result_ (**bool**) indicating whether the action succeeded
	- feedback: N/A
	- notes: Will pick up the object and attempt to return to its original pose.

* CloseFurnitureDoor.action
	- input: _goal\_tf_ (**string**) indicating where the door is (provisional)
	- result: _result_ (**bool**) indicating whether the action succeeded
	- feedback: N/A
	- notes: Will use the goal tf to locate the surface of the door and use point clouds to find the handle

* PointToObject.action
	- input: _object\_tf_ (**string**) to point towards
	- result: _result_ (**bool**) indicating whether the action succeeded
	- feedback: N/A
	- notes: Will use the object tf frame to determine 3D position to point to

* PourInto.action
	- input: _goal\_tf_ (**string**) to pour into
	- result: _result_ (**bool**) indicating whether the action succeeded
	- feedback: N/A
	- notes: Assumes the object with liquid in has already been grasped. The goal tf specifies the container to pour into. Do not test with real liquid...

* PutObjectOnSurface.action
  - input:
    - _goal\_tf_ (**string**) on top of the surface, to put the object at
    - _abandon\_action\_if\_no\_plane\_found_ (**bool**): Whether to give up if a plane to place on cannot be detected. If false, when a plane is not detected the action will place the object at goal_tf itself.
    - _drop\_object\_by\_metres_ (**float32**): How far above the surface to "drop" the object. It makes sense to drop bin bags a bit above the floor, for example. It makes less sense to drop fragile objects so this should be 0.0 by default. Negative values *shouldn't* result in the robot placing the item through solid surfaces, but don't try it anyway.
    - _check\_weight\_grams_ (**float32**): The robot will check that a weight change of check_weight_grams grams has occured after placing the object, e.g. to detect whether the object is somehow caught on the gripper. If detected_weight_change < check_weight_grams, the robot will wiggle the gripper to try to drop the object. Weight checking is not precise, so give the smallest practical weight change for the object being placed. If <=0, no weight checking will be carried out.
  - result: _result_ (**bool**) indicating whether the action succeeded
  - feedback: N/A
  - notes: _goal\_tf_ should be oriented so that z points upwards from the surface: this specifies that the object should be placed on a horizontal surface.

* GiveObjectToOperator.action
	- input: N/A
	- result: _result_ (**bool**) indicating whether the action succeeded
	- feedback: N/A
	- notes: Will present object in front of the HSR 

* ReceiveObjectFromOperator.action
	- input: N/A
	- result: _result_ (**bool**) indicating whether the action succeeded
	- feedback: N/A
	- notes: Hold on the arm directly in front and opens the gripper

* OpenBinLid.action
	- input: _goal\_tf_ (**string**) indicating where the lid is (provisional)
	- result: _result_ (**bool**) indicating whether the action succeeded
	- feedback: N/A
	- notes: Assumes that the robot is in front of a bin and will use point clouds to determine the bin lid handle. The action will lift up the lid. Must use additional actions to move back and place on floor etc.

* PlaceObjectRelative.action
	- input: goal_tf, x, y, z (**string**, **float32**, **float32**, **float32**)
	- result: _result_ (**bool**) indicating whether the action succeeded
	- feedback: N/A
	- notes: This action will place an object relative to a tf (e.g. another object seen and published by perception). Please ensure that x,y,z are given in standard robot axis convention (base_footprint) i.e x in front, y to left and z up. 


### Vision Actions
* CheckForObject.action
	- input: object_name
	- result: is_present (**bool**)
	- feedback: N/A
	- notes: This action checks whether the object specified by object_name (e.g. potted_plant) is in sight of the robot.

* CheckForBarDrinks.action
	- input: N/A
	- result: drinks, is_present(**string[]**, **bool**)
	- feedback: N/A
	- notes: This action will return the drink names on the bar. For use please first set the names of drinks, e.g. bottle, and names of the bar, e.g. table in the server file.

* Pointing.action
	- input: N/A
	- result: pointing_array, is_present(**PointingArray**, **bool**)
	- feedback: N/A
	- notes: This pointing_array message is a list of Pointing message. Each pointing message contains a color to mark which person, and a list of detections of objects that contains all information about the pointed objects.
### Speech Actions
* Speak.action
    - removed since HSR already defines an action server named ``/talk_request_action``. Actions are defined in ``tmc_msgs``. Any speech to the robot could be sent as below:
    
    
    ```
    from tmc_msgs.msg import TalkRequestAction, TalkRequestGoal, Voice
    
    talk_client = SimpleActionClient('talk_request_action', TalkRequestAction)
    # ...
    
    talk_goal = TalkRequestGoal()
    talk_goal.data.language = Voice.kEnglish
    talk_goal.data.sentence = text
    
    talk_client.send_goal(talk_goal)
    talk_client.wait_for_result()
    ```
	

* SpeakAndListen.action
	- input: question (**string**), candidates (**string[]**), params (**string[]**), timeout (**float32**),
	- result: answer (**string**), param (**string**), confidence (**float32**), transcription (**string**), succeeded (**bool**)
	- feedback: remaining (**float32**), answer (**string**), param (**string**), confidence (**float32**), transcription (**string**)
	- notes: Given an array of candiate answers, choose the best guess based on the voice input. Up to one parameter with multiple options could be given as a separate array.
	
* HotwordListen.action
	- input: timeout (**float32**), hotwords (**string[]**)
	- result: succeeded (**bool**), hotword (**string**)
	- feedback: N/A
	- notes: Detects a hotword (predefined)

### Semantic mapping
 This is no longer functional!!!
* SOMClearDatabase.srv
	- input:
	- returns:
	- description: deletes all objects from database.

* SOMObserve.srv
	- input: SOMObservation observation 
	- returns: bool result, string obj_id 
	- description: if SOMObservation has empty obj_id, creates new object in semantic map. If obj_id of existing object is supplied updates existing object in semantic map.
	
* SOMLookup.srv
	- input: string obj_id
	- returns: SOMObject object
	- description: lookup an object in the semantic map by id
	
* SOMGetRoom.srv
	- input: geometry_msgs/Pose pose
	- returns: string room_name
	- description: returns the name of a room given a pose.
	
* SOMCheckSimilarity.srv
	- input: SOMObservation obj1, SOMObservation obj2
	- returns: float32 similarity, string common_type
	- description: returns the similarity of two object types. Lower similarity is more similar. Common type is shared parent class. For example, the common type of apple and banana is fruit.
	
* SOMQuery.srv
	- input: SOMObservation obj1, Relation relation, SOMObservation obj2, geometry_msgs/Pose, current_robot_pose
	- output: Match[] matches
	- description: returns tuples which match the specification 'obj1 relation to obj2'
