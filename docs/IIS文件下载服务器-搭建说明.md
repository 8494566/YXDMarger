# IIS 文件下载服务器搭建说明

## 一、当前状态（已完成并验证）

- 系统：Windows Server 2022 Datacenter（10.0.20348）
- IIS：已安装，服务 `W3SVC` 状态 Running，启动类型 Automatic（重启后自动生效）
- 站点：`Default Web Site`，绑定 `*:80:`，物理路径已从 `C:\inetpub\wwwroot` 改为 `C:\ShareFiles`
- 目录浏览：已在 applicationHost.config 中开启（站点根目录保持干净，无 web.config）
- 防火墙：入站规则「万维网服务(HTTP 流量入站)」已启用（TCP 80，Any Profile）
- 公网出口 IP：42.193.197.163（本机 `ifconfig.me` 实测一致）

### 验证结果

| 测试项 | 结果 |
| --- | --- |
| http://127.0.0.1/hello.txt | HTTP 200，text/plain |
| http://127.0.0.1/demo.zip | HTTP 200，application/x-zip-compressed |
| http://42.193.197.163/hello.txt | HTTP 200 |
| http://42.193.197.163/demo.zip | HTTP 200 |
| http://42.193.197.163/ | HTTP 200（目录列表） |
| 外部 TCP 80 探测（check-host.net） | 芬兰 / 匈牙利 / 伊朗 / 意大利 4 节点全部连通（0.21~0.34s） |

## 二、怎么用

1. 把要分享的 txt / zip / exe / 图片丢进 `C:\ShareFiles`
2. 别人直接访问：`http://42.193.197.163/文件名`
   - 例如 `http://42.193.197.163/hello.txt`
   - 例如 `http://42.193.197.163/demo.zip`
3. 子目录也支持：`C:\ShareFiles\movie\a.zip` → `http://42.193.197.163/movie/a.zip`

## 三、常用操作

### 换共享目录（例如改用 D:\Public）

```powershell
Set-ItemProperty 'IIS:\Sites\Default Web Site' -Name physicalPath -Value 'D:\Public'
```

### 关闭目录列表（别人看不到文件清单，只能凭文件名下载）

```powershell
& $env:windir\system32\inetsrv\appcmd.exe set config "Default Web Site" /section:directoryBrowse /enabled:false /commit:apphost
```

### 重启 IIS

```powershell
iisreset
```

或者只重启站点：

```powershell
Restart-WebItem 'IIS:\Sites\Default Web Site'
```

### 从零复现（如果哪天要重装）

```powershell
Install-WindowsFeature -Name Web-Server,Web-Default-Doc,Web-Dir-Browsing,Web-Static-Content,Web-Http-Logging,Web-Filtering,Web-Mgmt-Console -IncludeManagementTools
New-Item -ItemType Directory -Path C:\ShareFiles -Force
Set-ItemProperty 'IIS:\Sites\Default Web Site' -Name physicalPath -Value 'C:\ShareFiles'
& $env:windir\system32\inetsrv\appcmd.exe set config "Default Web Site" /section:directoryBrowse /enabled:true /commit:apphost
```

## 四、安全提醒

- `C:\ShareFiles` 里的一切对全网公开，**不要放隐私、证件、数据库备份、密码文件**。
- 目前是匿名访问，任何人知道 IP 就能下载。要加访问控制可选：
  - IIS 基本身份验证 + 账号密码
  - 只放压缩包并给文件起复杂名字（弱隔离，不推荐当安全措施）
- IIS 默认会拦截 `.config` 等敏感扩展名（返回 404），但不要依赖它。
- 建议后续加 HTTPS（443 + 证书），避免内容被中间人看到。

## 五、注意事项

- 端口 80 上还有 **SQL Server Reporting Services (SQLEXPRESS)** 注册了 `HTTP://+:80/REPORTSERVER_SQLEXPRESS/` 和 `HTTP://+:80/REPORTS_SQLEXPRESS/` 两个路径级 URL。它和 IIS 不冲突（路径不重叠），实测 IIS 正常绑定 `*:80:` 并工作。
- 腾讯云安全组已放行 TCP 80（外部探测已验证）。如果以后换了安全组策略导致外网打不开，先查安全组的入站规则。
- 测试文件 `hello.txt`、`demo.zip` 可以删掉。
