Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 682692F904
	for <lists+linux-ltp@lfdr.de>; Thu, 30 May 2019 11:10:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 99E9A3EA721
	for <lists+linux-ltp@lfdr.de>; Thu, 30 May 2019 11:10:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 91DAA3EA02C
 for <ltp@lists.linux.it>; Thu, 30 May 2019 11:10:17 +0200 (CEST)
Received: from out30-130.freemail.mail.aliyun.com
 (out30-130.freemail.mail.aliyun.com [115.124.30.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 52043140127A
 for <ltp@lists.linux.it>; Thu, 30 May 2019 11:10:15 +0200 (CEST)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R131e4; CH=green; DM=||false|;
 FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04394; MF=caspar@linux.alibaba.com; NM=1;
 PH=DS; RN=3; SR=0; TI=SMTPD_---0TT.sggU_1559207412; 
Received: from linux.alibaba.com(mailfrom:caspar@linux.alibaba.com
 fp:SMTPD_---0TT.sggU_1559207412) by smtp.aliyun-inc.com(127.0.0.1);
 Thu, 30 May 2019 17:10:12 +0800
From: Caspar Zhang <caspar@linux.alibaba.com>
To: Cyril Hrubis <chrubis@suse.cz>
Date: Thu, 30 May 2019 17:09:58 +0800
Message-Id: <1985f9e48c4557c2ec52eded11d08f3b7b514962.1559207183.git.caspar@casparzhang.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <f11c83459b71fbf399794fb8363f2b538b0b6346.1559207183.git.caspar@casparzhang.com>
References: <f11c83459b71fbf399794fb8363f2b538b0b6346.1559207183.git.caspar@casparzhang.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-7.5 required=7.0 tests=ENV_AND_HDR_SPF_MATCH,
 SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Cc: LTP List <ltp@lists.linux.it>
Subject: [LTP] [PATCH 3/3] tst_test.sh,
	test.sh: report pass if both TPASS and TCONF exist in shell test
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

V2UgZG9uJ3Qgd2FudCB0aGUgdGVzdCByZXBvcnRpbmcgVENPTkYgaWYgYXQgbGVhc3Qgb25lIFRQ
QVNTIGV4aXN0ZWQKZHVyaW5nIHRlc3RpbmcuIEFuZCB0aGlzIGlzIGFsc28gdHJ1ZSBpbiBzaGVs
bCB0ZXN0cy4gU28gZml4IGl0LgoKU2lnbmVkLW9mZi1ieTogQ2FzcGFyIFpoYW5nIDxjYXNwYXJA
bGludXguYWxpYmFiYS5jb20+Ci0tLQogdGVzdGNhc2VzL2xpYi90ZXN0LnNoICAgICB8IDkgKysr
KysrKysrCiB0ZXN0Y2FzZXMvbGliL3RzdF90ZXN0LnNoIHwgMiArLQogMiBmaWxlcyBjaGFuZ2Vk
LCAxMCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvdGVzdGNhc2Vz
L2xpYi90ZXN0LnNoIGIvdGVzdGNhc2VzL2xpYi90ZXN0LnNoCmluZGV4IGFkZThmY2RmZi4uN2Nj
M2JiMmZlIDEwMDY0NAotLS0gYS90ZXN0Y2FzZXMvbGliL3Rlc3Quc2gKKysrIGIvdGVzdGNhc2Vz
L2xpYi90ZXN0LnNoCkBAIC0yMyw2ICsyMyw3IEBACiAKIGV4cG9ydCBMVFBfUkVUX1ZBTD0wCiBl
eHBvcnQgVFNUX0NPVU5UPTEKK2V4cG9ydCBUU1RfUEFTU19DT1VOVD0wCiBleHBvcnQgVFNUX0xJ
Ql9MT0FERUQ9MQogZXhwb3J0IFRTVF9UTVBESVJfUkhPU1Q9MAogCkBAIC02MCw2ICs2MSwxMCBA
QCB0c3RfcmVzbSgpCiAJY2FzZSAiJHJldCIgaW4KIAlUUEFTU3xURkFJTHxUQ09ORikgVFNUX0NP
VU5UPSQoKFRTVF9DT1VOVCsxKSk7OwogCWVzYWMKKworCWlmIFsgIiRyZXQiID0gVFBBU1MgXTsg
dGhlbgorCQlUU1RfUEFTU19DT1VOVD0kKChUU1RfUEFTU19DT1VOVCsxKSkKKwlmaQogfQogCiB0
c3RfYnJrbSgpCkBAIC0xMTEsNiArMTE2LDEwIEBAIHRzdF9leGl0KCkKIAkJcm0gLWYgIiRMVFBf
SVBDX1BBVEgiCiAJZmkKIAorCSMgTWFzayBvdXQgVENPTkYgaWYgbm8gVEZBSUwvVEJST0svVFdB
Uk4gYnV0IGhhcyBUUEFTUworCWlmIFsgJCgoTFRQX1JFVF9WQUwgJiA3KSkgLWVxIDAgLWEgJFRT
VF9QQVNTX0NPVU5UIC1ndCAwIF07IHRoZW4KKwkJTFRQX1JFVF9WQUw9JCgoTFRQX1JFVF9WQUwg
JiB+MzIpKQorCWZpCiAJIyBNYXNrIG91dCBUSU5GTwogCWV4aXQgJCgoTFRQX1JFVF9WQUwgJiB+
MTYpKQogfQpkaWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2xpYi90c3RfdGVzdC5zaCBiL3Rlc3RjYXNl
cy9saWIvdHN0X3Rlc3Quc2gKaW5kZXggNTEyNzMyMzE1Li5iZjcyNWZkZGUgMTAwNjQ0Ci0tLSBh
L3Rlc3RjYXNlcy9saWIvdHN0X3Rlc3Quc2gKKysrIGIvdGVzdGNhc2VzL2xpYi90c3RfdGVzdC5z
aApAQCAtNzgsNyArNzgsNyBAQCBfdHN0X2RvX2V4aXQoKQogCQlyZXQ9JCgocmV0fDQpKQogCWZp
CiAKLQlpZiBbICRUU1RfQ09ORiAtZ3QgMCBdOyB0aGVuCisJaWYgWyAkVFNUX0NPTkYgLWd0IDAg
LWEgJFRTVF9QQVNTIC1lcSAwIF07IHRoZW4KIAkJcmV0PSQoKHJldHwzMikpCiAJZmkKIAotLSAK
Mi4yMS4wCgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xp
c3RpbmZvL2x0cAo=
