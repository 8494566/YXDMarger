# YXDMarger — 测试服配置 / 表 / Lua 版本库

本仓库是**测试服务器**（内部测试、学习用）的双端配置版本库。
唯一真源 → 服务器计划任务 `deploy.ps1` 定时拉取并同步到线上目录。

## 目录结构

| 仓库路径 | 同步到 | 说明 |
|---|---|---|
| `shared/scp/` | `D:\YXDServer\server\Server1\Scp` **和** `D:\YXDClient\Data\Scp` | **双端文件唯一源**（144 个）：改一次，两端自动一致 |
| `server/lua/` | `D:\YXDServer\server\Server1\Scp\Lua` | 服务端 Lua（`Other/`、`Act/`、`NPC/`、`Task/`、`Main.lua`） |
| `client/extra/` | `D:\YXDClient\Data\Scp` | 仅客户端有的文件（A 维护，可留空） |
| `publish-static/` | `C:\ShareFiles` | 发布站小文件（`list.ini`、`start*.bat`、`一键发布.bat`） |
| `tools/` | 仅参考 | `deploy.ps1`、`db_backup.ps1`、`make_junctions.ps1` |

> `scp/`、`res/`、`*.exe`、`*.rcf`、`*.csv`、`*.scp` 不进仓库，见 `.gitignore`。

## 编辑铁律（动手前必看）

1. `.cse/.res` **只能用官方工具** `D:\YXDTool\脚本转换工具\Encrypt.exe`（右键解密 → 改 → 右键还原）；不要自己写脚本 XOR。
2. 解出来的 CSV **不能用 `splitlines()` 重排整份**（`\x0b/\x0c/\x85` 会被当换行）→ 用纯字节精确替换 + **回环校验**。
3. 表里**不能有重复 ID**；**不能出现双回车 `\r\r`**（会报「怪物ID: 0 配置重复」，整表装载失败）。
4. 服务端 Lua **必须 GBK** 编码。
5. 批量改同一张表：**每次基于当前线上文件重新解密**，不要复用上次结果。
6. 改完要生效：表 → 服务端「浏览+更新」；Lua → 「脚本更新」；或重启服务端。
7. 客户端发布：`start.bat` 重新生成 `scp.txt`，`bb=` 变化后玩家才会更新。

## 网络说明（这台服务器）

`github.com:443` 被墙，**走 SSH**：`github.com:22` 可用。
仓库地址用 `git@github.com:8494566/YXDMarger.git`，密钥在 `D:\deploy\ssh\yxd_deploy`。
