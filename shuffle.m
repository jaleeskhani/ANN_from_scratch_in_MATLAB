function ridxs = shuffle (idxsL)
    ridxs = 1:1:idxsL;
    % shuffle
    for ii = 1:1:idxsL
        rIdx1 = randi(idxsL);
        rIdx2 = randi(idxsL);
        tt = ridxs(rIdx1);
        ridxs(rIdx1) = ridxs(rIdx2);
        ridxs(rIdx2) = tt;
    end
end