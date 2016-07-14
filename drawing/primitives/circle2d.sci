// =============================================================================
// gfx4scilab - drawing
// dgerod@xyz-lab.org.es
// =============================================================================

function [Circ2d] = dw_Circ2d_create(Cx, Cy, Radius)
      
  c = [Cx,Cy]';
  Circ2d = struct("c", c, "r", radius);
  return [Circ2d];

endfunction

// -----------------------------------------------------------------------------

function [Circ3d] = dw_Circ2d_to3d(Circ2d)

  Circ3d = dw_Circ3d_create(0.0, eye(4,4));
  Circ3d = dw_Circ3d_from2d(Circ3d, Circ2d);
  return [Circ3d];

endfunction

// =================================================================================
