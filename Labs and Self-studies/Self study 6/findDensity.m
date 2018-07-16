function density=exampleCode(steamTableFilename, delimiter, pressure, steamQuality)
%FINDDENSITY Find the density of steam and water mixture
%   Read from table and interpolate

    %Read in the table
    table=dlmread(steamTableFilename, delimiter, [9, 1, 68, 3]);

    %Get Appropriate section by indexing just the data with pressure values
    table2=table(1:4:end,1:3);

    %Find the index of the pressure
    index=find(table2(:,3)==pressure);

    % If Invalid Steam Quality used output -1
    if steamQuality>1 || steamQuality<0
        density=-1;

    % If pressure not found output -1
    elseif isempty(index)==true
        density=-1;

    else
   
        vf=table2(index, 1);
        vg=table2(index, 2);
    
        %Interpolate to find the Density
        v=steamQuality*vg+(1-steamQuality)*vf;
    
    %Output Density
    density=1/v;
    end
end