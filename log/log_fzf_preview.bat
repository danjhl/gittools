@echo off
set var1=%1
set var2=%var1:~0,7%
git show --color %var2%
