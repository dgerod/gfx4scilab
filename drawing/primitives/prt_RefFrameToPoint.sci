// =============================================================================
// prt_RefFrameToPoint.sci
// =============================================================================

function [RefFrame] = prtRefFrameToPoint ( RefFrame,P )
   
  T = RefFrame.T ;  
  RefFrame.T = rt_transl( P )*T;
    
  return [RefFrame];

endfunction 
    
// =============================================================================
