// =============================================================================
// gfx4scilab - drawing
// dgerod@xyz-lab.org.es
// =============================================================================

function [Hex3d] = dw_Hex3d_create(R, T)
  
  Hex3d = 0;
  
  if rt_ishomog(T) == %T then 
    r = (1/2)*sqrt(3)*R;
    s = R - r;
    dim = struct("R",R, "r", r," s", s);
    Hex3d = struct("dim", dim, "T", T);
  end
    
  return [Ret,Hex3d];

endfunction

// -----------------------------------------------------------------------------

function [Points] = dw_Hex3d_getPoints(Hex3d)
  
  r = Hex3d.dim.r;
  R = Hex3d.dim.R;
  T = Hex3d.T

  hex(:,1) = [R/2,r,0]';
  hex(:,2) = [R,0,0]';
  hex(:,3) = [R/2,-r,0]';
  hex(:,4) = [-R/2,-r,0]';
  hex(:,5) = [-R,0,0]';
  hex(:,6) = [-R/2,r,0]';

  hex = hex';  
  a = T * [hex'; ones(1,size(hex',2))];
  Points = (a(1:3,:))';

  return [Points];
  
endfunction

// -----------------------------------------------------------------------------

function [Handle] = dw_Hex3d_draw(Hex3d)

  Handle = list();
  p = dw_Hex3d_getPoints(Hex3d);

  // Add first point to last position for closing the figure.
  points = [p; p(1,:)];
  // Prepare coordenates.
  hex_x = points(:,1);
  hex_y = points(:,2);
  hex_z = points(:,3);    

  Handle($+1) = param3d(hex_x, hex_y, hex_z);   
  return [Handle];  

endfunction 

// =============================================================================

