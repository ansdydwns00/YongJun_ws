// Copyright 2020-2022 The MathWorks, Inc.
// Common copy functions for yolov8_msgs/KeyPoint2D
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
#include "yolov8_msgs/msg/key_point2_d.hpp"
#include "visibility_control.h"
#include "class_loader/multi_library_class_loader.hpp"
#include "ROS2PubSubTemplates.hpp"
class YOLOV8_MSGS_EXPORT ros2_yolov8_msgs_msg_KeyPoint2D_common : public MATLABROS2MsgInterface<yolov8_msgs::msg::KeyPoint2D> {
  public:
    virtual ~ros2_yolov8_msgs_msg_KeyPoint2D_common(){}
    virtual void copy_from_struct(yolov8_msgs::msg::KeyPoint2D* msg, const matlab::data::Struct& arr, MultiLibLoader loader); 
    //----------------------------------------------------------------------------
    virtual MDArray_T get_arr(MDFactory_T& factory, const yolov8_msgs::msg::KeyPoint2D* msg, MultiLibLoader loader, size_t size = 1);
};
  void ros2_yolov8_msgs_msg_KeyPoint2D_common::copy_from_struct(yolov8_msgs::msg::KeyPoint2D* msg, const matlab::data::Struct& arr,
               MultiLibLoader loader) {
    try {
        //id
        const matlab::data::TypedArray<int32_t> id_arr = arr["id"];
        msg->id = id_arr[0];
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'id' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'id' is wrong type; expected a int32.");
    }
    try {
        //point
        const matlab::data::StructArray point_arr = arr["point"];
        auto msgClassPtr_point = getCommonObject<yolov8_msgs::msg::Point2D>("ros2_yolov8_msgs_msg_Point2D_common",loader);
        msgClassPtr_point->copy_from_struct(&msg->point,point_arr[0],loader);
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'point' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'point' is wrong type; expected a struct.");
    }
    try {
        //score
        const matlab::data::TypedArray<double> score_arr = arr["score"];
        msg->score = score_arr[0];
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'score' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'score' is wrong type; expected a double.");
    }
  }
  //----------------------------------------------------------------------------
  MDArray_T ros2_yolov8_msgs_msg_KeyPoint2D_common::get_arr(MDFactory_T& factory, const yolov8_msgs::msg::KeyPoint2D* msg,
       MultiLibLoader loader, size_t size) {
    auto outArray = factory.createStructArray({size,1},{"MessageType","id","point","score"});
    for(size_t ctr = 0; ctr < size; ctr++){
    outArray[ctr]["MessageType"] = factory.createCharArray("yolov8_msgs/KeyPoint2D");
    // id
    auto currentElement_id = (msg + ctr)->id;
    outArray[ctr]["id"] = factory.createScalar(currentElement_id);
    // point
    auto currentElement_point = (msg + ctr)->point;
    auto msgClassPtr_point = getCommonObject<yolov8_msgs::msg::Point2D>("ros2_yolov8_msgs_msg_Point2D_common",loader);
    outArray[ctr]["point"] = msgClassPtr_point->get_arr(factory, &currentElement_point, loader);
    // score
    auto currentElement_score = (msg + ctr)->score;
    outArray[ctr]["score"] = factory.createScalar(currentElement_score);
    }
    return std::move(outArray);
  } 
class YOLOV8_MSGS_EXPORT ros2_yolov8_msgs_KeyPoint2D_message : public ROS2MsgElementInterfaceFactory {
  public:
    virtual ~ros2_yolov8_msgs_KeyPoint2D_message(){}
    virtual std::shared_ptr<MATLABPublisherInterface> generatePublisherInterface(ElementType /*type*/);
    virtual std::shared_ptr<MATLABSubscriberInterface> generateSubscriberInterface(ElementType /*type*/);
    virtual std::shared_ptr<void> generateCppMessage(ElementType /*type*/, const matlab::data::StructArray& /* arr */, MultiLibLoader /* loader */, std::map<std::string,std::shared_ptr<MATLABROS2MsgInterfaceBase>>* /*commonObjMap*/);
    virtual matlab::data::StructArray generateMLMessage(ElementType  /*type*/ ,void*  /* msg */, MultiLibLoader /* loader */ , std::map<std::string,std::shared_ptr<MATLABROS2MsgInterfaceBase>>* /*commonObjMap*/);
};  
  std::shared_ptr<MATLABPublisherInterface> 
          ros2_yolov8_msgs_KeyPoint2D_message::generatePublisherInterface(ElementType /*type*/){
    return std::make_shared<ROS2PublisherImpl<yolov8_msgs::msg::KeyPoint2D,ros2_yolov8_msgs_msg_KeyPoint2D_common>>();
  }
  std::shared_ptr<MATLABSubscriberInterface> 
         ros2_yolov8_msgs_KeyPoint2D_message::generateSubscriberInterface(ElementType /*type*/){
    return std::make_shared<ROS2SubscriberImpl<yolov8_msgs::msg::KeyPoint2D,ros2_yolov8_msgs_msg_KeyPoint2D_common>>();
  }
  std::shared_ptr<void> ros2_yolov8_msgs_KeyPoint2D_message::generateCppMessage(ElementType /*type*/, 
                                           const matlab::data::StructArray& arr,
                                           MultiLibLoader loader,
                                           std::map<std::string,std::shared_ptr<MATLABROS2MsgInterfaceBase>>* commonObjMap){
    auto msg = std::make_shared<yolov8_msgs::msg::KeyPoint2D>();
    ros2_yolov8_msgs_msg_KeyPoint2D_common commonObj;
    commonObj.mCommonObjMap = commonObjMap;
    commonObj.copy_from_struct(msg.get(), arr[0], loader);
    return msg;
  }
  matlab::data::StructArray ros2_yolov8_msgs_KeyPoint2D_message::generateMLMessage(ElementType  /*type*/ ,
                                                    void*  msg ,
                                                    MultiLibLoader  loader ,
                                                    std::map<std::string,std::shared_ptr<MATLABROS2MsgInterfaceBase>>*  commonObjMap ){
    ros2_yolov8_msgs_msg_KeyPoint2D_common commonObj;	
    commonObj.mCommonObjMap = commonObjMap;	
    MDFactory_T factory;
    return commonObj.get_arr(factory, (yolov8_msgs::msg::KeyPoint2D*)msg, loader);			
 }
#include "class_loader/register_macro.hpp"
// Register the component with class_loader.
// This acts as a sort of entry point, allowing the component to be discoverable when its library
// is being loaded into a running process.
CLASS_LOADER_REGISTER_CLASS(ros2_yolov8_msgs_msg_KeyPoint2D_common, MATLABROS2MsgInterface<yolov8_msgs::msg::KeyPoint2D>)
CLASS_LOADER_REGISTER_CLASS(ros2_yolov8_msgs_KeyPoint2D_message, ROS2MsgElementInterfaceFactory)
#ifdef _MSC_VER
#pragma warning(pop)
#else
#pragma GCC diagnostic pop
#endif //_MSC_VER