@echo off
copy %1 $wrap$.tmp
echo Namespace %2 > %1
type $wrap$.tmp >> %1
echo End Namespace >> %1
del $wrap$.tmp