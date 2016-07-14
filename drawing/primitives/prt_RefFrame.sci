// =============================================================================
// prm_RefFrame.sci
// =============================================================================

function [Ret] = gfx_drawRefFrame ( RefFrame )
   
    Ret = 1;
    
    len = RefFrame.dim.len;
    T = RefFrame.T;
    name = RefFrame.name;
    
    //
    // ------------------------------------------------------
    
    if len < 0 then
      len = 1;
    end
          
    O  = T*[0 0 0 1]';    
    vx = T*[len 0 0 1]';
    vy = T*[0 len 0 1]';
    vz = T*[0 0 len 1]';
    
    //
    // ------------------------------------------------------
    
    red = color( 255,0,0 );
    green = color( 0,255,0 );
    blue = color( 0,0,255 );
    
    oc = xget("color" );    
    xset("color",red );    
    param3d( [vx(1),O(1)],[vx(2),O(2)],[vx(3),O(3)] );    
    xset("color",green ); 
    param3d( [vy(1),O(1)],[vy(2),O(2)],[vy(3),O(3)] );    
    xset("color",blue ); 
    param3d( [vz(1),O(1)],[vz(2),O(2)],[vz(3),O(3)] );    
    xset("color",oc);
    
    // Write name if it exists
    if ( isfield(RefFrame,"name") == %T & ...
         isempty(name) == %F ) then
      
        gfxDrawText3d( O(1),O(2),O(3),name );

    end
          
    // ------------------------------------------------------
    
    return Ret;

endfunction 

// =============================================================================
