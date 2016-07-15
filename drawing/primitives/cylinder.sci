// =============================================================================
// gfx4scilab - drawing
// dgerod@xyz-lab.org.es
// =============================================================================

function [Cyl] = dw_Cylinder_create(Height, Radius, T)
  
  Cyl = 0;
  
  if rt_ishomog( T ) == %T then     
    dim = struct("h", Height, "r", Radius);
    Cyl = struct("dim", dim, "T", T);    
  end
    
  return [Cyl];

endfunction

// -----------------------------------------------------------------------------

function [Points] = dw_Cylinder_getPoints(Cyl)

  h = Cyl.dim.h;
  r = Cyl.dim.r;
  T = Cyl.T;
  
  x0 = 0;
  y0 = 0;
  z0 = 0;
  
  theta = linspace(0, 2*%pi);
  
  X = r*cos(theta) + x0; 
  Y = r*sin(theta) + y0;    
  
  Z1 = zeros(X) + z0;
  cir1 = [ X' Y' Z1' ];  

  Z2 = Z1+h;
  cir2 = [ X' Y' Z2' ];
  
  a = T * [cir1'; ones(1,size(cir1',2))];
  p1 = (a(1:3,:))';   
  
  b = T * [cir2'; ones(1,size(cir2',2))];
  p2 = (b(1:3,:))';

  Points = [p1, p2];
  return [Points];

endfunction  

// -----------------------------------------------------------------------------

function [Handle] = dw_Cylinder_draw(Cyl)
  
  Handle = list();

  points = dw_Cylinder_getPoints(Box)
  cir1 = Points(:,1:3);
  cir2 = Points(:,4:6);
  
  cir1_x = cir1(:,1);
  cir1_y = cir1(:,2);
  cir1_z = cir1(:,3);    
  Handle($+1) = param3d(cir1_x, cir1_y, cir1_z);   
  
  cir2_x = cir2(:,1);
  cir2_y = cir2(:,2);
  cir2_z = cir2(:,3);
  Handle($+1) = param3d(cir2_x, cir2_y, cir2_z);   
  
  for i=1:size(cir1_x,1);    
    edges_x = [cir1_x(i) cir2_x(i)]; 
    edges_y = [cir1_y(i) cir2_y(i)];
    edges_z = [cir1_z(i) cir2_z(i)];           
    Handle($+1) = param3d(edges_x, edges_y, edges_z);       
  end
  
  return [Handle];

endfunction

// =================================================================================
