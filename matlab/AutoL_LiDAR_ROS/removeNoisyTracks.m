function tracks = removeNoisyTracks(tracks, positionSelector, imageSize)

    if isempty(tracks)
        return
    end
    
    % Extract the positions from all the tracks.
    positions = getTrackPositions(tracks, positionSelector);
    
    % The track is 'invalid' if the predicted position is about to move out
    % of the image, or if the bounding box is too small.
    invalid = ( positions(:, 1) < 1 | ...
                positions(:, 1) + positions(:, 3) > imageSize(2) | ...
                positions(:, 3) <= 20 | ...
                positions(:, 4) <= 20 );
    tracks(invalid) = [];
end