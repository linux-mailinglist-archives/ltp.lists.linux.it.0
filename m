Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B489315DCA
	for <lists+linux-ltp@lfdr.de>; Tue,  7 May 2019 08:55:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6E9063EA370
	for <lists+linux-ltp@lfdr.de>; Tue,  7 May 2019 08:55:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 73C023EA063
 for <ltp@lists.linux.it>; Tue,  7 May 2019 08:55:56 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 0EA611001DA5
 for <ltp@lists.linux.it>; Tue,  7 May 2019 08:55:51 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 340C5AD5E
 for <ltp@lists.linux.it>; Tue,  7 May 2019 06:55:53 +0000 (UTC)
From: Christian Amann <camann@suse.com>
To: ltp@lists.linux.it
Date: Tue,  7 May 2019 08:55:30 +0200
Message-Id: <20190507065530.12174-1-camann@suse.com>
X-Mailer: git-send-email 2.16.4
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v1] crypto/af_alg02: fixed read() being stuck
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

T24ga2VybmVscyA8IDQuMTQgKG1pc3NpbmcgY29tbWl0IDJkOTc1OTFlZjQzZCkgcmVhZGluZyBm
cm9tCnRoZSByZXF1ZXN0IHNvY2tldCBkb2VzIG5vdCByZXR1cm4gYW5kIHRoZSB0ZXN0Y2FzZSBk
b2VzIG5vdApmaW5pc2guCgpUaGlzIGZpeCBtb3ZlcyB0aGUgbG9naWMgdG8gYSBjaGlsZCB0aHJl
YWQgaW4gb3JkZXIgZm9yIHRoZQpwYXJlbnQgdG8gaGFuZGxlIHRoZSB0aW1lb3V0IGFuZCByZXBv
cnQgYSBtZXNzYWdlIHRvIHRoZSB1c2VyLgoKU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEFtYW5u
IDxjYW1hbm5Ac3VzZS5jb20+Ci0tLQogdGVzdGNhc2VzL2tlcm5lbC9jcnlwdG8vTWFrZWZpbGUg
ICB8ICAyICsrCiB0ZXN0Y2FzZXMva2VybmVsL2NyeXB0by9hZl9hbGcwMi5jIHwgMzYgKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKystCiAyIGZpbGVzIGNoYW5nZWQsIDM3IGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS90ZXN0Y2FzZXMva2VybmVsL2Ny
eXB0by9NYWtlZmlsZSBiL3Rlc3RjYXNlcy9rZXJuZWwvY3J5cHRvL01ha2VmaWxlCmluZGV4IDc2
ZjkzMDhjMi4uNjU0N2UxY2I2IDEwMDY0NAotLS0gYS90ZXN0Y2FzZXMva2VybmVsL2NyeXB0by9N
YWtlZmlsZQorKysgYi90ZXN0Y2FzZXMva2VybmVsL2NyeXB0by9NYWtlZmlsZQpAQCAtMjAsMyAr
MjAsNSBAQCBpbmNsdWRlICQodG9wX3NyY2RpcikvaW5jbHVkZS9tay90ZXN0Y2FzZXMubWsKIENG
TEFHUwkJCSs9IC1EX0dOVV9TT1VSQ0UKIAogaW5jbHVkZSAkKHRvcF9zcmNkaXIpL2luY2x1ZGUv
bWsvZ2VuZXJpY19sZWFmX3RhcmdldC5taworCithZl9hbGcwMjogQ0ZMQUdTICs9IC1wdGhyZWFk
CmRpZmYgLS1naXQgYS90ZXN0Y2FzZXMva2VybmVsL2NyeXB0by9hZl9hbGcwMi5jIGIvdGVzdGNh
c2VzL2tlcm5lbC9jcnlwdG8vYWZfYWxnMDIuYwppbmRleCBhOWU4MjA0MjMuLjA1NjUxMTk5MyAx
MDA2NDQKLS0tIGEvdGVzdGNhc2VzL2tlcm5lbC9jcnlwdG8vYWZfYWxnMDIuYworKysgYi90ZXN0
Y2FzZXMva2VybmVsL2NyeXB0by9hZl9hbGcwMi5jCkBAIC03LDEyICs3LDIzIEBACiAgKiBSZWdy
ZXNzaW9uIHRlc3QgZm9yIGNvbW1pdCBlY2FhYWI1NjQ5NzggKCJjcnlwdG86IHNhbHNhMjAgLSBm
aXgKICAqIGJsa2NpcGhlcl93YWxrIEFQSSB1c2FnZSIpLCBvciBDVkUtMjAxNy0xNzgwNS4gIFRo
aXMgdGVzdCB2ZXJpZmllcyB0aGF0IGFuCiAgKiBlbXB0eSBtZXNzYWdlIGNhbiBiZSBlbmNyeXB0
ZWQgd2l0aCBTYWxzYTIwIHdpdGhvdXQgY3Jhc2hpbmcgdGhlIGtlcm5lbC4KKyAqCisgKiByZWFk
KCkgZml4OgorICogQ2FsbHMgcmVhZCgpIGluIGNoaWxkIHRocmVhZCBpbiBvcmRlciB0byBtYW51
YWxseSBraWxsIGl0IGFmdGVyIHRpbWVvdXQuCisgKiBXaXRoIGtlcm5lbHMgbWlzc2luZyBjb21t
aXQgMmQ5NzU5MWVmNDNkICgiY3J5cHRvOiBhZl9hbGcgLSBjb25zb2xpZGF0aW9uCisgKiBvZiBk
dXBsaWNhdGUgY29kZSIpIHJlYWQoKSBkb2VzIG5vdCByZXR1cm4uCiAgKi8KIAogI2luY2x1ZGUg
InRzdF90ZXN0LmgiCiAjaW5jbHVkZSAidHN0X2FmX2FsZy5oIgorI2luY2x1ZGUgInRzdF9zYWZl
X3B0aHJlYWQuaCIKKyNpbmNsdWRlIDxwdGhyZWFkLmg+CisjaW5jbHVkZSA8dGltZS5oPgorI2lu
Y2x1ZGUgPGVycm5vLmg+CiAKLXN0YXRpYyB2b2lkIHJ1bih2b2lkKQorI2RlZmluZSBWRVJJRllf
VElNRU9VVCAodGltZShOVUxMKSArIDUpCisKK3ZvaWQgKnZlcmlmeV9lbmNyeXB0KHZvaWQgKmFy
ZykKIHsKIAljaGFyIGJ1ZlsxNl07CiAJaW50IHJlcWZkID0gdHN0X2FsZ19zZXR1cF9yZXFmZCgi
c2tjaXBoZXIiLCAic2Fsc2EyMCIsIE5VTEwsIDE2KTsKQEAgLTIyLDYgKzMzLDI5IEBAIHN0YXRp
YyB2b2lkIHJ1bih2b2lkKQogCQl0c3RfcmVzKFRQQVNTLCAiU3VjY2Vzc2Z1bGx5IFwiZW5jcnlw
dGVkXCIgYW4gZW1wdHkgbWVzc2FnZSIpOwogCWVsc2UKIAkJdHN0X3JlcyhUQlJPSywgInJlYWQo
KSBkaWRuJ3QgcmV0dXJuIDAiKTsKKwlyZXR1cm4gYXJnOworfQorCitzdGF0aWMgdm9pZCBydW4o
dm9pZCkKK3sKKwlwdGhyZWFkX3QgdGhyOworCWludCBqb2luX3JldDsKKwlzdHJ1Y3QgdGltZXNw
ZWMgcmVhZF90aW1lb3V0OworCisJcmVhZF90aW1lb3V0LnR2X3NlYyAgPSBWRVJJRllfVElNRU9V
VDsKKwlyZWFkX3RpbWVvdXQudHZfbnNlYyA9IDA7CisKKwlTQUZFX1BUSFJFQURfQ1JFQVRFKCZ0
aHIsIE5VTEwsIHZlcmlmeV9lbmNyeXB0LCBOVUxMKTsKKwlqb2luX3JldCA9IHB0aHJlYWRfdGlt
ZWRqb2luX25wKHRociwgTlVMTCwgJnJlYWRfdGltZW91dCk7CisKKwlpZiAoam9pbl9yZXQgIT0g
MCkgeworCQlpZiAoam9pbl9yZXQgPT0gRVRJTUVET1VUKQorCQkJdHN0X2JyayhUQlJPSywKKwkJ
CQkiVGltZWQgb3V0IHdoaWxlIHJlYWRpbmcgZnJvbSByZXF1ZXN0IHNvY2tldC4iKTsKKwkJZWxz
ZQorCQkJdHN0X2JyayhUQlJPSyB8IFRURVJSTk8sCisJCQkJIkVycm9yIHdoaWxlIGpvaW5pbmcg
Y2hpbGQgdGhyZWFkIik7CisJfQogfQogCiBzdGF0aWMgc3RydWN0IHRzdF90ZXN0IHRlc3QgPSB7
Ci0tIAoyLjE2LjQKCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXgu
aXQvbGlzdGluZm8vbHRwCg==
