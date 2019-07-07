" Poggit
" Copyright (C) Poggit
"
" This program is free software: you can redistribute it and/or modify
" it under the terms of the GNU Affero General Public License as published by
" the Free Software Foundation, either version 3 of the License, or
" (at your option) any later version.
"
" This program is distributed in the hope that it will be useful,
" but WITHOUT ANY WARRANTY; without even the implied warranty of
" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
" GNU Affero General Public License for more details.
"
" You should have received a copy of the GNU Affer General Public License
" along with this program. If not, see <https:"www.gnu.org/licenses/>.

scriptencoding utf-8

echo "Hello world"
if exists('g:loaded_signed_vimrc')
	finish
endif

let g:loaded_signed_vimrc = 1
let s:save_cpo = &cpo
set cpo&vim

if filereadable(".vimrc") 
	if filereadable(".vimrc.sig")
		silent !gpg --verify .vimrc.sig .vimrc 2>/dev/null
		if v:shell_error == 0
			source .vimrc
		else
			echo "Cannot load .vimrc: Invalid signature"
	endif
	else
		echo "Not loading .vimrc because .vimrc.sig is not found"
	endif
endif
