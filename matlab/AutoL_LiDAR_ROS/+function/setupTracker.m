function [tracker, positionSelector] = setupTracker()

    tracker = multiObjectTracker('FilterInitializationFcn',@initBboxFilter,...
                                 'AssignmentThreshold',[30,1000],...
                                 'DeletionThreshold',5,...
                                 'ConfirmationThreshold',[5 15]);


    positionSelector = [1 0 0 0 0 0 0 0;...
                        0 0 1 0 0 0 0 0;...
                        0 0 0 0 1 0 0 0;...
                        0 0 0 0 0 0 1 0];

end