# 自动部署已上线（给 A 端 / 客户端侧 AI）

> 状态：**已上线并跑通** 2026-09-28 17:45
> 服务器：Windows Server 2022，公网 IP 42.193.197.163

---

## 1. 现在是什么在跑

```text
[A 端] 改文件 → git commit → git push
                                │
                                ▼
        [GitHub]  8494566/YXDMarger （公开仓库）
                                │
                                ▼
[服务器] 计划任务 YXD-Git-AutoDeploy，每 1 分钟：
   git fetch/pull → robocopy /E 同步到 3 处 → 重新生成 scp.txt
   → ★自动热更（重新加载）changed 的服务端 Lua
                                │
                                ▼
   ①D:\YXDServer\server\Server1\Scp（服务端表+Lua）
   ②D:\YXDClient\Data\Scp（客户端工程）
   ③C:\ShareFiles（发布站，IIS 35179）
                                │
                                ▼
   [C 玩家] 登录器读 http://42.193.197.163:35179/scp/scp.txt 的 bb= → 拉更新
```

**耗时**：push 后最长 **1 分钟**生效（实测 19:39:38 发现 → 19:39:50 完成，含 Lua 热更）。

**✅ 已经全自动的**（2026-09-28 起）：
- 文件同步（服务端 / 客户端 / 发布站）
- 客户端更新清单 `scp.txt` 重生成
- **服务端 Lua 热更**（改 `.lua` → push 后自动重载，不用点也不用重启）
  实现方式：`D:\deploy\hot_update.ps1` 驱动 GameServer 窗口的「更新」按钮
  （先把窗口拉到前台 → 填路径 → 发鼠标点击 → **回读游戏日志确认「刷新 xxx 成功」**）

**⚠️ 仍需人工的**：
- **表（`.cse/.res`）热更**：那个「更新」按钮只管脚本，管不了表 →
  改了 `shared/scp/` 里的表，要在服务端手动「表 浏览+更新」，或者用 `deploy.ps1 -Restart` 重启服务端
- 只有极少数情况需要重启（会踢掉在线玩家）

> 依赖：部署任务必须以 **Administrator / Interactive（登录会话）** 运行 —— 因为窗口自动化需要桌面会话；
> 以 SYSTEM 跑会找不到窗口。所以**得有人登录着**（RDP 挂着也算）。

---

## 2. 仓库结构（改文件就按这个放）

| 仓库路径 | 会被同步到 | 谁维护 |
|---|---|---|
| `shared/scp/` | **同时**同步到服务端 `Server1\Scp` 和客户端 `Data\Scp` | **双端一致文件（144 个）唯一源**，A/B 都可改，但**一处改** |
| `server/lua/` | `Server1\Scp\Lua`（含 `Other/`、`Act/`、`NPC/`、`Task/`、`Main.lua`） | **B（服务端）** |
| `client/extra/` | 客户端 `Data\Scp` | **A**（仅客户端才有的文件，可留空） |
| `publish-static/` | `C:\ShareFiles` | B |
| `tools/` | 不同步，仅供参考 | B |

> 不进仓库：`scp/`、`res/`、`*.exe`、`*.rcf`、`*.csv`、`*.scp`、`*.log`、`Backup/`

**这样设计的原因**：144 个双端文件（怪物表、物品表、技能表、AI 表、宠物表…）如果两端各存一份，迟早会不一致 → 现在只存 `shared/scp/` 一份，由发布流程同时铺到两端，天然不会跑偏。

---

## 3. A 端怎么用（自己的电脑上）

```bash
# 1) 克隆（首次）
git clone https://github.com/8494566/YXDMarger.git
cd YXDMarger

# 2) 改文件（例如改客户端表 → 放 shared/scp/ 或 client/extra/）

# 3) 提交并推送
git add -A
git commit -m "改了 XXX（是否需要双端一致：是/否）"
git pull --rebase        # 若 push 被拒，先拉再推
git push
```

- 推送被拒（non-fast-forward）→ `git pull --rebase` 后重推；**禁止 `git push --force`**。
- 大改动先开分支，验证后再合入 `main`。
- 提交信息里注明**"是否需双端一致"**。

---

## 4. 编辑铁律（A 也会碰表，务必遵守）

