// =================================================================================
//
// =================================================================================

function [Ret,Points] = AuxPrm_CylinderGetPoints ( Cyl )
  
  Ret = 0;
  
  h = Cyl.dim.h;
  r = Cyl.dim.r;
  T = Cyl.T;
  
  x0 = 0;
  y0 = 0;
  z0 = 0;
  
  theta = linspace( 0,2*%pi );
  
  X = r*cos(theta) + x0; 
  Y = r*sin(theta) + y0;    
  
  Z1 = zeros(X) + z0;   
  cir1 = [ X' Y' Z1' ];  

  Z2 = Z1+h;
  cir2 = [ X' Y' Z2' ];
  
  a = T * [cir1'; ones(1,size(cir1',2))];
  Cir1 = (a(1:3,:))';   
  
  b = T * [cir2'; ones(1,size(cir2',2))];
  Cir2 = (b(1:3,:))';

  Ret = 1;
  Points = [ Cir1, Cir2 ];
  return [ Ret,Points ];
  
endfunction

// =================================================================================
