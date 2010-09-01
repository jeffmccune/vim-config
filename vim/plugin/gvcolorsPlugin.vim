" gvcolorsPlugin.vim
"   Author: Charles E. Campbell, Jr.
"   Date:   Oct 07, 2008
"   Version: 7b	NOT RELEASED
" ---------------------------------------------------------------------
"  Load Once: {{{1
if &cp || exists("g:loaded_gvcolorsPlugin")
 finish
endif
let g:loaded_gvcolorsPlugin = "v7b"
if v:version < 700
 echohl WarningMsg
 echo "***warning*** this version of gvcolors needs vim 7.0"
 echohl Normal
 finish
endif
let s:keepcpo= &cpo
set cpo&vim

" ---------------------------------------------------------------------
" Public Interface: {{{1
com! -nargs=0 GVColors call <SID>GVColors()

" ---------------------------------------------------------------------
" s:GVColors: {{{2
fun! s:GVColors()
"  call Dfunc("s:GVColors()")
  let rtplist= split(&rtp,',')
  for dir in rtplist
   if filereadable(dir."/autoload/gvcolors.vim")
	tabnew
	exe "e ".dir."/autoload/gvcolors.vim"
	so %
	break
   endif
  endfor
"  call Dret("s:GVColors")
endfun

" ---------------------------------------------------------------------
"  Restore: {{{1
let &cpo= s:keepcpo
unlet s:keepcpo
" vim: ts=4 fdm=marker
