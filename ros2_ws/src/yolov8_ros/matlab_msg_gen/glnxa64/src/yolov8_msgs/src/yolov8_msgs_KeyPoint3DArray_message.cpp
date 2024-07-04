// Copyright 2020-2022 The MathWorks, Inc.
// Common copy functions for yolov8_msgs/KeyPoint3DArray
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
#include "yolov8_msgs/msg/key_point3_d_array.hpp"
#include "visibility_control.h"
#include "class_loader/multi_library_class_loader.hpp"
#include "ROS2PubSubTemplates.hpp"
class YOLOV8_MSGS_EXPORT ros2_yolov8_msgs_msg_KeyPoint3DArray_common : public MATLABROS2MsgInterface<yolov8_msgs::msg::KeyPoint3DArray> {
  public:
    virtual ~ros2_yolov8_msgs_msg_KeyPoint3DArray_common(){}
    virtual void copy_from_struct(yolov8_msgs::msg::KeyPoint3DArray* msg, const matlab::data::Struct& arr, MultiLibLoader loader); 
    //----------------------------------------------------------------------------
    virtual MDArray_T get_arr(MDFactory_T& factory, const yolov8_msgs::msg::KeyPoint3DArray* msg, MultiLibLoader loader, size_t size = 1);
};
  void ros2_yolov8_msgs_msg_KeyPoint3DArray_common::copy_from_struct(yolov8_msgs::msg::KeyPoint3DArray* msg, const matlab::data::Struct& arr,
               MultiLibLoader loader) {
    try {
        //data
        const matlab::data::StructArray data_arr = arr["data"];
        for (auto _dataarr : data_arr) {
        	yolov8_msgs::msg::KeyPoint3D _val;
        auto msgClassPtr_data = getCommonObject<yolov8_msgs::msg::KeyPoint3D>("ros2_yolov8_msgs_msg_KeyPoint3D_common",loader);
        msgClassPtr_data->copy_from_struct(&_val,_dataarr,loader);
        	msg->data.push_back(_val);
        }
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'data' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'data' is wrong type; expected a struct.");
    }
    try {
        //frame_id
        const matlab::data::CharArray frame_id_arr = arr["frame_id"];
        msg->frame_id = frame_id_arr.toAscii();
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'frame_id' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'frame_id' is wrong type; expected a string.");
    }
  }
  //----------------------------------------------------------------------------
  MDArray_T ros2_yolov8_msgs_msg_KeyPoint3DArray_common::get_arr(MDFactory_T& factory, const yolov8_msgs::msg::KeyPoint3DArray* msg,
       MultiLibLoader loader, size_t size) {
    auto outArray = factory.createStructArray({size,1},{"MessageType","data","frame_id"});
    for(size_t ctr = 0; ctr < size; ctr++){
    outArray[ctr]["MessageType"] = factory.createCharArray("yolov8_msgs/KeyPoint3DArray");
    // data
    auto currentElement_data = (msg + ctr)->data;
    auto msgClassPtr_data = getCommonObject<yolov8_msgs::msg::KeyPoint3D>("ros2_yolov8_msgs_msg_KeyPoint3D_common",loader);
    outArray[ctr]["data"] = msgClassPtr_data->get_arr(factory,&currentElement_data[0],loader,currentElement_data.size());
    // frame_id
    auto currentElement_frame_id = (msg + ctr)->frame_id;
    outArray[ctr]["frame_id"] = factory.createCharArray(currentElement_frame_id);
    }
    return std::move(outArray);
  } 
class YOLOV8_MSGS_EXPORT ros2_yolov8_msgs_KeyPoint3DArray_message : public ROS2MsgElementInterfaceFactory {
  public:
    virtual ~ros2_yolov8_msgs_KeyPoint3DArray_message(){}
    virtual std::shared_ptr<MATLABPublisherInterface> generatePublisherInterface(ElementType /*type*/);
    virtual std::shared_ptr<MATLABSubscriberInterface> generateSubscriberInterface(ElementType /*type*/);
    virtual std::shared_ptr<void> generateCppMessage(ElementType /*type*/, const matlab::data::StructArray& /* arr */, MultiLibLoader /* loader */, std::map<std::string,std::shared_ptr<MATLABROS2MsgInterfaceBase>>* /*commonObjMap*/);
    virtual matlab::data::StructArray generateMLMessage(ElementType  /*type*/ ,void*  /* msg */, MultiLibLoader /* loader */ , std::map<std::string,std::shared_ptr<MATLABROS2MsgInterfaceBase>>* /*commonObjMap*/);
};  
  std::shared_ptr<MATLABPublisherInterface> 
          ros2_yolov8_msgs_KeyPoint3DArray_message::generatePublisherInterface(ElementType /*type*/){
    return std::make_shared<ROS2PublisherImpl<yolov8_msgs::msg::KeyPoint3DArray,ros2_yolov8_msgs_msg_KeyPoint3DArray_common>>();
  }
  std::shared_ptr<MATLABSubscriberInterface> 
         ros2_yolov8_msgs_KeyPoint3DArray_message::generateSubscriberInterface(ElementType /*type*/){
    return std::make_shared<ROS2SubscriberImpl<yolov8_msgs::msg::KeyPoint3DArray,ros2_yolov8_msgs_msg_KeyPoint3DArray_common>>();
  }
  std::shared_ptr<void> ros2_yolov8_msgs_KeyPoint3DArray_message::generateCppMessage(ElementType /*type*/, 
                                           const matlab::data::StructArray& arr,
                                           MultiLibLoader loader,
                                           std::map<std::string,std::shared_ptr<MATLABROS2MsgInterfaceBase>>* commonObjMap){
    auto msg = std::make_shared<yolov8_msgs::msg::KeyPoint3DArray>();
    ros2_yolov8_msgs_msg_KeyPoint3DArray_common commonObj;
    commonObj.mCommonObjMap = commonObjMap;
    commonObj.copy_from_struct(msg.get(), arr[0], loader);
    return msg;
  }
  matlab::data::StructArray ros2_yolov8_msgs_KeyPoint3DArray_message::generateMLMessage(ElementType  /*type*/ ,
                                                    void*  msg ,
                                                    MultiLibLoader  loader ,
                                                    std::map<std::string,std::shared_ptr<MATLABROS2MsgInterfaceBase>>*  commonObjMap ){
    ros2_yolov8_msgs_msg_KeyPoint3DArray_common commonObj;	
    commonObj.mCommonObjMap = commonObjMap;	
    MDFactory_T factory;
    return commonObj.get_arr(factory, (yolov8_msgs::msg::KeyPoint3DArray*)msg, loader);			
 }
#include "class_loader/register_macro.hpp"
// Register the component with class_loader.
// This acts as a sort of entry point, allowing the component to be discoverable when its library
// is being loaded into a running process.
CLASS_LOADER_REGISTER_CLASS(ros2_yolov8_msgs_msg_KeyPoint3DArray_common, MATLABROS2MsgInterface<yolov8_msgs::msg::KeyPoint3DArray>)
CLASS_LOADER_REGISTER_CLASS(ros2_yolov8_msgs_KeyPoint3DArray_message, ROS2MsgElementInterfaceFactory)
#ifdef _MSC_VER
#pragma warning(pop)
#else
#pragma GCC diagnostic pop
#endif //_MSC_VER