% Stop timer 
% stop(t)

% Initialize workspace
clear; clc;

% Connect udp handshake communication
udpObj = udpport("datagram","LocalPort",55501);

% Start timer
t = timer;
t.Period = 1;
t.TimerFcn = {@InitProtocol,udpObj};
t.ExecutionMode = 'fixedDelay';

start(t)
%%

% Connect udp data communication
udpObj2 = udpport("byte","LocalPort",56001,"ByteOrder","little-endian");

%% 

player = pcplayer([0 10],[-5 5],[-2 5]);

% Set temporary value for 1 frame
numPoints = 250 * 96; 

% Point data storage variable
x = single(zeros(numPoints,1));
y = single(zeros(numPoints,1));
z = single(zeros(numPoints,1));

xyzPoints = single(zeros(numPoints,3));

idx = 1;
count = 0;

frameCount = 0;


tic
while 1
    % Read 1 packet
    packet = single(read(udpObj2,1362))';

    % Check for Point data or IMU data
    dataType = packet(10);
    
    % dataType: 2 (cartesian data), dataType: 6 (IMU data)
    if dataType ~= 2
        flush(udpObj2);
        continue;
    else

        count = count + 1; 
        
        % Cartesian coordinate data is 19:end 
        xyzPointsPacket = packet(19:end);
        
        % 96 data consists of 14 bytes
        reshapedData = reshape(xyzPointsPacket, 14, []);
        
        for i = 1:size(reshapedData,2)
            currentPart = reshapedData(:, i);

            x_byte = currentPart(1:4);
            y_byte = currentPart(5:8);
            z_byte = currentPart(9:12); 
            
            x(idx) = bytesToDec(x_byte(1), x_byte(2), x_byte(3), x_byte(4));
            y(idx) = bytesToDec(y_byte(1), y_byte(2), y_byte(3), y_byte(4));
            z(idx) = bytesToDec(z_byte(1), z_byte(2), z_byte(3), z_byte(4));
            idx = idx + 1;
        end

        % When a temporary value for 1 frame is reached
        if count == 250
            xyzPoints = [x(1:idx-1) y(1:idx-1) z(1:idx-1)]; 
            % del_idx = all(xyzPoints,2);
            % xyzPoints(~del_idx,:) = [];

            ptCloud = pointCloud(xyzPoints); 
            view(player,ptCloud); 
            
            % Display Rendering rate 
            frameCount = frameCount + 1;
            elapsedTime = toc;
            frameRate = frameCount / elapsedTime;
            fprintf("Rendering rate: %f hz\n",frameRate);

            % Initialize Parameter
            count = 0; 
            idx = 1;
        end
    end
end

%% Support Fcn
function decimalValue = bytesToDec(p1, p2, p3, p4)
    bytes = [p1,p2,p3,p4];
    int32Value = typecast(uint8(bytes), 'int32');
    decimalValue = single(double(int32Value) / 1000);
end