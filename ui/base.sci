// =============================================================================
// gfx4scilab - ui
// dgerod@xyz-lab.org.es
// =============================================================================

function ui_setObjProp(Object, Properties)

    for prop = Properties;
      set(Object, prop(1), prop(2));
    end

endfunction

//------------------------------------------------------------------------------

function ui_setObjText(Tag, Text)

  aux = findobj('tag',Tag);
  aux.String = Text;

endfunction

//------------------------------------------------------------------------------

function Var = ui_getObjText(Tag)

  aux = findobj('tag',Tag);
  Var = aux.String;

endfunction

//------------------------------------------------------------------------------

function Object = ui_getObjTextVal(Tag)

  aux = findobj('tag',Tag);
  Object = strtod(aux.String);

endfunction

//------------------------------------------------------------------------------

function Value = ui_getObjVal(Tag)

  aux = findobj('tag',Tag);
  Value = aux.value;
  return Value;

endfunction

//------------------------------------------------------------------------------

function Object = ui_getObjByName(Name)

  Object = findobj('tag',Tag);

endfunction

//------------------------------------------------------------------------------

function ui_closeAllElements(Elements)

  if(typeof(Elements)=='list') then
    for item = Elements; 
      hNum = size(item,'r');  
      for i = hNum:-1:1;
       delete(item(i,1));
      end
    end
  else
    hNum = size(Elements,'r');  
    for i = hNum:-1:1;
       delete(Elements(i,1));
    end
  end

endfunction


//------------------------------------------------------------------------------

ui_FindElementByName = ui_getObjByName;

// =============================================================================

