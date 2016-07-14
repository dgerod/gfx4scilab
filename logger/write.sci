// =============================================================================
// gfx4scilab - drawing
// dgerod@xyz-lab.org.es
// =============================================================================

function lg_writeText(outFormat, varargin)

  global logCfg;
  
  if(logCfg.enabled == %f) then
    return;
  end
  
  if (logCfg.console == %t) then

    source = msprintf('mprintf(outFormat');
    if(length(varargin) > 0) then
      source = log_getCode(source, varargin);
    end  
    source = msprintf('%s%s', source, ');');
    
    execstr(source);
  end
  
  if ((logCfg.logFile.fileType == %t) & (logCfg.logFile.fd > 0)) then

    source = msprintf('fprintf(logCfg.logFile.fd, outFormat');    
    if(length(varargin)>0) then
      source = log_getCode(source, varargin);
    end    
    source = msprintf('%s%s',source , ');');
    
    execstr(source);
  end
  
endfunction

// -----------------------------------------------------------------------------

function lg_writeLine(outFormat, varargin)

  log_write('[log] ');
  items=length(varargin);
  source=msprintf('log_write(outFormat');
  if(length(varargin)>0) then
    source=log_getCode(source,varargin);
  end  
  source =msprintf('%s%s',source , ');');
  execstr(source);
  log_write_text('\n');

endfunction

// =============================================================================
