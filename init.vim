unmap <Space>


""""""""" jumping backwards and forwards """""""""
exmap goBack obcommand app:go-back
exmap goForward obcommand app:go-forward
nnoremap <C-o> :goBack<CR>
nnoremap <C-i> :goForward<CR>

" All these remaps with <Space> are because unfortunately I don't think it's
" possible to remap the leader key in obsidian vim

" Open current file in default program (want to use this to open files in nvim quickly from obsidian)
exmap openFile obcommand open-with-default-app:open
nmap <Space>opn :openFile<CR>

" x doesn't yank text anymore
nnoremap x "_x


" remap the § symbol so it can start macros
nmap § @



" H and L for going to the visual start/end of lines
nmap H g0
nmap L g$


set clipboard=unnamedplus

" no highlight search
noh


" jk in insert mode exits and goes to command mode
inoremap jk <Esc>

" Follow links using gd
exmap followLink obcommand editor:follow-link
nnoremap gd :followLink<CR>


