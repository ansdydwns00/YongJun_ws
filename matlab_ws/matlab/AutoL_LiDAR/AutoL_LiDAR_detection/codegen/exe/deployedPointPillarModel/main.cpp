
//
// File main.cpp
//
// Code generated for MATLAB function 'deployedPointPillarModel'.
//
// MATLAB Coder version         : 23.2 (R2023b) 01-Aug-2023
// C/C++ source code generated on : Tue Jun 04 16:24:57 2024
//
#include <thread>
#include <vector>
#include "rclcpp/rclcpp.hpp"
#include "deployedPointPillarModel.h"
rclcpp::Node::SharedPtr gNodePtr;
rclcpp::executors::MultiThreadedExecutor::SharedPtr gMultiExec;
bool threadTerminating = false;
void threadFunction(void)
{
    try {
        deployedPointPillarModel();
    } catch (std::runtime_error & e) {
        std::cout << "Caught exception: " << e.what() << std::endl;
    } catch (...) {
        std::cout << "Caught unknown exception, terminating the program." << std::endl;
    }
    gMultiExec->cancel();
    gMultiExec->remove_node(gNodePtr);
    threadTerminating = true;
    rclcpp::shutdown();
}
int main(int argc, char * const argv[])
{
    std::vector<char *> args(argv, argv + argc);
    rclcpp::init(static_cast<int>(args.size()), args.data());
    gNodePtr = std::make_shared<rclcpp::Node>("DetectionNode","");
    // Declare parameters if there is any
    gMultiExec = std::make_shared<rclcpp::executors::MultiThreadedExecutor>();
    gMultiExec->add_node(gNodePtr);
    std::thread threadObj(threadFunction);
    gMultiExec->spin();
    if (threadTerminating) {
    threadObj.join();
    }
    return 0;
}
