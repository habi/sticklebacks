#!/usr/bin/env bash

# Change terminal title
echo -en "\033]0;Stickleback synchronization\a"

# Set options
options=(
    --info=progress2        # Replaces line-by-line --verbose with a single updating progress line
    --archive
    --update
    --prune-empty-dirs
    --exclude='*SubScan?/*'
    --exclude='*_rectmp.log'
    --exclude='*.zip'
    --exclude='*.tmp'
    --exclude='Thumbs.db'
    --exclude='*DS_Store'
)

# Sync stuff
echo "2214 --> archive"
rsync "${options[@]}" --exclude="*.png" ~/2214/IEE\ Stickleback/ ~/research_storage_uct/Archiv_Tape/IEE\ Stickleback/

echo "2214 --> research storage Ben"
rsync "${options[@]}" ~/2214/IEE\ Stickleback/ ~/research_storage_ben/microCT_Stickleback/

echo "2214 (everything but projections) -> anamyct05 FastSSD"
rsync "${options[@]}" --exclude="*.?if" ~/2214/IEE\ Stickleback/ /media/habi/Fast_SSD/IEE\ Stickleback/

# echo "research_storage Ben --> anamyct05 FastSSD (all PNGs and things Ben and Sheila)"
# rsync "${options[@]}" --exclude="*.?if" --exclude="*.nrrd" --exclude="*.ply" --exclude="*.R" --exclude="*.ckpt" --exclude="*.zip" --exclude="*.doc*" --exclude="*.mr*" --exclude="*.json" --exclude="*.py" --exclude="*.ijm" --exclude="*.vp" --exclude="*.vtk" --exclude="*.tar" --exclude="*.nts" --exclude="*.h5" --exclude="*Rhistory" --exclude="*.pdf" --exclude="*.ctbl" ~/research_storage_ben/microCT_Stickleback/ /media/habi/Fast_SSD/IEE\ Stickleback/

echo "anamyct05 FastSSD (all PNGs and .logs we made, but no .zarr folders) --> research storage Ben"
rsync "${options[@]}" --exclude="*.zarr" /media/habi/Fast_SSD/IEE\ Stickleback/ ~/research_storage_ben/microCT_Stickleback/

echo "All log, text and label-checking files from research_storage Ben --> archive"
rsync "${options[@]}" --include="*.md" --include="*.Labels.Check.png" --include="2024_Fish_Data_Lynn.csv" --include="*/" --exclude="._*" --exclude="*" ~/research_storage_ben/microCT_Stickleback/ ~/research_storage_uct/Archiv_Tape/IEE\ Stickleback/

echo "Archive (logfiles, photos, markdown and label-checking files) --> repository subfolder"
rsync "${options[@]}" --include="*.?og" --include="*.?nc" --include="*.jpg" --include="*.md" --include="*.Labels.Check.png" --include="*/" --exclude="*" ~/research_storage_uct/Archiv_Tape/IEE\ Stickleback/ ~/P/Documents/IEE/Sulser\ Sticklebacks/logfiles/
