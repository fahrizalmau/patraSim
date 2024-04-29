function G = initNeighborGrid3D(cellsize)
    %cellsize
    nx=cellsize(1); ny=cellsize(2); nz=cellsize(3);
    n = nx*ny*nz;

    %preallocation
    G(n) = struct;
    
    
    idx = 0;
    for k=1:nz
        for j=1:ny
            for i=1:nx
                idx = idx+1;
                %active-or-not
                
                G(idx).idx = idx;
                G(idx).newIdx = idx;

                %center
                G(idx).center = idx;

                %north-south
                if j==1
                    G(idx).north = 0;
                    G(idx).south = idx+nx;
                elseif j==ny
                    G(idx).north = idx-nx;
                    G(idx).south = 0;
                else
                    G(idx).north = idx-nx;
                    G(idx).south = idx+nx;
                end    

                %west-east
                if i==1
                    G(idx).east = idx+1;
                    G(idx).west = 0;
                elseif i==nx
                    G(idx).east = 0;
                    G(idx).west = idx-1;
                else
                    G(idx).east = idx+1;
                    G(idx).west = idx-1;
                end

                %top-bottom
                if k==nz
                    G(idx).top = 0;
                    G(idx).bottom = idx-nx*ny;
                elseif k==1
                    G(idx).top = idx+nx*ny;
                    G(idx).bottom = 0;
                else
                    G(idx).top = idx+nx*ny;
                    G(idx).bottom = idx-nx*ny;
                end
            end
        end
    end
end

