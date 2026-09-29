#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
yxd_crypt.py — 英雄岛 表 加解密（纯 Python，无需 Encrypt.exe）

算法（字节级验证通过）：
    密钥 KEY = 按位取反(文件长度 + 3)，4 字节小端
    数据   data[i] ^= KEY[i % 4]
XOR 自逆，且密钥只取决于"输入文件的字节长度"，
所以 加密 和 解密 是同一个操作（对同一文件跑两次即还原）。

扩展名对照（与官方工具一致）：
    .cse  <-> .csv     （表格，Excel/文本编辑器）
    .res  <-> .scp     （文本脚本，记事本）
    .scp  <-> .res

用法：
    python yxd_crypt.py <输入文件> [输出文件]
未给输出文件时按上表自动定名。
加 --check 会做解密-回环校验（crypt(crypt(x))==x）。
"""
import sys, os

# 解密方向：加密扩展名 -> 明文扩展名
_DEC = {'.cse': '.csv', '.res': '.scp', '.scp': '.res'}
# 加密方向：明文扩展名 -> 加密扩展名
_ENC = {'.csv': '.cse', '.scp': '.res', '.res': '.scp'}


def _key(n):
    v = (n + 3) & 0xFFFFFFFF
    return bytes(0xFF ^ b for b in v.to_bytes(4, 'little'))


def crypt(data: bytes) -> bytes:
    k = _key(len(data))
    return bytes(data[i] ^ k[i % 4] for i in range(len(data)))


def _auto_out(src):
    stem, ext = os.path.splitext(src)
    ext = ext.lower()
    if ext in _DEC:
        return stem + _DEC[ext]
    if ext in _ENC:
        return stem + _ENC[ext]
    return stem + '.enc'


def main():
    args = [a for a in sys.argv[1:] if not a.startswith('--')]
    check = '--check' in sys.argv
    if not args:
        print(__doc__); sys.exit(1)
    src = args[0]
    data = open(src, 'rb').read()
    out = args[1] if len(args) > 1 else _auto_out(src)
    res = crypt(data)
    open(out, 'wb').write(res)
    print("%s (%d) -> %s (%d)  KEY=%s" % (src, len(data), out, len(res), _key(len(data)).hex()))
    if check:
        ok = crypt(res) == data
        print("回环校验: %s" % ("通过" if ok else "失败 !!"))
        if not ok:
            sys.exit(2)


if __name__ == '__main__':
    main()
