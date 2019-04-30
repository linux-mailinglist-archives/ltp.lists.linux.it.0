Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E9755F133
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Apr 2019 09:21:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B37BB3EACAB
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Apr 2019 09:21:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 2CC0C3EACA0
 for <ltp@lists.linux.it>; Tue, 30 Apr 2019 09:21:50 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id B6E9A14016B1
 for <ltp@lists.linux.it>; Tue, 30 Apr 2019 09:21:49 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C9C0930ADBAA;
 Tue, 30 Apr 2019 07:15:00 +0000 (UTC)
Received: from localhost (dhcp-12-130.nay.redhat.com [10.66.12.130])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C5C626E70E;
 Tue, 30 Apr 2019 07:14:58 +0000 (UTC)
From: Murphy Zhou <xzhou@redhat.com>
To: ltp@lists.linux.it
Date: Tue, 30 Apr 2019 15:14:46 +0800
Message-Id: <20190430071446.13716-1-xzhou@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Tue, 30 Apr 2019 07:15:00 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/swapon02: Do not fail on overlayfs
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

Q3VycmVudGx5IHN3YXBmaWxlcyBvbiBPdmVybGF5ZnMgYXJlIG5vdCBzdXBwb3J0ZWQuCgpTbyBp
ZiB3ZSBhcmUgb24gb3ZlcmxheWZzIGFuZCB3ZSBnZXQgRUlOVkFMIGZyb20gc3dhcG9uKCkgd2Ug
cmV0dXJuIFRDT05GLgoKU2lnbmVkLW9mZi1ieTogTXVycGh5IFpob3UgPHh6aG91QHJlZGhhdC5j
b20+Ci0tLQogdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9zd2Fwb24vc3dhcG9uMDIuYyB8IDUg
KysrKysKIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS90ZXN0
Y2FzZXMva2VybmVsL3N5c2NhbGxzL3N3YXBvbi9zd2Fwb24wMi5jIGIvdGVzdGNhc2VzL2tlcm5l
bC9zeXNjYWxscy9zd2Fwb24vc3dhcG9uMDIuYwppbmRleCA0YWY1MTA1YzYuLjIxMWNkZmM0ZSAx
MDA2NDQKLS0tIGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9zd2Fwb24vc3dhcG9uMDIuYwor
KysgYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3N3YXBvbi9zd2Fwb24wMi5jCkBAIC04Niw2
ICs4NiwxMSBAQCBzdGF0aWMgdm9pZCB2ZXJpZnlfc3dhcG9uKHN0cnVjdCB0ZXN0X2Nhc2VfdCAq
dGVzdCkKIAkJCXJldHVybjsKIAl9CiAKKwlpZiAoZnNfdHlwZSA9PSBUU1RfT1ZFUkxBWUZTX01B
R0lDICYmIGVycm5vID09IEVJTlZBTCkgeworCQl0c3RfcmVzbShUQ09ORiwgIlN3YXBmaWxlIG9u
IG92ZXJsYXlmcyBub3QgaW1wbGVtZXRlZCIpOworCQkJcmV0dXJuOworCX0KKwogCXRzdF9yZXNt
KFRGQUlMLCAic3dhcG9uKDIpIGZhaWxlZCB0byBwcm9kdWNlIGV4cGVjdGVkIGVycm9yOiIKIAkg
ICAgICAgICAiICVkLCBlcnJubzogJXMgYW5kIGdvdCAlZC4iLCB0ZXN0LT5leHBfZXJybm8sCiAJ
ICAgICAgICAgdGVzdC0+ZXhwX2VycnZhbCwgVEVTVF9FUlJOTyk7Ci0tIAoyLjIxLjAKCgotLSAK
TWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
