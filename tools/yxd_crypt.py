#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
yxd_crypt.py — 英雄岛 .cse/.res 加解密（纯 Python，无需 Encrypt.exe）

算法（实测反推，已验证 100+ 文件）：
    密钥 KEY = 按位取反(文件长度 + 3)，4 字节小端
    数据   data[i] ^= KEY[i % 4]
XOR 自逆，且加密/解密密钥只取决于"输入文件的字节长度"，
所以 加密和解密是同一个操作（对同一文件跑两次即还原）。

用法：
    python yxd_crypt.py <输入文件> [输出文件]
未给输出文件时：
    .cse/.res/.scp  -> 同名 .csv/.txt
    .csv/.txt       -> 同名 .cse/.res（需自己指定更稳妥）
"""
import sys, os

def _key(n):
    v = (n + 3) & 0xFFFFFFFF
    return bytes(0xFF ^ b for b in v.to_bytes(4, 'little'))

def crypt(data: bytes) -> bytes:
    k = _key(len(data))
    return bytes(data[i] ^ k[i % 4] for i in range(len(data)))

def main():
    if len(sys.argv) < 2:
        print(__doc__); sys.exit(1)
    src = sys.argv[1]
    data = open(src, 'rb').read()
    out = sys.argv[2] if len(sys.argv) > 2 else None
    if out is None:
        stem, ext = os.path.splitext(src)
        ext = ext.lower()
        if ext in ('.cse', '.res', '.scp'):
            out = stem + '.csv'
        else:
            out = stem + '.enc'
    res = crypt(data)
    open(out, 'wb').write(res)
    print("%s (%d) -> %s (%d)  KEY=%s" % (src, len(data), out, len(res), _key(len(data)).hex()))

if __name__ == '__main__':
    main()
