Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9758147833
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Jun 2019 04:31:33 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 699463EA499
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Jun 2019 04:31:33 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id D72F23EA442
 for <ltp@lists.linux.it>; Mon, 17 Jun 2019 04:31:31 +0200 (CEST)
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id D4F3E601717
 for <ltp@lists.linux.it>; Mon, 17 Jun 2019 04:31:30 +0200 (CEST)
Received: by mail-lj1-x22c.google.com with SMTP id a21so7715859ljh.7
 for <ltp@lists.linux.it>; Sun, 16 Jun 2019 19:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=Q1jKXB6nGGvv0+BRZxQc/KdHq6vkGWLu6l2k5ljvyqQ=;
 b=Ds+wcsKxAIW9cg4NdlbfMfk/z/JeScN0V0FmIDDgINU3PAw/tG5+frbi3RyFbSoHo8
 KDDjFrseT/NXzh0HWN0FPg9S4562hSG6iestFROZ90UskZj0vpCXJkVMh4RoPbPG6CII
 obicXeKsiiDBBAFmzOzIQ/BUWVdNDWddraWD1+95xspNPDDbFz+ns++6/lzPNabeZOEt
 5rsuzUTTeoHOrfzysHLyus4Mptoacv+OC/W4S/YGTdR2QDJvRmkhld+j/KS/zWE70X8L
 /0yUumMQdcEPk6gzLG9KvrMLgPtP7nl22D2E5citYhnNfPv1ri89RXeJ7TgtHqbK+Kou
 AMdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=Q1jKXB6nGGvv0+BRZxQc/KdHq6vkGWLu6l2k5ljvyqQ=;
 b=lHfYZ1bK5L21aAa31B6N59RQgk/OnfwA0c9FVdgo0hJRZhiLR7RmcW+oCwVPG/LsRK
 1b4FvkdHTTWT9QBqmOjlzl0npu4tpCIBP/Vd3fXpD2nC2Gc8+QNCaIt+w1gppVWmk0Uo
 k0wdStuLcA/RD+KvF2fhImUykweroo7xVPNQFyr8+ehnk0TmsImdYxxNRq71p9+iZHN7
 lpDEZy8ujSAeCkHDbDjirQn3ssy0EaIBdBfr3g6vytS6NuNYgl9ahphM9zi5tLnRgTbg
 +M3MpT8pDDG/CHae2IiT+4eNBMe7o6Tn4Cqx1soohgglfNII2+I+TIU1ZyW8s57i2Ueo
 RWbQ==
X-Gm-Message-State: APjAAAWc1LBOMtMtpixcu0OR4Kw2viyGvfjP1Yc8jXAAxfObPZJ4+x7+
 c7ZM13YktUDP+TPZVihSkHNU7Jkt6BE5pQYneckPKPlZTxM=
X-Google-Smtp-Source: APXvYqyBCAiblGMvzjmhf8/LES9rN0xI2oRrJGlTDDxdwMzR2dMU3rFzu9HxZrxftcAabkml6/l14ffQAx+tx0rYTFQ=
X-Received: by 2002:a2e:8495:: with SMTP id b21mr16615204ljh.149.1560738689942; 
 Sun, 16 Jun 2019 19:31:29 -0700 (PDT)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 17 Jun 2019 08:00:00 +0530
Message-ID: <CA+G9fYvg9va027oZELWkVVp5_YSyL0bZMy0iMVYweT2hh89xVg@mail.gmail.com>
To: ltp@lists.linux.it
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] Linux-4.4: pwritev201.c:62: FAIL: pwritev2() failed: EINVAL
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

