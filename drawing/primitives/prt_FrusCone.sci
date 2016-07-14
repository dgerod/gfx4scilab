// =================================================================================
// uiPrm_FrusCone
// =================================================================================

function [Ret] = uiPrm_FrusCone1 ( FrusCone )
//
// DEPRECATED function. Please, use 'btR_ui_prmDrawFrusCone1'. 

  [Ret] = btR_ui_prmDrawFrusCone1( FrusCone );
  return Ret;    
  
endfunction 

function [Ret] = AuxDrw_FrusCone2 ( Points )
//
// DEPRECATED function. Please, use 'btR_ui_prmDrawFrusCone2'. 
  
  [Ret] = btR_ui_prmDrawFrusCone2( Points );
  return Ret;
  
endfunction 

// =================================================================================
// btR_ui_prmFrusCone1
// =================================================================================

function [Ret] = btR_ui_prmDrawFrusCone1 ( FrusCone )

  Ret = 1;
  
  [ret,Points] = AuxPrm_FrusConeGetPoints( FrusCone );
  Ret = btR_ui_prmDrawFrusCone2 ( Points );
  
  return Ret;    
  
endfunction 

// =================================================================================
// btR_ui_prmFrusCone2
// =================================================================================

function [Ret] = btR_ui_prmDrawFrusCone2 ( Points )
  
  Ret = 1;
  
  Ret = btR_ui_prmDrawCylinder2( Points );  
  return Ret;
  
endfunction 

// =================================================================================
