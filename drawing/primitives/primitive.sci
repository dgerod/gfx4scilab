// =============================================================================
// gfx4scilab - drawing
// dgerod@xyz-lab.org.es
// =============================================================================

function [Prtimitive] = dw_Primitive_create()
  
  Primitive = struct("type", "", "T", eye(4,4), "name", "");    
  return [Primitive];
  
endfunction

// -----------------------------------------------------------------------------

function [Prtimitive] = dw_Primitive_setName(Primitive, Name)
  
  Primitive.name = Name;    
  return [Primitive];
  
endfunction

// -----------------------------------------------------------------------------

function [Primitive] = dw_Primitive_place1(Primitive, Transf)
  
  Ret = 0;
  
  T0 = Primitive.T;
  T1 = T0 * Transf;
  
  Primitive.T = Transf;  
  return [Primitive];
  
endfunction

// -----------------------------------------------------------------------------

function [Primitive] = dw_Primitive_place2(Primitive, Loc)
  
  Ret = 0;
  
  T0 = Primitive.T;
  
  Ti = rt_eul2tr(Loc(4:6))*rt_transl(Loc(1:3));
  T1 = T0 * Ti;
  
  Primitive.T = T1;  
  return [ Ret,Primitive ];
  
endfunction

// -----------------------------------------------------------------------------

function [Handle] = dw_Primitive_draw(Primitive)

endfunction

// =============================================================================

