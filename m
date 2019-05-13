Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 251F01B0B3
	for <lists+linux-ltp@lfdr.de>; Mon, 13 May 2019 09:04:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9E189294AB1
	for <lists+linux-ltp@lfdr.de>; Mon, 13 May 2019 09:04:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 443CA294A36
 for <ltp@lists.linux.it>; Mon, 13 May 2019 09:04:13 +0200 (CEST)
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id E4EAD6009ED
 for <ltp@lists.linux.it>; Mon, 13 May 2019 09:04:14 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id d8so8154837lfb.8
 for <ltp@lists.linux.it>; Mon, 13 May 2019 00:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=Rem/44la0ojZ/okwhQOse6NztGisqOG/WSQKgL0rk7c=;
 b=KOZzmyj5olxpvAFqvqgsGr2pxK5EGyxqvkJi1PVGSRVYkpPQXumJ2iJKNt3ChWaHpK
 FrCgjYw6FpL1NHc+TkeFTWaXLjaT3/8UVZ4/Kdh+FKD2wy+b+09IV1fk2YqtFkHvjoIw
 +U8hOgQqQ4LmMEgwrRBL5FkDRFU99eK+MHLjxjNVjfF9iEMfTqriksmxSXi5vdl3xwQy
 JwRw02fMhk3kCNrHVvuccX4UHPscDPdC+uWs5NB5Lph3aVRX/qy5iKcna7hnLPhbFoNA
 F4Zu3Eq3PJ0cWzHEvMeSkcOKqbZERH1Z0s9fWydktK3Sa14lnh7dzPmqEOGhn10mSYm3
 q79w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=Rem/44la0ojZ/okwhQOse6NztGisqOG/WSQKgL0rk7c=;
 b=S8dN02dFIlhzvrJAjvcf2BzcQJXFfbyPctcUf8GYWr1+mbEcU3mrDy6EhUi/pboXf8
 yM6w39N9CNeT4mgubP8a5uwweCjJ8VzeIC/4xn+KA4CY4cx9Q/Bw2+eudo568kIC3/yb
 eyqJSNkJ2hKJA4iF3fDGoR5p74yNnMizjElRZPnVr5o8NNRFud1DNYcufZScJcZKeAbz
 Y7uUsF3SduIcIk2ky5gKeO7tBcgt7NwHp4FNIVIBCCycHMpjcjDOqloy4mMI2F7AACkv
 L08kHIGTbLXxYPIo4dNcdNOQZbatjrx1tVuoMiHYxmIjYdIqLEsh0yqcoFCSAOqPrb0G
 WN9A==
X-Gm-Message-State: APjAAAXXDCBrBMtV2YKT2lYo2vbvo/wd8ME16ep2zaK4ssgq7UvKxzDq
 tR2efE4orQw5DpU40hTt0VSVCKgUygiodPZDhhkI6NawxRs=
X-Google-Smtp-Source: APXvYqybchJgzFpRfMAC3Q4BT11+uFkCytdEw3CHRxfQIQgptc+x0cgVE78YX68cLBOcn0XAzVV3N7RIjwtsBnCGFRA=
X-Received: by 2002:a19:6b0e:: with SMTP id d14mr10402628lfa.137.1557731051562; 
 Mon, 13 May 2019 00:04:11 -0700 (PDT)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 13 May 2019 12:34:00 +0530
Message-ID: <CA+G9fYuLXPnCmpnnLqBf5qinV6wrFx=HBH2KrB8s1HmCxLM=Zw@mail.gmail.com>
To: ltp@lists.linux.it
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Cc: lkft-triage@lists.linaro.org
Subject: [LTP] LTP: Syscalls: 274 failures: EROFS(30): Read-only file system
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.18
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

V2UgaGF2ZSBub3RpY2VkIDI3NCBzeXNjYWxsIHRlc3QgZmFpbHVyZXMgb24geDg2XzY0IGFuZCBp
Mzg2IGR1ZSB0bwpNYWtlIHRoZSB0ZW1wb3JhcnkgZGlyZWN0b3J5IGluIG9uZSBzaG90IHVzaW5n
IG1rZHRlbXAgZmFpbGVkLgp0c3RfdG1wZGlyLmM6MjY0OiBCUk9LOiB0c3RfdG1wZGlyOgpta2R0
ZW1wKC9zY3JhdGNoL2x0cC03RDh2QWNZZUZHL09YdXF1SikgZmFpbGVkOiBFUk9GUwoKRmFpbGVk
IGxvZzoKLS0tLS0tLS0tLS0tCnByZWFkMDEgICAgIDEgIFRCUk9LICA6ICB0c3RfdG1wZGlyLmM6
MjY0OiB0c3RfdG1wZGlyOgpta2R0ZW1wKC9zY3JhdGNoL2x0cC03RDh2QWNZZUZHL3ByZUFVdlhB
RSkgZmFpbGVkOiBlcnJubz1FUk9GUygzMCk6ClJlYWQtb25seSBmaWxlIHN5c3RlbQpwcmVhZDAx
ICAgICAyICBUQlJPSyAgOiAgdHN0X3RtcGRpci5jOjI2NDogUmVtYWluaW5nIGNhc2VzIGJyb2tl
bgoKZnVsbCB0ZXN0IGxvZywKLS0tLS0tLS0tLS0tLS0KaHR0cHM6Ly9sa2Z0LnZhbGlkYXRpb24u
bGluYXJvLm9yZy9zY2hlZHVsZXIvam9iLzcxMTgyNiNMNzgzNAoKTFRQIFZlcnNpb246IDIwMTkw
MTE1CgpLZXJuZWwgYmFkIGNvbW1pdDoKLS0tLS0tLS0tLS0tCmdpdCBicmFuY2ggbWFzdGVyCmdp
dCBjb21taXQgZGQ1MDAxZTIxYTk5MWI3MzFkNjU5ODU3Y2QwN2FjYzdhMTNlNjc4OQpnaXQgZGVz
Y3JpYmUgdjUuMS0zNDg2LWdkZDUwMDFlMjFhOTkKZ2l0IHJlcG8gaHR0cHM6Ly9naXQua2VybmVs
Lm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0CgpLZXJuZWwg
Z29vZCBjb21taXQ6Ci0tLS0tLS0tLS0tLQpnaXQgYnJhbmNoIG1hc3RlcgpnaXQgY29tbWl0IGQz
NTExZjUzYmIyNDc1ZjJhNGU4NDYwYmVlNWExYWU2ZGVhMmE0MzMKZ2l0IGRlc2NyaWJlIHY1LjEt
MzM4NS1nZDM1MTFmNTNiYjI0CmdpdCByZXBvIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3Nj
bS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdAoKQmVzdCByZWdhcmRzCk5hcmVz
aCBLYW1ib2p1CgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQv
bGlzdGluZm8vbHRwCg==
