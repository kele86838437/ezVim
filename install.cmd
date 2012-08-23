@if not exist "%HOME%" @set HOME=%HOMEDRIVE%%HOMEPATH%
@if not exist "%HOME%" @set HOME=%USERPROFILE%

@set BASE_DIR=%HOME%\.vim
call git clone --recursive https://github.com/satifanie/ezVim.git %BASE_DIR%/ezVim
call mkdir %BASE_DIR%\bundle

call mklink %HOME%\.vimrc %BASE_DIR%\ezVim\_vimrc
call mklink %HOME%\_vimrc %BASE_DIR%\ezVim\_vimrc

call git clone http://github.com/gmarik/vundle.git %HOME%/.vim/bundle/vundle