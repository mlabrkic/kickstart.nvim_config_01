" https://jdhao.github.io/2019/01/17/nvim_qt_settings_on_windows/

" Nvim-qt Settings on Windows 10

" To run Neovim on Windows, you can either use the terminal Neovim or use a GUI for Neovim.
" If you use terminal Nvim, you may encounter various annoying issues.
" Based on my experience, I recommend you using a GUI client for Nvim instead of the terminal one.

" Nvim-qt is one of the many GUI front end for Neovim, and it is packaged with Neovim by default on Windows platform.
" In this post, I will give a summary on how to solve a few issues with Nvim-qt.

" ---------------------------------------------
" GUI settings - ginit.vim
" ---------------------------------------------

" Nvim-qt has also provided a list of its own command to configure its behaviors.
" I list some of the settings in the following sections.

" ---------------------------------------------
" How to change the font used?

" You can change the font Nvim-qt uses by default.
" To check the default font used, use GuiFont command without argument inside nvim-qt.
" On my system, the output is Consolas:h11.
" :GuiFont

" According to nvim-qt documentation, the following attributes for fonts are available:
" hXX - height is XX in points
" b   - bold weight
" l   - light weight
" i   - italic
" GuiFont Hack:h10:l

" After issuing the above command, you may see the following warning message:
" Warning : Font “Hack” reports bad fixed pitch metrics.
" To suppress this message, use the bang version of GuiFont command instead:
" :GuiFont! Hack:h10:l

" ---------------------------------------------
"Fonts :
" monospaced, Adobe
" C:\UTILS\INSTALL\fonts_source-code-pro\"
" source-code-pro-2.030R-ro-1.050R-it.zip
" -->
" SourceCodePro-Regular.ttf
" -->
"Control Panel\All Control Panel Items\Fonts\Source Code Pro

" ---------------------------------------------
":help map-which-keys
":help {key}^D"
"^D is CTRL-D
" <S-Right>
" <S-Left>

" ---------------------------------------------

" Fix key mapping issues for GUI
inoremap <silent> <S-Insert>  <C-R>+
cnoremap <S-Insert> <C-R>+
nnoremap <silent> <C-6> <C-^>

if exists('g:GuiLoaded')
    " Guifont! Source Code Pro:h14:cEASTEUROPE
    Guifont! Source Code Pro:h16:cEASTEUROPE

    nmap <C-0> :Guifont! Source Code Pro:h16:cEASTEUROPE<CR>
    nmap <C-1> :Guifont! Source Code Pro:h18:cEASTEUROPE<CR>
    nmap <C-2> :Guifont! Source Code Pro:h20:cEASTEUROPE<CR>


    call GuiWindowMaximized(1)
    GuiTabline 0
    GuiPopupmenu 0
    GuiLinespace 2
endif

