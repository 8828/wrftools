function [ wind_dir_diff ] = get_wind_dir_diff( dir_1,dir_2 )
%GET_WIND_DIR_DIFF : the difference in wind speed can not exceed 180 grader - that is difference in wind_dir_1 =350 wind_dir_2 =5 is 15 and not 345 
    dif=abs(dir_1-dir_2);
    idx=find(dif>180);
    wind_dir_diff=dif;
    wind_dir_diff(idx)=abs(dif(idx)-360);
end
