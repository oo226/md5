#!/usr/bin/env bash
# 从上游重新浅克隆并刷新 mirrors/（会覆盖本地同名目录）
set -euo pipefail
ROOT="$(cd "$(dirname "$0")" && pwd)"
TMP="$ROOT/_sync_tmp"
MIRRORS="$ROOT/mirrors"
MAX_BYTES=$((80 * 1024 * 1024))

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
  [faker2]="https://github.com/shufflewzc/faker2.git"
  [faker3]="https://github.com/shufflewzc/faker3.git"
  [faker4]="https://github.com/shufflewzc/faker4.git"
  [Aaron-lv-sync]="https://github.com/Aaron-lv/sync.git"
  [zero205-JD]="https://github.com/zero205/JD_tencent_scf.git"
  [smiek2221-scripts]="https://github.com/smiek2221/scripts.git"
  [QLScript2]="https://github.com/ccwav/QLScript2.git"
  [dailycheckin]="https://github.com/Sitoi/dailycheckin.git"
  [checkinpanel]="https://github.com/Oreomeow/checkinpanel.git"
  [checkbox]="https://github.com/Wenmoux/checkbox.git"
  [BiliBiliToolPro]="https://github.com/RayWangQvQ/BiliBiliToolPro.git"
  [ken-iMoutai-Script]="https://github.com/AkenClub/ken-iMoutai-Script.git"
  [YuhengX]="https://github.com/Yuheng0101/X.git"
  [NobyDa-Script]="https://github.com/NobyDa/Script.git"
  [chavyleung-scripts]="https://github.com/chavyleung/scripts.git"
  [lowking-Scripts]="https://github.com/lowking/Scripts.git"
  [fireinrain-qinglong-scripts]="https://github.com/fireinrain/qinglong-scripts.git"
  [other-blowsnow-qinglong-scripts]="https://github.com/other-blowsnow/qinglong-scripts.git"
  [lucky-cry-qinglong_script]="https://github.com/lucky-cry/qinglong_script.git"
  [chendbdb-qinglong]="https://github.com/chendbdb/qinglong.git"
)

rm -rf "$TMP"
mkdir -p "$TMP" "$MIRRORS"

failed=()
for name in "${!REPOS[@]}"; do
  url="${REPOS[$name]}"
  echo "==> $name  ($url)"
  if git clone --depth 1 "$url" "$TMP/$name"; then
    rm -rf "$TMP/$name/.git"
    bytes=$(du -sb "$TMP/$name" | cut -f1)
    if [ "$bytes" -gt "$MAX_BYTES" ]; then
      echo "skip $name: too large ($(du -sh "$TMP/$name" | cut -f1))"
      failed+=("$name(too-large)")
      rm -rf "$TMP/$name"
      continue
    fi
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
  echo "Failed/skipped: ${failed[*]}" >&2
  exit 1
fi
