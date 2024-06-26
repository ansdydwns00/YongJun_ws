function msg = sensor_msgs_PointFieldStruct
% Message struct definition for sensor_msgs/PointField
coder.inline("never")
msg = struct(...
    'MessageType','sensor_msgs/PointField',...
    'INT8',ros.internal.ros2.messages.ros2.default_type('uint8',1,0,1),...
    'UINT8',ros.internal.ros2.messages.ros2.default_type('uint8',1,0,2),...
    'INT16',ros.internal.ros2.messages.ros2.default_type('uint8',1,0,3),...
    'UINT16',ros.internal.ros2.messages.ros2.default_type('uint8',1,0,4),...
    'INT32',ros.internal.ros2.messages.ros2.default_type('uint8',1,0,5),...
    'UINT32',ros.internal.ros2.messages.ros2.default_type('uint8',1,0,6),...
    'FLOAT32',ros.internal.ros2.messages.ros2.default_type('uint8',1,0,7),...
    'FLOAT64',ros.internal.ros2.messages.ros2.default_type('uint8',1,0,8),...
    'name',ros.internal.ros2.messages.ros2.char('string',1,NaN,1),...
    'offset',ros.internal.ros2.messages.ros2.default_type('uint32',1,0),...
    'datatype',ros.internal.ros2.messages.ros2.default_type('uint8',1,0),...
    'count',ros.internal.ros2.messages.ros2.default_type('uint32',1,0));
coder.cstructname(msg,'sensor_msgs_PointFieldStruct_T');
coder.varsize('msg.name',[1 1000000000],[0 1]);
if ~isempty(coder.target)
    coder.ceval('//',coder.rref(msg));
end
end
