# 变更记录

格式：`日期 | 谁 | 改了什么 | 是否需双端一致 | 备注`

- 2026-09-28 | B | 初始化仓库：`shared/scp`（144 个双端文件）、`server/lua`（Other/Act/NPC/Task/Main.lua）、`publish-static`、`tools` | — | 首次入库
- 2026-09-28 | B | �˵��˲��ԣ���֤ push -> �Զ���ȡ -> ͬ�� -> �������� scp.txt | - | �����ύ
- 2026-09-28 | B | SYSTEM �ƻ������Զ���ȡ��֤ | - | �����ύ2
- 2026-09-28 | B | 修复 deploy.ps1：start.bat 的 pause 会让计划任务卡死；cmd /c 引号需双层；robocopy 排除 .gitkeep | 否 | 实测通过
- 2026-09-28 | B | 新增全自动：同步后自动热更 changed 的服务端 Lua（hot_update.ps1 驱动服务器窗口「更新」按钮，含日志校验）；文档与 tools 同步 | 否 | 实测两轮通过
