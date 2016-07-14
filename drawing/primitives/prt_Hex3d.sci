// =================================================================================
// uiPrm_Hex3d
// =================================================================================

function [Ret] = uiPrm_Hex3d1 ( Hex )
//
// DEPRECATED function. Please, use 'btR_ui_prmDrawHex3d1'. 
  
  [Ret] = btR_ui_prmDrawHex3d1( Hex );
  return [Ret];
  
endfunction 

function [Ret] = uiPrm_Hex3d2 ( Points )
//
// DEPRECATED function. Please, use 'btR_ui_prmDrawHex3d2'. 
  
  [Ret] = btR_ui_prmDrawHex3d2( Points );
  return [Ret];
 
endfunction 

// =================================================================================
// btR_ui_prmDrawHex3d1
// =================================================================================

function [Ret] = btR_ui_prmDrawHex3d1 ( Hex )
  
  Ret = 1;
  
  [ret,Points] = AuxPrm_Hex3dGetPoints ( Hex )
  Ret = btR_ui_prmDrawHex3d2 ( Points );
  
  return Ret;    
  
endfunction 

// =================================================================================
// btR_ui_prmDrawHex3d2
// =================================================================================

function [Ret] = btR_ui_prmDrawHex3d2 ( Points )
  
  Ret = 1;  
  
  // Add first point to last position for closing the figure
  points = [ Points; Points(1,:) ];
  
  // Draw hexagon
  hex_x = points(:,1);
  hex_y = points(:,2);
  hex_z = points(:,3);    
  param3d( hex_x,hex_y,hex_z );   
  
  return Ret;
  
endfunction 

// =================================================================================

