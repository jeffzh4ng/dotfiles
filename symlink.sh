#!/bin/sh

# load system configuration via defaults cli
sh ./.osx

rm -rf $HOME/.config
ln -s $PWD/.config $HOME/.config

shopt -s dotglob
for file in *; do
	skip_file=false

        while read -r pattern; do
                case "$file" in
                    	$pattern)
                		echo "skipping $file (listed in .symlinkignore)"
                        	skip_file=true
                        	break
                        	;;
                esac
        done < ".symlinkignore"

	if $skip_file; then
        	continue
        fi

    	ln -s "$PWD/$file" "$HOME/$file"
    	echo "linked $PWD/$file to $HOME/$file"
done

brew services restart yabai
brew services restart skhd

# vscode settings
rm -rf ~/Library/Application\ Support/Code/User/settings.json
ln -s $PWD/settings.json ~/Library/Application\ Support/Code/User/settings.json