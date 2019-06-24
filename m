Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF13504E8
	for <lists+linux-ltp@lfdr.de>; Mon, 24 Jun 2019 10:52:53 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1635C3C181F
	for <lists+linux-ltp@lfdr.de>; Mon, 24 Jun 2019 10:52:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 965003C034E
 for <ltp@lists.linux.it>; Mon, 24 Jun 2019 10:52:50 +0200 (CEST)
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 0CF071400044
 for <ltp@lists.linux.it>; Mon, 24 Jun 2019 10:52:50 +0200 (CEST)
Received: by mail-wm1-x342.google.com with SMTP id u8so12458175wmm.1
 for <ltp@lists.linux.it>; Mon, 24 Jun 2019 01:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=WXFk1khXw7w9JayWCtJqPeCIfdpFk03EWcfew3oQchA=;
 b=WzcDKsGclsbXqhxOu/tvyyZzP5isS9NYXiD/OFYWEjnymXxtJxrtprGIJL29u+UPEZ
 /sAb8r1KAYqJ05+ZV9EDaVOS4+E9znb+uSWTCkvfLTcOVvAbwePdOhy9sz7xjjjvYYk2
 9nBQ+FZ2FjbfxtRRP44QEJlyDiE1DcXuAQaDkJ7XGkmOJQQG2muUc/bWRbeiNocW2Qud
 M7FypdvpUg4EILNM036p8F+qgol/YvW7jLIlfdjIaWlM9XjRg+yrIgHniDaZ2YRLynKc
 E6mNeBamLIyRomVYSrv+boJuRvsptxXvXF1UyL6ocwOwQnIPj3/KMxHiKZFPFYumgsMd
 2Bsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=WXFk1khXw7w9JayWCtJqPeCIfdpFk03EWcfew3oQchA=;
 b=GSSSi6fwRSolpAwT9lOv6FzCLuvW23w+MA0Ue+AyON2Cj0d7OsomgzuFpdsZk0s8YE
 qc55fFWpLYP7Tf0kGq6CzBgXZagTkW7lOBmbrm/31IQOF3LefJcSa4EEv5CX6i/+Eelg
 XUXURosxjddhdcMNYe557QXT95kU0D7xxoX1dH2vxNAIAm5FXhHlHkSRADqA+JWkkWYk
 ZP9Ifa0bCruETHszeNhekvQzCKgy/awf5akMGwAw3IhtER+1odPyW2GeZhkm6gBz4CkI
 DqW41XpSvqEkEx/N4I5f19fKVZNNM9CbljHguT8bhV9ZJhFg/Hm38YfWZmbfGWWV6GgX
 16nw==
X-Gm-Message-State: APjAAAXn0RGgXHDYeUzNWENZw0gAEusUBjxfvcAtDkKCg7Lo449th6Pm
 oY8o8C6N4WJxLDcjLie4XPyJv6Gs
X-Google-Smtp-Source: APXvYqwBa/wBZT9UjKR566d5IuoTulFV34gCeYjl2ClQc8YgFiYbH6Fw3C1G1IdEsGJFT+pzeRjiPg==
X-Received: by 2002:a7b:cb84:: with SMTP id m4mr15754574wmi.50.1561366369392; 
 Mon, 24 Jun 2019 01:52:49 -0700 (PDT)
Received: from amir-ThinkPad-T480.ctera.local
 (bzq-166-168-31-246.red.bezeqint.net. [31.168.166.246])
 by smtp.gmail.com with ESMTPSA id c15sm15298065wrd.88.2019.06.24.01.52.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 24 Jun 2019 01:52:48 -0700 (PDT)
From: Amir Goldstein <amir73il@gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
Date: Mon, 24 Jun 2019 11:52:41 +0300
Message-Id: <20190624085241.32276-1-amir73il@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Cc: Jan Kara <jack@suse.cz>, ltp@lists.linux.it
Subject: [LTP] [PATCH] syscalls/fanotify13: add test coverage for fsid cache
	bug
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
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

