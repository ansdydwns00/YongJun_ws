// Copyright 2020-2022 The MathWorks, Inc.
// Common copy functions for yolov8_msgs/Detection
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
#include "yolov8_msgs/msg/detection.hpp"
#include "visibility_control.h"
#include "class_loader/multi_library_class_loader.hpp"
#include "ROS2PubSubTemplates.hpp"
class YOLOV8_MSGS_EXPORT ros2_yolov8_msgs_msg_Detection_common : public MATLABROS2MsgInterface<yolov8_msgs::msg::Detection> {
  public:
    virtual ~ros2_yolov8_msgs_msg_Detection_common(){}
    virtual void copy_from_struct(yolov8_msgs::msg::Detection* msg, const matlab::data::Struct& arr, MultiLibLoader loader); 
    //----------------------------------------------------------------------------
    virtual MDArray_T get_arr(MDFactory_T& factory, const yolov8_msgs::msg::Detection* msg, MultiLibLoader loader, size_t size = 1);
};
  void ros2_yolov8_msgs_msg_Detection_common::copy_from_struct(yolov8_msgs::msg::Detection* msg, const matlab::data::Struct& arr,
               MultiLibLoader loader) {
    try {
        //class_id
        const matlab::data::TypedArray<int32_t> class_id_arr = arr["class_id"];
        msg->class_id = class_id_arr[0];
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'class_id' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'class_id' is wrong type; expected a int32.");
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
    try {
        //score
        const matlab::data::TypedArray<double> score_arr = arr["score"];
        msg->score = score_arr[0];
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'score' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'score' is wrong type; expected a double.");
    }
    try {
        //id
        const matlab::data::CharArray id_arr = arr["id"];
        msg->id = id_arr.toAscii();
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'id' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'id' is wrong type; expected a string.");
    }
    try {
        //bbox
        const matlab::data::StructArray bbox_arr = arr["bbox"];
        auto msgClassPtr_bbox = getCommonObject<yolov8_msgs::msg::BoundingBox2D>("ros2_yolov8_msgs_msg_BoundingBox2D_common",loader);
        msgClassPtr_bbox->copy_from_struct(&msg->bbox,bbox_arr[0],loader);
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'bbox' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'bbox' is wrong type; expected a struct.");
    }
    try {
        //bbox3d
        const matlab::data::StructArray bbox3d_arr = arr["bbox3d"];
        auto msgClassPtr_bbox3d = getCommonObject<yolov8_msgs::msg::BoundingBox3D>("ros2_yolov8_msgs_msg_BoundingBox3D_common",loader);
        msgClassPtr_bbox3d->copy_from_struct(&msg->bbox3d,bbox3d_arr[0],loader);
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'bbox3d' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'bbox3d' is wrong type; expected a struct.");
    }
    try {
        //mask
        const matlab::data::StructArray mask_arr = arr["mask"];
        auto msgClassPtr_mask = getCommonObject<yolov8_msgs::msg::Mask>("ros2_yolov8_msgs_msg_Mask_common",loader);
        msgClassPtr_mask->copy_from_struct(&msg->mask,mask_arr[0],loader);
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'mask' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'mask' is wrong type; expected a struct.");
    }
    try {
        //keypoints
        const matlab::data::StructArray keypoints_arr = arr["keypoints"];
        auto msgClassPtr_keypoints = getCommonObject<yolov8_msgs::msg::KeyPoint2DArray>("ros2_yolov8_msgs_msg_KeyPoint2DArray_common",loader);
        msgClassPtr_keypoints->copy_from_struct(&msg->keypoints,keypoints_arr[0],loader);
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'keypoints' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'keypoints' is wrong type; expected a struct.");
    }
    try {
        //keypoints3d
        const matlab::data::StructArray keypoints3d_arr = arr["keypoints3d"];
        auto msgClassPtr_keypoints3d = getCommonObject<yolov8_msgs::msg::KeyPoint3DArray>("ros2_yolov8_msgs_msg_KeyPoint3DArray_common",loader);
        msgClassPtr_keypoints3d->copy_from_struct(&msg->keypoints3d,keypoints3d_arr[0],loader);
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'keypoints3d' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'keypoints3d' is wrong type; expected a struct.");
    }
  }
  //----------------------------------------------------------------------------
  MDArray_T ros2_yolov8_msgs_msg_Detection_common::get_arr(MDFactory_T& factory, const yolov8_msgs::msg::Detection* msg,
       MultiLibLoader loader, size_t size) {
    auto outArray = factory.createStructArray({size,1},{"MessageType","class_id","class_name","score","id","bbox","bbox3d","mask","keypoints","keypoints3d"});
    for(size_t ctr = 0; ctr < size; ctr++){
    outArray[ctr]["MessageType"] = factory.createCharArray("yolov8_msgs/Detection");
    // class_id
    auto currentElement_class_id = (msg + ctr)->class_id;
    outArray[ctr]["class_id"] = factory.createScalar(currentElement_class_id);
    // class_name
    auto currentElement_class_name = (msg + ctr)->class_name;
    outArray[ctr]["class_name"] = factory.createCharArray(currentElement_class_name);
    // score
    auto currentElement_score = (msg + ctr)->score;
    outArray[ctr]["score"] = factory.createScalar(currentElement_score);
    // id
    auto currentElement_id = (msg + ctr)->id;
    outArray[ctr]["id"] = factory.createCharArray(currentElement_id);
    // bbox
    auto currentElement_bbox = (msg + ctr)->bbox;
    auto msgClassPtr_bbox = getCommonObject<yolov8_msgs::msg::BoundingBox2D>("ros2_yolov8_msgs_msg_BoundingBox2D_common",loader);
    outArray[ctr]["bbox"] = msgClassPtr_bbox->get_arr(factory, &currentElement_bbox, loader);
    // bbox3d
    auto currentElement_bbox3d = (msg + ctr)->bbox3d;
    auto msgClassPtr_bbox3d = getCommonObject<yolov8_msgs::msg::BoundingBox3D>("ros2_yolov8_msgs_msg_BoundingBox3D_common",loader);
    outArray[ctr]["bbox3d"] = msgClassPtr_bbox3d->get_arr(factory, &currentElement_bbox3d, loader);
    // mask
    auto currentElement_mask = (msg + ctr)->mask;
    auto msgClassPtr_mask = getCommonObject<yolov8_msgs::msg::Mask>("ros2_yolov8_msgs_msg_Mask_common",loader);
    outArray[ctr]["mask"] = msgClassPtr_mask->get_arr(factory, &currentElement_mask, loader);
    // keypoints
    auto currentElement_keypoints = (msg + ctr)->keypoints;
    auto msgClassPtr_keypoints = getCommonObject<yolov8_msgs::msg::KeyPoint2DArray>("ros2_yolov8_msgs_msg_KeyPoint2DArray_common",loader);
    outArray[ctr]["keypoints"] = msgClassPtr_keypoints->get_arr(factory, &currentElement_keypoints, loader);
    // keypoints3d
    auto currentElement_keypoints3d = (msg + ctr)->keypoints3d;
    auto msgClassPtr_keypoints3d = getCommonObject<yolov8_msgs::msg::KeyPoint3DArray>("ros2_yolov8_msgs_msg_KeyPoint3DArray_common",loader);
    outArray[ctr]["keypoints3d"] = msgClassPtr_keypoints3d->get_arr(factory, &currentElement_keypoints3d, loader);
    }
    return std::move(outArray);
  } 
class YOLOV8_MSGS_EXPORT ros2_yolov8_msgs_Detection_message : public ROS2MsgElementInterfaceFactory {
  public:
    virtual ~ros2_yolov8_msgs_Detection_message(){}
    virtual std::shared_ptr<MATLABPublisherInterface> generatePublisherInterface(ElementType /*type*/);
    virtual std::shared_ptr<MATLABSubscriberInterface> generateSubscriberInterface(ElementType /*type*/);
    virtual std::shared_ptr<void> generateCppMessage(ElementType /*type*/, const matlab::data::StructArray& /* arr */, MultiLibLoader /* loader */, std::map<std::string,std::shared_ptr<MATLABROS2MsgInterfaceBase>>* /*commonObjMap*/);
    virtual matlab::data::StructArray generateMLMessage(ElementType  /*type*/ ,void*  /* msg */, MultiLibLoader /* loader */ , std::map<std::string,std::shared_ptr<MATLABROS2MsgInterfaceBase>>* /*commonObjMap*/);
};  
  std::shared_ptr<MATLABPublisherInterface> 
          ros2_yolov8_msgs_Detection_message::generatePublisherInterface(ElementType /*type*/){
    return std::make_shared<ROS2PublisherImpl<yolov8_msgs::msg::Detection,ros2_yolov8_msgs_msg_Detection_common>>();
  }
  std::shared_ptr<MATLABSubscriberInterface> 
         ros2_yolov8_msgs_Detection_message::generateSubscriberInterface(ElementType /*type*/){
    return std::make_shared<ROS2SubscriberImpl<yolov8_msgs::msg::Detection,ros2_yolov8_msgs_msg_Detection_common>>();
  }
  std::shared_ptr<void> ros2_yolov8_msgs_Detection_message::generateCppMessage(ElementType /*type*/, 
                                           const matlab::data::StructArray& arr,
                                           MultiLibLoader loader,
                                           std::map<std::string,std::shared_ptr<MATLABROS2MsgInterfaceBase>>* commonObjMap){
    auto msg = std::make_shared<yolov8_msgs::msg::Detection>();
    ros2_yolov8_msgs_msg_Detection_common commonObj;
    commonObj.mCommonObjMap = commonObjMap;
    commonObj.copy_from_struct(msg.get(), arr[0], loader);
    return msg;
  }
  matlab::data::StructArray ros2_yolov8_msgs_Detection_message::generateMLMessage(ElementType  /*type*/ ,
                                                    void*  msg ,
                                                    MultiLibLoader  loader ,
                                                    std::map<std::string,std::shared_ptr<MATLABROS2MsgInterfaceBase>>*  commonObjMap ){
    ros2_yolov8_msgs_msg_Detection_common commonObj;	
    commonObj.mCommonObjMap = commonObjMap;	
    MDFactory_T factory;
    return commonObj.get_arr(factory, (yolov8_msgs::msg::Detection*)msg, loader);			
 }
#include "class_loader/register_macro.hpp"
// Register the component with class_loader.
// This acts as a sort of entry point, allowing the component to be discoverable when its library
// is being loaded into a running process.
CLASS_LOADER_REGISTER_CLASS(ros2_yolov8_msgs_msg_Detection_common, MATLABROS2MsgInterface<yolov8_msgs::msg::Detection>)
CLASS_LOADER_REGISTER_CLASS(ros2_yolov8_msgs_Detection_message, ROS2MsgElementInterfaceFactory)
#ifdef _MSC_VER
#pragma warning(pop)
#else
#pragma GCC diagnostic pop
#endif //_MSC_VER