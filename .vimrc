let mapleader = "\<Space>"

" move among buffers with CTRL
map <C-J> :bnext<CR>
map <C-K> :bprev<CR>

" 
nnoremap <Leader>b :ls<CR>:b<Space>

colorscheme abstract
" noremap <F2> <ESC>:tabprev <CR>
" vnoremap <F1> <ESC>:tabprev <CR>
" inoremap <F1> <ESC>
"  
" noremap <F3> <ESC> :w <CR> :make <CR>
" inoremap <F3> <ESC> :w <CR> :make <CR>
"  
" noremap <F7> <ESC> :w !python3 <CR>
"  
" noremap <F8> <ESC> :w <CR> :!g++ -fsanitize=address -std=c++17 -DONPC -O2 -o %< % && ./%< < inp<CR>
" inoremap <F8> <ESC> :w <CR> :!g++ -fsanitize=address -std=c++17 -DONPC -O2 -o "%<" "%" && "./%<" < inp<CR>
"  
"  
noremap <F2> <ESC> :w <CR> :!g++ -fsanitize=address -std=c++17 -Wall -Wextra -Wshadow -O2 -o %< % && ./%< <CR>
"  
"  
noremap <F3> <ESC> :w <CR> :!g++ -fsanitize=address -std=c++17 -Wall -Wextra -Wshadow -DONPC -O2 -o %< % && cat in && ./%< < in > out 2>&1<CR>
"

" search into subfolders and doesnt leave the main one
set path+=**

" you can tab files
set wildmenu
":b [substring] will go to the buffer file that match that substring

noremap <F7> <ESC>:w<CR>:!gcc -Wall -Werror -Wextra -pedantic -std=c99 % -o %:r && "./%<" <CR>

"noremap <F8> <ESC>:w<CR>:!gcc -Wall -Wextra -pedantic -std=c99 *.c -o %:r && "./%<"<CR>

" noremap <F9> <ESC>:w<CR>:!gcc -Wall -Wextra -pedantic -std=c99 *.c -o %:r && "./%<" in  > out && cat out<CR>

" noremap <F8> <ESC>:w<CR>:!gcc -Wall -Wextra -pedantic -std=c99 % -o %:r && "./%<"<CR>
inoremap jk <ESC>
 
 
"let c_syntax_for_h=""
 
"let g:netrw_keepdir = 0
 
"let g:netrw_localrmdir='rm -r'
 
" noremap <Leader>b ^
"open file
noremap <Leader>e <ESC>:e .<CR>
noremap <Leader>r <C-R>
noremap <Leader>j <C-W><C-J>
noremap <Leader>u i_<ESC>r
noremap <Leader>n :vs 
noremap <Leader>q :q<CR>
"back buffer
noremap <Leader>o <C-O>
"next buffer
noremap <Leader>i <C-I>
"selecciona todo 
noremap <Leader>a ggVG
"commenta el codigo
noremap <Leader>/ 0i//<ESC> 
noremap <Leader>s :source ~/.vimrc <CR>
 
"command! Prog :e ~/Documents/programming/
"command! SP :e ~/Documents/SPBU_SP_6_term/
command! Kek source ~/.vimrc
"autocmd FocusLost * redraw!
"command! LLDB :!clang++ -fsanitize=address -std=c++17 -O0 -g -o "%<" "%" && lldb %<
"command! Gdb !g++ -std=c++18 -O0 -g -o %< 
command! Gcc !gcc -Wall -Wextra -pedantic -std=c99 % -o %:r && "./%<"
 
 
set autoindent
set autoread
set cin
set expandtab
set guifont=Menlo\ Regular:h16
set history=1000
set hlsearch
set ignorecase
set incsearch
set mousehide
set noerrorbells
set noswapfile
set number
set pastetoggle=
set shiftwidth=2
set smarttab
set tabstop=2
set vb t_vb=
set relativenumber

