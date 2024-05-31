function [outputArg1,outputArg2] = crc32_calculator(inputArg1,inputArg2)
%CRC32_CALCULATOR 이 함수의 요약 설명 위치
%   자세한 설명 위치

crc = bitxor(hex2dec('0x564f580a'),0xffffffff);

outputArg1 = inputArg1;
outputArg2 = inputArg2;
end

