@echo off
echo > "www\sitemap.html"

cscript /nologo bin\MakeSiteMap.vbs "www" "www\sitemap.html" "html xml jpg png pdf"

type sitemapHead.txt > $tmp$
type "www\sitemap.html" >> $tmp$
type sitemapFoot.txt >> $tmp$
copy $tmp$ "www\sitemap.html"
del $tmp$

start www\sitemap.html
pause
