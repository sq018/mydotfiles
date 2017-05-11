" vimrc for graphical vim

" use visual bell
set vb

" disable some default key bindings in macvim
if has("gui_macvim")
  " remap <D-p> for Ctrlp
  macmenu File.Print key=<nop>
  " remap <D-b> to <C-^>
  macm Tools.Make<Tab>:make key=<nop>
  " remap <D-g> for :Gstatus
  macm Edit.Find.Find\ Next key=<nop>
endif
