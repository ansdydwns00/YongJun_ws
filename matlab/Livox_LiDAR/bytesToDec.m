function decimalValue = bytesToDec(bytes)
    int32Value = typecast(uint8(bytes), 'int32');
    decimalValue = single(double(int32Value) / 1000);
end