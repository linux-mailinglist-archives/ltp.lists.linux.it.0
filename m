Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9071726D
	for <lists+linux-ltp@lfdr.de>; Wed,  8 May 2019 09:16:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E46CD294AAB
	for <lists+linux-ltp@lfdr.de>; Wed,  8 May 2019 09:16:46 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id DF8EC3EADD1
 for <ltp@lists.linux.it>; Wed,  8 May 2019 09:16:44 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id E710C1002049
 for <ltp@lists.linux.it>; Wed,  8 May 2019 09:16:38 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 74F40AEC6
 for <ltp@lists.linux.it>; Wed,  8 May 2019 07:16:40 +0000 (UTC)
From: Christian Amann <camann@suse.com>
To: ltp@lists.linux.it
Date: Wed,  8 May 2019 09:16:36 +0200
Message-Id: <20190508071636.13804-1-camann@suse.com>
X-Mailer: git-send-email 2.16.4
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v3] crypto/af_alg02: fixed read() being stuck
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
IDxjYW1hbm5Ac3VzZS5jb20+Ci0tLQoKTm90ZXM6CiAgICBIaSBMaSwKICAgIAogICAgPiBXZSBj
b3VsZCBzZXQgTFRQX0FUVFJJQlVURV9VTlVTRUQgYXQgdGhlIGJlaGluZCBvZiB1bnVzZWQgcGFy
YW1ldGVyIHRvIGdldAogICAgPiByaWQgb2YgY29tcGlsaW5nIHdhcm5pbmcKICAgIAogICAgVGhh
dHMgdmVyeSB1c2VmdWwgYnV0IEkgY291bGRuJ3QgZmluZCBpdCBhbnl3aGVyZSBpbiB0aGUgZG9j
dW1lbnRhdGlvbi4KICAgIElNSE8gaXQgc2hvdWxkIGJlIHB1dCBpbiB0aGVyZSwgYmVjYXVzZSBJ
IHN0dW1ibGVkIHVwb24gdGhpcyBwcm9ibGVtCiAgICBhIGNvdXBsZSBvZiB0aW1lcy4KICAgIAog
ICAgQW55d2F5LCBJIGltcGxlbWVudGVkIHlvdXIgc3VnZ2VzdGlvbnMuIEkgaG9wZSBpdCdzIGFu
IGFscmlnaHQgcGF0Y2ggbm93LgogICAgVGhhbmtzIGZvciB5b3VyIGZlZWRiYWNrIQogICAgCiAg
ICBSZWdhcmRzLAogICAgQ2hyaXN0aWFuCgogdGVzdGNhc2VzL2tlcm5lbC9jcnlwdG8vTWFrZWZp
bGUgICB8ICAyICsrCiB0ZXN0Y2FzZXMva2VybmVsL2NyeXB0by9hZl9hbGcwMi5jIHwgMzcgKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLQogMiBmaWxlcyBjaGFuZ2VkLCAzNyBp
bnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJu
ZWwvY3J5cHRvL01ha2VmaWxlIGIvdGVzdGNhc2VzL2tlcm5lbC9jcnlwdG8vTWFrZWZpbGUKaW5k
ZXggNzZmOTMwOGMyLi42NTQ3ZTFjYjYgMTAwNjQ0Ci0tLSBhL3Rlc3RjYXNlcy9rZXJuZWwvY3J5
cHRvL01ha2VmaWxlCisrKyBiL3Rlc3RjYXNlcy9rZXJuZWwvY3J5cHRvL01ha2VmaWxlCkBAIC0y
MCwzICsyMCw1IEBAIGluY2x1ZGUgJCh0b3Bfc3JjZGlyKS9pbmNsdWRlL21rL3Rlc3RjYXNlcy5t
awogQ0ZMQUdTCQkJKz0gLURfR05VX1NPVVJDRQogCiBpbmNsdWRlICQodG9wX3NyY2RpcikvaW5j
bHVkZS9tay9nZW5lcmljX2xlYWZfdGFyZ2V0Lm1rCisKK2FmX2FsZzAyOiBDRkxBR1MgKz0gLXB0
aHJlYWQKZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJuZWwvY3J5cHRvL2FmX2FsZzAyLmMgYi90
ZXN0Y2FzZXMva2VybmVsL2NyeXB0by9hZl9hbGcwMi5jCmluZGV4IGE5ZTgyMDQyMy4uMWM3MjUy
MTJhIDEwMDY0NAotLS0gYS90ZXN0Y2FzZXMva2VybmVsL2NyeXB0by9hZl9hbGcwMi5jCisrKyBi
L3Rlc3RjYXNlcy9rZXJuZWwvY3J5cHRvL2FmX2FsZzAyLmMKQEAgLTcsMjMgKzcsNTYgQEAKICAq
IFJlZ3Jlc3Npb24gdGVzdCBmb3IgY29tbWl0IGVjYWFhYjU2NDk3OCAoImNyeXB0bzogc2Fsc2Ey
MCAtIGZpeAogICogYmxrY2lwaGVyX3dhbGsgQVBJIHVzYWdlIiksIG9yIENWRS0yMDE3LTE3ODA1
LiAgVGhpcyB0ZXN0IHZlcmlmaWVzIHRoYXQgYW4KICAqIGVtcHR5IG1lc3NhZ2UgY2FuIGJlIGVu
Y3J5cHRlZCB3aXRoIFNhbHNhMjAgd2l0aG91dCBjcmFzaGluZyB0aGUga2VybmVsLgorICoKKyAq
IEZpeCBmb3Iga2VybmVscyA8IDQuMTQ6CisgKiBXaXRoIGtlcm5lbHMgbWlzc2luZyBjb21taXQg
MmQ5NzU5MWVmNDNkICgiY3J5cHRvOiBhZl9hbGcgLSBjb25zb2xpZGF0aW9uCisgKiBvZiBkdXBs
aWNhdGUgY29kZSIpIHJlYWQoKSBkb2VzIG5vdCByZXR1cm4gaW4gdGhpcyBzaXR1YXRpb24uIFRo
ZSBjYWxsIGlzCisgKiBub3cgbW92ZWQgdG8gYSBjaGlsZCB0aHJlYWQgaW4gb3JkZXIgdG8gY2Fu
Y2VsIGl0IGluIGNhc2UgcmVhZCgpIHRha2VzIGFuCisgKiB1bnVzdWFsIGxvbmcgYW1vdW50IG9m
IHRpbWUuCiAgKi8KIAogI2luY2x1ZGUgInRzdF90ZXN0LmgiCiAjaW5jbHVkZSAidHN0X2FmX2Fs
Zy5oIgorI2luY2x1ZGUgInRzdF9zYWZlX3B0aHJlYWQuaCIKKyNpbmNsdWRlIDxwdGhyZWFkLmg+
CisjaW5jbHVkZSA8ZXJybm8uaD4KIAotc3RhdGljIHZvaWQgcnVuKHZvaWQpCit2b2lkICp2ZXJp
ZnlfZW5jcnlwdCh2b2lkICphcmcgTFRQX0FUVFJJQlVURV9VTlVTRUQpCiB7CiAJY2hhciBidWZb
MTZdOwogCWludCByZXFmZCA9IHRzdF9hbGdfc2V0dXBfcmVxZmQoInNrY2lwaGVyIiwgInNhbHNh
MjAiLCBOVUxMLCAxNik7CiAKKwlUU1RfQ0hFQ0tQT0lOVF9XQUtFKDApOworCiAJLyogV2l0aCB0
aGUgYnVnIHRoZSBrZXJuZWwgY3Jhc2hlZCBoZXJlICovCiAJaWYgKHJlYWQocmVxZmQsIGJ1Ziwg
MTYpID09IDApCiAJCXRzdF9yZXMoVFBBU1MsICJTdWNjZXNzZnVsbHkgXCJlbmNyeXB0ZWRcIiBh
biBlbXB0eSBtZXNzYWdlIik7CiAJZWxzZQotCQl0c3RfcmVzKFRCUk9LLCAicmVhZCgpIGRpZG4n
dCByZXR1cm4gMCIpOworCQl0c3RfcmVzKFRGQUlMLCAicmVhZCgpIGRpZG4ndCByZXR1cm4gMCIp
OworCXJldHVybiBhcmc7Cit9CisKK3N0YXRpYyB2b2lkIHJ1bih2b2lkKQoreworCXB0aHJlYWRf
dCB0aHI7CisKKwlwdGhyZWFkX3NldGNhbmNlbHN0YXRlKFBUSFJFQURfQ0FOQ0VMX0VOQUJMRSwg
TlVMTCk7CisJU0FGRV9QVEhSRUFEX0NSRUFURSgmdGhyLCBOVUxMLCB2ZXJpZnlfZW5jcnlwdCwg
TlVMTCk7CisKKwlUU1RfQ0hFQ0tQT0lOVF9XQUlUKDApOworCisJd2hpbGUgKHB0aHJlYWRfa2ls
bCh0aHIsIDApICE9IEVTUkNIKSB7CisJCWlmICh0c3RfdGltZW91dF9yZW1haW5pbmcoKSA8PSAx
MCkgeworCQkJcHRocmVhZF9jYW5jZWwodGhyKTsKKwkJCXRzdF9icmsoVEJST0ssCisJCQkJIlRp
bWVkIG91dCB3aGlsZSByZWFkaW5nIGZyb20gcmVxdWVzdCBzb2NrZXQuIik7CisJCX0KKwkJdXNs
ZWVwKDEwMDApOworCX0KIH0KIAogc3RhdGljIHN0cnVjdCB0c3RfdGVzdCB0ZXN0ID0gewogCS50
ZXN0X2FsbCA9IHJ1biwKKwkudGltZW91dCA9IDIwLAorCS5uZWVkc19jaGVja3BvaW50cyA9IDEs
CiB9OwotLSAKMi4xNi40CgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxp
bnV4Lml0L2xpc3RpbmZvL2x0cAo=
