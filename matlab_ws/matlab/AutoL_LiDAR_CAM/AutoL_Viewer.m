%% Lidar Connection

% clear workspace
clear; clc

% Create udp communication object
udpObj = udpport("byte","LocalPort",5001,"ByteOrder","little-endian");

%% Packet Data parsing 

% Create point cloud viewer
player = pcplayer([0 60],[-20 20],[-1 50]);


% Initialize of parameters 

frameCount = 0;
reset_flag = single(0);                         % Reset persistent variable


frameBin = 1;



% Remove input buffer
flush(udpObj,"input")

% tic
while true
    
    % Load 1 packet [1 x 1330]   
    packetData = single(read(udpObj,1330))';   
    
    % Use mex file to verify generated c code
    [xyzCoords,xyzIntensity,isValid] = AutoL_parsing_Intensity_mex(packetData,reset_flag);
    

    % Check end frame  
    if isValid
        
        % [x,y,z] coordinates to point cloud
        ptCloud = pointCloud(xyzCoords,"Intensity",xyzIntensity);
    
        % Display ptCloud on pcplayer
        view(player,ptCloud) 
        


        % % ptCloud to bin file
        filename = sprintf('%06d.bin',frameBin);
        frameBin = frameBin + 1;

        fileID = fopen(filename,'w');

        xyzi_point = [ptCloud.Location normalize(ptCloud.Intensity)]';

        fwrite(fileID,xyzi_point,'single');
        fclose(fileID);

   

        % Display Rendering rate 
        % frameCount = frameCount + 1;
        % elapsedTime = toc;
        % frameRate = frameCount / elapsedTime;
        % fprintf("Rendering rate: %f hz\n",frameRate);

        flush(udpObj);
    end  
    reset_flag = single(1);      
end
