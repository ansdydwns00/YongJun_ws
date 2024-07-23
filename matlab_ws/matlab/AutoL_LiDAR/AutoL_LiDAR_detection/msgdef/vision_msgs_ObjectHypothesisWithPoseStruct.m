function msg = vision_msgs_ObjectHypothesisWithPoseStruct
% Message struct definition for vision_msgs/ObjectHypothesisWithPose
coder.inline("never")
msg = struct(...
    'MessageType','vision_msgs/ObjectHypothesisWithPose',...
    'hypothesis',vision_msgs_ObjectHypothesisStruct,...
    'pose',geometry_msgs_PoseWithCovarianceStruct);
coder.cstructname(msg,'vision_msgs_ObjectHypothesisWithPoseStruct_T');
if ~isempty(coder.target)
    coder.ceval('//',coder.rref(msg));
end
end
