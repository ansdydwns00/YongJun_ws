function AutoL_parsing_reset() %#codegen
    % Initialize of persistent parameters
    persistent points
    persistent i

    points = zeros(22784,3);
    i = 1;
end
