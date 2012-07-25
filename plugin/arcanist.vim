" arcanist.vim - An Arcanist wrapper
" Maintainer:   Jamie Wong <http://jamie-wong.com/>
" Version:      0.1

if exists('g:loaded_arcanist') || &cp
  finish
endif

let g:loaded_arcanist = 1
if !exists('g:arcanist_executable')
  let g:arcanist_executable = 'arc'
endif

function! s:shellesc(arg) abort
  if a:arg =~ '^[A-Za-z0-9_/.-]\+$'
    return a:arg
  elseif &shell =~# 'cmd'
    return '"'.s:gsub(s:gsub(a:arg, '"', '""'), '\%', '"%"').'"'
  else
    return shellescape(a:arg)
  endif
endfunction

function! s:arc_command(...) abort
  let cmd = g:arcanist_executable
  if has("gui_running")
    let cmd .= " --no-ansi"
  endif
  let cmd .= ' ' . join(map(copy(a:000), 's:shellesc(v:val)'), ' ')
  return cmd
endfunction

" Arc {{{1
function! s:Arc(cmd) abort
  execute "!" . s:arc_command() . " " . a:cmd
endfunction

command! -nargs=* Arc call s:Arc(<q-args>)
" }}}1

" ArcInlines {{{1

function! s:Inlines(...) abort
  " Given 0 arguments, just run arc inlines
  " Given 1 argument, run arc inlines --revision <ARG>
  let arc_args = ['inlines']

  if a:0
    let arc_args += ['--revision', a:1]
  endif

  let exec_cmd = "cexpr system('" . call("s:arc_command", arc_args) . "')"
  echo "Loading arc inlines..."
  silent! execute exec_cmd

  " Open the quickfix window
  botright copen
  " Switch back to the previous window
  wincmd p
endfunction

command! -nargs=? ArcInlines call s:Inlines(<f-args>)
" }}}1
