Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B2E29526
	for <lists+linux-ltp@lfdr.de>; Fri, 24 May 2019 11:53:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C5F91294AC4
	for <lists+linux-ltp@lfdr.de>; Fri, 24 May 2019 11:53:30 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 93CA33EA5F1
 for <ltp@lists.linux.it>; Fri, 24 May 2019 11:53:28 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 67091201817
 for <ltp@lists.linux.it>; Fri, 24 May 2019 11:53:27 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id BB2A5AE14;
 Fri, 24 May 2019 09:53:26 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 24 May 2019 11:53:17 +0200
Message-Id: <20190524095317.10240-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH] net: Disable building tst_get_unused_port in old API
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

Q29tbWl0IGZhNmE0ZTcwOCBtb3ZlZCB0c3RfZ2V0X3VudXNlZF9wb3J0IGludG8gbmV3IEFQSSwg
YnV0IGxlZnQgY29kZQppbiBNYWtlZmlsZSBidWlsdCBpdCBhbHNvIGZvciBvbGQgQVBJLiBJdCB3
YXMgdXAgdG8gbWFrZSB3aGljaCBvZiB0aGVzZQp3YXMgY29waWVkIGxhc3QgYW5kIHJlbWFpbiBp
bnN0YWxsZWQuCgpBbHNvIHJlbW92ZSBjb21wYXJpc29uIGZvciB0c3RfZ2V0X3VudXNlZF9wb3J0
IGZyb20gbHRwYXBpY21kLmMuCgpGaXhlczogZmE2YTRlNzA4ICgibmV0OiBJbnRyb2R1Y2UgVFNU
X0dFVF9VTlVTRURfUE9SVCgpIG1hY3JvIGludG8gQyBBUEkiKQoKU2lnbmVkLW9mZi1ieTogUGV0
ciBWb3JlbCA8cHZvcmVsQHN1c2UuY3o+Ci0tLQpIaSwKCnNvcnJ5IGZvciBpbnRyb2R1Y2luZyBh
IHJlZ3Jlc3Npb24uCgpLaW5kIHJlZ2FyZHMsClBldHIKLS0tCiB0b29scy9hcGljbWRzL01ha2Vm
aWxlICAgIHwgMiArLQogdG9vbHMvYXBpY21kcy9sdHBhcGljbWQuYyB8IDMgKy0tCiAyIGZpbGVz
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90
b29scy9hcGljbWRzL01ha2VmaWxlIGIvdG9vbHMvYXBpY21kcy9NYWtlZmlsZQppbmRleCAxMTc2
M2UyY2MuLjRiMmE2MDQ5NSAxMDA2NDQKLS0tIGEvdG9vbHMvYXBpY21kcy9NYWtlZmlsZQorKysg
Yi90b29scy9hcGljbWRzL01ha2VmaWxlCkBAIC0yOCw3ICsyOCw3IEBAIENQUEZMQUdTCQkrPSAt
RF9HTlVfU09VUkNFCiAKIE1BS0VfVEFSR0VUUwkJOj0gJChhZGRwcmVmaXggdHN0XyxicmsgYnJr
bSBleGl0IFwKIAkJCSAgICAgcmVzIHJlc20gbmNwdXMgbmNwdXNfY29uZiBuY3B1c19tYXggXAot
CQkJICAgICBnZXRfdW51c2VkX3BvcnQgZnNfaGFzX2ZyZWUpCisJCQkgICAgIGZzX2hhc19mcmVl
KQogCiBpbmNsdWRlICQodG9wX3NyY2RpcikvaW5jbHVkZS9tay9nZW5lcmljX2xlYWZfdGFyZ2V0
Lm1rCiAKZGlmZiAtLWdpdCBhL3Rvb2xzL2FwaWNtZHMvbHRwYXBpY21kLmMgYi90b29scy9hcGlj
bWRzL2x0cGFwaWNtZC5jCmluZGV4IGY3ZTJhNWVhYi4uYzRmYWIzMjE4IDEwMDY0NAotLS0gYS90
b29scy9hcGljbWRzL2x0cGFwaWNtZC5jCisrKyBiL3Rvb2xzL2FwaWNtZHMvbHRwYXBpY21kLmMK
QEAgLTI2Miw4ICsyNjIsNyBAQCBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqYXJndltdKQogCXRz
dF90b3RhbCA9IGdldGVudigiVFNUX1RPVEFMIik7CiAJdHN0X2NudHN0ciA9IGdldGVudigiVFNU
X0NPVU5UIik7CiAJaWYgKFRDSUQgPT0gTlVMTCB8fCB0c3RfdG90YWwgPT0gTlVMTCB8fCB0c3Rf
Y250c3RyID09IE5VTEwpIHsKLQkJIGlmKCFzdHJjbXAoY21kX25hbWUsICJ0c3RfZnNfaGFzX2Zy
ZWUiKSAmJgotCQkgICAgIXN0cmNtcChjbWRfbmFtZSwgInRzdF9nZXRfdW51c2VkX3BvcnQiKSkg
eworCQkgaWYoIXN0cmNtcChjbWRfbmFtZSwgInRzdF9mc19oYXNfZnJlZSIpKSB7CiAJCQlmcHJp
bnRmKHN0ZGVyciwKIAkJCQkiXG5TZXQgdmFyaWFibGVzIFRDSUQsIFRTVF9UT1RBTCwgYW5kIFRT
VF9DT1VOVCBiZWZvcmUgZWFjaCB0ZXN0OlxuIgogCQkJCSJleHBvcnQgVENJRD08dGVzdCBuYW1l
PlxuIgotLSAKMi4yMS4wCgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxp
bnV4Lml0L2xpc3RpbmZvL2x0cAo=
