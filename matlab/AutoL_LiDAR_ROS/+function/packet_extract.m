function [payload, top_bottom_flag, dataType] = packet_extract(packetData)   

    % Split into "Payload Header" and "Payload" (UDP Header is received truncated.)
    payload_header = packetData(1:28,:);            % [1 x 28]
    payload = single(packetData(29:end-6,:));               % [1 x 1296] (Except for Timestamp, ProductID)  
    

    
    top_bottom_flag = uint8(payload_header(5));   % To check the upper(1) and lower frames(0)
    dataType = uint32(payload_header(6));         % [01 = 1(continue) or AA(terminate) = 170 or CC(error) = 204, A5 = 165, B3 = 179, C2 = 194] 
  
end