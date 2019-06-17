Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 090EC49389
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Jun 2019 23:31:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DA9453EB070
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Jun 2019 23:31:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 0204E3EA41B
 for <ltp@lists.linux.it>; Mon, 17 Jun 2019 23:31:48 +0200 (CEST)
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id B4A8A600700
 for <ltp@lists.linux.it>; Mon, 17 Jun 2019 23:31:45 +0200 (CEST)
Received: by mail-wr1-x443.google.com with SMTP id x17so11588359wrl.9
 for <ltp@lists.linux.it>; Mon, 17 Jun 2019 14:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pwsuKA5ZBnHl/E946mjscLMLOxjc2e1UFTc9UguSmMg=;
 b=f3p63QttZaW/gjf0nBw6D5CEf9uOq+/aWZJ2Oj/4EkiiX5aQhBNA8qpU2ejlNgUqSW
 fXSGt12CLoqL7ml2OsJDxI9DSuS04BnuHNTk418pSKpoL9utHSEVZX1NkYafSbtbc4Mz
 KF3h7tgVGdn9n2/0Kk51kMEeFpiHxurahXwlTgSvzeblpkcUWj7eL9iVWa3PM4fR1F8V
 lDWCnp+YIRDTGzASg2pc5W7j+WnKIodoT6oqaT77sItpeQU6fZyNXtm9f98rBlIKhkR8
 81HbIL09+7GTCwTIKwkgRPr0kB3K6dXSteceqvk2V4ht5U0bOEK/C0LEgQkk2nYeLx7V
 +Vgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pwsuKA5ZBnHl/E946mjscLMLOxjc2e1UFTc9UguSmMg=;
 b=K2BENfrEZbu5+YRDxqxWM4gZr0XeKiL16NAC0LjTCPXkSd9mAZUYJgrP+ZFM0BzlRy
 BJNyVbdFHrhCT4BR2EVJWY2ONllrQM2rZIgwaBF5HXf0M6WP+oJF6nR6bItuwrMjMYtD
 cPVbwkXGeFXlKZOuYumyBb8ZajUFp+JkfaGV7+XlPEvZfUtD8HKxHuglcThy6/b8PuZd
 P9zb2wgu4eX0KMQhPPQb3gK28by1BdFymeFUNDb/xvALYvPhD1pGMQdj8D3d/nzGPL2g
 Pl75EluYCm4Xepm8gs51U2/inV4Vnvofz+sq2Ilr31RCYIrRzQuHhrSp4agAsJHMQmAY
 7JkA==
X-Gm-Message-State: APjAAAX+qE5QagjPQxd55cMgayiiosioyweoZycTSzmljVk3yzHvbiFb
 ts7fmLvAR174q0GFcIaaG2/8sxuU
X-Google-Smtp-Source: APXvYqwEs+lDPqnmXHlceExHjdUoM7wtmBpUHszULd0ZrN6CPzIGSGLC0KK55DqNfBPXpezHc9CM2A==
X-Received: by 2002:a5d:4286:: with SMTP id k6mr16492624wrq.151.1560807104977; 
 Mon, 17 Jun 2019 14:31:44 -0700 (PDT)
Received: from x230.suse.cz ([62.201.25.198])
 by smtp.gmail.com with ESMTPSA id y2sm10697111wrl.4.2019.06.17.14.31.44
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 14:31:44 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: ltp@lists.linux.it
Date: Mon, 17 Jun 2019 23:31:38 +0200
Message-Id: <20190617213138.15896-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] syscalls/ustat: Use __kernel_daddr_t instead of
	daddr_t
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

