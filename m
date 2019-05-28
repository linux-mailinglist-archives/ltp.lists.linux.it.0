Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9582BE62
	for <lists+linux-ltp@lfdr.de>; Tue, 28 May 2019 06:40:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B063A3EA503
	for <lists+linux-ltp@lfdr.de>; Tue, 28 May 2019 06:40:23 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id F3E5C3EA51C
 for <ltp@lists.linux.it>; Tue, 28 May 2019 06:40:06 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 179032011BC
 for <ltp@lists.linux.it>; Tue, 28 May 2019 06:40:05 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8081F3086224;
 Tue, 28 May 2019 04:40:04 +0000 (UTC)
Received: from localhost (dhcp-12-130.nay.redhat.com [10.66.12.130])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 214511820E;
 Tue, 28 May 2019 04:40:02 +0000 (UTC)
From: Murphy Zhou <xzhou@redhat.com>
To: chrubis@suse.cz
Date: Tue, 28 May 2019 12:39:28 +0800
Message-Id: <20190528043929.19671-3-xzhou@redhat.com>
In-Reply-To: <20190528043929.19671-1-xzhou@redhat.com>
References: <20190523135518.GF30616@rei.lan>
 <20190528043929.19671-1-xzhou@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Tue, 28 May 2019 04:40:04 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: [LTP] [PATCH v5 3/4] syscalls/swapon/swapon0{1..3}: use helper to
	check support status
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

