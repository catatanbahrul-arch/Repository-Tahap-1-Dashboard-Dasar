#!/data/data/com.termux/files/usr/bin/bash

set -u

PROJECT="$HOME/robot-messenger-facebook"
LOGDIR="$PROJECT/.robot"
OUTPUT="$LOGDIR/last-output.txt"
COMMAND="$LOGDIR/last-command.txt"
STATUS="$LOGDIR/last-status.txt"
TIME="$LOGDIR/last-timestamp.txt"

mkdir -p "$LOGDIR"
cd "$PROJECT" || exit 1

if [ "$#" -eq 0 ]; then
    echo "Penggunaan: ./robot-run.sh \"perintah\""
    exit 1
fi

CMD="$*"

printf '%s\n' "$CMD" > "$COMMAND"
date -Iseconds > "$TIME"

echo "===== ROBOT COMMAND ====="
echo "$CMD"
echo
echo "===== OUTPUT ====="

bash -c "$CMD" 2>&1 | tee "$OUTPUT"
EXIT_CODE=${PIPESTATUS[0]}

echo "$EXIT_CODE" > "$STATUS"

echo
echo "===== EXIT CODE ====="
echo "$EXIT_CODE"

if [ "$EXIT_CODE" -eq 0 ]; then
    git add .robot/ 2>/dev/null
    git commit -m "robot: update terminal result" 2>/dev/null || true
    git push 2>/dev/null || true
else
    git add .robot/ 2>/dev/null
    git commit -m "robot: record failed command" 2>/dev/null || true
    git push 2>/dev/null || true
fi

exit "$EXIT_CODE"
