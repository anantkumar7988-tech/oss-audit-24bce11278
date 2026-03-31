PACKAGE="git"

echo "============================================================="
echo "         FOSS PACKAGE INSPECTOR"
echo "============================================================="
echo ""

echo "Checking package: $PACKAGE"
echo "-------------------------------------------------------------"

if command -v rpm &>/dev/null && rpm -q "$PACKAGE" &>/dev/null; then
    echo "STATUS : $PACKAGE is INSTALLED (RPM-based system)"
    echo ""
    rpm -qi "$PACKAGE" | grep -E 'Version|License|Summary|Size'

elif command -v dpkg &>/dev/null && dpkg -l "$PACKAGE" 2>/dev/null | grep -q '^ii'; then
    echo "STATUS : $PACKAGE is INSTALLED (DEB-based system)"
    echo ""
    dpkg -s "$PACKAGE" 2>/dev/null | grep -E 'Version|Description'

else
    echo "STATUS : $PACKAGE is NOT installed."
    echo ""
    echo "Install using:"
    echo "  sudo apt install $PACKAGE"
    echo "  sudo dnf install $PACKAGE"
fi

echo ""
echo "-------------------------------------------------------------"
echo "OPEN SOURCE NOTE"
echo "-------------------------------------------------------------"

case "$PACKAGE" in
    git)
        echo "Git: Built by Linus Torvalds in 2005 under GPL v2."
        ;;
    apache2|httpd)
        echo "Apache: Popular open-source web server."
        ;;
    mysql|mariadb)
        echo "MySQL: Open-source relational database."
        ;;
    python|python3)
        echo "Python: Community-driven programming language."
        ;;
    *)
        echo "This is open-source software."
        ;;
esac

echo "============================================================="
