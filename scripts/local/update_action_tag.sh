#!/bin/zsh

#if [ -z "$SUDO_COMMAND" ]
#  then
#    echo -e "Only root can run this script.\nRelaunching script with sudo.\n"
#    sudo -E $0 $*
#    exit 0
#fi

#while getopts u:a:hr flag
#do
#    case "${flag}" in
#        r)
#          git remote set-url origin git@github.com:discoverygarden/${repository}
#          echo "Redirected origin back to discoverygarden repo"
#          exit;;
#        u) contributor=${OPTARG};;
#        h)
#          echo "Add specified fork to local git repository remotes. Defaults to noel"
#          echo
#          echo "Syntax: ${0##*/} [-u|h]"
#          echo "Options:"
#          echo "  -u     User to account to target. Available: noel, morgan, chris, jordan, alex, jojo, adam, akanksha."
#          echo "  -a     Add all currently available remotes.(Not currently available)"
#          echo "  -r     Redirects origin remote target to discoverygarden repo."
#          echo "  -h     Print this help."
#          exit;;
#        \?)
#          echo "Error: Invalid Option"
#          exit;;
#    esac
#done

git fetch origin --tags        # gets all remote tags
git tag -d v1                  # delete the old tag locally
git push origin :refs/tags/v1  # delete the old tag remotely
git tag v1                     # make a new tag locally
git push origin v1             # push the new local tag to the remote
