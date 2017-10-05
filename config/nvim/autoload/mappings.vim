" This function converts a decimal number to binary string 
function! s:decimal_to_binary_string(dec, min_length)
  let decimal = a:dec
  let result = ''
  while decimal
    let result = '01'[decimal % 2] . result
    let decimal  = decimal / 2
  endwhile
  
  " Ensure that the min length is satisfied
  while strlen(result) < a:min_length
    let result = '0' . result
  endwhile
  return result
endfunction

" Cycle through all possible number modes beginning at the preconfigured
" options set by the user.
function! mappings#cycle_numbering() abort
  if exists('+relativenumber')
    
    " Here, we calculate the original and cycled numbering in decimal form
    let original_numbering = eval('0b' . &number . &relativenumber)
    let cycled_numbering = (original_numbering + 1) % 4

    " Convert the cycled numbering into a binary key
    let decimal_options = <sid>decimal_to_binary_string(cycled_numbering, 2)

    " Update the settings
    execute {
          \ '00': 'set nonumber | set norelativenumber',
          \ '01': 'set nonumber | set relativenumber',
          \ '10': 'set number   | set norelativenumber',
          \ '11': 'set number   | set relativenumber'
          \ }[decimal_options]
  else
    " No relative numbering, just toggle numbers on and off
    set number!<CR>
  endif
endfunction

" Zap trailing whitespace
function! mappings#zap() abort
  let l:pos=getcurpos()
  let l:search=@/
  keepjumps %substitute/\s\+$//e
  let @/=l:search
  nohlsearch
  call setpos('.', l:pos)
endfunction
