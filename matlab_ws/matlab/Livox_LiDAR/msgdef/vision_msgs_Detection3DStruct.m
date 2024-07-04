function msg = vision_msgs_Detection3DStruct
% Message struct definition for vision_msgs/Detection3D
coder.inline("never")
msg = struct(...
    'MessageType','vision_msgs/Detection3D',...
    'header',std_msgs_HeaderStruct,...
    'results',vision_msgs_ObjectHypothesisWithPoseStruct,...
    'bbox',vision_msgs_BoundingBox3DStruct,...
    'id',ros.internal.ros2.messages.ros2.char('string',1,NaN,1));
coder.cstructname(msg,'vision_msgs_Detection3DStruct_T');
coder.varsize('msg.results',[1000000000 1],[1 0]);
coder.varsize('msg.id',[1 1000000000],[0 1]);
msg.results = msg.results([],1);
if ~isempty(coder.target)
    coder.ceval('//',coder.rref(msg));
end
end
