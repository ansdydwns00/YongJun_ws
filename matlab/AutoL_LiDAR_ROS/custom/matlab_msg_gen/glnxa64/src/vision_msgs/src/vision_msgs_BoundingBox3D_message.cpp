// Copyright 2020-2022 The MathWorks, Inc.
// Common copy functions for vision_msgs/BoundingBox3D
#ifdef _MSC_VER
#pragma warning(push)
#pragma warning(disable : 4100)
#pragma warning(disable : 4265)
#pragma warning(disable : 4456)
#pragma warning(disable : 4458)
#pragma warning(disable : 4946)
#pragma warning(disable : 4244)
#else
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wpedantic"
#pragma GCC diagnostic ignored "-Wunused-local-typedefs"
#pragma GCC diagnostic ignored "-Wredundant-decls"
#pragma GCC diagnostic ignored "-Wnon-virtual-dtor"
#pragma GCC diagnostic ignored "-Wdelete-non-virtual-dtor"
#pragma GCC diagnostic ignored "-Wunused-parameter"
#pragma GCC diagnostic ignored "-Wunused-variable"
#pragma GCC diagnostic ignored "-Wshadow"
#pragma GCC diagnostic ignored "-Wdeprecated-declarations"
#endif //_MSC_VER
#include "rclcpp/rclcpp.hpp"
#include "vision_msgs/msg/bounding_box3_d.hpp"
#include "visibility_control.h"
#include "class_loader/multi_library_class_loader.hpp"
#include "ROS2PubSubTemplates.hpp"
class VISION_MSGS_EXPORT ros2_vision_msgs_msg_BoundingBox3D_common : public MATLABROS2MsgInterface<vision_msgs::msg::BoundingBox3D> {
  public:
    virtual ~ros2_vision_msgs_msg_BoundingBox3D_common(){}
    virtual void copy_from_struct(vision_msgs::msg::BoundingBox3D* msg, const matlab::data::Struct& arr, MultiLibLoader loader); 
    //----------------------------------------------------------------------------
    virtual MDArray_T get_arr(MDFactory_T& factory, const vision_msgs::msg::BoundingBox3D* msg, MultiLibLoader loader, size_t size = 1);
};
  void ros2_vision_msgs_msg_BoundingBox3D_common::copy_from_struct(vision_msgs::msg::BoundingBox3D* msg, const matlab::data::Struct& arr,
               MultiLibLoader loader) {
    try {
        //center
        const matlab::data::StructArray center_arr = arr["center"];
        auto msgClassPtr_center = getCommonObject<geometry_msgs::msg::Pose>("ros2_geometry_msgs_msg_Pose_common",loader);
        msgClassPtr_center->copy_from_struct(&msg->center,center_arr[0],loader);
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'center' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'center' is wrong type; expected a struct.");
    }
    try {
        //size
        const matlab::data::StructArray size_arr = arr["size"];
        auto msgClassPtr_size = getCommonObject<geometry_msgs::msg::Vector3>("ros2_geometry_msgs_msg_Vector3_common",loader);
        msgClassPtr_size->copy_from_struct(&msg->size,size_arr[0],loader);
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'size' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'size' is wrong type; expected a struct.");
    }
  }
  //----------------------------------------------------------------------------
  MDArray_T ros2_vision_msgs_msg_BoundingBox3D_common::get_arr(MDFactory_T& factory, const vision_msgs::msg::BoundingBox3D* msg,
       MultiLibLoader loader, size_t size) {
    auto outArray = factory.createStructArray({size,1},{"MessageType","center","size"});
    for(size_t ctr = 0; ctr < size; ctr++){
    outArray[ctr]["MessageType"] = factory.createCharArray("vision_msgs/BoundingBox3D");
    // center
    auto currentElement_center = (msg + ctr)->center;
    auto msgClassPtr_center = getCommonObject<geometry_msgs::msg::Pose>("ros2_geometry_msgs_msg_Pose_common",loader);
    outArray[ctr]["center"] = msgClassPtr_center->get_arr(factory, &currentElement_center, loader);
    // size
    auto currentElement_size = (msg + ctr)->size;
    auto msgClassPtr_size = getCommonObject<geometry_msgs::msg::Vector3>("ros2_geometry_msgs_msg_Vector3_common",loader);
    outArray[ctr]["size"] = msgClassPtr_size->get_arr(factory, &currentElement_size, loader);
    }
    return std::move(outArray);
  } 
