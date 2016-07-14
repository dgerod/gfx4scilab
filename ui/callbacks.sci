// =============================================================================
// gfx4scilab - ui
// dgerod@xyz-lab.org.es
// =============================================================================

function [Str] = ui_prepareAppCallback(FunctionName)

    args = "Handles, AppData";
    Str = msprintf("[%s] = %s(%s)", args, FunctionName, args);
    return Str;
  
endfunction

// -----------------------------------------------------------------------------

function [Element] = ui_registerAppCallback(Element, FunctionName)
// This function register a callback by name as an application callback.
// An application callback must be declared as: 
//      [Handles, AppData] = name_of_the_function (Handles, AppData)
//
// If the function is not correctly declared an error during execution 
// will be raised.

    Element.callback = ui_theApp_cbDispatcher;
    Element.callback_type = 2;
    
    callback = ui_prepareAppCallback(FunctionName);    
    Element.my_callback = callback
  
    return Element;
    
endfunction

function [theApp] = ui_theApp_cbDispatcher(theApp)

    self = gcbo;
    
    [theApp.uiElements, theApp.AppDAta] = self.my_callback(theApp.uiElements, theApp.AppDAta)
    return theApp;
  
endfunction

// =============================================================================

