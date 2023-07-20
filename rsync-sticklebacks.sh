echo "2214->archive"
rsync --verbose --recursive --compress --times --update --omit-dir-times --prune-empty-dirs --include="*/" --include="*.?og" --include="*.c?v" --include="*.?oi" --include="*.?at" --include="*_spr*.bmp" --include="*.txt" --include="*.md" --include="*.mp" --include="*.sb" --include="*.tf" --include="*.info" --include="*.?nc" --include="*.bkp" --include="*.ctt" --include="*.?if" --exclude="*_rectmp.log" --exclude="*"  ~/2214/IEE\ Stickleback/ ~/research-storage-uct/Archiv_Tape/IEE\ Stickleback/
#echo "2214->IEE research storage"
#rsync --verbose --recursive --compress --times --update --omit-dir-times --prune-empty-dirs --include="*/" --exclude="*_rectmp.log" ~/2214/IEE\ Stickleback/ ~/research-storage-iee/SOMEFOLDER/
echo "2214 (logfiles)->repository subfolder"
rsync --verbose --recursive --compress --times --update --omit-dir-times --prune-empty-dirs --include="*/" --include="*.?og" --include="*.c?v" --include="*.?oi" --include="*.?at" --include="*.txt" --include="*.md" --include="*.mp" --include="*.sb" --include="*.tf" --include="*.info" --include="*.?nc" --include="*.bkp" --include="*.ctt" --exclude="*_rectmp.log" --exclude="*"  ~/2214/IEE\ Stickleback/ ~/P/Documents/IEE/Sulser\ Sticklebacks/logfiles/
