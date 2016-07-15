// =============================================================================
// gfx4scilab - drawing
// dgerod@xyz-lab.org.es
// =============================================================================

function [Sphere] = dw_Sphere_create(Radius, T)

  Sphere = 0;  
  if rt_ishomog( T ) == %T then 
    dim = struct("r", Radius);
    Sphere = struct("dim", dim, "T", T);
  end
    
  return [Sphere];

endfunction

// -----------------------------------------------------------------------------

function [Points] = dw_Sphere_getPoints(Sphere)
  
  // This code is ONGOING...

  r = Sphere.dim.r;
  T = Sphere.T;
    
  u = linspace(-%pi/2,%pi/2,40);
  v = linspace(0,2*%pi,20);
  
  X = r*cos(u)' * cos(v);
  Y = r*cos(u)' * sin(v);
  Z = r*sin(u)' * ones(v);
 
//  // --
//    
//  n = size(X,1);
//  m = size(X,2); 
//   
//  X1 = matrix( X,1,n*m );
//  Y1 = matrix( Y,1,n*m );
//  Z1 = matrix( Z,1,n*m );
//  // --
//  
//  P = [X1' Y1' Z1' ];      
//  a = T * [P'; ones(1,size(P',2))];
//  points = (a(1:3,:))';   
//  
//  // --
//  X2 = matrix (points(:,1),n,m);
//  Y2 = matrix (points(:,2),n,m);
//  Z2 = matrix (points(:,3),n,m);
//  // --
//  
//  Points = [X2' Y2' Z2' ];  
//  Ret = 1;

  Points = [X' Y' Z'];  
  return [Points];

endfunction

// -----------------------------------------------------------------------------

function [Handle] = dw_Sphere_draw(Sphere)

  Handle = list();  
  points = dw_Sphere_getPoints(Sphere);

  // This code is ONGOING...

  x = r*cos(alp).*cos(tet) + orig(1)*ones(tet);
  y = r*cos(alp).*sin(tet) + orig(2)*ones(tet);
  z = r*sin(alp) + orig(3)*ones(tet);
  
  r=1; 
  orig=[0 0 0]; 
  u = linspace(-%pi/2, %pi/2, 40)
  v = linspace(0, %pi*2, 20); 
  [xx,yy,zz] = eval3dp(sph, u, v);
  
  Handle($+1) = plot3d(xx, yy, zz)
  
endfunction 

// =============================================================================
