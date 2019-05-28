Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 624542C869
	for <lists+linux-ltp@lfdr.de>; Tue, 28 May 2019 16:13:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3D3A0294AD4
	for <lists+linux-ltp@lfdr.de>; Tue, 28 May 2019 16:13:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 655CD294AE6
 for <ltp@lists.linux.it>; Tue, 28 May 2019 16:13:03 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id BFED61A00CBC
 for <ltp@lists.linux.it>; Tue, 28 May 2019 16:13:02 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1D57BA3EA8;
 Tue, 28 May 2019 14:13:01 +0000 (UTC)
Received: from localhost (dhcp-12-130.nay.redhat.com [10.66.12.130])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 192CA7C58B;
 Tue, 28 May 2019 14:12:56 +0000 (UTC)
From: Murphy Zhou <xzhou@redhat.com>
To: amir73il@gmail.com
Date: Tue, 28 May 2019 22:12:13 +0800
Message-Id: <20190528141214.18752-3-xzhou@redhat.com>
In-Reply-To: <20190528141214.18752-1-xzhou@redhat.com>
References: <CAOQ4uxihom9Uw66c0BwuiWHOejZXDJHUe3rHBVRfk0=C-AYnAw@mail.gmail.com>
 <20190528141214.18752-1-xzhou@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Tue, 28 May 2019 14:13:01 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: [LTP] [PATCH v6 3/4] syscalls/swapon/swapon0{1..3}: use helper to
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
YyB8IDExICsrLS0tLS0tLS0tCiB0ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3N3YXBvbi9zd2Fw
b24wMi5jIHwgMTMgKysrLS0tLS0tLS0tLQogdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9zd2Fw
b24vc3dhcG9uMDMuYyB8IDE1ICsrKystLS0tLS0tLS0tLQogMyBmaWxlcyBjaGFuZ2VkLCA5IGlu
c2VydGlvbnMoKyksIDMwIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJu
ZWwvc3lzY2FsbHMvc3dhcG9uL3N3YXBvbjAxLmMgYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxz
L3N3YXBvbi9zd2Fwb24wMS5jCmluZGV4IDMyNTM4ZjgyYi4uZjk1Y2UwYWIyIDEwMDY0NAotLS0g
YS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3N3YXBvbi9zd2Fwb24wMS5jCisrKyBiL3Rlc3Rj
YXNlcy9rZXJuZWwvc3lzY2FsbHMvc3dhcG9uL3N3YXBvbjAxLmMKQEAgLTg0LDE2ICs4NCw5IEBA
IHN0YXRpYyB2b2lkIHNldHVwKHZvaWQpCiAKIAl0c3RfdG1wZGlyKCk7CiAKLQlzd2l0Y2ggKChm
c190eXBlID0gdHN0X2ZzX3R5cGUoY2xlYW51cCwgIi4iKSkpIHsKLQljYXNlIFRTVF9ORlNfTUFH
SUM6Ci0JY2FzZSBUU1RfVE1QRlNfTUFHSUM6Ci0JCXRzdF9icmttKFRDT05GLCBjbGVhbnVwLAot
CQkJICJDYW5ub3QgZG8gc3dhcG9uIG9uIGEgZmlsZSBvbiAlcyBmaWxlc3lzdGVtIiwKLQkJCSB0
c3RfZnNfdHlwZV9uYW1lKGZzX3R5cGUpKTsKLQlicmVhazsKLQl9CisJaXNfc3dhcF9zdXBwb3J0
ZWQoY2xlYW51cCwgIi4vdHN0c3dhcCIpOwogCi0JbWFrZV9zd2FwZmlsZShjbGVhbnVwLCAic3dh
cGZpbGUwMSIpOworCW1ha2Vfc3dhcGZpbGUoY2xlYW51cCwgInN3YXBmaWxlMDEiLCAwKTsKIH0K
IAogc3RhdGljIHZvaWQgY2xlYW51cCh2b2lkKQpkaWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2tlcm5l
bC9zeXNjYWxscy9zd2Fwb24vc3dhcG9uMDIuYyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMv
c3dhcG9uL3N3YXBvbjAyLmMKaW5kZXggNGFmNTEwNWM2Li4zZDQ5ZDBjNmIgMTAwNjQ0Ci0tLSBh
L3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvc3dhcG9uL3N3YXBvbjAyLmMKKysrIGIvdGVzdGNh
c2VzL2tlcm5lbC9zeXNjYWxscy9zd2Fwb24vc3dhcG9uMDIuYwpAQCAtMTMyLDE4ICsxMzIsMTEg
QEAgc3RhdGljIHZvaWQgc2V0dXAodm9pZCkKIAogCXRzdF90bXBkaXIoKTsKIAotCXN3aXRjaCAo
KGZzX3R5cGUgPSB0c3RfZnNfdHlwZShjbGVhbnVwLCAiLiIpKSkgewotCWNhc2UgVFNUX05GU19N
QUdJQzoKLQljYXNlIFRTVF9UTVBGU19NQUdJQzoKLQkJdHN0X2Jya20oVENPTkYsIGNsZWFudXAs
Ci0JCQkgIkNhbm5vdCBkbyBzd2Fwb24gb24gYSBmaWxlIG9uICVzIGZpbGVzeXN0ZW0iLAotCQkJ
IHRzdF9mc190eXBlX25hbWUoZnNfdHlwZSkpOwotCWJyZWFrOwotCX0KKwlpc19zd2FwX3N1cHBv
cnRlZChjbGVhbnVwLCAiLi90c3Rzd2FwIik7CiAKIAlTQUZFX1RPVUNIKGNsZWFudXAsICJub3Rz
d2FwIiwgMDc3NywgTlVMTCk7Ci0JbWFrZV9zd2FwZmlsZShjbGVhbnVwLCAic3dhcGZpbGUwMSIp
OwotCW1ha2Vfc3dhcGZpbGUoY2xlYW51cCwgImFscmVhZHl1c2VkIik7CisJbWFrZV9zd2FwZmls
ZShjbGVhbnVwLCAic3dhcGZpbGUwMSIsIDApOworCW1ha2Vfc3dhcGZpbGUoY2xlYW51cCwgImFs
cmVhZHl1c2VkIiwgMCk7CiAKIAlpZiAobHRwX3N5c2NhbGwoX19OUl9zd2Fwb24sICJhbHJlYWR5
dXNlZCIsIDApKSB7CiAJCWlmIChmc190eXBlICE9IFRTVF9CVFJGU19NQUdJQyB8fCBlcnJubyAh
PSBFSU5WQUwpCmRpZmYgLS1naXQgYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3N3YXBvbi9z
d2Fwb24wMy5jIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9zd2Fwb24vc3dhcG9uMDMuYwpp
bmRleCA5NTVhYzI0N2IuLmNlZjU3MTUwYyAxMDA2NDQKLS0tIGEvdGVzdGNhc2VzL2tlcm5lbC9z
eXNjYWxscy9zd2Fwb24vc3dhcG9uMDMuYworKysgYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxz
L3N3YXBvbi9zd2Fwb24wMy5jCkBAIC0xNTMsNyArMTUzLDcgQEAgc3RhdGljIGludCBzZXR1cF9z
d2FwKHZvaWQpCiAJaW50IGosIGZkOwogCWludCBzdGF0dXM7CiAJaW50IHJlcyA9IDA7Ci0JY2hh
ciBmaWxlbmFtZVsxNV07CisJY2hhciBmaWxlbmFtZVtGSUxFTkFNRV9NQVhdOwogCWNoYXIgYnVm
W0JVRlNJWiArIDFdOwogCiAJLyogRmluZCBvdXQgaG93IG1hbnkgc3dhcGZpbGVzICgxIGxpbmUg
cGVyIGVudHJ5KSBhbHJlYWR5IGV4aXN0ICovCkBAIC0yMTAsNyArMjEwLDcgQEAgc3RhdGljIGlu
dCBzZXR1cF9zd2FwKHZvaWQpCiAJCQl9CiAKIAkJCS8qIENyZWF0ZSB0aGUgc3dhcGZpbGUgKi8K
LQkJCW1ha2Vfc3dhcGZpbGUoY2xlYW51cCwgZmlsZW5hbWUpOworCQkJbWFrZV9zd2FwZmlsZShj
bGVhbnVwLCBmaWxlbmFtZSwgMCk7CiAKIAkJCS8qIHR1cm4gb24gdGhlIHN3YXAgZmlsZSAqLwog
CQkJcmVzID0gbHRwX3N5c2NhbGwoX19OUl9zd2Fwb24sIGZpbGVuYW1lLCAwKTsKQEAgLTI0Niw3
ICsyNDYsNyBAQCBzdGF0aWMgaW50IHNldHVwX3N3YXAodm9pZCkKIAogCS8qIENyZWF0ZSBhbGwg
bmVlZGVkIGV4dHJhIHN3YXBmaWxlcyBmb3IgdGVzdGluZyAqLwogCWZvciAoaiA9IDA7IGogPCB0
ZXN0ZmlsZXM7IGorKykKLQkJbWFrZV9zd2FwZmlsZShjbGVhbnVwLCBzd2FwX3Rlc3RmaWxlc1tq
XS5maWxlbmFtZSk7CisJCW1ha2Vfc3dhcGZpbGUoY2xlYW51cCwgc3dhcF90ZXN0ZmlsZXNbal0u
ZmlsZW5hbWUsIDApOwogCiAJcmV0dXJuIDA7CiAKQEAgLTMzMywxNCArMzMzLDcgQEAgc3RhdGlj
IHZvaWQgc2V0dXAodm9pZCkKIAogCXRzdF90bXBkaXIoKTsKIAotCXN3aXRjaCAoKGZzX3R5cGUg
PSB0c3RfZnNfdHlwZShjbGVhbnVwLCAiLiIpKSkgewotCWNhc2UgVFNUX05GU19NQUdJQzoKLQlj
YXNlIFRTVF9UTVBGU19NQUdJQzoKLQkJdHN0X2Jya20oVENPTkYsIGNsZWFudXAsCi0JCQkgIkNh
bm5vdCBkbyBzd2Fwb24gb24gYSBmaWxlIG9uICVzIGZpbGVzeXN0ZW0iLAotCQkJIHRzdF9mc190
eXBlX25hbWUoZnNfdHlwZSkpOwotCWJyZWFrOwotCX0KKwlpc19zd2FwX3N1cHBvcnRlZChjbGVh
bnVwLCAiLi90c3Rzd2FwIik7CiAKIAlURVNUX1BBVVNFOwogfQotLSAKMi4yMS4wCgoKLS0gCk1h
aWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
