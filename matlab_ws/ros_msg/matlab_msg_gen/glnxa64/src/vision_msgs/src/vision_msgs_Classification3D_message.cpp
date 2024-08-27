// Copyright 2020-2022 The MathWorks, Inc.
// Common copy functions for vision_msgs/Classification3D
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
#include "vision_msgs/msg/classification3_d.hpp"
#include "visibility_control.h"
#include "class_loader/multi_library_class_loader.hpp"
#include "ROS2PubSubTemplates.hpp"
class VISION_MSGS_EXPORT ros2_vision_msgs_msg_Classification3D_common : public MATLABROS2MsgInterface<vision_msgs::msg::Classification3D> {
  public:
    virtual ~ros2_vision_msgs_msg_Classification3D_common(){}
    virtual void copy_from_struct(vision_msgs::msg::Classification3D* msg, const matlab::data::Struct& arr, MultiLibLoader loader); 
    //----------------------------------------------------------------------------
    virtual MDArray_T get_arr(MDFactory_T& factory, const vision_msgs::msg::Classification3D* msg, MultiLibLoader loader, size_t size = 1);
};
  void ros2_vision_msgs_msg_Classification3D_common::copy_from_struct(vision_msgs::msg::Classification3D* msg, const matlab::data::Struct& arr,
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
        //results
        const matlab::data::StructArray results_arr = arr["results"];
        for (auto _resultsarr : results_arr) {
        	vision_msgs::msg::ObjectHypothesis _val;
        auto msgClassPtr_results = getCommonObject<vision_msgs::msg::ObjectHypothesis>("ros2_vision_msgs_msg_ObjectHypothesis_common",loader);
        msgClassPtr_results->copy_from_struct(&_val,_resultsarr,loader);
        	msg->results.push_back(_val);
        }
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'results' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'results' is wrong type; expected a struct.");
    }
    try {
        //source_cloud
        const matlab::data::StructArray source_cloud_arr = arr["source_cloud"];
        auto msgClassPtr_source_cloud = getCommonObject<sensor_msgs::msg::PointCloud2>("ros2_sensor_msgs_msg_PointCloud2_common",loader);
        msgClassPtr_source_cloud->copy_from_struct(&msg->source_cloud,source_cloud_arr[0],loader);
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'source_cloud' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'source_cloud' is wrong type; expected a struct.");
    }
  }
  //----------------------------------------------------------------------------
  MDArray_T ros2_vision_msgs_msg_Classification3D_common::get_arr(MDFactory_T& factory, const vision_msgs::msg::Classification3D* msg,
       MultiLibLoader loader, size_t size) {
    auto outArray = factory.createStructArray({size,1},{"MessageType","header","results","source_cloud"});
    for(size_t ctr = 0; ctr < size; ctr++){
    outArray[ctr]["MessageType"] = factory.createCharArray("vision_msgs/Classification3D");
    // header
    auto currentElement_header = (msg + ctr)->header;
    auto msgClassPtr_header = getCommonObject<std_msgs::msg::Header>("ros2_std_msgs_msg_Header_common",loader);
    outArray[ctr]["header"] = msgClassPtr_header->get_arr(factory, &currentElement_header, loader);
    // results
    auto currentElement_results = (msg + ctr)->results;
    auto msgClassPtr_results = getCommonObject<vision_msgs::msg::ObjectHypothesis>("ros2_vision_msgs_msg_ObjectHypothesis_common",loader);
    outArray[ctr]["results"] = msgClassPtr_results->get_arr(factory,&currentElement_results[0],loader,currentElement_results.size());
    // source_cloud
    auto currentElement_source_cloud = (msg + ctr)->source_cloud;
    auto msgClassPtr_source_cloud = getCommonObject<sensor_msgs::msg::PointCloud2>("ros2_sensor_msgs_msg_PointCloud2_common",loader);
    outArray[ctr]["source_cloud"] = msgClassPtr_source_cloud->get_arr(factory, &currentElement_source_cloud, loader);
    }
    return std::move(outArray);
  } 
class VISION_MSGS_EXPORT ros2_vision_msgs_Classification3D_message : public ROS2MsgElementInterfaceFactory {
  public:
    virtual ~ros2_vision_msgs_Classification3D_message(){}
    virtual std::shared_ptr<MATLABPublisherInterface> generatePublisherInterface(ElementType /*type*/);
    virtual std::shared_ptr<MATLABSubscriberInterface> generateSubscriberInterface(ElementType /*type*/);
    virtual std::shared_ptr<void> generateCppMessage(ElementType /*type*/, const matlab::data::StructArray& /* arr */, MultiLibLoader /* loader */, std::map<std::string,std::shared_ptr<MATLABROS2MsgInterfaceBase>>* /*commonObjMap*/);
    virtual matlab::data::StructArray generateMLMessage(ElementType  /*type*/ ,void*  /* msg */, MultiLibLoader /* loader */ , std::map<std::string,std::shared_ptr<MATLABROS2MsgInterfaceBase>>* /*commonObjMap*/);
};  
  std::shared_ptr<MATLABPublisherInterface> 
          ros2_vision_msgs_Classification3D_message::generatePublisherInterface(ElementType /*type*/){
    return std::make_shared<ROS2PublisherImpl<vision_msgs::msg::Classification3D,ros2_vision_msgs_msg_Classification3D_common>>();
  }
  std::shared_ptr<MATLABSubscriberInterface> 
         ros2_vision_msgs_Classification3D_message::generateSubscriberInterface(ElementType /*type*/){
    return std::make_shared<ROS2SubscriberImpl<vision_msgs::msg::Classification3D,ros2_vision_msgs_msg_Classification3D_common>>();
  }
  std::shared_ptr<void> ros2_vision_msgs_Classification3D_message::generateCppMessage(ElementType /*type*/, 
                                           const matlab::data::StructArray& arr,
                                           MultiLibLoader loader,
                                           std::map<std::string,std::shared_ptr<MATLABROS2MsgInterfaceBase>>* commonObjMap){
    auto msg = std::make_shared<vision_msgs::msg::Classification3D>();
    ros2_vision_msgs_msg_Classification3D_common commonObj;
    commonObj.mCommonObjMap = commonObjMap;
    commonObj.copy_from_struct(msg.get(), arr[0], loader);
    return msg;
  }
  matlab::data::StructArray ros2_vision_msgs_Classification3D_message::generateMLMessage(ElementType  /*type*/ ,
                                                    void*  msg ,
                                                    MultiLibLoader  loader ,
                                                    std::map<std::string,std::shared_ptr<MATLABROS2MsgInterfaceBase>>*  commonObjMap ){
    ros2_vision_msgs_msg_Classification3D_common commonObj;	
    commonObj.mCommonObjMap = commonObjMap;	
    MDFactory_T factory;
    return commonObj.get_arr(factory, (vision_msgs::msg::Classification3D*)msg, loader);			
 }
#include "class_loader/register_macro.hpp"
// Register the component with class_loader.
// This acts as a sort of entry point, allowing the component to be discoverable when its library
// is being loaded into a running process.
CLASS_LOADER_REGISTER_CLASS(ros2_vision_msgs_msg_Classification3D_common, MATLABROS2MsgInterface<vision_msgs::msg::Classification3D>)
CLASS_LOADER_REGISTER_CLASS(ros2_vision_msgs_Classification3D_message, ROS2MsgElementInterfaceFactory)
#ifdef _MSC_VER
#pragma warning(pop)
#else
#pragma GCC diagnostic pop
#endif //_MSC_VER