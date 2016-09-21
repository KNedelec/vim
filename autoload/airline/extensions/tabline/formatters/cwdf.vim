function! airline#extensions#tabline#formatters#cwdf#format(bufnr, buffers)
  return fnamemodify(getcwd(), ':t')
endfunction
