let g:tyofile = {'python': 'python3', 'c': 'c', 'html': $BROWSER, 'javascript': 'node', 'zsh': '$SHELL', 'go': 'go run', 'java': 'java'}

function! GetType(path) abort
  let buf = bufnr(a:path, 1)
  call bufload(buf)
  let curbuf = bufnr('%')
  execute 'buffer ' . buf
  filetype detect
  let type = &filetype
  execute 'buffer ' . curbuf

  return type
endfunction

function! RunFile(...) abort
  let file = (a:0 > 0) ? a:1 : expand('%:p')
  let type = GetType(file)
  let archive = get(g:tyofile, type, '')

  if empty(archive)
    echom "tipo não encontrado: " . type
    return
  endif

  execute '!' . archive . ' ' . shellescape(file)
endfunction

command! -nargs=? -complete=file RUN call RunFile(<f-args>)