TmV3bHkgYWRkZWQgdGVzdHMgcHdyaXRldjIwMSBhbmQgcHdyaXRldjIwMV82NCBmcm9tIExUUCB2
ZXJzaW9uCjIwMTkwNTE3IGdvdCBmYWlsZWQgb24gYWxsIGRldmljZXMgZm9yIExpbnV4IDQuNApk
byB5b3UgdGVzdCB0aGlzIG9uIGxpbnV4IHN0YWJsZSAgNC40IGJyYW5jaCA/IGRvIHlvdSBub3Rp
Y2UgdGhpcyBmYWlsdXJlID8KClRlc3QgUEFTUyBvbiBzdGFibGUgNC45LCA0LjE0IGFuZCA0LjE5
IGJyYW5jaGVzLgoKdHN0X3Rlc3QuYzoxMDk2OiBJTkZPOiBUaW1lb3V0IHBlciBydW4gaXMgMGgg
MTVtIDAwcwpwd3JpdGV2MjAxLmM6OTY6IFBBU1M6IHB3cml0ZXYyKCkgd3JvdGUgNjQgYnl0ZXMg
c3VjY2Vzc2Z1bGx5IHdpdGgKY29udGVudCAnYScgZXhwZWN0ZWRseQpwd3JpdGV2MjAxLmM6OTY6
IFBBU1M6IHB3cml0ZXYyKCkgd3JvdGUgNjQgYnl0ZXMgc3VjY2Vzc2Z1bGx5IHdpdGgKY29udGVu
dCAnYScgZXhwZWN0ZWRseQpwd3JpdGV2MjAxLmM6OTY6IFBBU1M6IHB3cml0ZXYyKCkgd3JvdGUg
NjQgYnl0ZXMgc3VjY2Vzc2Z1bGx5IHdpdGgKY29udGVudCAnYScgZXhwZWN0ZWRseQpwd3JpdGV2
MjAxLmM6NjI6IEZBSUw6IHB3cml0ZXYyKCkgZmFpbGVkOiBFSU5WQUwKcHdyaXRldjIwMS5jOjYy
OiBGQUlMOiBwd3JpdGV2MigpIGZhaWxlZDogRUlOVkFMCnB3cml0ZXYyMDEuYzo2MjogRkFJTDog
cHdyaXRldjIoKSBmYWlsZWQ6IEVJTlZBTApTdW1tYXJ5OgpwYXNzZWQgICAzCmZhaWxlZCAgIDMK
c2tpcHBlZCAgMAp3YXJuaW5ncyAwCgp0c3RfdGVzdC5jOjEwOTY6IElORk86IFRpbWVvdXQgcGVy
IHJ1biBpcyAwaCAxNW0gMDBzCnB3cml0ZXYyMDEuYzo5NjogUEFTUzogcHdyaXRldjIoKSB3cm90
ZSA2NCBieXRlcyBzdWNjZXNzZnVsbHkgd2l0aApjb250ZW50ICdhJyBleHBlY3RlZGx5CnB3cml0
ZXYyMDEuYzo5NjogUEFTUzogcHdyaXRldjIoKSB3cm90ZSA2NCBieXRlcyBzdWNjZXNzZnVsbHkg
d2l0aApjb250ZW50ICdhJyBleHBlY3RlZGx5CnB3cml0ZXYyMDEuYzo5NjogUEFTUzogcHdyaXRl
djIoKSB3cm90ZSA2NCBieXRlcyBzdWNjZXNzZnVsbHkgd2l0aApjb250ZW50ICdhJyBleHBlY3Rl
ZGx5CnB3cml0ZXYyMDEuYzo2MjogRkFJTDogcHdyaXRldjIoKSBmYWlsZWQ6IEVJTlZBTApwd3Jp
dGV2MjAxLmM6NjI6IEZBSUw6IHB3cml0ZXYyKCkgZmFpbGVkOiBFSU5WQUwKcHdyaXRldjIwMS5j
OjYyOiBGQUlMOiBwd3JpdGV2MigpIGZhaWxlZDogRUlOVkFMClN1bW1hcnk6CnBhc3NlZCAgIDMK
ZmFpbGVkICAgMwpza2lwcGVkICAwCndhcm5pbmdzIDAKCkZ1bGwgdGVzdCBsb2csCmh0dHBzOi8v
bGtmdC52YWxpZGF0aW9uLmxpbmFyby5vcmcvc2NoZWR1bGVyL2pvYi83NTEwMjcjTDk2MDgKClRl
c3QgcmVzdWx0cyBjb21wYXJpc29uIGxpbmssCmh0dHBzOi8vcWEtcmVwb3J0cy5saW5hcm8ub3Jn
L18vY29tcGFyZXRlc3QvP3Byb2plY3Q9MjImcHJvamVjdD02JnByb2plY3Q9NTgmcHJvamVjdD0x
MzUmcHJvamVjdD00MCZwcm9qZWN0PTIzJnByb2plY3Q9MTY3JnN1aXRlPWx0cC1zeXNjYWxscy10
ZXN0cyZ0ZXN0PXB3cml0ZXYyMDEKCkJlc3QgcmVnYXJkcwpOYXJlc2ggS2FtYm9qdQoKLS0gCk1h
aWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
