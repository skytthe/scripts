
echo "Important!​: For the later installation of ROS you have to configure your Ubuntu repositories to allow \"restricted,\" \"universe,\" and \"multiverse\". Please follow the Ubuntu guide for instructionson how to do this: ​https://help.ubuntu.com/community/Repositories/Ubuntu"

read -p "Continue (y/n)?" choice
case "$choice" in 
  y|Y ) echo "go!";;
  n|N ) exit;;
  * ) echo "invalid";;
esac


#  install the some packages
sudo apt install wget curl htop build-essential dkms linux-headers-$(uname -r)

# update and upgrade
sudo apt update
sudo apt upgrade
sudo apt-get update
sudo apt-get upgrade

#install terminator command line
sudo apt install terminator

#install git
sudo apt install git

###################
# install ROS     #
###################
## Setup your sources.list and your keys
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

## update and upgrade
sudo apt update
sudo apt upgrade
sudo apt-get update
sudo apt-get upgrade

## instal ROS
sudo apt install ros-melodic-desktop-full

## Dependencies for building packages
sudo apt install python-rosdep python-rosinstall python-rosinstall-generator python-wstool

# Installing catkin_tools
sudo apt-get install python-catkin-tools

## update and upgrade
sudo apt update
sudo apt upgrade
sudo apt-get update
sudo apt-get upgrade

## Environment setup
echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
source ~/.bashrc

## Initialize rosdep
sudo rosdep init
rosdep update
source /opt/ros/melodic/setup.bash

## Create workspace
mkdir -p ~/catkin_ws/src
cd ~/catkin_ws
source /opt/ros/melodic/setup.bash
catkin init

## Build the workspace
cd ~/catkin_ws/
source /opt/ros/melodic/setup.bash
catkin build

## Source your workspace:
cd ~/catkin_ws/
echo "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc
source ~/.bashrc

#Links:
#
# https://ethz.ch/content/dam/ethz/special-interest/mavt/robotics-n-intelligent-systems/rsl-dam/ROS2020/HowToSetupDeveloperPC_18-04.pdf
#
# http://wiki.ros.org/melodic/Installation/Ubuntu
#
# https://catkin-tools.readthedocs.io/en/latest/installing.html#installing-on-ubuntu-with-apt-get
#

# install VS code editor with extensions
sudo snap install --classic code
code --install-extension DotJoshJohnson.xml
code --install-extension ms-python.python
code --install-extension ms-vscode.cmake-tools
code --install-extension ms-vscode.cpptools
code --install-extension ms-iot.vscode-ros


# install ROS packages
sudo apt install ros-melodic-tf2-tools
sudo apt install liburdfdom-tools
sudo apt install ros-melodic-gazebo-ros-control
sudo apt install ros-melodic-joint-trajectory-controller


sudo apt-get install ros-melodic-moveit*
sudo apt-get install ros-melodic-geometric-shapes
sudo apt-get install ros-melodic-moveit ros-melodic-moveit-msgs
sudo apt-get install ros-melodic-rviz-visual-tools
sudo apt-get install ros-melodic-controller*

sudo apt-get install ros-melodic-gazebo-ros ros-melodic-eigen-conversions ros-melodic-object-recognition-msgs ros-melodic-roslint libgazebo9* ros-melodic-moveit-core ros-melodic-moveit-ros ros-melodic-moveit-planners-ompl ros-melodic-moveit-fake-controller-manager ros-melodic-moveit-simple-controller-manager ros-melodic-gazebo-ros-control