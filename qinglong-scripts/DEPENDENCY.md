# 是否「自依赖」？

**结论：镜像可以离线备份浏览，但跑任务并不能只靠本仓库「自给自足」。**

## 已经自带的（镜像内）

- 各上游脚本源码快照（按目录分开，互不改写）
- 部分库自带 `sendNotify.js` / `notify.py` / `notifier.py`（如 QLScriptPublic、faker*、zyqinglong、Aaron-lv-sync 等）
- 部分库自带 `package.json` / `requirements.txt`（需你在青龙里再装依赖，文件在并不等于已安装）

## 仍然依赖外部的

| 依赖 | 说明 |
|------|------|
| 青龙面板本体 | 定时/订阅/环境变量/日志，见 [whyour/qinglong](https://github.com/whyour/qinglong) |
| 你的账号凭证 | Cookie / Token 等环境变量，镜像里不会也不应带真实密钥 |
| Node / Python 包 | 如 `axios`、`crypto-js`、`requests` 等，要在面板「依赖管理」安装 |
| 通知通道 | 企业微信 / Telegram / Bark 等，靠你在青龙配置 |
| 部分京东库额外能力 | 助力池、sign 服务、Spy 等，**不是**把代码拷进来就能替代 |
| 上游更新 | 镜像是快照；要最新脚本需再跑 `sync.sh` 或直接订上游 |

## 和「只订本仓库」的关系

- **备份/查阅**：可以只依赖本仓库（已拉进来的脚本不依赖上游是否还在线）。
- **日常更新与跑任务**：不建议只订本仓当唯一源——路径深、脚本重复多、且缺面板侧依赖安装流程；更稳妥是：本仓备份 + 上游订阅。

## 拉不进来的库

见 [SOURCES.md](./SOURCES.md#拉不进来的)——那些上游删除/404/被 GitHub 禁用后，**本镜像里也没有**（除非另有可用 fork，例如 qlym 已用 `cckj2580/qlym` 代替 `hongke120/qlym`）。
