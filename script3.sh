DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp")

echo "============================================================="
echo "         DISK AND PERMISSION AUDITOR"
echo "============================================================="
echo ""

printf "%-20s %-12s %-30s\n" "DIRECTORY" "SIZE" "PERMISSIONS / OWNER / GROUP"
echo "-------------------------------------------------------------"

for DIR in "${DIRS[@]}"; do
    if [ -d "$DIR" ]; then
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)
        PERMS=$(ls -ld "$DIR" | awk '{print $1, $3, $4}')
        printf "%-20s %-12s %-30s\n" "$DIR" "$SIZE" "$PERMS"
    else
        printf "%-20s %-12s %-30s\n" "$DIR" "N/A" "[not found]"
    fi
done

echo ""
echo "-------------------------------------------------------------"
echo "GIT CONFIG FILES"
echo "-------------------------------------------------------------"

GIT_SYSTEM_CONFIG="/etc/gitconfig"
GIT_USER_CONFIG="$HOME/.gitconfig"

echo ""
echo "System config: $GIT_SYSTEM_CONFIG"

if [ -f "$GIT_SYSTEM_CONFIG" ]; then
    ls -l "$GIT_SYSTEM_CONFIG"
else
    echo "Not found"
fi

echo ""
echo "User config: $GIT_USER_CONFIG"

if [ -f "$GIT_USER_CONFIG" ]; then
    cat "$GIT_USER_CONFIG"
else
    echo "Not found"
fi

echo ""
echo "============================================================="
