// =============================================================================
// gfx4scilab - drawing
// dgerod@xyz-lab.org.es
// =============================================================================

function [Circ3d] = dw_Circ3d_create(Radius, T)
  
  Circ3d = 0;
  
  if rt_ishomog(T) == %T then 
    dim = struct("r", Radius);
    Circ3d = struct("dim", dim, "T", T);
  end
    
  return [Circ3d];

endfunction

// -----------------------------------------------------------------------------

function [Points] = dw_Circ3d_getPoints(Circ3d)
  
  r = Circ3d.dim.r;
  T = Circ3d.T;
  
  theta = linspace(0, 2*%pi);
  X = r*cos(theta); 
  Y = r*sin(theta); 
  Z = zeros(X);  
  circ = [X' Y' Z'];
  
  a = T * [circ'; ones(1,size(circ',2))];
  p = (a(1:3,:))';
  
  Points = p;
  return [Points];
  
endfunction

// -----------------------------------------------------------------------------

function [Circ3d] = dw_Circ3d_from2d(Circ3d, Circ2d)
  
  x = Circ2d.c(1);  y = Circ2d.c(2); r = Circ2d.r;  
  Circ3d.T = rt_transl(x, y, 0);
  Circ3d.dim.r = r;

  return [Circ3d];

endfunction

// -----------------------------------------------------------------------------

function [Handle] = dw_Circ3d_draw(Circle3d)

  Handle = list();

  points = dw_Circ3d_getPoints(Circle3d)
  cir_x = points(:,1);
  cir_y = points(:,2);
  cir_z = points(:,3);    

  Handle($+1) = param3d(cir_x, cir_y, cir_z);   
  return [Handle];
  
endfunction 

// =================================================================================
