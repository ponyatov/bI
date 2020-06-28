import logging
let log = newConsoleLogger(fmtStr = "[$date $time] - $levelname: ")
addHandler(log)

import os
import memfiles as mmap

var src: MemFile

proc main =
  let argv = @[os.getAppFilename()] & os.commandLineParams()
  for i in pairs(argv):
    info "argv[", i.key, "] = <", i.val, ">"
  debug "mmap ", argv[1]
  src = mmap.open(argv[1])
  defer: src.close()

when isMainModule: main()
