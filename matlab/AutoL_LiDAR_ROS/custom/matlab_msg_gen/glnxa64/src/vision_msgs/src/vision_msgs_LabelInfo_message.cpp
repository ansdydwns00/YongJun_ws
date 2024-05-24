// Copyright 2020-2022 The MathWorks, Inc.
// Common copy functions for vision_msgs/LabelInfo
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
#include "vision_msgs/msg/label_info.hpp"
#include "visibility_control.h"
#include "class_loader/multi_library_class_loader.hpp"
#include "ROS2PubSubTemplates.hpp"
class VISION_MSGS_EXPORT ros2_vision_msgs_msg_LabelInfo_common : public MATLABROS2MsgInterface<vision_msgs::msg::LabelInfo> {
  public:
    virtual ~ros2_vision_msgs_msg_LabelInfo_common(){}
    virtual void copy_from_struct(vision_msgs::msg::LabelInfo* msg, const matlab::data::Struct& arr, MultiLibLoader loader); 
    //----------------------------------------------------------------------------
    virtual MDArray_T get_arr(MDFactory_T& factory, const vision_msgs::msg::LabelInfo* msg, MultiLibLoader loader, size_t size = 1);
};
  void ros2_vision_msgs_msg_LabelInfo_common::copy_from_struct(vision_msgs::msg::LabelInfo* msg, const matlab::data::Struct& arr,
               MultiLibLoader loader) {
    try {
        //header
        const matlab::data::StructArray header_arr = arr["header"];
        auto msgClassPtr_header = getCommonObject<std_msgs::msg::Header>("ros2_std_msgs_msg_Header_common",loader);
        msgClassPtr_header->copy_from_struct(&msg->header,header_arr[0],loader);
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'header' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'header' is wrong type; expected a struct.");
    }
    try {
        //class_map
        const matlab::data::StructArray class_map_arr = arr["class_map"];
        for (auto _class_maparr : class_map_arr) {
        	vision_msgs::msg::VisionClass _val;
        auto msgClassPtr_class_map = getCommonObject<vision_msgs::msg::VisionClass>("ros2_vision_msgs_msg_VisionClass_common",loader);
        msgClassPtr_class_map->copy_from_struct(&_val,_class_maparr,loader);
        	msg->class_map.push_back(_val);
        }
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'class_map' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'class_map' is wrong type; expected a struct.");
    }
    try {
        //threshold
        const matlab::data::TypedArray<float> threshold_arr = arr["threshold"];
        msg->threshold = threshold_arr[0];
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'threshold' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'threshold' is wrong type; expected a single.");
    }
  }
  //----------------------------------------------------------------------------
  MDArray_T ros2_vision_msgs_msg_LabelInfo_common::get_arr(MDFactory_T& factory, const vision_msgs::msg::LabelInfo* msg,
       MultiLibLoader loader, size_t size) {
    auto outArray = factory.createStructArray({size,1},{"MessageType","header","class_map","threshold"});
    for(size_t ctr = 0; ctr < size; ctr++){
    outArray[ctr]["MessageType"] = factory.createCharArray("vision_msgs/LabelInfo");
    // header
    auto currentElement_header = (msg + ctr)->header;
    auto msgClassPtr_header = getCommonObject<std_msgs::msg::Header>("ros2_std_msgs_msg_Header_common",loader);
    outArray[ctr]["header"] = msgClassPtr_header->get_arr(factory, &currentElement_header, loader);
    // class_map
    auto currentElement_class_map = (msg + ctr)->class_map;
    auto msgClassPtr_class_map = getCommonObject<vision_msgs::msg::VisionClass>("ros2_vision_msgs_msg_VisionClass_common",loader);
    outArray[ctr]["class_map"] = msgClassPtr_class_map->get_arr(factory,&currentElement_class_map[0],loader,currentElement_class_map.size());
    // threshold
    auto currentElement_threshold = (msg + ctr)->threshold;
    outArray[ctr]["threshold"] = factory.createScalar(currentElement_threshold);
    }
    return std::move(outArray);
  } 
class VISION_MSGS_EXPORT ros2_vision_msgs_LabelInfo_message : public ROS2MsgElementInterfaceFactory {
  public:
    virtual ~ros2_vision_msgs_LabelInfo_message(){}
    virtual std::shared_ptr<MATLABPublisherInterface> generatePublisherInterface(ElementType /*type*/);
    virtual std::shared_ptr<MATLABSubscriberInterface> generateSubscriberInterface(ElementType /*type*/);
    virtual std::shared_ptr<void> generateCppMessage(ElementType /*type*/, const matlab::data::StructArray& /* arr */, MultiLibLoader /* loader */, std::map<std::string,std::shared_ptr<MATLABROS2MsgInterfaceBase>>* /*commonObjMap*/);
    virtual matlab::data::StructArray generateMLMessage(ElementType  /*type*/ ,void*  /* msg */, MultiLibLoader /* loader */ , std::map<std::string,std::shared_ptr<MATLABROS2MsgInterfaceBase>>* /*commonObjMap*/);
};  
  std::shared_ptr<MATLABPublisherInterface> 
          ros2_vision_msgs_LabelInfo_message::generatePublisherInterface(ElementType /*type*/){
    return std::make_shared<ROS2PublisherImpl<vision_msgs::msg::LabelInfo,ros2_vision_msgs_msg_LabelInfo_common>>();
  }
  std::shared_ptr<MATLABSubscriberInterface> 
         ros2_vision_msgs_LabelInfo_message::generateSubscriberInterface(ElementType /*type*/){
    return std::make_shared<ROS2SubscriberImpl<vision_msgs::msg::LabelInfo,ros2_vision_msgs_msg_LabelInfo_common>>();
  }
  std::shared_ptr<void> ros2_vision_msgs_LabelInfo_message::generateCppMessage(ElementType /*type*/, 
                                           const matlab::data::StructArray& arr,
                                           MultiLibLoader loader,
                                           std::map<std::string,std::shared_ptr<MATLABROS2MsgInterfaceBase>>* commonObjMap){
    auto msg = std::make_shared<vision_msgs::msg::LabelInfo>();
    ros2_vision_msgs_msg_LabelInfo_common commonObj;
    commonObj.mCommonObjMap = commonObjMap;
    commonObj.copy_from_struct(msg.get(), arr[0], loader);
    return msg;
  }
  matlab::data::StructArray ros2_vision_msgs_LabelInfo_message::generateMLMessage(ElementType  /*type*/ ,
                                                    void*  msg ,
                                                    MultiLibLoader  loader ,
                                                    std::map<std::string,std::shared_ptr<MATLABROS2MsgInterfaceBase>>*  commonObjMap ){
    ros2_vision_msgs_msg_LabelInfo_common commonObj;	
    commonObj.mCommonObjMap = commonObjMap;	
    MDFactory_T factory;
    return commonObj.get_arr(factory, (vision_msgs::msg::LabelInfo*)msg, loader);			
 }
#include "class_loader/register_macro.hpp"
// Register the component with class_loader.
// This acts as a sort of entry point, allowing the component to be discoverable when its library
// is being loaded into a running process.
CLASS_LOADER_REGISTER_CLASS(ros2_vision_msgs_msg_LabelInfo_common, MATLABROS2MsgInterface<vision_msgs::msg::LabelInfo>)
CLASS_LOADER_REGISTER_CLASS(ros2_vision_msgs_LabelInfo_message, ROS2MsgElementInterfaceFactory)
#ifdef _MSC_VER
#pragma warning(pop)
#else
#pragma GCC diagnostic pop
#endif //_MSC_VER