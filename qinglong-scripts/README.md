# 青龙脚本合集（镜像整理）

本目录汇总多个公开的青龙面板脚本仓库，便于统一浏览与备份。

> **说明**：脚本版权与维护权归各原作者。日常跑任务建议优先订阅**上游仓库**（更新更及时）；本仓库作为镜像备份与索引。

## 目录结构

```text
qinglong-scripts/
├── README.md                 # 本说明
├── SOURCES.md                # 来源与许可
├── SUBSCRIPTIONS.md          # 青龙订阅命令速查
├── sync.sh                   # 从上游重新拉取镜像
└── mirrors/                  # 各上游仓库快照
    ├── QLScriptPublic/       # smallfawn — 综合签到（覆盖面大）
    ├── zyqinglong/           # linbailo — 外卖/出行/顺丰等
    ├── huajiScript/          # huaji8 — 联通/酷狗等
    ├── ql-script-hub/        # agluo — 网盘/论坛/签到监控
    ├── ql-scripts/           # lzwme — JS/TS 脚本集
    ├── qlk/                  # 985Ming — 较新脚本库
    ├── QinglongScripts/      # CN-Grace — B站/贴吧/森空岛等
    ├── qlym/                 # cckj2580 镜像（原 hongke120/qlym 已不可拉）
    ├── ql_scripts/           # Rookie-wb-WH — 自用学习库
    └── qinglong_scripts/     # ZJYCP — 霸王茶姬等
```

## 在青龙面板使用

### 方式一：直接订阅上游（推荐）

见 [SUBSCRIPTIONS.md](./SUBSCRIPTIONS.md)。

### 方式二：订阅本仓库镜像

面板 → **订阅管理** → 新建订阅：

| 项 | 值 |
|---|---|
| 类型 | 公开仓库 |
| 链接 | `https://github.com/oo226/md5.git` |
| 分支 | 使用本功能分支或合并后的 `main` |
| 文件后缀 | `js py ts` |
| 白名单 | 按需填写脚本名关键词，避免一次拉全库 |

也可按子目录单独订阅上游，见速查表。

## 刷新镜像

```bash
cd qinglong-scripts
bash sync.sh
```

## 免责声明

脚本仅供学习研究；请自行判断合法性与账号风险。使用本镜像即视为已阅读并接受各上游仓库的免责声明。
