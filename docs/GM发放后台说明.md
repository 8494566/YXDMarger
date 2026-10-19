# GM 发放后台 使用说明

访问地址：`http://42.193.197.163:35179/pay/gm.aspx`

（也可以从充值后台 `http://42.193.197.163:35179/pay/admin.aspx` 顶部新加的「**GM 发放**」按钮进去。）

登录密码：**与充值后台同一个**（存在 `C:\PayApp\App_Data\admin.dat`）。没设过就先去 `/pay/admin.aspx` 初始化，或运行 `C:\PayApp\tools\set-admin-password.ps1`。

---

## 四个功能

### ① 发放
填写后点「确认发放」：

| 字段 | 说明 |
|---|---|
| 角色（名字或 ActorID） | 例如 `无双` 或 `10001` |
| 物品 ID | 留空 = 只发金币 |
| 物品数量 | 单个附件上限 30000 |
| 金币数量 | 0 = 不发金币 |
| 邮件标题 / 正文 | 可留空，会自动生成 |

发放走的是系统邮件（`FromActorID < 1000`），玩家在游戏内邮箱领取。

**注意：物品和金币要分两次发。** 同一封邮件里如果既有附件又有金币，玩家领附件时金币会被清零——所以填了物品 ID 就别再填金币。

### ② 查角色
输入角色名 / ActorID / 账号ID 模糊查询，列出 ActorID、角色名、账号、等级、金币、点券；点「选用」会自动填进上面的发放表单。

### ③ 查物品（ID ↔ 名字）
按名字关键字或直接输 ID 搜索，点「选用」自动填物品 ID。

目录共 **4967** 条，来自服务端这四张表（`D:\Server\server\Server1\Scp\`）：

| 来源 | 内容 |
|---|---|
| `Medicament.cse` | 道具 / 药品 / 礼包 / 宝箱 |
| `Equipment.cse` | 装备 / 时装 / 士气装备 |
| `Materiel.cse` | 材料 / 货币（点券 80082、聊天石 80397、薄荷龙鳞 82018、金克拉 83113、冰封水晶 83114…） |
| `Gem.cse` | 宝石 |

**没收进来的**：宠物卡、载具等——它们的 ID 在 `Scp\pet\PetCards.cse`、`Scp\Vehical\VehicalCards.cse` 这类独立表里，编号体系不同。要用的话直接在「物品 ID」里填数字即可（发放不依赖目录）。

### ④ 最近发放记录
显示最近 30 条发放/失败记录，日志文件在 `C:\PayApp\logs\gm-YYYYMM.log`。

---

## 技术细节

- 页面文件：`C:\PayApp\gm.aspx`（单文件，内联 C#）
- 鉴权：复用 `App_Code\Common.cs` 的 `AdminAuth`（PBKDF2，60 次迭代哈希）
- 数据库：以 `IIS APPPOOL\PayApp` 身份连 `PayCenter`，跨库操作 `GameDB`
  - 已授权：`GameDB.dbo.Actor`(SELECT)、`GameDB.dbo.GM_ItemCatalog`(SELECT)、`GameDB.dbo.PrGs_GameEmail_Add_V5`(EXECUTE)
- 发放调用：`GameDB.dbo.PrGs_GameEmail_Add_V5`，附件缓冲用 `Db.BuildGoodsBuf(goodsId, num)` 构造（525 字节 = 8 字节头 + 97 字节物品行）
- 入口按钮加在 `C:\PayApp\admin.aspx`（原文件备份为 `admin.aspx.bak-20260928`）
- 物品目录表：`GameDB.dbo.GM_ItemCatalog (GoodsID, Name, ItemType, Src)`
  - 重新导入（若改了端里的物品表）：重新运行生成脚本即可，源逻辑是"解密 .cse（密钥 = 前 4 字节 XOR 表头首 4 字节「物品」）→ 取 ID/名字/类型 → 重建表"
