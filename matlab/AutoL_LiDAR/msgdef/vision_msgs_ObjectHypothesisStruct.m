function msg = vision_msgs_ObjectHypothesisStruct
% Message struct definition for vision_msgs/ObjectHypothesis
coder.inline("never")
msg = struct(...
    'MessageType','vision_msgs/ObjectHypothesis',...
    'class_id',ros.internal.ros2.messages.ros2.char('string',1,NaN,1),...
    'score',ros.internal.ros2.messages.ros2.default_type('double',1,0));
coder.cstructname(msg,'vision_msgs_ObjectHypothesisStruct_T');
coder.varsize('msg.class_id',[1 1000000000],[0 1]);
if ~isempty(coder.target)
    coder.ceval('//',coder.rref(msg));
end
end
