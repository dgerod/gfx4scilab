// =============================================================================
// gfx4scilab - ui
// dgerod@xyz-lab.org.es
// =============================================================================

//------------------------------------------------------------------------------
// MainWindow
//------------------------------------------------------------------------------

function [Handle] = ui_MainWnd_create(Data)
//
// Function: ui_Create_MainWin
// Description: Create a windows without child toolbars or menu
//             
// Parameters: 
//            Data:  list("Title" [,Properties]) where Properties = list(list([propi,vali]));
// Return: 
//
    
    // Create the main Window
//    handle = figure("figure_name", gettext(Data(1)),...
//    "Position",[50 50 300 195],...
//    "BackgroundColor",[0.9 0.9 0.9],...
//    "Units", "pixels");

    Handle = figure("figure_name", gettext(Data(1)), ...
                    "Position", [50 50 300 195], ...
                    "BackgroundColor", [0.9 0.9 0.9] );
      
    // Remove Scilab 'standard' menus
    delmenu(Handle.figure_id, gettext("&File"));
    delmenu(Handle.figure_id, gettext("&Tools"));
    delmenu(Handle.figure_id, gettext("&Edit"));
    delmenu(Handle.figure_id, gettext("&?"));
    
    // Disable graphics toolbar
    toolbar(Handle.figure_id, "off");
    
    // Adjust figure properties
    if(size(Data)>=2) then 
      ui_setObjProp(Handle,Data(2));
    end
    
    return Handle;
    
endfunction
    
//------------------------------------------------------------------------------
// MainFrame
//------------------------------------------------------------------------------

function [Handles] = ui_MainFrame_create(Handles, Data)
//
// Function: ui_Create_MainWin
// Description: Creates the application main window and its main menu (1 level of submenus supportred)
// Parameters: 
//             handles -> list to store the handles of created ui objects
//             Data -> list of entries (mainWindow [,menu1][,menui]) where
//                  Data(1)->  mainwindow: list("Title" [,Properties]) where Properties = list(list([propi,vali]));
//                  Data(i)->  menui: list(menui [,Submenui1][,submenui2]) where menui,submenui: list("Label" [,Properties]) where Properties = list(list([propi,vali]));
// Return: 
//            handles -> list of created ui objects

     
    Handles(1) = ui_MainWnd_create(Data(1));

    for menuItem=2:size(Data);   
      
      menu = Data(menuItem);  
      Handles($+1) = uimenu("Parent", Handles(1), "Label", gettext(menu(1)(1)));
      // Adjust menu properties
      if(size(menu(1))>=2) then 
        ui_setObjProp(Handles($),menu(1)(2));
      end
      //Add submenu entries if provided
      menuHandle = Handles($);
      
      for subMenuItem=2:size(menu);
        subMenu = menu(subMenuItem);
        Handles($+1) = uimenu("Parent",menuHandle, "Label",subMenu(1)); 
        // Adjust menu properties
        if(size(subMenu)>=2) then 
          ui_setObjProp(Handles($),subMenu(2));
        end
      end
      
    end
    
    return Handles;
    
endfunction

// =============================================================================

