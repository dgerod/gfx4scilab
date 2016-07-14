// =================================================================================
//
// =================================================================================

function [Ret,Points] = AuxPrm_FrusConeGetPoints ( FrusCone )
  
  Ret = 0;
  
  h = FrusCone.dim.h;
  rb = FrusCone.dim.rb;
  rt = FrusCone.dim.rt;
  T = FrusCone.T;
  
  x0 = 0;
  y0 = 0;
  z0 = 0;
  
  theta = linspace( 0,2*%pi );
  
  X1 = rb*cos(theta) + x0; 
  Y1 = rb*sin(theta) + y0;
  Z1 = zeros(X1) + z0;
  cir1 = [X1' Y1' Z1'];
  
  X2 = rt*cos(theta) + x0; 
  Y2 = rt*sin(theta) + y0;    
  Z2 = Z1+h;
  cir2 = [X2' Y2' Z2'];
  
  a = T * [cir1'; ones(1,size(cir1',2))];
  Cir1 = (a(1:3,:))';
  
  b = T * [cir2'; ones(1,size(cir2',2))];
  Cir2 = (b(1:3,:))';
  
  Ret = 1;
  Points = [ Cir1, Cir2 ];
  return [ Ret,Points ];

endfunction

// =================================================================================
