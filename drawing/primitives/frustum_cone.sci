// =============================================================================
// gfx4scilab - drawing
// dgerod@xyz-lab.org.es
// =============================================================================

function [FrustCone] = dw_FrustCone_create(h, rb, rt, T)
  
  FrustCone = 0;
  
  if rt_ishomog( T ) == %T then 
    dim = struct("h", h, "rb", rb, "rt", rt);
    FrustCone = struct("dim", dim, "T", T);
  end
    
  return [FrusCone];

endfunction

// -----------------------------------------------------------------------------

function [Points] = dw_FrustCone_getPoints(FrustCone)
    
  h = FrustCone.dim.h;
  rb = FrustCone.dim.rb;
  rt = FrustCone.dim.rt;
  T = FrustCone.T;
  
  x0 = 0;
  y0 = 0;
  z0 = 0;
  
  theta = linspace(0, 2*%pi);
  
  X1 = rb*cos(theta) + x0; 
  Y1 = rb*sin(theta) + y0;
  Z1 = zeros(X1) + z0;
  cir1 = [X1' Y1' Z1'];
  
  X2 = rt*cos(theta) + x0; 
  Y2 = rt*sin(theta) + y0;    
  Z2 = Z1+h;
  cir2 = [X2' Y2' Z2'];
  
  a = T * [cir1'; ones(1,size(cir1',2))];
  p1 = (a(1:3,:))';
  
  b = T * [cir2'; ones(1,size(cir2',2))];
  p2 = (b(1:3,:))';
  
  Points = [p1, p2];
  return [Points];

endfunction

// -----------------------------------------------------------------------------

function [Handle] = dw_FrustCone_draw(FrustCone)

  Handle = dw_Cylinder_draw(FrustCone)  
  return [Handle];

endfunction 

// =================================================================================