1. `.cse/.res` **只能用官方工具** `D:\YXDTool\脚本转换工具\Encrypt.exe`（右键解密 → 改 → 右键还原）——**不要自己写脚本 XOR**。（工具是绿色小 exe，可拷到 A 端电脑）
2. 解出来的 CSV **绝不能用 `splitlines()` 重排整份**（`\x0b/\x0c/\x85` 会被当换行，文件直接废掉）→ 用**纯字节精确替换** + **回环校验**。
3. 表里**不能有重复 ID**；**不能出现双回车 `\r\r`** → 会报「怪物ID: 0 配置重复」，**整张表装载失败**（我们踩过）。
4. 服务端 Lua **必须 GBK** 编码（UTF-8 会乱码/白屏）。
5. 批量改同一张表：**每次基于当前线上文件重新解密**，不要复用上次的解密结果。
6. 客户端对话框内容**别超过约 4.7KB**（超了渲染不出来）→ 长列表要分页。
7. 同一个双端文件**不要两端各加密一次**（字节可能不同）→ 统一走 `shared/scp/`。

---

## 5. 服务器端已装/已配的东西（B 侧，供参考）

| 项目 | 位置/说明 |
|---|---|
| Git for Windows 2.55 | `C:\Program Files\Git` |
| TortoiseGit 2.19 + 中文 | 图形化提交/推送/看历史（RDP 进来可直接用） |
| 部署脚本 | `D:\deploy\deploy.ps1`（拉取+同步+生成清单，SSH 方式） |
| 数据库备份 | `D:\deploy\db_backup.ps1` → `D:\Backup\<日期>\`，计划任务 **每天 04:00** |
| 计划任务 | `YXD-Git-AutoDeploy`（每 1 分钟）、`YXD-DB-Backup`（每天 04:00） |
| 部署日志 | `D:\git\deploy.log`（「no changes」时不写日志） |
| ASCII 软链接 | `D:\YXDServer` → `D:\Server`；`D:\YXDClient` → 客户端工程 |

## 6. 网络说明（很重要）

这台服务器 **`github.com:443` 被墙**，所以走 **SSH**（`github.com:22`，实测通）：
- 服务器上的仓库地址是 `git@github.com:8494566/YXDMarger.git`
- 私钥在服务器 `D:\deploy\ssh\yxd_deploy`（只读权限、不外发）
- A 端在普通网络下用 `https://github.com/...` 即可

## 7. 回滚

1. `git revert <坏提交>`（或 `git reset --hard <好提交>`）→ push
2. 服务器 1 分钟内自动同步回滚后的文件
3. 服务端重新「浏览+更新」表 /「脚本更新」Lua
4. 客户端重新生成 `scp.txt`（脚本自动做），玩家按新 bb 回退
5. 大改动前建议打 tag


---

## ⚠️ 2026-09-29 故障复盘（必读）

### 发生了什么
- 提交 `43bc9f0`（删卡90链条）改 `server/lua/Act/Jinkelanpc.lua` 时，**删条目留下了一个多余的逗号**：
  ```lua
  {GoodsID=39744,Point=0,Jinkelanpc=200},,     -- ← 行尾多一个逗号
  ```
- 服务端**重启时**加载该文件 → `unexpected symbol near ','` → 整个 `Act_Main` 包加载失败 → **全套 Lua 挂掉**（日志刷满 `MercGroupMain_OnLoadIDataOK (a nil value)` 之类的连锁错误）。

### 已修复
- B 已把双逗号删掉并推送（提交 `b4a8ea6`），重启服务端后恢复 ✓

### A 端必须遵守（新增规则）
1. **删表/删条目时，逗号必须一起处理**：删掉 `{...},` 整行后，不能让上一行以 `,,` 结尾。
2. **改完 Lua 必须自检**（哪怕只是删一行）：
   - 全文搜 `,,`（双逗号）—— 出现即语法错误
   - 括号 `{}` `()` `[]` 配平
   - 服务端 Lua **GBK** 编码
3. push 前用仓库里的 `tools/lua_check.ps1` 过一遍：
   ```powershell
   powershell -File tools\lua_check.ps1 shared\scp\xxx.lua
   ```
   （返回 `OK` 才 push；`DOUBLE_COMMA` 就必须先改）

### B 端新增的两道保险（已上线）
1. **语法预检**：部署脚本在热更前先跑 `lua_check.ps1`，**双逗号等必错文件直接拒绝热更**（不会再把服务端搞挂）。
2. **失败自动回滚**：热更前自动备份，热更后回读服务端日志确认「刷新 xxx 成功！」；**一旦失败立即恢复旧文件并重新加载**。
   - 日志关键字：`[hotupdate] OK / FAIL / REJECT / ROLLBACK`
3. 另外：`safe.directory` 重复值导致的部署中断、发布站漏复制（断点续传）、`res.txt` 卡死等问题也一并修掉了。

> 结论：**现在推坏文件不会再炸服**（会被拦或自动回滚），但请大家还是按上面 2-3 条自检 —— 拦得住不代表可以随意推。
