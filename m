Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8D838BAB
	for <lists+linux-ltp@lfdr.de>; Fri,  7 Jun 2019 15:31:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A15D13EA6D7
	for <lists+linux-ltp@lfdr.de>; Fri,  7 Jun 2019 15:31:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 3B2DC3EA5DC
 for <ltp@lists.linux.it>; Fri,  7 Jun 2019 15:31:15 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 340EE2011C0
 for <ltp@lists.linux.it>; Fri,  7 Jun 2019 15:31:13 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7180EAFBE
 for <ltp@lists.linux.it>; Fri,  7 Jun 2019 13:31:13 +0000 (UTC)
Date: Fri, 7 Jun 2019 15:31:12 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Christian Amann <camann@suse.com>
Message-ID: <20190607133112.GA20202@rei.lan>
References: <20190607091923.30683-1-camann@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190607091923.30683-1-camann@suse.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v3] syscalls/fstat{03,05}: rewrote testcases
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

SGkhClB1c2hlZCB3aXRoIGEgZmV3IGNoYW5nZXMsIHRoYW5rcy4KCiogTWFkZSB0aGUgY2hlY2sg
Zm9yIHJldHVybiB2YWx1ZSBtb3JlIHN0cmljdAoKKiBDaGFuZ2VkIHRoZSBjb2RlIHNvIHRoYXQg
d2UgZG8gbm90IHJlbHkgb24gdGVzdCBudW1iZXIgYnV0IG9uIGV4cGVjdGVkCiAgZXJybm8gaW4g
dGhlIHNlZ2ZhdWx0IGNoZWNrLCB0aGlzIG1ha2VzIHRoZSB0ZXN0IG1vcmUgcm9idXN0IGluIGEg
Y2FzZQogIHdlIHdvdWxkIGFkZCB0ZXN0cyB0byB0aGUgdGNhc2Ugc3RydWN0dXJlLiBBbHNvIHRo
aXMgbWFrZXMgdGhlIGNvZGUKICBtb3JlIGNsZWFyIHRvIHRoZSByZWFkZXIuCgoqIEFkZGVkIGNv
ZGUgdG8gbWFrZSBzdXJlIHRoZSBjaGlsZCBoYXMgZXhpdHRlZCB3aXRoIDAgaW4gbm9ybWFsIGNh
c2UKCmRpZmYgLS1naXQgYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2ZzdGF0L2ZzdGF0MDMu
YyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvZnN0YXQvZnN0YXQwMy5jCmluZGV4IDNkNjc5
MGViMi4uN2QyMTNkZWE5IDEwMDY0NAotLS0gYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2Zz
dGF0L2ZzdGF0MDMuYworKysgYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2ZzdGF0L2ZzdGF0
MDMuYwpAQCAtNDIsNyArNDIsNyBAQCBzdGF0aWMgdm9pZCBjaGVja19mc3RhdCh1bnNpZ25lZCBp
bnQgdGNfbnVtKQogCXN0cnVjdCB0Y2FzZSAqdGMgPSAmdGNhc2VzW3RjX251bV07CiAKIAlURVNU
KGZzdGF0KCp0Yy0+ZmQsIHRjLT5zdGF0X2J1ZikpOwotCWlmIChUU1RfUkVUICE9IDApIHsKKwlp
ZiAoVFNUX1JFVCA9PSAtMSkgewogCQlpZiAodGMtPmV4cF9lcnIgPT0gVFNUX0VSUikgewogCQkJ
dHN0X3JlcyhUUEFTUywKIAkJCQkgImZzdGF0KCkgZmFpbHMgd2l0aCBleHBlY3RlZCBlcnJvciAl
cyIsCkBAIC03MCw4ICs3MCwxNSBAQCBzdGF0aWMgdm9pZCBydW4odW5zaWduZWQgaW50IHRjX251
bSkKIAl9CiAJU0FGRV9XQUlUUElEKHBpZCwgJnN0YXR1cywgMCk7CiAKLQlpZiAodGNfbnVtID09
IDEgJiYgV1RFUk1TSUcoc3RhdHVzKSA9PSBTSUdTRUdWKQorCWlmICh0Y2FzZXNbdGNfbnVtXS5l
eHBfZXJyID09IEVGQVVMVCAmJiBXVEVSTVNJRyhzdGF0dXMpID09IFNJR1NFR1YpIHsKIAkJdHN0
X3JlcyhUUEFTUywgImZzdGF0KCkgZmFpbGVkIGFzIGV4cGVjdGVkIHdpdGggU0lHU0VHViIpOwor
CQlyZXR1cm47CisJfQorCisJaWYgKFdJRkVYSVRFRChzdGF0dXMpICYmIFdFWElUU1RBVFVTKHN0
YXR1cykgPT0gMCkKKwkJcmV0dXJuOworCisJdHN0X3JlcyhUQlJPSywgImNoaWxkICVzIiwgdHN0
X3N0cnN0YXR1cyhzdGF0dXMpKTsKIH0KIAogc3RhdGljIHZvaWQgc2V0dXAodm9pZCkKCi0tIApD
eXJpbCBIcnViaXMKY2hydWJpc0BzdXNlLmN6CgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBz
Oi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
