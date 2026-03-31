echo "============================================================="
echo "       OPEN SOURCE MANIFESTO GENERATOR"
echo "============================================================="
echo ""

read -p "1. One open-source tool you use daily: " TOOL
read -p "2. What does 'freedom' mean in one word: " FREEDOM
read -p "3. One thing you'd build and share: " BUILD

if [ -z "$TOOL" ] || [ -z "$FREEDOM" ] || [ -z "$BUILD" ]; then
    echo "All inputs required."
    exit 1
fi

DATE=$(date '+%d %B %Y')
AUTHOR=$(whoami)
OUTPUT="manifesto_${AUTHOR}.txt"

echo "=============================================================" > "$OUTPUT"
echo "OPEN SOURCE MANIFESTO" >> "$OUTPUT"
echo "Author: $AUTHOR" >> "$OUTPUT"
echo "Date: $DATE" >> "$OUTPUT"
echo "=============================================================" >> "$OUTPUT"
echo "" >> "$OUTPUT"

echo "Every day, I use $TOOL built by a community." >> "$OUTPUT"
echo "Freedom means $FREEDOM in software." >> "$OUTPUT"
echo "One day I will build $BUILD and share it openly." >> "$OUTPUT"

echo "" >> "$OUTPUT"
echo "-- $AUTHOR" >> "$OUTPUT"

echo "Saved to $OUTPUT"
cat "$OUTPUT"

echo ""
echo "============================================================="
