function msg = vision_msgs_Detection3DArrayStruct
% Message struct definition for vision_msgs/Detection3DArray
coder.inline("never")
msg = struct(...
    'MessageType','vision_msgs/Detection3DArray',...
    'header',std_msgs_HeaderStruct,...
    'detections',vision_msgs_Detection3DStruct);
coder.cstructname(msg,'vision_msgs_Detection3DArrayStruct_T');
coder.varsize('msg.detections',[1000000000 1],[1 0]);
msg.detections = msg.detections([],1);
if ~isempty(coder.target)
    coder.ceval('//',coder.rref(msg));
end
end
