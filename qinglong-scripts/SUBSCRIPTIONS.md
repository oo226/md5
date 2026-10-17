# 青龙订阅命令速查

在青龙面板「订阅管理」新建，或 SSH 进容器执行 `ql repo ...`。

## 上游直订（推荐）

```bash
# smallfawn 综合签到
ql repo https://github.com/smallfawn/QLScriptPublic.git

# linbailo 外卖/出行等（后缀 py js）
# 面板：链接 https://github.com/linbailo/zyqinglong.git ，定时 0 30 * * * * ，后缀 py js

# huaji8
ql repo https://github.com/huaji8/huajiScript.git

# agluo 网盘/论坛签到
# 链接 https://github.com/agluo/ql-script-hub.git

# lzwme（需白名单/依赖目录）
ql repo https://github.com/lzwme/ql-scripts.git "ql_|ql-" "backup|todo|deprecated" "utils" "" "js ts"

# 985Ming qlk
ql repo https://github.com/985Ming/qlk.git

# CN-Grace
# 链接 https://github.com/CN-Grace/QinglongScripts.git ，定时 0 0 * * *

# qlym（hongke120 原库不可用时用 fork）
ql repo https://github.com/cckj2580/qlym.git

# Rookie-wb-WH
ql repo https://github.com/Rookie-wb-WH/ql_scripts.git

# ZJYCP
ql repo https://github.com/ZJYCP/qinglong_scripts.git script config|json /* main py|yaml|js|ts|sh|json
```

## 本仓库镜像（备份）

仓库：`https://github.com/oo226/md5.git`

按需用白名单只拉某一来源，例如只拉 QLScriptPublic 下 `daily` 脚本时，在订阅里配置路径/白名单关键词，或改用上游直订更省事。

## 使用提醒

1. 先看各脚本注释里的**环境变量**名称，再在青龙「环境变量」里配置。
2. 部分脚本依赖 `sendNotify.js` / `notify.py`，拉库时注意依赖文件目录。
3. `lzwme/ql-scripts` 若用 TS，需在 `config.sh` 的 `RepoFileExtensions` 中加入 `ts`。