VGhpcyBidWcgd2FzIHJlcG9ydGVkIGJ5IHN5emJvdDoKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
bGludXgtZnNkZXZlbC9DQU9RNHV4aHNuT1hYVkN1T1Q0cDRjX2tvQk1GZnByV3dkdENQR05HaHpw
ckZhSlp3UkFAbWFpbC5nbWFpbC5jb20vVC8jdAoKQW5kIGZpeGVkIGJ5IGtlcm5lbCBjb21taXQK
YzI4NWEyZjAxZDY5ICgiZmFub3RpZnk6IHVwZGF0ZSBjb25uZWN0b3IgZnNpZCBjYWNoZSBvbiBh
ZGQgbWFyayIpCgpTaWduZWQtb2ZmLWJ5OiBBbWlyIEdvbGRzdGVpbiA8YW1pcjczaWxAZ21haWwu
Y29tPgotLS0KCkN5cmlsLAoKSGVyZSBpcyBhIHJlLXNlbmQgb2YgdGhlIHBhdGNoIHlvdSBtaXNz
ZWQuCkkgYWxzbyBhZGRlZCB0aGUga2VybmVsIGZpeCBjb21taXQgZm9yIHJlZmVyZW5jZS4KClRo
YW5rcywKQW1pci4KCiAuLi4va2VybmVsL3N5c2NhbGxzL2Zhbm90aWZ5L2Zhbm90aWZ5MTMuYyAg
ICAgfCAyMCArKysrKysrKysrKysrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTYgaW5zZXJ0aW9u
cygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90ZXN0Y2FzZXMva2VybmVsL3N5c2Nh
bGxzL2Zhbm90aWZ5L2Zhbm90aWZ5MTMuYyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvZmFu
b3RpZnkvZmFub3RpZnkxMy5jCmluZGV4IDNlNDc3OGU2OC4uZTU2ODFjODA0IDEwMDY0NAotLS0g
YS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2Zhbm90aWZ5L2Zhbm90aWZ5MTMuYworKysgYi90
ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2Zhbm90aWZ5L2Zhbm90aWZ5MTMuYwpAQCAtODUsNiAr
ODUsNyBAQCBzdGF0aWMgc3RydWN0IHRlc3RfY2FzZV90IHsKIAl9CiB9OwogCitzdGF0aWMgaW50
IG5vZmlkX2ZkOwogc3RhdGljIGludCBmYW5vdGlmeV9mZDsKIHN0YXRpYyBjaGFyIGV2ZW50c19i
dWZbQlVGX1NJWkVdOwogc3RhdGljIHN0cnVjdCBldmVudF90IGV2ZW50X3NldFtFVkVOVF9NQVhd
OwpAQCAtMjgxLDIxICsyODIsMzIgQEAgb3V0OgogCiBzdGF0aWMgdm9pZCBkb19zZXR1cCh2b2lk
KQogewotCWludCBmZDsKLQogCS8qIENoZWNrIGZvciBrZXJuZWwgZmFub3RpZnkgc3VwcG9ydCAq
LwotCWZkID0gU0FGRV9GQU5PVElGWV9JTklUKEZBTl9DTEFTU19OT1RJRiwgT19SRE9OTFkpOwot
CVNBRkVfQ0xPU0UoZmQpOworCW5vZmlkX2ZkID0gU0FGRV9GQU5PVElGWV9JTklUKEZBTl9DTEFT
U19OT1RJRiwgT19SRE9OTFkpOwogCiAJLyogQ3JlYXRlIGZpbGUgYW5kIGRpcmVjdG9yeSBvYmpl
Y3RzIGZvciB0ZXN0aW5nICovCiAJY3JlYXRlX29iamVjdHMoKTsKIAorCS8qCisJICogQ3JlYXRl
IGEgbWFyayBvbiBmaXJzdCBpbm9kZSB3aXRob3V0IEZBTl9SRVBPUlRfRklELCB0byB0ZXN0CisJ
ICogdW5pbml0aWFsaXplZCBjb25uZWN0b3ItPmZzaWQgY2FjaGUuIFRoaXMgbWFyayByZW1haW5z
IGZvciBhbGwgdGVzdAorCSAqIGNhc2VzIGFuZCBpcyBub3QgZXhwZWN0ZWQgdG8gZ2V0IGFueSBl
dmVudHMgKG5vIHdyaXRlcyBpbiB0aGlzIHRlc3QpLgorCSAqLworCWlmIChmYW5vdGlmeV9tYXJr
KG5vZmlkX2ZkLCBGQU5fTUFSS19BREQsIEZBTl9DTE9TRV9XUklURSwgQVRfRkRDV0QsCisJCQkg
IEZJTEVfUEFUSF9PTkUpID09IC0xKSB7CisJCXRzdF9icmsoVEJST0sgfCBURVJSTk8sCisJCQki
ZmFub3RpZnlfbWFyayglZCwgRkFOX01BUktfQURELCBGQU5fQ0xPU0VfV1JJVEUsICIKKwkJCSJB
VF9GRENXRCwgIkZJTEVfUEFUSF9PTkUiKSBmYWlsZWQiLAorCQkJbm9maWRfZmQpOworCX0KKwog
CS8qIEdldCB0aGUgZmlsZXN5c3RlbSBmc2lkIGFuZCBmaWxlIGhhbmRsZSBmb3IgZWFjaCBjcmVh
dGVkIG9iamVjdCAqLwogCWdldF9vYmplY3Rfc3RhdHMoKTsKIH0KIAogc3RhdGljIHZvaWQgZG9f
Y2xlYW51cCh2b2lkKQogeworCVNBRkVfQ0xPU0Uobm9maWRfZmQpOwogCWlmIChmYW5vdGlmeV9m
ZCA+IDApCiAJCVNBRkVfQ0xPU0UoZmFub3RpZnlfZmQpOwogfQotLSAKMi4xNy4xCgoKLS0gCk1h
aWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
