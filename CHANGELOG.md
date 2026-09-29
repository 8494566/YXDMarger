# 变更记录

格式：`日期 | 谁 | 改了什么 | 是否需双端一致 | 备注`

- 2026-09-28 | B | 初始化仓库：`shared/scp`（144 个双端文件）、`server/lua`（Other/Act/NPC/Task/Main.lua）、`publish-static`、`tools` | — | 首次入库
- 2026-09-28 | B | �˵��˲��ԣ���֤ push -> �Զ���ȡ -> ͬ�� -> �������� scp.txt | - | �����ύ
- 2026-09-28 | B | SYSTEM �ƻ������Զ���ȡ��֤ | - | �����ύ2
- 2026-09-28 | B | 修复 deploy.ps1：start.bat 的 pause 会让计划任务卡死；cmd /c 引号需双层；robocopy 排除 .gitkeep | 否 | 实测通过
- 2026-09-28 | B | 新增全自动：同步后自动热更 changed 的服务端 Lua（hot_update.ps1 驱动服务器窗口「更新」按钮，含日志校验）；文档与 tools 同步 | 否 | 实测两轮通过
- 2026-09-28 | B | 修复关键漏步：deploy.ps1 现在会把客户端工程复制到发布站 scp/（之前漏了 → 清单更新但发布站是旧文件 → 客户端无限断点续传）；并加入 res 图片同步 | 否 | 已修复现场
- 2026-09-29 | B | 新增 lua_check.ps1 语法预检（拦 ",," 等必错）+ hot_update 失败自动回滚；修复 Jinkelanpc.lua 双逗号；deploy.ps1 修复 safe.directory 与发布站复制/res 改为 opt-in | 否 | 服务端已恢复
- 2026-09-29 | B | 以服务端手改版为准：同步 shared/scp/AIInfo.res + monster03.cse（客户端/发布站已同步，清单 bb=cee5798ed54e）| 是 | 待服务端重载表
- 2026-09-29 | B | 以服务端手改版为准：PetCards 宠物大图ID 列修正（38行）已加密并发布；4表同步
- 2026-09-29 | B | PetCards：43 行 GroupPer 改为对应 monster03 的 Resid（名字一致的行）；8 行异常待确认
- 2026-09-29 | B | PetCards：回退卡0-51的 GroupPer（保留卡82+），删除卡9 行（NPCID 823009 与卡82 重复）
- 2026-09-29 | B | 回退 Effect.res 到 A 之前版本：客户端装载 Effect.res 失败导致游戏进不去（A 版结构正常，疑客户端装载器限制）
- 2026-09-29 | B | 修复圣兽守护 Effect.res：把 A 追加在脚本末尾的 505 个 Object 移入 `Object 基本属性和… = 1` 体内（使其归属 level 2，对上 Status2 的 Property=2；原先在 -54 组，ID 30093~30597 超范围致客户端装载失败）。用 res->scp/scp->res 路径
