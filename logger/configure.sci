// =============================================================================
// gfx4scilab - drawing
// dgerod@xyz-lab.org.es
// =============================================================================

function lg_enable(isOn)

  global logCfg;

  if isOn == %t then
     logCfg.enabled = %t;
  else
     logCfg.enabled = %f;
  end

endfunction

// -----------------------------------------------------------------------------

function lg_setFileMode(isFileMode)

  global logCfg;

  if isFileMode == %t then
     logCfg.logFile.fileType = %t;
  else
     logCfg.logFile.fileType = %f;
  end

endfunction


// =============================================================================
