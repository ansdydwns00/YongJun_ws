// Copyright 2020-2022 The MathWorks, Inc.
// Common copy functions for vision_msgs/BoundingBox3DArray
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
#include "vision_msgs/msg/bounding_box3_d_array.hpp"
#include "visibility_control.h"
#include "class_loader/multi_library_class_loader.hpp"
#include "ROS2PubSubTemplates.hpp"
class VISION_MSGS_EXPORT ros2_vision_msgs_msg_BoundingBox3DArray_common : public MATLABROS2MsgInterface<vision_msgs::msg::BoundingBox3DArray> {
  public:
    virtual ~ros2_vision_msgs_msg_BoundingBox3DArray_common(){}
    virtual void copy_from_struct(vision_msgs::msg::BoundingBox3DArray* msg, const matlab::data::Struct& arr, MultiLibLoader loader); 
    //----------------------------------------------------------------------------
    virtual MDArray_T get_arr(MDFactory_T& factory, const vision_msgs::msg::BoundingBox3DArray* msg, MultiLibLoader loader, size_t size = 1);
};
  void ros2_vision_msgs_msg_BoundingBox3DArray_common::copy_from_struct(vision_msgs::msg::BoundingBox3DArray* msg, const matlab::data::Struct& arr,
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
        //boxes
        const matlab::data::StructArray boxes_arr = arr["boxes"];
        for (auto _boxesarr : boxes_arr) {
        	vision_msgs::msg::BoundingBox3D _val;
        auto msgClassPtr_boxes = getCommonObject<vision_msgs::msg::BoundingBox3D>("ros2_vision_msgs_msg_BoundingBox3D_common",loader);
        msgClassPtr_boxes->copy_from_struct(&_val,_boxesarr,loader);
        	msg->boxes.push_back(_val);
        }
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'boxes' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'boxes' is wrong type; expected a struct.");
    }
  }
  //----------------------------------------------------------------------------
  MDArray_T ros2_vision_msgs_msg_BoundingBox3DArray_common::get_arr(MDFactory_T& factory, const vision_msgs::msg::BoundingBox3DArray* msg,
       MultiLibLoader loader, size_t size) {
    auto outArray = factory.createStructArray({size,1},{"MessageType","header","boxes"});
    for(size_t ctr = 0; ctr < size; ctr++){
    outArray[ctr]["MessageType"] = factory.createCharArray("vision_msgs/BoundingBox3DArray");
    // header
    auto currentElement_header = (msg + ctr)->header;
    auto msgClassPtr_header = getCommonObject<std_msgs::msg::Header>("ros2_std_msgs_msg_Header_common",loader);
    outArray[ctr]["header"] = msgClassPtr_header->get_arr(factory, &currentElement_header, loader);
    // boxes
    auto currentElement_boxes = (msg + ctr)->boxes;
    auto msgClassPtr_boxes = getCommonObject<vision_msgs::msg::BoundingBox3D>("ros2_vision_msgs_msg_BoundingBox3D_common",loader);
    outArray[ctr]["boxes"] = msgClassPtr_boxes->get_arr(factory,&currentElement_boxes[0],loader,currentElement_boxes.size());
    }
    return std::move(outArray);
  } 
class VISION_MSGS_EXPORT ros2_vision_msgs_BoundingBox3DArray_message : public ROS2MsgElementInterfaceFactory {
  public:
    virtual ~ros2_vision_msgs_BoundingBox3DArray_message(){}
    virtual std::shared_ptr<MATLABPublisherInterface> generatePublisherInterface(ElementType /*type*/);
    virtual std::shared_ptr<MATLABSubscriberInterface> generateSubscriberInterface(ElementType /*type*/);
    virtual std::shared_ptr<void> generateCppMessage(ElementType /*type*/, const matlab::data::StructArray& /* arr */, MultiLibLoader /* loader */, std::map<std::string,std::shared_ptr<MATLABROS2MsgInterfaceBase>>* /*commonObjMap*/);
    virtual matlab::data::StructArray generateMLMessage(ElementType  /*type*/ ,void*  /* msg */, MultiLibLoader /* loader */ , std::map<std::string,std::shared_ptr<MATLABROS2MsgInterfaceBase>>* /*commonObjMap*/);
};  
  std::shared_ptr<MATLABPublisherInterface> 
          ros2_vision_msgs_BoundingBox3DArray_message::generatePublisherInterface(ElementType /*type*/){
    return std::make_shared<ROS2PublisherImpl<vision_msgs::msg::BoundingBox3DArray,ros2_vision_msgs_msg_BoundingBox3DArray_common>>();
  }
  std::shared_ptr<MATLABSubscriberInterface> 
         ros2_vision_msgs_BoundingBox3DArray_message::generateSubscriberInterface(ElementType /*type*/){
    return std::make_shared<ROS2SubscriberImpl<vision_msgs::msg::BoundingBox3DArray,ros2_vision_msgs_msg_BoundingBox3DArray_common>>();
  }
  std::shared_ptr<void> ros2_vision_msgs_BoundingBox3DArray_message::generateCppMessage(ElementType /*type*/, 
                                           const matlab::data::StructArray& arr,
                                           MultiLibLoader loader,
                                           std::map<std::string,std::shared_ptr<MATLABROS2MsgInterfaceBase>>* commonObjMap){
    auto msg = std::make_shared<vision_msgs::msg::BoundingBox3DArray>();
    ros2_vision_msgs_msg_BoundingBox3DArray_common commonObj;
    commonObj.mCommonObjMap = commonObjMap;
    commonObj.copy_from_struct(msg.get(), arr[0], loader);
    return msg;
  }
  matlab::data::StructArray ros2_vision_msgs_BoundingBox3DArray_message::generateMLMessage(ElementType  /*type*/ ,
                                                    void*  msg ,
                                                    MultiLibLoader  loader ,
                                                    std::map<std::string,std::shared_ptr<MATLABROS2MsgInterfaceBase>>*  commonObjMap ){
    ros2_vision_msgs_msg_BoundingBox3DArray_common commonObj;	
    commonObj.mCommonObjMap = commonObjMap;	
    MDFactory_T factory;
    return commonObj.get_arr(factory, (vision_msgs::msg::BoundingBox3DArray*)msg, loader);			
 }
#include "class_loader/register_macro.hpp"
// Register the component with class_loader.
// This acts as a sort of entry point, allowing the component to be discoverable when its library
// is being loaded into a running process.
CLASS_LOADER_REGISTER_CLASS(ros2_vision_msgs_msg_BoundingBox3DArray_common, MATLABROS2MsgInterface<vision_msgs::msg::BoundingBox3DArray>)
CLASS_LOADER_REGISTER_CLASS(ros2_vision_msgs_BoundingBox3DArray_message, ROS2MsgElementInterfaceFactory)
#ifdef _MSC_VER
#pragma warning(pop)
#else
#pragma GCC diagnostic pop
#endif //_MSC_VER