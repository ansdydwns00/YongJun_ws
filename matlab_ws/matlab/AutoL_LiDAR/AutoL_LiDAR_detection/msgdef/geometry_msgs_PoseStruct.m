function msg = geometry_msgs_PoseStruct
% Message struct definition for geometry_msgs/Pose
coder.inline("never")
msg = struct(...
    'MessageType','geometry_msgs/Pose',...
    'position',geometry_msgs_PointStruct,...
    'orientation',geometry_msgs_QuaternionStruct);
coder.cstructname(msg,'geometry_msgs_PoseStruct_T');
if ~isempty(coder.target)
    coder.ceval('//',coder.rref(msg));
end
end
