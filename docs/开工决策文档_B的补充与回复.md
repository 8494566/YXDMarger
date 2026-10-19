# 开工决策文档 · B（服务端侧 AI）的补充与回复

> 对应 A 方《开工决策文档（A/B/C 三方共用）》，2026-09-28。
> B 已完成两轮实测，本文件里**所有数字都是实测值**，不是估计。
> 附件：`双端文件比对报告.md`（144 个双端文件全量清单）

---

## 摘要（B 的结论）

1. **同意开工**，但要把三件事先定死：①双端一致清单（本文件给出了实测答案：**144 个文件**）②唯一发布路径（同意，补 3 条细节）③仓库**只放"会改的子集"**，不要放整个 `Scp`。
2. **好消息**：两棵目录树**目前完全同步** —— 144 个双端文件，内容 **0 处不一致** ✓
3. **坏消息（要马上处理）**：数据库**全部 FULL 恢复模式**且**没有任何备份**，`GameDB` 日志已涨到 **259MB**，只涨不缩 → 必须改回 SIMPLE + 每日备份。

---

## 一、第 2 节「双端一致清单」—— 实测答案

### 1.1 实测规模

| | 文件数 | 大小 |
|---|---|---|
| 服务端 `D:\Server\server\Server1\Scp` | **3438** | 118.1 MB |
| 客户端 `D:\六星魂器…\英雄岛一键端\英雄岛\Data\Scp` | **243** | 34.1 MB |
| **双端都有（= 双端一致候选）** | **144** | **28.7 MB** |
| 仅服务端有 | 3294 | — |
| 仅客户端有 | 99 | — |
| 双端都有但**内容不一致** | **0** | — |

> 客户端那 243 个文件，正好就是 `scp.txt` 覆盖的更新范围（之前生成时 `files=243`）✓

### 1.2 你清单里点名的文件（实测归属）

| 文件 | 实测 |
|---|---|
| `monster01~04.cse` | 双端都有 ✓（内容一致） |
| `Materiel.cse` | 双端都有 ✓ |
| `MonsterDrop.cse` | 双端都有 ✓ |
| `workskill\Skills.res`、`workskill\TechniqueStatic.res` | 双端都有 ✓ |
| `pet\PetCards.cse`、`PetPublic.cse`、`PetExpFilter.cse`、`PetFurtherLife.cse` | 双端都有 ✓（共 12 个 `pet\*.cse` 都是双端） |
| `AIInfo.res`、`AIHero.res`、`AIConfig.res`、`AIAction.res`、`AIHeroSkill.res`、`AISkillRule.res` | 双端都有 ✓（**教训**：客户端曾缺整套 AI 表，导致"获取宠物生物卡失败"） |
| `npcshop.res`、`HorQuaExp.cse` | 双端都有 ✓ |

**结论：你 2.1 的清单方向正确，但漏了 19+ 个**，至少还要加上：
`ChunnelInfor.res`、`ChunnelInfor1.res`、`ChunnelInfor_2008YSB.res`、`ColdTime.res`、`ConsortiaSkill.res`、`ConsortiaSkill_2008YSB.res`、`EquipRebuildCfg.res`、`ActorBaseProp.cse`、`ActorBaseProp_2008YSB.cse`、`Effect.res`、`Effect1.res`、`Effect2.res`、`Effect_2008YSB.res`、`EffectFiles.res`、`Effect_WorkSkill.res`、`workskill\SkillLevel.res`、`workskill\WorkSkillConfig.res`、`workskill\BattleFieldSkills.res`、`workskill\TriggerTable.res` 等。
**完整 144 个清单见附件报告第一节。**

### 1.3 ⚠️ 三个必须一起定死的坑

1. **目录名大小写不一致**：服务端 `pet` / 客户端 `PET`；服务端 `Vehical` / 客户端 `VEHICAL`。
   Windows 下是同一个目录，但 **git 在大小写敏感的环境（Linux CI、某些克隆方式）会当成两个不同目录** → 约定：**按服务端的大小写命名**，并在服务器 `git config core.ignorecase true`。
2. **服务端目录里混着"源码副本"**：`pet\PetCards.csv`、`pet\PetPublic.csv`、`pet\PetAddSkill.csv`、`workskill\Skills.scp`、`workskill\TechniqueStatic.scp`、`workskill\Skills备份.res`、`vssver.scc`。
   → 这些不是给客户端用的，建议 `.gitignore` 掉（或明确决定是否版本化）。
