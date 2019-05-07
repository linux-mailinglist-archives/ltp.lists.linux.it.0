Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 00BC3162F3
	for <lists+linux-ltp@lfdr.de>; Tue,  7 May 2019 13:38:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B892C3EA36B
	for <lists+linux-ltp@lfdr.de>; Tue,  7 May 2019 13:38:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id E21EB3EA03A
 for <ltp@lists.linux.it>; Tue,  7 May 2019 13:38:16 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 9A9526023E4
 for <ltp@lists.linux.it>; Tue,  7 May 2019 13:38:15 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 86867AEAC
 for <ltp@lists.linux.it>; Tue,  7 May 2019 11:38:14 +0000 (UTC)
From: Christian Amann <camann@suse.com>
To: ltp@lists.linux.it
Date: Tue,  7 May 2019 13:38:09 +0200
Message-Id: <20190507113809.25890-1-camann@suse.com>
X-Mailer: git-send-email 2.16.4
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v2] crypto/af_alg02: fixed read() being stuck
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
ICB8ICAyICsrCiB0ZXN0Y2FzZXMva2VybmVsL2NyeXB0by9hZl9hbGcwMi5jIHwgMjkgKysrKysr
KysrKysrKysrKysrKysrKysrKysrKy0KIDIgZmlsZXMgY2hhbmdlZCwgMzAgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJuZWwvY3J5cHRvL01h
a2VmaWxlIGIvdGVzdGNhc2VzL2tlcm5lbC9jcnlwdG8vTWFrZWZpbGUKaW5kZXggNzZmOTMwOGMy
Li42NTQ3ZTFjYjYgMTAwNjQ0Ci0tLSBhL3Rlc3RjYXNlcy9rZXJuZWwvY3J5cHRvL01ha2VmaWxl
CisrKyBiL3Rlc3RjYXNlcy9rZXJuZWwvY3J5cHRvL01ha2VmaWxlCkBAIC0yMCwzICsyMCw1IEBA
IGluY2x1ZGUgJCh0b3Bfc3JjZGlyKS9pbmNsdWRlL21rL3Rlc3RjYXNlcy5tawogQ0ZMQUdTCQkJ
Kz0gLURfR05VX1NPVVJDRQogCiBpbmNsdWRlICQodG9wX3NyY2RpcikvaW5jbHVkZS9tay9nZW5l
cmljX2xlYWZfdGFyZ2V0Lm1rCisKK2FmX2FsZzAyOiBDRkxBR1MgKz0gLXB0aHJlYWQKZGlmZiAt
LWdpdCBhL3Rlc3RjYXNlcy9rZXJuZWwvY3J5cHRvL2FmX2FsZzAyLmMgYi90ZXN0Y2FzZXMva2Vy
bmVsL2NyeXB0by9hZl9hbGcwMi5jCmluZGV4IGE5ZTgyMDQyMy4uN2Y4YzgxYjY2IDEwMDY0NAot
LS0gYS90ZXN0Y2FzZXMva2VybmVsL2NyeXB0by9hZl9hbGcwMi5jCisrKyBiL3Rlc3RjYXNlcy9r
ZXJuZWwvY3J5cHRvL2FmX2FsZzAyLmMKQEAgLTcsMTIgKzcsMjAgQEAKICAqIFJlZ3Jlc3Npb24g
dGVzdCBmb3IgY29tbWl0IGVjYWFhYjU2NDk3OCAoImNyeXB0bzogc2Fsc2EyMCAtIGZpeAogICog
YmxrY2lwaGVyX3dhbGsgQVBJIHVzYWdlIiksIG9yIENWRS0yMDE3LTE3ODA1LiAgVGhpcyB0ZXN0
IHZlcmlmaWVzIHRoYXQgYW4KICAqIGVtcHR5IG1lc3NhZ2UgY2FuIGJlIGVuY3J5cHRlZCB3aXRo
IFNhbHNhMjAgd2l0aG91dCBjcmFzaGluZyB0aGUga2VybmVsLgorICoKKyAqIHJlYWQoKSBmaXg6
CisgKiBDYWxscyByZWFkKCkgaW4gY2hpbGQgdGhyZWFkIGluIG9yZGVyIHRvIG1hbnVhbGx5IGtp
bGwgaXQgYWZ0ZXIgYSB0aW1lb3V0LgorICogV2l0aCBrZXJuZWxzIG1pc3NpbmcgY29tbWl0IDJk
OTc1OTFlZjQzZCAoImNyeXB0bzogYWZfYWxnIC0gY29uc29saWRhdGlvbgorICogb2YgZHVwbGlj
YXRlIGNvZGUiKSByZWFkKCkgZG9lcyBub3QgcmV0dXJuLgogICovCiAKICNpbmNsdWRlICJ0c3Rf
dGVzdC5oIgogI2luY2x1ZGUgInRzdF9hZl9hbGcuaCIKKyNpbmNsdWRlICJ0c3Rfc2FmZV9wdGhy
ZWFkLmgiCisjaW5jbHVkZSA8cHRocmVhZC5oPgorI2luY2x1ZGUgPGVycm5vLmg+CiAKLXN0YXRp
YyB2b2lkIHJ1bih2b2lkKQordm9pZCAqdmVyaWZ5X2VuY3J5cHQodm9pZCAqYXJnKQogewogCWNo
YXIgYnVmWzE2XTsKIAlpbnQgcmVxZmQgPSB0c3RfYWxnX3NldHVwX3JlcWZkKCJza2NpcGhlciIs
ICJzYWxzYTIwIiwgTlVMTCwgMTYpOwpAQCAtMjIsOCArMzAsMjcgQEAgc3RhdGljIHZvaWQgcnVu
KHZvaWQpCiAJCXRzdF9yZXMoVFBBU1MsICJTdWNjZXNzZnVsbHkgXCJlbmNyeXB0ZWRcIiBhbiBl
bXB0eSBtZXNzYWdlIik7CiAJZWxzZQogCQl0c3RfcmVzKFRCUk9LLCAicmVhZCgpIGRpZG4ndCBy
ZXR1cm4gMCIpOworCXJldHVybiBhcmc7Cit9CisKK3N0YXRpYyB2b2lkIHJ1bih2b2lkKQorewor
CXB0aHJlYWRfdCB0aHI7CisKKwlwdGhyZWFkX3NldGNhbmNlbHN0YXRlKFBUSFJFQURfQ0FOQ0VM
X0VOQUJMRSwgTlVMTCk7CisJU0FGRV9QVEhSRUFEX0NSRUFURSgmdGhyLCBOVUxMLCB2ZXJpZnlf
ZW5jcnlwdCwgTlVMTCk7CisKKwl3aGlsZSAocHRocmVhZF9raWxsKHRociwgMCkgIT0gRVNSQ0gp
IHsKKwkJaWYgKHRzdF90aW1lb3V0X3JlbWFpbmluZygpIDw9IDEwKSB7CisJCQlwdGhyZWFkX2Nh
bmNlbCh0aHIpOworCQkJdHN0X2JyayhUQlJPSywKKwkJCQkiVGltZWQgb3V0IHdoaWxlIHJlYWRp
bmcgZnJvbSByZXF1ZXN0IHNvY2tldC4iKTsKKwkJfQorCQl1c2xlZXAoMTAwMCk7CisJfQogfQog
CiBzdGF0aWMgc3RydWN0IHRzdF90ZXN0IHRlc3QgPSB7CiAJLnRlc3RfYWxsID0gcnVuLAorCS50
aW1lb3V0ID0gMjAsCiB9OwotLSAKMi4xNi40CgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRw
czovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
