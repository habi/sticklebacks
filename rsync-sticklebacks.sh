# Change terminal title
echo -en "\033]0;Stickleback synchronization\a"

# Set options
options=(
    --archive
    --update
    --whole-file            # Bypasses CPU delta calculations; streams files directly (ideal for fast SSDs/LAN)
    --inplace               # Writes directly to target files without creating temporary split files first
    --omit-dir-times
    --prune-empty-dirs
    --no-owner              # Avoids chown overhead over network/external mounts
    --no-group              # Avoids chgrp overhead over network/external mounts
    --info=progress2        # Replaces line-by-line --verbose with a single updating progress line
    --exclude='*SubScan?/*'
    --exclude='*_rectmp.log'
    --exclude='*.tmp'
    --exclude='Thumbs.db'
    --exclude='*DS_Store'
    --include='*/'
)

# Sync stuff
echo "2214 --> archive"
rsync "${options[@]}" --exclude="*.png" ~/2214/IEE\ Stickleback/ ~/research_storage_uct/Archiv_Tape/IEE\ Stickleback/

echo "2214 --> research storage Ben"
rsync "${options[@]}" ~/2214/IEE\ Stickleback/ ~/research_storage_ben/microCT_Stickleback/

echo "2214 (everything but projections) -> anamyct05 FastSSD"
rsync "${options[@]}" --exclude="*.?if" ~/2214/IEE\ Stickleback/ /media/habi/Fast_SSD/IEE\ Stickleback/

# echo "research_storage Ben --> anamyct05 FastSSD (all PNGs and things Ben and Sheila)"
# rsync "${options[@]}" --exclude="*.?if" --exclude="*.nrrd" --exclude="*.ply" --exclude="*.R" --exclude="*.ckpt" --exclude="*.zip" --exclude="*.doc*" --exclude="*.mr*"--exclude="*.json" --exclude="*.py" --exclude="*.ijm" --exclude="*.vp" --exclude="*.vtk" --exclude="*.tar" --exclude="*.nts" --exclude="*.h5" --exclude="*Rhistory" --exclude="*.pdf" --exclude="*.ctbl" ~/research_storage_ben/microCT_Stickleback/ /media/habi/Fast_SSD/IEE\ Stickleback/

echo "anamyct05 FastSSD (all PNGs and .logs we made, but no .zarr folders) --> research storage Ben"
rsync "${options[@]}" --exclude="*.zarr/***" /media/habi/Fast_SSD/IEE\ Stickleback/ ~/research_storage_ben/microCT_Stickleback/

echo "All log, text and label-checking files from research_storage Ben --> archive"
rsync "${options[@]}" --include="*.?og" --include="*.?nc" --include="*.md" --include="*.txt" --include="*.Labels.Check.png" --exclude="._*" --exclude="*" ~/research_storage_ben/microCT_Stickleback/ ~/research_storage_uct/Archiv_Tape/IEE\ Stickleback/

echo "Archive (logfiles, photos, markdown and label-checking files) --> repository subfolder"
rsync "${options[@]}" --include="*.?og" --include="*.?nc" --include="*.jpg" --include="*.md" --include="*.Labels.Check.png" --exclude="*" ~/research_storage_uct/Archiv_Tape/IEE\ Stickleback/ ~/P/Documents/IEE/Sulser\ Sticklebacks/logfiles/
