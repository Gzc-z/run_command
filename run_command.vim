let tyofile = {'python': 'python3', 'c': 'c', 'html': $BROWSER, 'javascript': 'node'}

function! RunFile()
  let type = &filetype
  let file = expand('%:p')
  let archive = get(g:tyofile, type, '')

  " if empty(archive)
  "   echom "não foi encontrado: " . type
  "   return
  " endif

  execute '!' . archive . ' ' . file
endfunction

command! RUN call RunFile()

