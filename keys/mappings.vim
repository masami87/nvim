inoremap jk <ESC>
inoremap kj <ESC>

" 使用ESC回到NORMAL模式
tnoremap <ESC> <C-\><C-n>

" TAB in general mode will move to text buffer
nnoremap <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <S-TAB> :bprevious<CR>

" Telescope
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" BufferLine
nnoremap <silent>    <leader>1 <Cmd>BufferLineGoToBuffer 1<CR>
nnoremap <silent>    <leader>2 <Cmd>BufferLineGoToBuffer 2<CR>
nnoremap <silent>    <leader>3 <Cmd>BufferLineGoToBuffer 3<CR>
nnoremap <silent>    <leader>4 <Cmd>BufferLineGoToBuffer 4<CR>
nnoremap <silent>    <leader>5 <Cmd>BufferLineGoToBuffer 5<CR>
nnoremap <silent>    <leader>6 <Cmd>BufferLineGoToBuffer 6<CR>
nnoremap <silent>    <leader>7 <Cmd>BufferLineGoToBuffer 7<CR>
nnoremap <silent>    <leader>8 <Cmd>BufferLineGoToBuffer 8<CR>
nnoremap <silent>    <leader>9 <Cmd>BufferLineGoToBuffer 9<CR>


" open nvim-tree
nnoremap <C-b> :NvimTreeToggle<CR>

" Alternate way to save
nnoremap <C-s> :w<CR>
" Alternate way to quit
" nnoremap <C-Q> :wq!<CR>

" formatting
nnoremap <silent> <space>f <cmd>lua vim.lsp.buf.formatting()<CR>

" Code navigation shortcuts
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
" To activate hover actions, run the command twice -> KK
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> ga    <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> <space>e <cmd>lua vim.diagnostic.open_float()<CR>
nnoremap <silent> <space>q <cmd>lua vim.diagnostic.setloclist()<CR>


