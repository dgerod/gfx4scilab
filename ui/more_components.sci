// =============================================================================
// gfx4scilab - ui
// dgerod@xyz-lab.org.es
// =============================================================================

//------------------------------------------------------------------------------
// MessageBox
//------------------------------------------------------------------------------

function [Element] = ui_MsgBox_create(Collection, Args)

    Element = list();

    Pos = Args(1);
    Label = Args(2);
    Text = Args(3);

    // Message box ---
    
    args = list([5 35 615 25], 'Message');
    element1 = ui_StaticText_create(Collection(1), args);
    element1 = ui_Element_setProperty(element1, ui_ElementProperty("FontSize", 14));
    element1 = ui_Element_setProperty(element1, ui_ElementProperty("FontWeight", "bold"));
    element1 = ui_Element_setProperty(element1, ui_ElementProperty("BackgroundColor", [0.9 0.9 0.9]));
    
    args = list([5 5 615 25], '');
    element2 = ui_EditBox_create(Collection(1), args);
    element2 = ui_Element_setProperty(element2, ui_ElementProperty("FontSize", 14));
    element2 = ui_Element_setProperty(element2, ui_ElementProperty("BackgroundColor", [0.8 0.8 0.8]));
    element2 = ui_Element_setProperty(element2, ui_ElementProperty("Enable", "off"));
    element2 = ui_Element_setText(element2, Text);

    Element($+1) = element1;
    Element($+1) = element2;
    return Element

endfunction

//------------------------------------------------------------------------------
// EditBoxPanel
//------------------------------------------------------------------------------

function [Collection] = ui_EditBoxPanel_create1(Collection, Args)
  
  Titles = Args(2);     // Edit Box Labels
  DefVal = Args(3);     // Edit Box default values
  Tags = Args(4);       // Edit Box Tags
  FramePos = Args(5);   // External Frame dimensions
  WItem = Args(6);      // Width of elements
  HItem = Args(7);      // Heigth of elements
 
  nb_elm = size(Titles);
  nb_inputs = (size(Tags(1)))+1;

  VFreeSpace = ((FramePos(1,4)-(nb_elm*HItem))/(nb_elm +1));
  HFreeSpace = ((FramePos(1,3)-(nb_inputs*WItem))/(nb_inputs+1));
  
   // Frame 
  Collection($+1) = uicontrol(Collection(1), "Position", FramePos, ...
    "Style", "frame", ...
    "BackgroundColor", [0.9 0.9 0.9]);

    // Frame_title 
    if(Args(1)<>"") then
      Pos= [(FramePos(1,1)+10) (FramePos(1,2)+FramePos(1,4)-5) (FramePos(1,3)-20) 15]; 
      Collection($+1)=uicontrol(Collection(1), "Position",Pos,"Style", "text","String", gettext(Args(1)),"BackgroundColor", [0.9 0.9 0.9]);
    end
  
    for item=1:nb_elm
      //title 
      Pos= [(FramePos(1,1)+HFreeSpace) (FramePos(1,2)+FramePos(1,4)-(item*(VFreeSpace+HItem))) WItem HItem]; 
      Collection($+1)=uicontrol(Collection(1), "Position",Pos , ...
      "Style", "text",...
      "String", gettext(Titles(item)),...
      "FontWeight","bold",...
      "FontSize",14,...
      "BackgroundColor", [0.9 0.9 0.9]);
  
      //edit Box
      Pos= [(FramePos(1,1)+(FramePos(1,3)/2)+(HFreeSpace/2)) (FramePos(1,2)+FramePos(1,4)-(item*(VFreeSpace+HItem))) WItem HItem]; 
      
      Collection($+1)=uicontrol(Collection(1), "Position",Pos , ...
      "Style", "edit", ...
      "FontSize", 14, ...
      "String", gettext(DefVal(item)), ...
      "BackgroundColor", [1 1 1], ...
      "Tag",Tags(item));
    end   

    return Collection; 

endfunction
  
//------------------------------------------------------------------------------