" set autoindent: al habilitar esta opción, Vim automáticamente indenta las nuevas líneas en función de la indentación de la línea anterior.
" set autoread: permite que Vim recargue automáticamente el archivo si éste cambia mientras se está editando.
" set cin: configura la indentación automática para ciertas situaciones de código.
" set expandtab: convierte automáticamente las tabulaciones en espacios en blanco.
" set guifont=Menlo\ Regular:h16: establece la fuente y el tamaño de la fuente en Vim cuando se utiliza una interfaz gráfica de usuario.
" set history=1000: establece el número máximo de entradas en el historial de comandos de Vim.
" set hlsearch: hace que Vim resalte automáticamente todas las coincidencias de búsqueda en el texto.
" set ignorecase: hace que las búsquedas sean insensibles a mayúsculas y minúsculas.
" set incsearch: hace que Vim muestre los resultados de la búsqueda a medida que se escribe la consulta.
" set mousehide: oculta automáticamente el cursor del mouse cuando se está escribiendo.
" set noerrorbells: deshabilita la campana o el pitido que hace Vim en ciertas situaciones de error.
" set noswapfile: evita que Vim cree archivos de intercambio.
" set number: muestra el número de línea en la barra lateral izquierda del editor.
" set pastetoggle=: asigna una tecla para alternar el modo de pegado, lo que evita que Vim agregue automáticamente indentación o cambios de formato al pegar texto.
" set shiftwidth=2: establece la cantidad de espacios en blanco que se utilizan para la indentación automática.
" set smarttab: hace que Vim use espacios en blanco para la indentación cuando sea necesario, y tabulaciones cuando no lo sea.
" set tabstop=2: establece la cantidad de espacios en blanco que se utilizan para cada nivel de tabulación.
" set vb t_vb=: hace que Vim muestre un mensaje en la esquina inferior derecha cuando se presiona una tecla que no es válida.
" set relativenumber: muestra el número de línea actual y el número de línea relativo al cursor.


filetype on
filetype plugin on
" autocmd FileType cpp setlocal makeprg=g\+\+\ %\ \-g\ \-std\=c\+\+17\ \-Wall
" autocmd FileType haskell setlocal makeprg=ghci\ %
" autocmd FileType python setlocal makeprg=python3\ %
" autocmd FileType sh setlocal makeprg=%


    " filetype on: Habilita la detección automática del tipo de archivo que se está editando. Esto permite que Vim cargue automáticamente las configuraciones de sintaxis, indentación y otros ajustes que se ajusten al tipo de archivo.
    " filetype plugin on: Habilita la carga de complementos específicos del tipo de archivo. Esto significa que Vim cargará automáticamente los complementos que estén diseñados para el tipo de archivo que se está editando.
    " autocmd FileType cpp setlocal makeprg=g\+\+\ %\ \-g\ \-std\=c\+\+17\ \-Wall: Define un comando de compilación personalizado para archivos de tipo de archivo "cpp" (C++). Esto significa que al ejecutar el comando :make, Vim utilizará el compilador g++ con los parámetros -g, -std=c++17 y -Wall para compilar el archivo actual. El setlocal asegura que este comando solo se aplique a la ventana actual.
    " autocmd FileType haskell setlocal makeprg=ghci\ %: Define un comando de compilación personalizado para archivos de tipo de archivo "haskell". Esto significa que al ejecutar el comando :make, Vim utilizará el intérprete ghci para ejecutar el archivo actual.
    " autocmd FileType python setlocal makeprg=python3\ %: Define un comando de compilación personalizado para archivos de tipo de archivo "python". Esto significa que al ejecutar el comando :make, Vim utilizará el intérprete de Python 3 para ejecutar el archivo actual.
    " autocmd FileType sh setlocal makeprg=%: Define un comando de compilación personalizado para archivos de tipo de archivo "sh" (Shell script). Esto significa que al ejecutar el comando :make, Vim ejecutará el archivo actual como un script de shell. El uso de % como makeprg ejecutará el archivo actual como un script de shell.
   

syntax on
 
set shellslash
filetype indent on
let g:tex_flavor='latex'
set sw=2
set iskeyword+=:
    "
    " syntax on: Habilita la sintaxis resaltada en Vim para el lenguaje del archivo que se está editando. Esto hace que sea más fácil leer y editar el código, ya que los diferentes elementos sintácticos del lenguaje (como las palabras clave, los comentarios, las cadenas de caracteres, etc.) se resaltan con diferentes colores o estilos.
    " set shellslash: Especifica que se deben utilizar barras diagonales (o "slashes") como separadores de ruta en lugar de barras invertidas (o "backslashes"). Esto puede ser útil al trabajar con archivos en sistemas operativos que utilizan barras diagonales, como Linux o macOS.
    " filetype indent on: Habilita la indentación automática basada en el tipo de archivo que se está editando. Esto significa que Vim intentará utilizar un esquema de indentación adecuado para el lenguaje del archivo, lo que hace que sea más fácil escribir código bien estructurado y legible.
    " let g:tex_flavor='latex': Especifica el sabor de LaTeX que se está utilizando. En este caso, se está especificando que se está utilizando LaTeX estándar, en lugar de otro sabor como XeLaTeX o LuaLaTeX.
    " set sw=2: Especifica el ancho de la indentación en espacios. En este caso, se está utilizando un ancho de 2 espacios por nivel de indentación.
    " set iskeyword+=:: Agrega el carácter : a la lista de caracteres que se consideran parte de una palabra en el lenguaje que se está editando. Esto puede ser útil para algunos lenguajes que utilizan el carácter : como parte de sus palabras clave o identificadores.


