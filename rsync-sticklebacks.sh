echo "2214 --> archive"
rsync --verbose --recursive --times --update --omit-dir-times --prune-empty-dirs --include="*/" --exclude="*.png" --exclude="*_rectmp.log"  ~/2214/IEE\ Stickleback/ ~/research-storage-uct/Archiv_Tape/IEE\ Stickleback/
echo "2214 --> research storage Ben"
rsync --verbose --recursive --times --update --omit-dir-times --prune-empty-dirs --include="*/" --exclude="*_rectmp.log" ~/2214/IEE\ Stickleback/ ~/research-storage-ben/BenSulser/microCT\ Stickleback
echo "2214 (everything but projections) -> anaklin25 FastSSD"
rsync --verbose --recursive --times --update --omit-dir-times --prune-empty-dirs --include="*/" --exclude="*.?if" --exclude="*_rectmp.log" ~/2214/IEE\ Stickleback/ /media/habi/Fast_SSD/IEE\ Stickleback/
echo "anaklin25 FastSSD (all PNGs and .logs we made)--> research storage Ben"
rsync --verbose --recursive --times --update --omit-dir-times --prune-empty-dirs --include="*/" --include="*.log" --include="*.png" --exclude="*_rectmp.log" --exclude="*" /media/habi/Fast_SSD/IEE\ Stickleback/ ~/research-storage-ben/BenSulser/microCT\ Stickleback
echo "anaklin25 FastSSD (all text files)--> archive"
rsync --verbose --recursive --times --update --omit-dir-times --prune-empty-dirs --include="*/" --include="*.log" --include="*.md" --include="*.txt" --exclude="*_rectmp.log" --exclude="*" /media/habi/Fast_SSD/IEE\ Stickleback/ ~/research-storage-ben/BenSulser/microCT\ Stickleback
echo "Archive (logfiles) --> repository subfolder"
rsync --verbose --recursive --times --update --omit-dir-times --prune-empty-dirs --include="*/" --include="*.?og" --include="*.?nc" --exclude="*_rectmp.log" --exclude="*" ~/research-storage-uct/Archiv_Tape/IEE\ Stickleback/ ~/P/Documents/IEE/Sulser\ Sticklebacks/logfiles/
