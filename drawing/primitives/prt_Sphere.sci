// =================================================================================
//
// =================================================================================

function [Ret] = uiPrm_Sphere1 ( Sphere )
  
  Ret = 1;
  
  [ret,Points] = AuxPrm_SphereGetPoints ( Sphere )
  Ret = uiPrm_Sphere2 ( Points );
  
  return Ret;    
  
endfunction 

function [Ret] = uiPrm_Sphere2 ( Points )
  
  Ret = 1;  
  SX = Points(:,1:40); 
  SY = Points(:,41:80); 
  SZ = Points(:,81:120); 

  param3d(SX,SY,SZ);  
  
  return Ret;
  
endfunction 

// =================================================================================

btR_gfx_prmDrawSphere1 = uiPrm_Sphere1;
