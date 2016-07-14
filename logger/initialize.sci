// =============================================================================
// gfx4scilab - drawing
// dgerod@xyz-lab.org.es
// =============================================================================

function lg_init()
// Logging parameters
// console: 
//	TRUE log in console. 
//	FALSE not log in console
// enabled: 
//	TRUE log enabled. 
//	FALSE log not enabled
// path: folder path where logs files are created
// fileName: Name of the log file
// autoName: 
//	TRUE: enables automatic generation of log file name 
//		-> 'fileName + date&tiem' -> Ex:logtest_5-3-2010_-16-33-9-987.log
// fileType: 
//	F: Log on files disabled. 
//	T: Log in a text file format
// fd (Reserved): opened file handle
//

  global logCfg;

  logFile = struct("path", "", "fileName", "LogData", "autoName", %t, "fileType", %f, "fd", 0);
  logCfg = struct("logFile", logFile, "console", %t, "enabled", %t);
  logCfg.logFile.path = pwd();

endfunction

// -----------------------------------------------------------------------------

function [err] = lg_open()

  global logCfg;

  err = 0;
  msg ="";
  if (logCfg.logFile.fileType == %t) then
    [logCfg.logFile.fd, err] = mopen(__lg_getFilePathName(), "wt");
    [err, msg] = merror(logCfg.logFile.fd);
    
    if (err <> 0) then
      mprintf("\nFILE OPEN ERROR:%d - %s",err,msg);
    end
  end
  
  return err;

endfunction

// -----------------------------------------------------------------------------

function lg_close()

  global logCfg;
  
  if (logCfg.logFile.fd > 0) then
    mclose(logCfg.logFile.fd);
  end
  
endfunction

// -----------------------------------------------------------------------------

function [filePath] = __lg_getFilePathName()

  global logCfg;
  name = logCfg.logFile.fileName;

  if(logCfg.logFile.autoName == %t) then
    w = getdate();
    name = sprintf("%s_%d_%d_%d_%d_%d_%d_%d.log", ...
       logCfg.logFile.fileName, w(6), w(2), w(1), w(7), w(8), w(9), w(10));
  end
  
  filePath = sprintf("%s\%s", logCfg.logFile.path, name);
  return filePath;

endfunction

// -----------------------------------------------------------------------------

function [source] = __lg_getCode(source, varargin)
  
  rhs = argn(2);
  
  if(rhs >= 1) then
    for i=1:length(varargin(1));
      source = sprintf("%s%s",source ,",");
      source = sprintf("%svarargin(%d)",source ,i);
    end
  end

  return source;

endfunction

// =============================================================================
