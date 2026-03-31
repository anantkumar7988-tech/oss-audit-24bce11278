LOGFILE=$1
KEYWORD=${2:-"error"}
COUNT=0
MATCH_FILE="/tmp/log_matches_$$.txt"

echo "============================================================="
echo "         LOG FILE ANALYZER"
echo "============================================================="
echo ""

if [ -z "$LOGFILE" ]; then
    echo "Usage: $0 /path/to/logfile [keyword]"
    exit 1
fi

if [ ! -f "$LOGFILE" ]; then
    echo "File not found: $LOGFILE"
    exit 1
fi

echo "Keyword: '$KEYWORD'"
echo ""

while IFS= read -r LINE; do
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))
        echo "$LINE" >> "$MATCH_FILE"
    fi
done < "$LOGFILE"

echo "Matches found: $COUNT"
echo ""

if [ "$COUNT" -gt 0 ]; then
    echo "Last 5 matches:"
    tail -n 5 "$MATCH_FILE"
else
    echo "No matches found."
fi

rm -f "$MATCH_FILE"

echo ""
echo "============================================================="
