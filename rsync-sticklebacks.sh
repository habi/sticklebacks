# Change terminal title
echo -en "\033]0;Stickleback synchronization\a"
# Set options
options="--verbose --archive --update --omit-dir-times --prune-empty-dirs --exclude="*SubScan?/*" --exclude="*_rectmp.log" --exclude="Thumbs.db" --include="*/""
# Sync stuff
echo "2214 --> archive"
rsync $options --exclude="*.png" ~/2214/IEE\ Stickleback/ ~/research_storage_uct/Archiv_Tape/IEE\ Stickleback/
echo "2214 --> research storage Ben"
rsync $options ~/2214/IEE\ Stickleback/ ~/research_storage_ben/microCT_Stickleback/
echo "2214 (everything but projections) -> anamyct05 FastSSD"
rsync $options --exclude="*.?if" ~/2214/IEE\ Stickleback/ /media/habi/Fast_SSD/IEE\ Stickleback/
echo "anamyct05 FastSSD (all PNGs and .logs we made)--> research storage Ben"
rsync $options /media/habi/Fast_SSD/IEE\ Stickleback/ ~/research_storage_ben/microCT_Stickleback/
echo "anamyct05 FastSSD (all text files)--> archive"
rsync $options --include="*.log" --include="*.md" --include="*.txt" --exclude="*" /media/habi/Fast_SSD/IEE\ Stickleback/ ~/research_storage_ben/microCT_Stickleback/
echo "Archive (logfiles) --> repository subfolder"
rsync $options --include="*.?og" --include="*.?nc" --exclude="*" ~/research_storage_uct/Archiv_Tape/IEE\ Stickleback/ ~/P/Documents/IEE/Sulser\ Sticklebacks/logfiles/
