IFS=$'\n'; for f in `ls *.pdf`; do pdftotext "$f"; done;





AstroGrep.exe /spath="C:\Users\lapps\Desktop\PDF" /stypes="*.txt" /stext="active" /l 3 /cl=3 /s /otype=txt /opath=tmp /exit