local exts=(
    cpp cxx cc c hh h inl asc txt TXT tex  # Text
    jpg jpeg png gif mng tiff tif xpm  # Image
    ape avi flv m4a mkv mov mp3 mp4 mpeg mpg ogg ogm rm wav webm  # Media
    pdf ps dvi djvu  # Print
    doc docx ppt pptx xls xlsx odt # Office
)

for ext in $exts; do
    alias -s $ext=xdg-open
done

unset exts
