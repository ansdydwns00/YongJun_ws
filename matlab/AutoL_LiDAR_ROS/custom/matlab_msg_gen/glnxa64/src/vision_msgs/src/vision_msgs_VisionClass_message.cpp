// Copyright 2020-2022 The MathWorks, Inc.
// Common copy functions for vision_msgs/VisionClass
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
#include "vision_msgs/msg/vision_class.hpp"
#include "visibility_control.h"
#include "class_loader/multi_library_class_loader.hpp"
#include "ROS2PubSubTemplates.hpp"
class VISION_MSGS_EXPORT ros2_vision_msgs_msg_VisionClass_common : public MATLABROS2MsgInterface<vision_msgs::msg::VisionClass> {
  public:
    virtual ~ros2_vision_msgs_msg_VisionClass_common(){}
    virtual void copy_from_struct(vision_msgs::msg::VisionClass* msg, const matlab::data::Struct& arr, MultiLibLoader loader); 
    //----------------------------------------------------------------------------
    virtual MDArray_T get_arr(MDFactory_T& factory, const vision_msgs::msg::VisionClass* msg, MultiLibLoader loader, size_t size = 1);
};
  void ros2_vision_msgs_msg_VisionClass_common::copy_from_struct(vision_msgs::msg::VisionClass* msg, const matlab::data::Struct& arr,
               MultiLibLoader loader) {
    try {
        //class_id
        const matlab::data::TypedArray<uint16_t> class_id_arr = arr["class_id"];
        msg->class_id = class_id_arr[0];
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'class_id' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'class_id' is wrong type; expected a uint16.");
    }
    try {
        //class_name
        const matlab::data::CharArray class_name_arr = arr["class_name"];
        msg->class_name = class_name_arr.toAscii();
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'class_name' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'class_name' is wrong type; expected a string.");
    }
  }
  //----------------------------------------------------------------------------
  MDArray_T ros2_vision_msgs_msg_VisionClass_common::get_arr(MDFactory_T& factory, const vision_msgs::msg::VisionClass* msg,
       MultiLibLoader loader, size_t size) {
    auto outArray = factory.createStructArray({size,1},{"MessageType","class_id","class_name"});
    for(size_t ctr = 0; ctr < size; ctr++){
    outArray[ctr]["MessageType"] = factory.createCharArray("vision_msgs/VisionClass");
    // class_id
    auto currentElement_class_id = (msg + ctr)->class_id;
    outArray[ctr]["class_id"] = factory.createScalar(currentElement_class_id);
    // class_name
    auto currentElement_class_name = (msg + ctr)->class_name;
    outArray[ctr]["class_name"] = factory.createCharArray(currentElement_class_name);
    }
    return std::move(outArray);
  } 
class VISION_MSGS_EXPORT ros2_vision_msgs_VisionClass_message : public ROS2MsgElementInterfaceFactory {
  public:
    virtual ~ros2_vision_msgs_VisionClass_message(){}
    virtual std::shared_ptr<MATLABPublisherInterface> generatePublisherInterface(ElementType /*type*/);
    virtual std::shared_ptr<MATLABSubscriberInterface> generateSubscriberInterface(ElementType /*type*/);
    virtual std::shared_ptr<void> generateCppMessage(ElementType /*type*/, const matlab::data::StructArray& /* arr */, MultiLibLoader /* loader */, std::map<std::string,std::shared_ptr<MATLABROS2MsgInterfaceBase>>* /*commonObjMap*/);
    virtual matlab::data::StructArray generateMLMessage(ElementType  /*type*/ ,void*  /* msg */, MultiLibLoader /* loader */ , std::map<std::string,std::shared_ptr<MATLABROS2MsgInterfaceBase>>* /*commonObjMap*/);
};  
  std::shared_ptr<MATLABPublisherInterface> 
          ros2_vision_msgs_VisionClass_message::generatePublisherInterface(ElementType /*type*/){
    return std::make_shared<ROS2PublisherImpl<vision_msgs::msg::VisionClass,ros2_vision_msgs_msg_VisionClass_common>>();
  }
  std::shared_ptr<MATLABSubscriberInterface> 
         ros2_vision_msgs_VisionClass_message::generateSubscriberInterface(ElementType /*type*/){
    return std::make_shared<ROS2SubscriberImpl<vision_msgs::msg::VisionClass,ros2_vision_msgs_msg_VisionClass_common>>();
  }
  std::shared_ptr<void> ros2_vision_msgs_VisionClass_message::generateCppMessage(ElementType /*type*/, 
                                           const matlab::data::StructArray& arr,
                                           MultiLibLoader loader,
                                           std::map<std::string,std::shared_ptr<MATLABROS2MsgInterfaceBase>>* commonObjMap){
    auto msg = std::make_shared<vision_msgs::msg::VisionClass>();
    ros2_vision_msgs_msg_VisionClass_common commonObj;
    commonObj.mCommonObjMap = commonObjMap;
    commonObj.copy_from_struct(msg.get(), arr[0], loader);
    return msg;
  }
  matlab::data::StructArray ros2_vision_msgs_VisionClass_message::generateMLMessage(ElementType  /*type*/ ,
                                                    void*  msg ,
                                                    MultiLibLoader  loader ,
                                                    std::map<std::string,std::shared_ptr<MATLABROS2MsgInterfaceBase>>*  commonObjMap ){
    ros2_vision_msgs_msg_VisionClass_common commonObj;	
    commonObj.mCommonObjMap = commonObjMap;	
    MDFactory_T factory;
    return commonObj.get_arr(factory, (vision_msgs::msg::VisionClass*)msg, loader);			
 }
#include "class_loader/register_macro.hpp"
// Register the component with class_loader.
// This acts as a sort of entry point, allowing the component to be discoverable when its library
// is being loaded into a running process.
CLASS_LOADER_REGISTER_CLASS(ros2_vision_msgs_msg_VisionClass_common, MATLABROS2MsgInterface<vision_msgs::msg::VisionClass>)
CLASS_LOADER_REGISTER_CLASS(ros2_vision_msgs_VisionClass_message, ROS2MsgElementInterfaceFactory)
#ifdef _MSC_VER
#pragma warning(pop)
#else
#pragma GCC diagnostic pop
#endif //_MSC_VER