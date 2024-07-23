function msg = geometry_msgs_PoseWithCovarianceStruct
% Message struct definition for geometry_msgs/PoseWithCovariance
coder.inline("never")
msg = struct(...
    'MessageType','geometry_msgs/PoseWithCovariance',...
    'pose',geometry_msgs_PoseStruct,...
    'covariance',ros.internal.ros2.messages.ros2.default_type('double',36,0));
coder.cstructname(msg,'geometry_msgs_PoseWithCovarianceStruct_T');
if ~isempty(coder.target)
    coder.ceval('//',coder.rref(msg));
end
end
