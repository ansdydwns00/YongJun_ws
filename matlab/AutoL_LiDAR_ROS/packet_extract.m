function [payload, top_bottom_flag, dataType] = packet_extract(packetData)   

    % Payload Header와 Payload로 분할(UDP Header는 잘려서 수신 받음)
    payload_header = packetData(:,1:28);   % [1 x 28]
    payload = packetData(:,29:end-6);      % [1 x 1296] ( Timestamp, ProductID 제외)  
    
    %------------------------------------payload_header------------------------------------%
   
    top_bottom_flag = uint8(payload_header(:,5));

    dataType = uint32(payload_header(:,6:9));   % A5 = 165, B3 = 179, C2 = 194, 01 = 1, AA(종료) = 170, CC(에러) = 204, 프레임이 종료인지 아닌지는 6번째 열을 확인 
  
end