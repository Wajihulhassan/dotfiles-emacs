########## Variables
 
dir=~/dotfiles-emacs                    # dotfiles directory
olddir=~/dotfiles-emacs_old             # old dotfiles backup directory
files=".emacs .emacs.d .bashrc .bash_aliases"        # list of files/folders to symlink in homedir
 
##########
 
# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"
 
# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"
 
# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    yes | cp -rf ~/$file $olddir && rm -R ~/$file
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/$file
done

source ~/.bashrc