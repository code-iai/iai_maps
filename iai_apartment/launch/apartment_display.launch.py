from launch import LaunchDescription
from launch.actions import IncludeLaunchDescription
from launch_ros.actions import Node 
from launch.launch_description_sources import PythonLaunchDescriptionSource
from ament_index_python.packages import get_package_share_directory
import os

def generate_launch_description():
    iai_apartment_dir = get_package_share_directory('iai_apartment')
    bringup_launch = os.path.join(iai_apartment_dir, 'launch', 'apartment_bringup.launch.py')
    rviz_config = os.path.join(iai_apartment_dir, 'rviz_config', 'rviz_config.rviz')
    print(f"Using RViz config: {rviz_config}")

    return LaunchDescription([
        IncludeLaunchDescription(
            PythonLaunchDescriptionSource(bringup_launch)
        ),
        Node(
            package='rviz2',
            executable='rviz2',
            name='rviz',
            arguments=['-d', rviz_config]
        )
    ])