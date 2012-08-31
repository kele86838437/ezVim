@if not exist "%HOME%" @set HOME=%HOMEDRIVE%%HOMEPATH%
@if not exist "%HOME%" @set HOME=%USERPROFILE%

@set BASE_DIR=%HOME%\.ezVim
call git clone https://github.com/satifanie/ezVim.git %BASE_DIR%
call mkdir %BASE_DIR%\.vim\bundle
call mklink /J %HOME%\.vim %BASE_DIR%\.vim
call mklink %HOME%\.vimrc %BASE_DIR%\_vimrc
call mklink %HOME%\_vimrc %BASE_DIR%\_vimrc

call git clone http://github.com/gmarik/vundle.git %HOME%/.vim/bundle/vundle