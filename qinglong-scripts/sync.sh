#!/usr/bin/env bash
# 从上游重新浅克隆并刷新 mirrors/（会覆盖本地同名目录）
set -euo pipefail
ROOT="$(cd "$(dirname "$0")" && pwd)"
TMP="$ROOT/_sync_tmp"
MIRRORS="$ROOT/mirrors"

declare -A REPOS=(
  [QLScriptPublic]="https://github.com/smallfawn/QLScriptPublic.git"
  [zyqinglong]="https://github.com/linbailo/zyqinglong.git"
  [huajiScript]="https://github.com/huaji8/huajiScript.git"
  [ql-script-hub]="https://github.com/agluo/ql-script-hub.git"
  [ql-scripts]="https://github.com/lzwme/ql-scripts.git"
  [qlk]="https://github.com/985Ming/qlk.git"
  [QinglongScripts]="https://github.com/CN-Grace/QinglongScripts.git"
  [qlym]="https://github.com/cckj2580/qlym.git"
  [ql_scripts]="https://github.com/Rookie-wb-WH/ql_scripts.git"
  [qinglong_scripts]="https://github.com/ZJYCP/qinglong_scripts.git"
)

rm -rf "$TMP"
mkdir -p "$TMP" "$MIRRORS"

failed=()
for name in "${!REPOS[@]}"; do
  url="${REPOS[$name]}"
  echo "==> $name  ($url)"
  if git clone --depth 1 "$url" "$TMP/$name"; then
    rm -rf "$TMP/$name/.git"
    rm -rf "$MIRRORS/$name"
    mv "$TMP/$name" "$MIRRORS/$name"
  else
    failed+=("$name")
  fi
done

rm -rf "$TMP"
echo
echo "Done. mirrors size: $(du -sh "$MIRRORS" | cut -f1)"
if ((${#failed[@]})); then
  echo "Failed: ${failed[*]}" >&2
  exit 1
fi
