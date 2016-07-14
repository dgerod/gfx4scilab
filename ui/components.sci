// =============================================================================
// gfx4scilab - ui
// dgerod@xyz-lab.org.es
// =============================================================================

//------------------------------------------------------------------------------
// Collection
//------------------------------------------------------------------------------

function [Collection] = ui_Collection_addElement(Collection, NewElement)
  
  exist = %f;
  for item = 1:size(NewElement,'r');
    if (Collection(item) == NewElement) then
      exist=%t;
      break;
    end
  end

  if (exist == %f) then
      Collection($+1) = NewElement;
  end

  return Collection;

endfunction

//------------------------------------------------------------------------------

function ui_Collection_releaseAll(Collection)

  if(typeof(Collection)=='list') then
    for item = Collection; 
      hNum = size(item,'r');  
      for i = hNum:-1:1;
       delete(item(i,1));
      end
    end
  else
    hNum = size(Collection,'r');  
    for i = hNum:-1:1;
       delete(Collection(i,1));
    end
  end

endfunction

//------------------------------------------------------------------------------
// Element
//------------------------------------------------------------------------------

function [Element] = ui_Element_setTag(Element, Tag)
    set(Element, "Tag", Tag);
endfunction

//------------------------------------------------------------------------------

function [Element] = ui_Element_addCb(Element, FunctionName)    
    Element.callback = FunctionName;
    Element.callback_type = 2;        
endfunction

//------------------------------------------------------------------------------

function [Element] = ui_Element_addCbForApp(Element, FunctionName)    
    Element.callback = ui_theApp_cbDispatcher;
    Element.callback_type = 2;
    Element.app_callback = ui_prepareAppCallback(FunctionName);        
endfunction

//------------------------------------------------------------------------------

function [Element] = ui_Element_setProperty(Element, Property)
   set(Element, Property(1), Property(2));
   return Element;
endfunction

//------------------------------------------------------------------------------

function [Property] = ui_ElementProperty(Name, Value)
    Property = list(Name, Value);
    return Property;
endfunction 

//------------------------------------------------------------------------------
// EditBox
//------------------------------------------------------------------------------

function [Element] = ui_EditBox_create(Collection, Args)

    Pos = Args(1);
    Label = Args(2);

    Element = uicontrol(Collection(1), 'Style', 'edit', ...
        'String', Label, 'Position', Pos, 'Tag', '');
    return Element;
      
endfunction

//------------------------------------------------------------------------------

function [Element] = ui_EditBox_writeText(Element, Text)
    set(Element, "String", Text);
endfunction
  
//------------------------------------------------------------------------------
// Button
//------------------------------------------------------------------------------

function [Element] = ui_Button_create(Collection, Args)

    Pos = Args(1);
    Label = Args(2);

    // {pushbutton} | radiobutton
    Element = uicontrol(Collection(1), 'Style', 'pushbutton', ...
        'String', Label, 'Position', Pos, 'Tag', '');  
   return Element;
   
endfunction

//------------------------------------------------------------------------------
// StaticText
//------------------------------------------------------------------------------

function [Element] = ui_StaticText_create(Collection, Args)

    Pos = Args(1);
    Label = Args(2);

    Element = uicontrol(Collection(1), 'style', 'text', ...
        'String', Label, 'Position', Pos, 'Tag', '');     
    return Element;
  
endfunction

//------------------------------------------------------------------------------
// Container
//------------------------------------------------------------------------------

function [Collection] = ui_Container_create(Collection, Args)

    FramePos = Args(1);
    FrameTitle = Args(2);

    // Frame 
    Collection($+1) = uicontrol(Collection(1), "Position", FramePos, ...
        "Style", "frame", "BackgroundColor", [0.9 0.9 0.9], 'Tag', '');

    // Frame_title 
    if (Args(2) <> "") then
        pos = [(FramePos(1,1)+10) (FramePos(1,2)+FramePos(1,4)-5) (FramePos(1,3)-20) 15]; 
        
        static_args($+1) = gettext(Args(1)), "BackgroundColor", [0.9 0.9 0.9]
        Collection($+1) = ui_StaticText_create(Collection(1), Args)
        Collection($+1) = ui_Element_setProperties(Collection($+1), ..
            ui_Property("BackgroundColor", [0.9 0.9 0.9]));
    end

    return Collection; 

endfunction

//------------------------------------------------------------------------------

function [Container] = ui_Container_addElement(Container, NewElement)

endfunction

// =============================================================================

