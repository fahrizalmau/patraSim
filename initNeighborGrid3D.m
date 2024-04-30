function G = initNeighborGrid3D(cellsize)
    %cellsize
    nx=cellsize(1); ny=cellsize(2); nz=cellsize(3);
    n = nx*ny*nz;

    %preallocation
    G.index = struct('index',    linspace(1, n, n), ...
                     'initial',  linspace(1,n,n), ...
                     'isActive', linspace(1,1,n));
    G.neighbors = struct('ncontact', zeros(1, n), ...
                         'nsewtb',   zeros(6,n));

    idx = 0;
    for k=1:nz
        for j=1:ny
            for i=1:nx
                idx = idx+1;

                %north-south
                if j==1
                    G.neighbors.nsewtb(1,idx) = 0;
                    G.neighbors.nsewtb(2,idx) = idx+nx;
                elseif j==ny
                    G.neighbors.nsewtb(1,idx) = idx-nx;
                    G.neighbors.nsewtb(2,idx) = 0;
                else
                    G.neighbors.nsewtb(1,idx) = idx-nx;
                    G.neighbors.nsewtb(2,idx) = idx+nx;
                end    

                %west-east
                if i==1
                    G.neighbors.nsewtb(3,idx) = idx+1;
                    G.neighbors.nsewtb(4,idx) = 0;
                elseif i==nx
                    G.neighbors.nsewtb(3,idx) = 0;
                    G.neighbors.nsewtb(4,idx) = idx-1;
                else
                    G.neighbors.nsewtb(3,idx) = idx+1;
                    G.neighbors.nsewtb(4,idx) = idx-1;
                end

                %top-bottom
                if k==nz
                    G.neighbors.nsewtb(5,idx) = 0;
                    G.neighbors.nsewtb(6,idx) = idx-nx*ny;
                elseif k==1
                    G.neighbors.nsewtb(5,idx) = idx+nx*ny;
                    G.neighbors.nsewtb(6,idx) = 0;
                else
                    G.neighbors.nsewtb(5,idx) = idx+nx*ny;
                    G.neighbors.nsewtb(6,idx) = idx-nx*ny;
                end
            end
        end
    end
    
    %assign ncontact
    G.neighbors.ncontact = sum(G.neighbors.nsewtb~=0, 1);

end

