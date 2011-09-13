#!/bin/bash
#
#  Nautilus script - terminal-here
#  This script will open a GNOME Terminal in the current directory.
#  Written by Linerd in August, 2009 - http://tuxtweaks.com/
#
#  Modification:
#  * konsole-here
#  * Open the Konsole terminal emulator in the current directory.
#
#  Save this script under $HOME/.gnome2/nautilus-scripts/terminal-here. Make sure that
#  you give this file executable permission. { chmod +x terminal-here }
#
#  This program is free software.  It is distributed in the hope
#  that it will be useful, but WITHOUT ANY WARRANTY; without even
#  the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
#  PURPOSE.  See the GNU General Public License for more details.
######################################################################

if [ "$NAUTILUS_SCRIPT_CURRENT_URI" == "x-nautilus-desktop:///" ]; then
        DIR=$HOME"/Desktop"
else
        DIR=`echo $NAUTILUS_SCRIPT_CURRENT_URI | sed 's/^file:\/\///' | sed 's/%20/ /g'`
fi

# gnome-terminal --working-directory="$DIR"
# so as konsole to get focus, disable visual effects under Gnome
konsole --workdir "$DIR"

exit 0
