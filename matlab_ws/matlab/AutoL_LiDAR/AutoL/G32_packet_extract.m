function [payload, top_bottom_flag, dataType] = G32_packet_extract(packetData) 

    %---------------------------------------------------------------------%
    % LOWER FRAME(0): 1~16 channels
    % UPPER FRAME(1): 17~32 channels

    % Split into "Payload Header(28 btyes)" and "Payload(1302 bytes)" (UDP Header(42 bytes)is received truncated.)
    % Extracts distinction flags for upper/lower frames and data type information of packets
    %---------------------------------------------------------------------%

    % [1 x 28]
    payload_header = single(packetData(1:28,:));      

    % [1 x 1296], Except for Timestamp(4 bytes), ProductID(2 bytes)  
    payload = single(packetData(29:end-6,:));               
    
    % To check the UPPER(1) and LOWER frames(0)
    top_bottom_flag = uint8(payload_header(5,:));

    % [01(1) = continue OR AA(170) = terminate OR CC(204) = error, A5(165), B3(179), C2(194)]
    dataType = uint32(payload_header(6,:));          
  
end