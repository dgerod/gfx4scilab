// =============================================================================
// prt_RefFrameCreate
// =============================================================================

function [RefFrame] = prtCreateRefFrame ( len,T )
   
  RefFrame = 0;
  
  if rt_ishomog( T ) == %T then 
    
    name = "";    
    dim = struct( "len",len );
    RefFrame = struct( "name",name,"dim",dim,"T",T );
    
    Ret = 1;
  end
    
  return [RefFrame];

endfunction 

// =============================================================================
