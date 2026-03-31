STUDENT_NAME="Anant Kumar"
ROLL_NUMBER="24bce11278"
SOFTWARE_CHOICE="Git"

KERNEL=$(uname -r)
USER_NAME=$(whoami)
HOME_DIR=$HOME
UPTIME=$(uptime -p)
CURRENT_DATE=$(date '+%A, %d %B %Y')
CURRENT_TIME=$(date '+%H:%M:%S')

if [ -f /etc/os-release ]; then
    DISTRO=$(grep '^PRETTY_NAME' /etc/os-release | cut -d= -f2 | tr -d '"')
else
    DISTRO="Unknown Linux Distribution"
fi

OS_LICENSE="GNU General Public License v2 (GPL v2)"

echo "============================================================="
echo "       OPEN SOURCE AUDIT — SYSTEM IDENTITY REPORT"
echo "============================================================="
echo ""
echo "  Student      : $STUDENT_NAME"
echo "  Roll No      : $ROLL_NUMBER"
echo "  Project      : Auditing '$SOFTWARE_CHOICE'"
echo ""
echo "  Distribution : $DISTRO"
echo "  Kernel       : $KERNEL"
echo "  User         : $USER_NAME"
echo "  Home Dir     : $HOME_DIR"
echo "  Uptime       : $UPTIME"
echo "  Date         : $CURRENT_DATE"
echo "  Time         : $CURRENT_TIME"
echo ""
echo "  This system runs Linux, licensed under:"
echo "  $OS_LICENSE"
echo ""
echo "============================================================="
