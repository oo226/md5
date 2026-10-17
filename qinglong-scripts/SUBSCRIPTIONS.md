# 青龙订阅命令速查

## 综合签到

```bash
ql repo https://github.com/smallfawn/QLScriptPublic.git
# zyqinglong：面板填 https://github.com/linbailo/zyqinglong.git ，后缀 py js
ql repo https://github.com/huaji8/huajiScript.git
# ql-script-hub：https://github.com/agluo/ql-script-hub.git
ql repo https://github.com/lzwme/ql-scripts.git "ql_|ql-" "backup|todo|deprecated" "utils" "" "js ts"
ql repo https://github.com/985Ming/qlk.git
# QinglongScripts：https://github.com/CN-Grace/QinglongScripts.git
ql repo https://github.com/cckj2580/qlym.git
ql repo https://github.com/Rookie-wb-WH/ql_scripts.git
ql repo https://github.com/ZJYCP/qinglong_scripts.git script config|json /* main py|yaml|js|ts|sh|json
```

## 京东集合（三选一，勿全开）

```bash
# 拉库前建议清空配置里的 GithubProxyUrl=""
ql repo https://github.com/shufflewzc/faker3.git "jd_|jx_|gua_|jddj_|jdCookie" "activity|backUp" "^jd[^_]|USER|function|utils|sendNotify|ZooFaker_Necklace.js|JDJRValidator_|sign_graphics_validate|ql|JDSignValidator|magic|depend|h5sts" "main"
# faker2 / faker4 命令同结构，换仓库名即可
```

## 签到框架 / 其他

```bash
# dailycheckin / checkinpanel / checkbox / BiliBiliToolPro / i茅台 等：见各上游 README
# 本镜像路径：qinglong-scripts/mirrors/<目录名>
```

## 本仓库镜像

`https://github.com/oo226/md5.git` — 适合备份；日常更新仍建议订上游。详见 [DEPENDENCY.md](./DEPENDENCY.md)。
