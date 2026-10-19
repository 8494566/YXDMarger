# 登录器再加一份清单：`Data\Pic`（英雄头像等散图）

## 为什么
英雄头像（`Data\Pic\HEROHEAD\HeroHead<英雄ID>.tga`）等散图**不在**现有两份清单覆盖范围内：

| 清单 | 根目录 | 覆盖内容 |
|---|---|---|
| `scp/scp.txt` | 客户端 `Data\Scp` | 表（脚本/配置）|
| `res/res.txt` | 客户端 `Data\Res` | 图集（bmp.fsp / Magic.fsp / grd 等）|
| **`pic/pic.txt`（本次要加的）** | 客户端 `Data\Pic` | 散图（HEROHEAD / Cursor / LuaUse / MapBack / MiniMapObj / WorldMap / weather 等）|

现状：新英雄「无极」(HeroID 53) 的头像 `HeroHead53.tga` 放在 `Data\Pic\HEROHEAD\` 里，
玩家端拿不到 → 英雄列表显示「?」。（我已临时把同一张图放了一份到 `Data\Res\HEROHEAD\` 走 res 通道，
但如果客户端只认 `Data\Pic`，就还需要这份新清单 ✓）

## 要做什么（和 `res` 那套**完全一样**，只是换个目录/段名）
1. **建 `pic/` 目录**，内容 = 客户端 `Data\Pic` 的全部文件（保留子目录结构）。
2. **生成并上传 `pic/pic.txt`**：段名必须是 **`[pic]`**，根目录对应客户端 `Data\Pic`，
   路径形如 `HEROHEAD/HeroHead53.tga`、`Cursor/cur_beam.bmp`（用第六节那个工具生成，只改段名 ✓）。
3. **MIME**：我们站点已用通配符 `*` → `application/octet-stream` 覆盖 ✓ **不用改 web.config** ✓。
4. **HTTP Range**：已支持 ✓。

## 验收
1. `http://42.193.197.163:35179/pic/pic.txt` → 首行 `[pic]`、第二行 `bb=...`
2. 挑两个路径（含子目录）拼接访问 → 200，例：`/pic/HEROHEAD/HeroHead53.tga`
3. 客户端本地版本键用 `picbb`（和 `scpbb`/`resbb` 同一套写法）

## 更新流程（以后）
改了 `Data\Pic` 里的东西 → 覆盖 `pic/` 下对应文件 → 重新生成 `pic/pic.txt` → 上传覆盖。
（`bb` 变了客户端才会更新 ✓）
