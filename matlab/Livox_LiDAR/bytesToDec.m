function decimalValue = bytesToDec(p1, p2, p3, p4)
    bytes = [p1,p2,p3,p4];
    int32Value = typecast(uint8(bytes), 'int32');
    decimalValue = single(double(int32Value) / 1000);
end