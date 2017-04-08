// =============================================================================
// gfx4scilab - drawing
// dgerod@xyz-lab.org.es
// =============================================================================

function [Box] = dw_Box_create(Side, T)
//
// DESCRIPTION
//  Create a box primitive, it is described by side length 's'
//  as a set of points of size 'n'.
// 
// PARAMETERS
//  s [IN]    : Side size. 
//  T [IN]    : Homogeneus transformation (4x4).
//  Box [OUT] : Created box.
//

  Box = 0;
  
  if rt_ishomog( T ) == %T then 
  
    dim = struct("s", Side);
    Box = struct("dim", dim, "T", T);
  end
    
  return [Box];

endfunction

// -----------------------------------------------------------------------------

function [Points] = dw_Box_getPoints(Box)
//
// DESCRIPTION
//  Return vertex whose define the box.
// 
// PARAMETERS
//  Box    [IN] : 
//  Points [OUT] : (3xN)Handle
//
    
  s = Box.dim.s;
  T = Box.T;
  
  box(:,1) = [s/2,s/2,0]';
  box(:,2) = [-s/2,s/2,0]';
  box(:,3) = [-s/2,-s/2,0]';
  box(:,4) = [s/2,-s/2,0]';
  
  box(:,5) = [s/2,s/2,s]';
  box(:,6) = [-s/2,s/2,s]';
  box(:,7) = [-s/2,-s/2,s]';
  box(:,8) = [s/2,-s/2,s]';
  
  box = box';  
  a = T * [box'; ones(1,size(box',2))];
  Points = (a(1:3,:))';
  
  return [Points];

endfunction

// -----------------------------------------------------------------------------

function [Handle] = dw_Box_draw(Box)

  Handle = list();

  points = dw_Box_getPoints(Box)
  face1 = [points(1:4,:); points(1,:)];
  face2 = [points(5:8,:); points(5,:)];  
  
  X1 = face1(:,1);
  Y1 = face1(:,2);
  Z1 = face1(:,3)
  Handle($+1) = param3d(X1, Y1, Z1);   
  
  X2 = face2(:,1);
  Y2 = face2(:,2);
  Z2 = face2(:,3)  
  Handle($+1) = param3d(X2, Y2, Z2);   
  
  for i=1:4;
    
    edges_x = [X1(i) X2(i)]; 
    edges_y = [Y1(i) Y2(i)];
    edges_z = [Z1(i) Z2(i)];           
    Handle($+1) = param3d(edges_x, edges_y, edges_z);   
    
  end
    
  return [Handle];
  
endfunction 

// =============================================================================

