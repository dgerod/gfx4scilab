// =================================================================================
// uiPrm_Cylinder
// =================================================================================

function [Ret] = uiPrm_Cylinder1 ( Cylinder )
//
// DEPRECATED function. Please, use 'btR_ui_prmDrawCylinder1'. 
    
  Ret = btR_ui_prmDrawCylinder1( Cylinder );
  return Ret;    
  
endfunction 

function [Ret] = uiPrm_Cylinder2 ( Points )
//
// DEPRECATED function. Please, use 'btR_ui_prmDrawCylinder2'. 
    
  Ret = btR_ui_prmDrawCylinder2( Points );
  return Ret;    
  
endfunction 

// =================================================================================
// btR_ui_prmCylinder1
// =================================================================================

function [Ret] = btR_ui_prmDrawCylinder1 ( Cylinder )
  
  Ret = 1;
  
  [ret,Points] = AuxPrm_CylinderGetPoints( Cylinder );
  Ret = btR_ui_prmDrawCylinder2( Points );
  
  return Ret;    
  
endfunction 

// =================================================================================
// btR_ui_prmCylinder2
// =================================================================================

function [Ret] = btR_ui_prmDrawCylinder2 ( Points )
  
  Ret = 1;  
  Cir1 = Points(:,1:3);
  Cir2 = Points(:,4:6);
  
  cir1_x = Cir1(:,1);
  cir1_y = Cir1(:,2);
  cir1_z = Cir1(:,3);    
  param3d( cir1_x,cir1_y,cir1_z );   
  
  cir2_x = Cir2(:,1);
  cir2_y = Cir2(:,2);
  cir2_z = Cir2(:,3);
  param3d( cir2_x,cir2_y,cir2_z );   
  
  for i=1:size(cir1_x,1);
    
    edges_x = [cir1_x(i) cir2_x(i)]; 
    edges_y = [cir1_y(i) cir2_y(i)];
    edges_z = [cir1_z(i) cir2_z(i)];           
    param3d( edges_x,edges_y,edges_z );   
    
  end
  
  return Ret;
  
endfunction 

// =================================================================================
