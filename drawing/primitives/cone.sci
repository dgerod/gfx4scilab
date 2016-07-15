// =============================================================================
// gfx4scilab - drawing
// dgerod@xyz-lab.org.es
// =============================================================================

function [Cone] = dw_Cone_create(Height, Radius, T)

  Cone = 0;
  
  if rt_ishomog(T) == %T then     
    dim = struct("h", Height, "r", Radius );
    Cone = struct("dim", dim, "T", T);    
  end
    
  return [Cone];

endfunction

// -----------------------------------------------------------------------------

function [Points] = dw_Cone_getPoints(Cone)
  
  frustum_cone = dw_FrustCone_create(Cone.dim.h, Cone.dim.r, 0, Cone.T);
  Points = dw_FrustCone_getPoints(frustum_cone);
  return Points;
  
endfunction

// -----------------------------------------------------------------------------

function [Handle] = dw_Cone_draw(Cone)

  Handle = dw_Cylinder_draw(Cone)  
  return [Handle];
  
endfunction 

// =================================================================================
