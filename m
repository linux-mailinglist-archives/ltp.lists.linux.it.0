Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4072FA38
	for <lists+linux-ltp@lfdr.de>; Thu, 30 May 2019 12:23:56 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DDA9B3EA6CA
	for <lists+linux-ltp@lfdr.de>; Thu, 30 May 2019 12:23:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id EA6D73EA166
 for <ltp@lists.linux.it>; Thu, 30 May 2019 12:23:52 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 85A526012CD
 for <ltp@lists.linux.it>; Thu, 30 May 2019 12:23:52 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1BE0430C4F49;
 Thu, 30 May 2019 10:23:51 +0000 (UTC)
Received: from localhost (dhcp-12-130.nay.redhat.com [10.66.12.130])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B33465F9BA;
 Thu, 30 May 2019 10:23:48 +0000 (UTC)
From: Murphy Zhou <xzhou@redhat.com>
To: ltp@lists.linux.it
Date: Thu, 30 May 2019 18:23:35 +0800
Message-Id: <20190530102336.10898-1-xzhou@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Thu, 30 May 2019 10:23:51 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] lib/tst_test: introduce tst_test->some_filesystems
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

TGlrZSBhbGxfZmlsZXN5c3RlbXMsIHNvbWVfZmlsZXN5c3RlbXMgb3B0aW9uIGxldCB0Y2FzZSB0
byBydW4gb24Kc3BlY2lmaWMgZmlsZXN5c3RlbXMuCkluIG9yZGVyIHRvIGltcGxlbWVudCB0aGlz
LCBjaGFuZ2UgcnVuX3RjYXNlc19wZXJfZnMgdG8gYWNjZXB0IGEKcGFyYW1ldGVyIGluZGljYXRp
bmcgd2hpY2ggZmlsZXN5c3RlbXMgbmVlZCB0byB0ZXN0LgoKVG8gbGV0IHRjYXNlIHVzZSB0aGlz
IG9wdGlvbiwgd2UgbmVlZCBzb21lIG90aGVyIGZsYWdzIHNldApFZzoKc3RhdGljIGNoYXIgKnNv
bWVfZmlsZXN5c3RlbXNbXSA9IHsiZXh0NCIsICJ4ZnMiLCAiYnRyZnMifTsKCiAgLm1vdW50X2Rl
dmljZSA9IDAsCiAgLm5lZWRzX2RldmljZSA9IDEsCiAgLmZvcm1hdF9kZXZpY2UgPSAxLAogIC5t
bnRwb2ludCA9IE1OVFBPSU5ULAogIC5zb21lX2ZpbGVzeXN0ZW1zID0gc29tZV9maWxlc3lzdGVt
cywKClNpZ25lZC1vZmYtYnk6IE11cnBoeSBaaG91IDx4emhvdUByZWRoYXQuY29tPgotLS0KIGlu
Y2x1ZGUvdHN0X3Rlc3QuaCB8ICAxICsKIGxpYi90c3RfdGVzdC5jICAgICB8IDEzICsrKysrKysr
LS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2luY2x1ZGUvdHN0X3Rlc3QuaCBiL2luY2x1ZGUvdHN0X3Rlc3QuaAppbmRl
eCBlNGI5MzVjNDUuLjhkYzRmYjZiNCAxMDA2NDQKLS0tIGEvaW5jbHVkZS90c3RfdGVzdC5oCisr
KyBiL2luY2x1ZGUvdHN0X3Rlc3QuaApAQCAtMTM3LDYgKzEzNyw3IEBAIHN0cnVjdCB0c3RfdGVz
dCB7CiAJICogdG8gdGhlIHRlc3QgZnVuY3Rpb24uCiAJICovCiAJaW50IGFsbF9maWxlc3lzdGVt
czoxOworCWNoYXIgKipzb21lX2ZpbGVzeXN0ZW1zOwogCiAJLyoKIAkgKiBJZiBzZXQgbm9uLXpl
cm8gZGVub3RlcyBudW1iZXIgb2YgdGVzdCB2YXJpYW50LCB0aGUgdGVzdCBpcyBleGVjdXRlZApk
aWZmIC0tZ2l0IGEvbGliL3RzdF90ZXN0LmMgYi9saWIvdHN0X3Rlc3QuYwppbmRleCAyZDg4YWRi
ZDcuLjcyMjYwZjAyNyAxMDA2NDQKLS0tIGEvbGliL3RzdF90ZXN0LmMKKysrIGIvbGliL3RzdF90
ZXN0LmMKQEAgLTg2Nyw3ICs4NjcsNyBAQCBzdGF0aWMgdm9pZCBkb19zZXR1cChpbnQgYXJnYywg
Y2hhciAqYXJndltdKQogCQllbHNlCiAJCQl0ZGV2LmZzX3R5cGUgPSB0c3RfZGV2X2ZzX3R5cGUo
KTsKIAotCQlpZiAoIXRzdF90ZXN0LT5hbGxfZmlsZXN5c3RlbXMpCisJCWlmICghdHN0X3Rlc3Qt
PmFsbF9maWxlc3lzdGVtcyAmJiAhdHN0X3Rlc3QtPnNvbWVfZmlsZXN5c3RlbXMpCiAJCQlwcmVw
YXJlX2RldmljZSgpOwogCX0KIApAQCAtMTE0MywxMSArMTE0MywxMSBAQCBzdGF0aWMgaW50IGZv
cmtfdGVzdHJ1bih2b2lkKQogCXJldHVybiAwOwogfQogCi1zdGF0aWMgaW50IHJ1bl90Y2FzZXNf
cGVyX2ZzKHZvaWQpCitzdGF0aWMgaW50IHJ1bl90Y2FzZXNfcGVyX2ZzKGNoYXIgKipmc2VzKQog
ewogCWludCByZXQgPSAwOwogCXVuc2lnbmVkIGludCBpOwotCWNvbnN0IGNoYXIgKmNvbnN0ICpm
aWxlc3lzdGVtcyA9IHRzdF9nZXRfc3VwcG9ydGVkX2ZzX3R5cGVzKCk7CisJY29uc3QgY2hhciAq
Y29uc3QgKmZpbGVzeXN0ZW1zID0gZnNlczsKIAogCWlmICghZmlsZXN5c3RlbXNbMF0pCiAJCXRz
dF9icmsoVENPTkYsICJUaGVyZSBhcmUgbm8gc3VwcG9ydGVkIGZpbGVzeXN0ZW1zIik7CkBAIC0x
MjAyLDggKzEyMDIsMTEgQEAgdm9pZCB0c3RfcnVuX3RjYXNlcyhpbnQgYXJnYywgY2hhciAqYXJn
dltdLCBzdHJ1Y3QgdHN0X3Rlc3QgKnNlbGYpCiAKIAlmb3IgKHRzdF92YXJpYW50ID0gMDsgdHN0
X3ZhcmlhbnQgPCB0ZXN0X3ZhcmlhbnRzOyB0c3RfdmFyaWFudCsrKSB7CiAJCWlmICh0c3RfdGVz
dC0+YWxsX2ZpbGVzeXN0ZW1zKQotCQkJcmV0IHw9IHJ1bl90Y2FzZXNfcGVyX2ZzKCk7Ci0JCWVs
c2UKKwkJCXJldCB8PSBydW5fdGNhc2VzX3Blcl9mcyh0c3RfZ2V0X3N1cHBvcnRlZF9mc190eXBl
cygpKTsKKwkJZWxzZSBpZiAodHN0X3Rlc3QtPnNvbWVfZmlsZXN5c3RlbXMpIHsKKwkJCXRzdF90
ZXN0LT5tb3VudF9kZXZpY2UgPSAxOworCQkJcmV0IHw9IHJ1bl90Y2FzZXNfcGVyX2ZzKHRzdF90
ZXN0LT5zb21lX2ZpbGVzeXN0ZW1zKTsKKwkJfSBlbHNlCiAJCQlyZXQgfD0gZm9ya190ZXN0cnVu
KCk7CiAKIAkJaWYgKHJldCAmIH4oVENPTkYpKQotLSAKMi4yMS4wCgoKLS0gCk1haWxpbmcgbGlz
dCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