VGhpcyBmaXhlcyBidWlsZCBmb3IgbXVzbCwgd2hpY2ggZG9lcyBub3QgaGF2ZSA8c3lzL3VzdGF0
Lmg+IG5vcgp0eXBlZGVmIGRhZGRyX3QuIE11c2wgZG9lcyBub3QgZGVmaW5lIHRoZXNlIGFzIHVz
dGF0IGlzIGRlcHJlY2F0ZWQKaW4gZmF2b3Igb2Ygc3RhdGZzKCkgYW5kIGRhZGRyX3QgaXMgYW5j
aWVudCBbMV0uCgpPdGhlciBsaWJjIGFsc28gZG9lcyBub3QgaGF2ZSA8c3lzL3VzdGF0Lmg+ICh1
c3RhdCBzdXBwb3J0IHdhcyByZW1vdmVkCmZyb20gZ2xpYmMgaW4gMi4yOCksIGJ1dCB0aGV5IGhh
dmUgZGFkZHJfdC4KClRoaXMgYnJpbmdzIDxsaW51eC90eXBlcy5oPiBkZXBlbmRlbmN5IGZvciB1
c3RhdCB0ZXN0aW5nLgoKVHlwZWRlZiBpcyBuZWVkZWQgYXMgc3BhcmMgYW5kIG1pcHMgaGF2ZSBf
X2tlcm5lbF9kYWRkcl90IGxvbmcsCm90aGVyd2lzZSBpdCdzIGludC4KClsxXSBodHRwczovL3d3
dy5vcGVud2FsbC5jb20vbGlzdHMvbXVzbC8yMDE5LzA2LzEwLzEKClNpZ25lZC1vZmYtYnk6IFBl
dHIgVm9yZWwgPHBldHIudm9yZWxAZ21haWwuY29tPgotLS0KIGNvbmZpZ3VyZS5hYyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHwgMSArCiBpbmNsdWRlL2xhcGkvdXN0YXQuaCAgICAgICAg
ICAgICAgICAgICAgICB8IDUgKysrLS0KIHRlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvdXN0YXQv
dXN0YXQwMS5jIHwgOCArKysrKysrLQogdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy91c3RhdC91
c3RhdDAyLmMgfCA4ICsrKysrKystCiA0IGZpbGVzIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKyks
IDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvY29uZmlndXJlLmFjIGIvY29uZmlndXJlLmFj
CmluZGV4IDUzYWQ3ODRkNy4uOGNhN2U4MDY1IDEwMDY0NAotLS0gYS9jb25maWd1cmUuYWMKKysr
IGIvY29uZmlndXJlLmFjCkBAIC00Niw2ICs0Niw3IEBAIEFDX0NIRUNLX0hFQURFUlMoWyBcCiAg
ICAgbGludXgvbWVtcG9saWN5LmggXAogICAgIGxpbnV4L21vZHVsZS5oIFwKICAgICBsaW51eC9u
ZXRsaW5rLmggXAorICAgIGxpbnV4L3R5cGVzLmggXAogICAgIGxpbnV4L3VzZXJmYXVsdGZkLmgg
XAogICAgIG1tLmggXAogICAgIG5ldGluZXQvc2N0cC5oIFwKZGlmZiAtLWdpdCBhL2luY2x1ZGUv
bGFwaS91c3RhdC5oIGIvaW5jbHVkZS9sYXBpL3VzdGF0LmgKaW5kZXggMTJjMDczNTgyLi45ODYz
M2U3NDkgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGFwaS91c3RhdC5oCisrKyBiL2luY2x1ZGUvbGFw
aS91c3RhdC5oCkBAIC05LDkgKzksMTAgQEAKIAogI2lmZGVmIEhBVkVfU1lTX1VTVEFUX0gKICMg
aW5jbHVkZSA8c3lzL3VzdGF0Lmg+Ci0jZWxzZQorI2VsaWYgSEFWRV9MSU5VWF9UWVBFU19ICisj
IGluY2x1ZGUgPGxpbnV4L3R5cGVzLmg+CiBzdHJ1Y3QgdXN0YXQgewotCWRhZGRyX3QgZl90ZnJl
ZTsKKwlfX2tlcm5lbF9kYWRkcl90IGZfdGZyZWU7CiAJaW5vX3QgZl90aW5vZGU7CiAJY2hhciBm
X2ZuYW1lWzZdOwogCWNoYXIgZl9mcGFja1s2XTsKZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJu
ZWwvc3lzY2FsbHMvdXN0YXQvdXN0YXQwMS5jIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy91
c3RhdC91c3RhdDAxLmMKaW5kZXggMmU3ZGNjOWQ3Li4wMjUyODU4YmUgMTAwNjQ0Ci0tLSBhL3Rl
c3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvdXN0YXQvdXN0YXQwMS5jCisrKyBiL3Rlc3RjYXNlcy9r
ZXJuZWwvc3lzY2FsbHMvdXN0YXQvdXN0YXQwMS5jCkBAIC01LDYgKzUsMTAgQEAKICAqIENoZWNr
IHRoYXQgdXN0YXQoKSBzdWNjZWVkcyBnaXZlbiBjb3JyZWN0IHBhcmFtZXRlcnMuCiAgKi8KIAor
I2luY2x1ZGUgImNvbmZpZy5oIgorI2luY2x1ZGUgInRzdF90ZXN0LmgiCisKKyNpZiBkZWZpbmVk
KEhBVkVfU1lTX1VTVEFUX0gpIHx8IGRlZmluZWQoSEFWRV9MSU5VWF9UWVBFU19IKQogI2luY2x1
ZGUgPHVuaXN0ZC5oPgogI2luY2x1ZGUgPGVycm5vLmg+CiAjaW5jbHVkZSA8c3lzL3R5cGVzLmg+
CkBAIC0xMiw3ICsxNiw2IEBACiAKICNpbmNsdWRlICJsYXBpL3N5c2NhbGxzLmgiCiAjaW5jbHVk
ZSAibGFwaS91c3RhdC5oIgotI2luY2x1ZGUgInRzdF90ZXN0LmgiCiAKIHN0YXRpYyBkZXZfdCBk
ZXZfbnVtOwogCkBAIC00MiwzICs0NSw2IEBAIHN0YXRpYyBzdHJ1Y3QgdHN0X3Rlc3QgdGVzdCA9
IHsKIAkudGVzdF9hbGwgPSBydW4sCiAJLnNldHVwID0gc2V0dXAsCiB9OworI2Vsc2UKK1RTVF9U
RVNUX1RDT05GKCJ0ZXN0aW5nIHVzdGF0IHJlcXVpcmVzIDxzeXMvdXN0YXQuaD4gb3IgPGxpbnV4
L3R5cGVzLmg+Iik7CisjZW5kaWYKZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2Fs
bHMvdXN0YXQvdXN0YXQwMi5jIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy91c3RhdC91c3Rh
dDAyLmMKaW5kZXggOWJiZTRmM2Y1Li40YzE3MWY3YjggMTAwNjQ0Ci0tLSBhL3Rlc3RjYXNlcy9r
ZXJuZWwvc3lzY2FsbHMvdXN0YXQvdXN0YXQwMi5jCisrKyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lz
Y2FsbHMvdXN0YXQvdXN0YXQwMi5jCkBAIC02LDYgKzYsMTAgQEAKICAqIGludmFsaWQgZGV2X3Qg
cGFyYW1ldGVyIGFuZCBmb3IgYmFkIGFkZHJlc3MgcGFyYW1hdGVyLgogICovCiAKKyNpbmNsdWRl
ICJjb25maWcuaCIKKyNpbmNsdWRlICJ0c3RfdGVzdC5oIgorCisjaWYgZGVmaW5lZChIQVZFX1NZ
U19VU1RBVF9IKSB8fCBkZWZpbmVkKEhBVkVfTElOVVhfVFlQRVNfSCkKICNpbmNsdWRlIDx1bmlz
dGQuaD4KICNpbmNsdWRlIDxlcnJuby5oPgogI2luY2x1ZGUgPHN5cy9zdGF0Lmg+CkBAIC0xMyw3
ICsxNyw2IEBACiAKICNpbmNsdWRlICJsYXBpL3N5c2NhbGxzLmgiCiAjaW5jbHVkZSAibGFwaS91
c3RhdC5oIgotI2luY2x1ZGUgInRzdF90ZXN0LmgiCiAKIHN0YXRpYyBkZXZfdCBpbnZhbGlkX2Rl
diA9IC0xOwogc3RhdGljIGRldl90IHJvb3RfZGV2OwpAQCAtNjEsMyArNjQsNiBAQCBzdGF0aWMg
c3RydWN0IHRzdF90ZXN0IHRlc3QgPSB7CiAJLnNldHVwID0gc2V0dXAsCiAJLnRjbnQgPSBBUlJB
WV9TSVpFKHRjKSwKIH07CisjZWxzZQorVFNUX1RFU1RfVENPTkYoInRlc3RpbmcgdXN0YXQgcmVx
dWlyZXMgPHN5cy91c3RhdC5oPiBvciA8bGludXgvdHlwZXMuaD4iKTsKKyNlbmRpZgotLSAKMi4y
MC4xCgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3Rp
bmZvL2x0cAo=
