// =============================================================================
// gfx4scilab - ui
// dgerod@xyz-lab.org.es
// =============================================================================

function [theApp] = ui_theApp_create(AppView, AppController)
    handlers = list([]);    
    appData = struct();
    theApp = struct('uiElements', handles, 'appData', appData);
endfunction

// -----------------------------------------------------------------------------

function ui_theApp_destroy(theApp)
endfunction

//------------------------------------------------------------------------------

function ui_exitScilab()
    
    msg = gettext("Do you really want to quit Scilab?");
    answ = messagebox(msg, gettext("Quit Scilab"), "quextion", [gettext("Yes") gettext("No")], "modal");
    if answ==1 then
      exit;
    end
    
endfunction

// =============================================================================