T2Ygc3dhcCBvcGVyYXRpb25zLgoKU2lnbmVkLW9mZi1ieTogTXVycGh5IFpob3UgPHh6aG91QHJl
ZGhhdC5jb20+Ci0tLQogdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9zd2Fwb24vc3dhcG9uMDEu
YyB8ICA5ICstLS0tLS0tLQogdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9zd2Fwb24vc3dhcG9u
MDIuYyB8ICA5ICstLS0tLS0tLQogdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9zd2Fwb24vc3dh
cG9uMDMuYyB8IDExICsrLS0tLS0tLS0tCiAzIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygr
KSwgMjUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxs
cy9zd2Fwb24vc3dhcG9uMDEuYyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvc3dhcG9uL3N3
YXBvbjAxLmMKaW5kZXggMzI1MzhmODJiLi4wODJhMjFmNzIgMTAwNjQ0Ci0tLSBhL3Rlc3RjYXNl
cy9rZXJuZWwvc3lzY2FsbHMvc3dhcG9uL3N3YXBvbjAxLmMKKysrIGIvdGVzdGNhc2VzL2tlcm5l
bC9zeXNjYWxscy9zd2Fwb24vc3dhcG9uMDEuYwpAQCAtODQsMTQgKzg0LDcgQEAgc3RhdGljIHZv
aWQgc2V0dXAodm9pZCkKIAogCXRzdF90bXBkaXIoKTsKIAotCXN3aXRjaCAoKGZzX3R5cGUgPSB0
c3RfZnNfdHlwZShjbGVhbnVwLCAiLiIpKSkgewotCWNhc2UgVFNUX05GU19NQUdJQzoKLQljYXNl
IFRTVF9UTVBGU19NQUdJQzoKLQkJdHN0X2Jya20oVENPTkYsIGNsZWFudXAsCi0JCQkgIkNhbm5v
dCBkbyBzd2Fwb24gb24gYSBmaWxlIG9uICVzIGZpbGVzeXN0ZW0iLAotCQkJIHRzdF9mc190eXBl
X25hbWUoZnNfdHlwZSkpOwotCWJyZWFrOwotCX0KKwlpc19zd2FwX3N1cHBvcnRlZChjbGVhbnVw
LCAic3dhcG9uIiwgIi4vdHN0c3dhcCIpOwogCiAJbWFrZV9zd2FwZmlsZShjbGVhbnVwLCAic3dh
cGZpbGUwMSIpOwogfQpkaWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9zd2Fw
b24vc3dhcG9uMDIuYyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvc3dhcG9uL3N3YXBvbjAy
LmMKaW5kZXggNGFmNTEwNWM2Li4xNGJmNDkwNWQgMTAwNjQ0Ci0tLSBhL3Rlc3RjYXNlcy9rZXJu
ZWwvc3lzY2FsbHMvc3dhcG9uL3N3YXBvbjAyLmMKKysrIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNj
YWxscy9zd2Fwb24vc3dhcG9uMDIuYwpAQCAtMTMyLDE0ICsxMzIsNyBAQCBzdGF0aWMgdm9pZCBz
ZXR1cCh2b2lkKQogCiAJdHN0X3RtcGRpcigpOwogCi0Jc3dpdGNoICgoZnNfdHlwZSA9IHRzdF9m
c190eXBlKGNsZWFudXAsICIuIikpKSB7Ci0JY2FzZSBUU1RfTkZTX01BR0lDOgotCWNhc2UgVFNU
X1RNUEZTX01BR0lDOgotCQl0c3RfYnJrbShUQ09ORiwgY2xlYW51cCwKLQkJCSAiQ2Fubm90IGRv
IHN3YXBvbiBvbiBhIGZpbGUgb24gJXMgZmlsZXN5c3RlbSIsCi0JCQkgdHN0X2ZzX3R5cGVfbmFt
ZShmc190eXBlKSk7Ci0JYnJlYWs7Ci0JfQorCWlzX3N3YXBfc3VwcG9ydGVkKGNsZWFudXAsICJz
d2Fwb24iLCAiLi90c3Rzd2FwIik7CiAKIAlTQUZFX1RPVUNIKGNsZWFudXAsICJub3Rzd2FwIiwg
MDc3NywgTlVMTCk7CiAJbWFrZV9zd2FwZmlsZShjbGVhbnVwLCAic3dhcGZpbGUwMSIpOwpkaWZm
IC0tZ2l0IGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9zd2Fwb24vc3dhcG9uMDMuYyBiL3Rl
c3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvc3dhcG9uL3N3YXBvbjAzLmMKaW5kZXggOTU1YWMyNDdi
Li42MmU2N2Q2NzcgMTAwNjQ0Ci0tLSBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvc3dhcG9u
L3N3YXBvbjAzLmMKKysrIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9zd2Fwb24vc3dhcG9u
MDMuYwpAQCAtMTUzLDcgKzE1Myw3IEBAIHN0YXRpYyBpbnQgc2V0dXBfc3dhcCh2b2lkKQogCWlu
dCBqLCBmZDsKIAlpbnQgc3RhdHVzOwogCWludCByZXMgPSAwOwotCWNoYXIgZmlsZW5hbWVbMTVd
OworCWNoYXIgZmlsZW5hbWVbRklMRU5BTUVfTUFYXTsKIAljaGFyIGJ1ZltCVUZTSVogKyAxXTsK
IAogCS8qIEZpbmQgb3V0IGhvdyBtYW55IHN3YXBmaWxlcyAoMSBsaW5lIHBlciBlbnRyeSkgYWxy
ZWFkeSBleGlzdCAqLwpAQCAtMzMzLDE0ICszMzMsNyBAQCBzdGF0aWMgdm9pZCBzZXR1cCh2b2lk
KQogCiAJdHN0X3RtcGRpcigpOwogCi0Jc3dpdGNoICgoZnNfdHlwZSA9IHRzdF9mc190eXBlKGNs
ZWFudXAsICIuIikpKSB7Ci0JY2FzZSBUU1RfTkZTX01BR0lDOgotCWNhc2UgVFNUX1RNUEZTX01B
R0lDOgotCQl0c3RfYnJrbShUQ09ORiwgY2xlYW51cCwKLQkJCSAiQ2Fubm90IGRvIHN3YXBvbiBv
biBhIGZpbGUgb24gJXMgZmlsZXN5c3RlbSIsCi0JCQkgdHN0X2ZzX3R5cGVfbmFtZShmc190eXBl
KSk7Ci0JYnJlYWs7Ci0JfQorCWlzX3N3YXBfc3VwcG9ydGVkKGNsZWFudXAsICJzd2Fwb24iLCAi
Li90c3Rzd2FwIik7CiAKIAlURVNUX1BBVVNFOwogfQotLSAKMi4yMS4wCgoKLS0gCk1haWxpbmcg
bGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
