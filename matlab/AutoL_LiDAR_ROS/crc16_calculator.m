function [crc] = crc16_calculator(packet,table)
%CRC_CACULATOR 이 함수의 요약 설명 위치
%   자세한 설명 위치
crc = (hex2dec('4C49'));
for i = 1:length(packet)
    index = bitxor((bitand(crc,255)),packet(i));
    crc = bitxor((bitshift(crc,-8)), table(index+1));
end
   crc = [mod(crc,256),floor(double(crc)/double(256))];
end
