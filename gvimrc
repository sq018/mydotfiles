" use visual bell
set vb

" disable some default key bindings in macvim
if has("gui_macvim")
  macmenu File.Print key=<nop>
  macm Tools.Make<Tab>:make key=<nop>
endif
