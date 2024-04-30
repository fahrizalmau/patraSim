function G = neighborNotActive3D(G, idx)
    %change the the isActive value
    for i=1:numel(idx)
        G.index.isActive(1, idx) = 0;
    end
end