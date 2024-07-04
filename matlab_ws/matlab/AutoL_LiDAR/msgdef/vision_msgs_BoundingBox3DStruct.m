function msg = vision_msgs_BoundingBox3DStruct
% Message struct definition for vision_msgs/BoundingBox3D
coder.inline("never")
msg = struct(...
    'MessageType','vision_msgs/BoundingBox3D',...
    'center',geometry_msgs_PoseStruct,...
    'size',geometry_msgs_Vector3Struct);
coder.cstructname(msg,'vision_msgs_BoundingBox3DStruct_T');
if ~isempty(coder.target)
    coder.ceval('//',coder.rref(msg));
end
end
