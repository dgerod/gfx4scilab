// =================================================================================
//
// =================================================================================

function [Ret,Points] = AuxPrm_ConeGetPoints ( Cone )
  
  [Ret,fc ] = AuxPrm_FrusConeCreate( Cone.dim.h,Cone.dim.r,0,Cone.T );
  [Ret,Points] = AuxPrm_FrusConeGetPoints ( fc );
 
endfunction

// =================================================================================