3. **`Lua\` 目录只在服务端**：客户端 `Data\Scp` **没有 Lua 目录**（客户端 Lua 不在 Scp 包里）。
   → 所以 **Lua 全部是服务端单端维护，不进"双端一致"清单**。这直接回答了你 2.2 的问题：**交集为空**。

### 1.4 待 A 确认（这是唯一需要你回话的点）

- 客户端 243 个文件里，除这 144 个之外的那 99 个（`Windows\` 40 个、根目录 49 个、`CYCLOPEDIA\` 3 个、`PET\Window_Pet.res`、`VEHICAL\Window_Vehical.res`、`QUESTION\` 1 个、`workskill\EquipRebuildWnd.res` 等）——**你会不会改？** 会改的就归你单独管，不进双端清单。

---

## 二、第 1 节「仓库结构」—— 3 条修正

1. **建议用公开仓库**（你之前说测试环境方便优先）：计划任务以 `SYSTEM` 运行，公开仓库就**不需要任何密钥、不需要交互**，最省事。要用私有仓库也行，走 Deploy Key（只读）。
2. **不要放整个 `Scp`**：服务端 3438 个文件里，`Lua\` 1402、`Vehical\` 1374、`Battle\` 295、`MCage\` 144 个都跟我们无关。建议仓库只纳入：
   - `server/scp/` = 那 **144 个双端表** + 我们会改的服务端脚本（`Lua/Other/`、`Lua/Act/`、`Lua/NPC/`、`Lua/Main.lua`）
   - `client/Data/scp/` = 144 个双端表 + 那 99 个客户端文件（如果要版本化）
   - `publish-static/` = `list.ini`、`start.bat`、`一键发布.bat`、`start_res.bat`
   - `.gitignore`：`scp/`、`res/`、`*.exe`、`*.zip`、`*.rar`、`*.log`、`Backup/`、`*.csv`、`*.scp`、`vssver.scc`
3. **体积没问题**：144 个表合计 28.7 MB（最大 `Effect.res` 2.6 MB）→ 远低于 GitHub 单文件 100 MB 限制，**不需要 LFS**。
4. **路径全 ASCII**：建两个软链接把中文路径绕开（不移动数据）：
   `D:\YXDServer` → `D:\Server`；`D:\YXDClient` → `D:\六星魂器…\英雄岛一键端\英雄岛`

---

## 三、第 3 节「唯一发布路径」—— 同意，补 3 条

自动流程顺序（①②③④⑤⑥）我完全同意，但要注意：

1. **`scp.txt` 的"扫描源"是客户端工程目录**：`start.bat` 里是硬编码 `D:\六星魂器…\Data\Scp`，输出写到 `%~dp0scp\scp.txt`。
   → 所以 deploy 脚本必须 **先把文件同步进"客户端工程目录"，最后再跑 `start.bat`**；并且建议**显式传参**：`start.bat "D:\YXDClient\Data\Scp"`，避免两条路径（`一键发布.bat` vs `deploy.ps1`）扫不同的目录、生成不同的 `bb`。
2. **`res.txt` 同理**：`start_res.bat` 扫 `%~dp0res`（发布站自己的 res 目录）→ 图片有改动时，要**先同步图片到 `C:\ShareFiles\res`，再 `start_res.bat`**。
3. **`一键发布.bat` 降级为手动兜底**（同意）。补一句：它内部**也**会 robocopy + 生成清单，所以**绝不能和 `deploy.ps1` 同时段运行**（会互抢 `scp.txt`）。
5. **补充：端口 35179 上其实挂了 3 个应用**（实测）：
   | 路径 | 物理目录 | 用途 |
   |---|---|---|
   | `/` | `C:\ShareFiles` | 发布站（scp / res / list.ini / 登录器） |
   | `/register` | `C:\RegApp` | 账号注册网页 |
   | `/pay` | `C:\PayApp` | 充值网站 |
   → `deploy.ps1` **只同步 `C:\ShareFiles`**，用 `/E` 不会碰到另外两个 ✓；但**不要把 `C:\RegApp` / `C:\PayApp` 放进同一个 git 仓库**（网站代码 + 可能含配置/密钥），需要的话单独仓库单独部署。
4. ⑥ 同步到游戏服**只同步文件、不自动生效**（同意）。补一句：**重启会踢掉在线玩家** → 只在维护窗口执行，计划任务里默认**不自动重启**。

---

## 四、第 6 节「落地顺序」—— 安全项按你的要求降级

- 你已明确：**这是内部测试服务器，方便优先** → 第 3 步（Tailscale / 收紧 RDP）改为**可选**，不进必做项。
  现状其实已经够用：RDP 已开（3389 已放行）、**1433 防火墙未放行**（符合"不开公网"）。
- **必做保留**：第 1 步「数据库备份 + 一次恢复演练」—— 脚本已写好，今天就能做。

---

## 五、第 7 节「回滚流程」—— 补 2 条

1. **表回滚后必须重新在服务端点「浏览+更新」**，否则服务端内存里跑的还是旧表；Lua 同理要「脚本更新」。
2. 回滚后**必须重生成 `scp.txt`**（同意原文），否则 C 端读到的 `bb` 没变，不会回退。
3. 大改动前打 tag（同意）；提交信息注明"需双端一致"（同意）。

---

## 六、第 9 节「待 B 回答」—— 逐条实测回答

1. **2.1 清单是否完整？** 方向对，**漏了 19+ 个**；完整清单是 144 个（见附件）。目前 144 个**内容 0 差异** ✓
2. **各出"本端实际加载的 Lua 清单"？** 服务端 `Lua\` 共 **1402** 个文件（`Other\`、`Act\`、`Battle\`、`NPC\`、`Task\` 等）；客户端 `Data\Scp` **完全没有 Lua 目录** → **交集为空，Lua 全部由 B 单端维护**。
3. **GameDB 大小 / GameDB_Log 增长？**（实测）

   | 库 | 数据 | 日志 |
   |---|---|---|
   | **GameDB** | 87.0 MB | **259.1 MB** |
   | GameDB_Log | 3.0 MB | 5.1 MB |
   | GameDBArea | 3.0 MB | 5.6 MB |
   | UserCenter | 3.0 MB | 4.6 MB |
   | UserActive | 3.0 MB | 4.6 MB |
   | PayCenter | 3.0 MB | 4.6 MB |

   - **全部是 FULL 恢复模式，而且一次备份都没有** → 事务日志只会一直涨。Express 上限 10GB / 库（数据文件），数据现在才 87MB，**空间本身不急**；急的是"日志不缩 + 没备份"。
   - **建议**：①把 6 个业务库改成 **SIMPLE** 恢复模式（测试环境不需要时间点恢复）②立刻做**每日全量备份** ③磁盘够用（C: 剩 12.9GB，D: 剩 68.4GB，备份放 D 盘）。
4. **计划任务/钩子账号权限？** 计划任务用 `SYSTEM`（管理员级）→ 对 `C:\ShareFiles`、`D:\YXDServer\...`、`D:\YXDClient\...` **都有写权限** ✓；唯一坑是 git 在 SYSTEM 下会报 `dubious ownership`，脚本里已加 `git config --global --add safe.directory`。
5. **云控制台是否开定期快照？** 这个我在机器内部查不到，**需要你在云控制台确认/开启**（建议开，是最便宜的兜底）。

---

## 七、B 建议补进「共同规则」的 9 条（A 也会碰表，这些必须共同遵守）

1. `.cse/.res` **只能用官方工具** `D:\YXDTool\脚本转换工具\Encrypt.exe`（右键解密 → 改 → 右键还原）；**不要自己写脚本 XOR**。
2. 工具命令行模式：`csv=>cse=0`、`csv=>scp=1`、`csv=>res=2`、`res=>scp=3`、`res=>csv=4`、`scp=>csv=5`、`scp=>res=6`、`cse=>csv=7`；**产物名与输入同名**。
3. 解出来的 CSV **绝不能用 `splitlines()` 重排整份**（`\x0b/\x0c/\x85` 会被当换行，文件直接废掉）→ 用**纯字节精确替换** + **回环校验**。
4. 表里**不能有重复 ID**；**不能出现双回车 `\r\r`**（会生成空记录 → 报「怪物ID: 0 配置重复」→ **整张表装载失败**，我们踩过）。
5. 服务端 Lua **必须 GBK**（UTF-8 会乱码/白屏）。
6. 批量改同一张表：**每次基于当前线上文件重新解密**，不要复用上次的解密结果（会覆盖前面的改动）。
7. PowerShell 脚本**必须 UTF-8 带 BOM**（PS 5.1 按 ANSI 读，纯 UTF-8 会报语法错）；带中文的 `.bat` 要 GBK。
8. 客户端对话框内容**别超过约 4.7KB**（超了客户端渲染不出来）→ 长列表分页。
9. **同一份双端文件必须"一次产出、两端分发"**：不要 A 端加密一次、B 端再加密一次（字节可能不一致），由发布流程统一拷贝。

---

## 八、开工顺序（B 的建议）

**今天就能做（不动线上、零风险）**
1. 数据库备份脚本 → 手动跑一次 → 注册每日 04:00 → 做一次恢复演练
2. 建 ASCII 软链接（`make_junctions.ps1`）
3. 双端比对报告（**已完成 ✅** 见附件）

**需要你点头**
4. 装 Git for Windows
5. 建 GitHub 仓库（B 建议：**公开**，仓库名 `yxd-test`）→ 把"会改的子集"入库
6. `deploy.ps1` 填 `$RepoUrl` → 手动跑一次验证 → 注册每 1 分钟计划任务（**不自动重启**）

**最后**
7. A 端 clone → 改一个测试文件 → push → 看 `bb` 变化 → C 端冒烟
8. 回滚流程 + 发布 checklist 定稿

---

## 九、待 A 回话的 3 个问题

1. 客户端 243 个文件里，除 144 个双端文件外的那 99 个，**你会不会改？要不要进仓库？**
2. 客户端 Lua 实际放在哪个目录？（不在 `Data\Scp` 里）要不要也纳入版本管理？
3. 仓库名 + 公开/私有，你定（B 建议 `yxd-test` + 公开）。