class VISION_MSGS_EXPORT ros2_vision_msgs_BoundingBox3D_message : public ROS2MsgElementInterfaceFactory {
  public:
    virtual ~ros2_vision_msgs_BoundingBox3D_message(){}
    virtual std::shared_ptr<MATLABPublisherInterface> generatePublisherInterface(ElementType /*type*/);
    virtual std::shared_ptr<MATLABSubscriberInterface> generateSubscriberInterface(ElementType /*type*/);
    virtual std::shared_ptr<void> generateCppMessage(ElementType /*type*/, const matlab::data::StructArray& /* arr */, MultiLibLoader /* loader */, std::map<std::string,std::shared_ptr<MATLABROS2MsgInterfaceBase>>* /*commonObjMap*/);
    virtual matlab::data::StructArray generateMLMessage(ElementType  /*type*/ ,void*  /* msg */, MultiLibLoader /* loader */ , std::map<std::string,std::shared_ptr<MATLABROS2MsgInterfaceBase>>* /*commonObjMap*/);
};  
  std::shared_ptr<MATLABPublisherInterface> 
          ros2_vision_msgs_BoundingBox3D_message::generatePublisherInterface(ElementType /*type*/){
    return std::make_shared<ROS2PublisherImpl<vision_msgs::msg::BoundingBox3D,ros2_vision_msgs_msg_BoundingBox3D_common>>();
  }
  std::shared_ptr<MATLABSubscriberInterface> 
         ros2_vision_msgs_BoundingBox3D_message::generateSubscriberInterface(ElementType /*type*/){
    return std::make_shared<ROS2SubscriberImpl<vision_msgs::msg::BoundingBox3D,ros2_vision_msgs_msg_BoundingBox3D_common>>();
  }
  std::shared_ptr<void> ros2_vision_msgs_BoundingBox3D_message::generateCppMessage(ElementType /*type*/, 
                                           const matlab::data::StructArray& arr,
                                           MultiLibLoader loader,
                                           std::map<std::string,std::shared_ptr<MATLABROS2MsgInterfaceBase>>* commonObjMap){
    auto msg = std::make_shared<vision_msgs::msg::BoundingBox3D>();
    ros2_vision_msgs_msg_BoundingBox3D_common commonObj;
    commonObj.mCommonObjMap = commonObjMap;
    commonObj.copy_from_struct(msg.get(), arr[0], loader);
    return msg;
  }
  matlab::data::StructArray ros2_vision_msgs_BoundingBox3D_message::generateMLMessage(ElementType  /*type*/ ,
                                                    void*  msg ,
                                                    MultiLibLoader  loader ,
                                                    std::map<std::string,std::shared_ptr<MATLABROS2MsgInterfaceBase>>*  commonObjMap ){
    ros2_vision_msgs_msg_BoundingBox3D_common commonObj;	
    commonObj.mCommonObjMap = commonObjMap;	
    MDFactory_T factory;
    return commonObj.get_arr(factory, (vision_msgs::msg::BoundingBox3D*)msg, loader);			
 }
#include "class_loader/register_macro.hpp"
// Register the component with class_loader.
// This acts as a sort of entry point, allowing the component to be discoverable when its library
// is being loaded into a running process.
CLASS_LOADER_REGISTER_CLASS(ros2_vision_msgs_msg_BoundingBox3D_common, MATLABROS2MsgInterface<vision_msgs::msg::BoundingBox3D>)
CLASS_LOADER_REGISTER_CLASS(ros2_vision_msgs_BoundingBox3D_message, ROS2MsgElementInterfaceFactory)
#ifdef _MSC_VER
#pragma warning(pop)
#else
#pragma GCC diagnostic pop
#endif //_MSC_VER