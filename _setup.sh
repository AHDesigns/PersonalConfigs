#!/bin/bash

normal=$(tput sgr0)
red=$(tput setaf 1)
green=$(tput setaf 2)

configs=$1
_self="${0##*/}"

if [[ ! -d $configs ]]; then
	echo "${red}missing required arg${normal}: config files directory"
	echo "e.g: ${_self} ~/PersonalConfigs"
	exit 1
fi

function mapFiles() {
    array_of_dirFiles="$(ls -A $1)"

    IFS='
' # prevent splitting on spaces

	for fileOnly in ${array_of_dirFiles}
	do
        dirFile="$1/$fileOnly"

		if	[[ ! $dirFile =~ (README.md|.DS_Store|./.gitignore$|.sw.?$|^./.git$|^./_.*) ]]
		then
			if [[ -d $dirFile ]]; then
                    if [ -L "$HOME/$dirFile" ]; then
					echo "dir: ${green}$dirFile is linked${normal}"

				elif [ -d "$HOME/$dirFile" ]; then
                    mapFiles "$dirFile"
				else
                    mkdir "$HOME/$dirFile" 
                    mapFiles "$dirFile"
				fi

			elif [[ -f $dirFile ]]; then
				if [ -L "$HOME/$dirFile" ]; then
					echo "file: ${green}$dirFile is linked${normal}"

				elif [ -f "$HOME/$dirFile" ]; then
					echo "${red}    and is regular${normal} you'll need to remove this manually"
				else
					ln -s "$configs/$dirFile" "$HOME/$dirFile"

					[ -L "$HOME/$dirFile" ] && echo "${green}$dirFile is now linked${normal}"
				fi
			else
				echo "$dirFile is not valid"
				exit 1
			fi
		fi
	done
}

mapFiles "."

echo ''
echo ''
echo '________'
