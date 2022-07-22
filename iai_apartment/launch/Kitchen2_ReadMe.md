# Kitchen 2.0

## How to run
You do `roslaunch iai_kitchen2 kitchen2_display.launch`

## Known Issues

Set `iai_kitchen2/kitchen_root` as fixed frame in rviz Displays setting panel if it throws a "known frame map" issue.

Click on add and add a robot model if there is none. Change the `robot_description` to `apartment_description` in the robot description settings and in the `TF Prefix` write `iai_kitchen2`. 

Save your config file as `rviz_config.rviz` in the rviz config folder. Do not commit your rviz config file. if your config file got corrupted, fix it by removing the config file and going through these steps again. 

