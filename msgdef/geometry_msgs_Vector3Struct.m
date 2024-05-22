function msg = geometry_msgs_Vector3Struct
% Message struct definition for geometry_msgs/Vector3
coder.inline("never")
msg = struct(...
    'MessageType','geometry_msgs/Vector3',...
    'x',ros.internal.ros2.messages.ros2.default_type('double',1,0),...
    'y',ros.internal.ros2.messages.ros2.default_type('double',1,0),...
    'z',ros.internal.ros2.messages.ros2.default_type('double',1,0));
coder.cstructname(msg,'geometry_msgs_Vector3Struct_T');
if ~isempty(coder.target)
    coder.ceval('//',coder.rref(msg));
end
end