function [Collection] = ui_EditBoxPanel_create2(Collection, Args)
//
// Function: ui_Comb_Input2
// Description:
//             
// Parameters: 
//
// Return: 
//
//--------------------------------------------------------
// Example:
//  CombData = list("Initial Robot Position",list("Pos:","Vel:","Acc:"),list(list("0.0","0.0","0.0"),list("0.0","0.0","0.0"),list("0.0","0.0","0.0")),...
//            list(list("RPI_X","RPI_Y","RPI_Z"),list("RVELI_X","RVELI_Y","RVELI_Z"),list("RACCI_X","RACCI_Y","RACCI_Z")),[10 140 300 110],70,25);
// [handles] = ui_Comb_Input2(handles,CombData);
    
  Titles = Args(2);   //Label of each row
  DefVal = Args(3);   // Sequential list of list of Default values
  Tags = Args(4);     // Sequential list of list of Tags
  FramePos = Args(5); // External Frame dimensions
  WItem = Args(6);    // elements width
  HItem = Args(7);    // elements Heigth
   
  nb_elm = size(Titles);
  nb_inputs = (size(Tags(1)))+1;
  VFreeSpace = ((FramePos(1,4)-(nb_elm*HItem))/(nb_elm +1));
  HFreeSpace = ((FramePos(1,3)-(nb_inputs*WItem))/(nb_inputs+1));

   //Frame 
  Collection($+1)=Collection(Collection(1), "Position", FramePos, ...
    "Style", "frame", ...
    "BackgroundColor", [0.9 0.9 0.9]);
  //Frame_title 
   Pos= [(FramePos(1,1)+10) (FramePos(1,2)+FramePos(1,4)-5) (FramePos(1,3)-20) 15]; 
  Collection($+1)=uicontrol(Collection(1), "Position",Pos, ...
    "Style", "text",...
    "String", gettext(Args(1)),...
    "BackgroundColor", [0.9 0.9 0.9]);
   
    for item=1:nb_elm
      //title 
      Pos= [(FramePos(1,1)+HFreeSpace) (FramePos(1,2)+FramePos(1,4)-(item*(VFreeSpace+HItem))) WItem HItem]; 
      Collection($+1)=uicontrol(Collection(1), "Position",Pos , ...
      "Style", "text",...
      "String", gettext(Titles(item)),...
      "FontWeight","bold",...
      "FontSize",14,...
      "BackgroundColor", [0.9 0.9 0.9]);
      
      //edit Box 1
      Pos= [(FramePos(1,1)+ HFreeSpace+WItem) (FramePos(1,2)+FramePos(1,4)-(item*(VFreeSpace+HItem))) WItem HItem]; 
      
      Collection($+1)=uicontrol(Collection(1), "Position",Pos , ...
      "Style", "edit", ...
      "FontSize", 14, ...
      "String", gettext(DefVal(item)(1)), ...
      "BackgroundColor", [1 1 1], ...
      "Tag",Tags(item)(1));
      
       //edit Box 2
      Pos= [(FramePos(1,1)+ (2*(HFreeSpace+WItem))) (FramePos(1,2)+FramePos(1,4)-(item*(VFreeSpace+HItem))) WItem HItem]; 
      
      Collection($+1)=uicontrol(Collection(1), "Position",Pos , ...
      "Style", "edit", ...
      "FontSize", 14, ...
      "String", gettext(DefVal(item)(2)), ...
      "BackgroundColor", [1 1 1], ...
      "Tag",Tags(item)(2));
      
       //edit Box 3
      Pos= [(FramePos(1,1)+ (3*(HFreeSpace+WItem))) (FramePos(1,2)+FramePos(1,4)-(item*(VFreeSpace+HItem))) WItem HItem]; 
      
      Collection($+1)=uicontrol(Collection(1), "Position",Pos , ...
      "Style", "edit", ...
      "FontSize", 14, ...
      "String", gettext(DefVal(item)(3)), ...
      "BackgroundColor", [1 1 1], ...
      "Tag",Tags(item)(3));
    end   
    
    return Collection; 
    
endfunction

//------------------------------------------------------------------------------

// Deprecated
ui_Comb_Input1 = ui_EditBoxPanel_create1;
ui_Comb_Input2 = ui_EditBoxPanel_create2;

// =============================================================================

