function uniqueArray = unique_rows(array)
    [~, uniqueIdx] = unique(array, 'rows');
    uniqueArray = array(uniqueIdx, :);
    uniqueArray = sortrows(uniqueArray);
end