@echo off
type %1 | UNIX2DOS > $$tmp$$
if not exist $$tmp$$ goto :error1

del %1
if exist %1 goto :error2
move $$tmp$$ %1
goto :exit

:error1
echo failed to make temporary file $$tmp$$
pause
goto :exit

:error2
echo failed to delete %1
pause
goto :exit

:exit
pause
