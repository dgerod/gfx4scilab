//Dependencies:
// ui_func.sci
// ui_graph_func.sci
// log_func.sci

//--------------------------------------------------------
// Function: log_gui_LogFolDlgCB
// Description:
//             
// Parameters: 
//
// Return: 
//
//--------------------------------------------------------
function log_gui_LogFolDlgCB()
  global logCfg;
  logCfg.logFile.path=uigetdir(logCfg.logFile.path,'Select Log file Folder');
endfunction

//--------------------------------------------------------
// Function: log_gui_LogCfDlgCB
// Description:
//             
// Parameters: 
//
// Return: 
//
//--------------------------------------------------------
function [handles]=log_gui_LogCfDlgCB(res,handles)
  global logCfg;
 //Get Data from configuration dialog
 if(res=='OK') then
   logCfg.enabled=%f;
   if(ui_getObjVal('LogCfgEnabled')==1) then
     logCfg.enabled=%t;
   end

    logCfg.console=%f;
    if(ui_getObjVal('LogCfgConsole')==1) then
      logCfg.console=%t;
    end

   logCfg.logFile.fileType=ui_getObjVal('LogCfgFile');
    
    logCfg.logFile.autoName=%f;
    if(ui_getObjVal('LogCfgFileAutName')==1) then
      logCfg.logFile.autoName=%t;
    end
  end
 
  ui_close_ui(handles($));
  handles($)=null();

endfunction

//--------------------------------------------------------
// Function: log_gui_LogCfDlg
// Description:
//             
// Parameters: 
//
// Return: 
//
//--------------------------------------------------------
function [handles]=log_gui_LogCfDlg(handles)
  
  localHandles=[];
  global logCfg;
  
  mainWinProp = list(list('Tag','Log_Cfg'),list('Position',[50 50 300 300]));
  Data = list('Logging Configuration',mainWinProp);
  localHandles($+1)=ui_Create_MainWin(Data);
  
  // A checkbox to enable/disable logging
  localHandles($+1) = uicontrol(localHandles(1), 'Position', [10 270 170 20], ...
  'Style', 'checkbox', ...
  'String', gettext('Enabled'), ...
  'UserData',[],...
  'Value',0,...
  'Tag', 'LogCfgEnabled');

  if(logCfg.enabled==%t) then
    set(localHandles($),'value',1);
  else
    set(localHandles($),'value',0);
  end
  
  // A checkbox to enable/disable logging to console
  localHandles($+1) = uicontrol(localHandles(1), 'Position', [10 240 170 20], ...
  'Style', 'checkbox', ...
  'String', gettext('Log to Console'), ...
  'UserData',[],...
  'Value',0,...
  'Tag', 'LogCfgConsole');
  
  if(logCfg.console==%t) then
    set(localHandles($),'value',1);
  else
    set(localHandles($),'value',0);
  end
  
  // A checkbox to enable/disable logging to file
  localHandles($+1) = uicontrol(localHandles(1), 'Position', [10 210 170 20], ...
  'Style', 'checkbox', ...
  'String', gettext('Log to File'), ...
  'UserData',[],...
  'Value',0,...
  'Tag', 'LogCfgFile');
  set(localHandles($),'value',logCfg.logFile.fileType);
 
  
  // A checkbox to enable/disable filename auto generation
  localHandles($+1) = uicontrol(localHandles(1), 'Position', [10 180 170 20], ...
  'Style', 'checkbox', ...
  'String', gettext('Auto Log File Name'), ...
  'UserData',[],...
  'Value',1,...
  'Tag', 'LogCfgFileAutName');
  
   if(logCfg.logFile.autoName==%t) then
    set(localHandles($),'value',1);
  else
    set(localHandles($),'value',0);
  end
  
  //Get Directory button
  localHandles($+1) = uicontrol(localHandles(1),'Style','pushbutton','String','Get Log Folder','Position',[ 10 150 100 20],'Callback','log_gui_LogFolDlgCB();');
   //OK Button
   localHandles($+1) = uicontrol(localHandles(1),'Style','pushbutton','String','OK','Position',[ 40 10 100 20],'Callback','[handles]=log_gui_LogCfDlgCB(''OK'',handles);');
   //Cancel Button
   localHandles($+1) = uicontrol(localHandles(1),'Style','pushbutton','String','CANCEL','Position',[ 160 10 100  20],'Callback','[handles]=log_gui_LogCfDlgCB(''CANCEL'',handles);');
   
   handles($+1) = localHandles;
   return handles;   
endfunction
