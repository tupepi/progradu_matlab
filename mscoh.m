function mscoh = mscoh(signal1,signal2)  
    
    msc = mscohere(signal1,signal2);
    
    mscoh = sumsqr(msc); 
end