// =================================================================================
//
// =================================================================================

function [Ret,FrusCone] = AuxPrm_FrusConeCreate ( h,rb,rt,T )
  
  Ret = 0;
  FrusConeone = 0;
  
  if rt_ishomog( T ) == %T then 
    
    dim = struct( "h",h,"rb",rb,"rt",rt );
    FrusCone = struct( "dim",dim,"T",T );
    
    Ret = 1;
  end
    
  return [Ret,FrusCone];

endfunction

// =================================================================================
