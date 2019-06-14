Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 475A745CC9
	for <lists+linux-ltp@lfdr.de>; Fri, 14 Jun 2019 14:27:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EDD60294B08
	for <lists+linux-ltp@lfdr.de>; Fri, 14 Jun 2019 14:27:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id ABC34294A36
 for <ltp@lists.linux.it>; Fri, 14 Jun 2019 14:27:28 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 024B5601C66
 for <ltp@lists.linux.it>; Fri, 14 Jun 2019 14:27:29 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id AF0BAACEE;
 Fri, 14 Jun 2019 12:27:26 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 14 Jun 2019 14:27:16 +0200
Message-Id: <20190614122716.2383-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH] net/tst_net_vars: Fix IPv4 network computing on big
	endianness
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

YnkgY29udmVydGluZyBJUCB0byBuZXR3b3JrIGJ5dGUgb3JkZXIgYW5kIGFkanVzdCBwcmludGlu
Zy4KClNpZ25lZC1vZmYtYnk6IFBldHIgVm9yZWwgPHB2b3JlbEBzdXNlLmN6PgotLS0KIHRlc3Rj
YXNlcy9saWIvdHN0X25ldF92YXJzLmMgfCAxNiArKysrKystLS0tLS0tLS0tCiAxIGZpbGUgY2hh
bmdlZCwgNiBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90ZXN0
Y2FzZXMvbGliL3RzdF9uZXRfdmFycy5jIGIvdGVzdGNhc2VzL2xpYi90c3RfbmV0X3ZhcnMuYwpp
bmRleCA0M2NkOTJiY2YuLmIxZWE5OWRmNiAxMDA2NDQKLS0tIGEvdGVzdGNhc2VzL2xpYi90c3Rf
bmV0X3ZhcnMuYworKysgYi90ZXN0Y2FzZXMvbGliL3RzdF9uZXRfdmFycy5jCkBAIC00NzYsMjMg
KzQ3NiwxOSBAQCBzdGF0aWMgY2hhciAqZ2V0X2lwdjRfbmV0d29yayhpbnQgaXAsIHVuc2lnbmVk
IGludCBwcmVmaXgpCiAJdW5zaWduZWQgY2hhciBieXRlOwogCXVuc2lnbmVkIGludCBpOwogCisJ
aXAgPSBodG9ubChpcCk7CisKIAlpZiAocHJlZml4ID4gTUFYX0lQVjRfUFJFRklYKQogCQlyZXR1
cm4gTlVMTDsKIAogCWlmIChwcmVmaXggPT0gTUFYX0lQVjRfUFJFRklYKQogCQlyZXR1cm4gc3Ry
ZHVwKCJcMCIpOwogCi0JcHJlZml4ICY9IDB4MTg7CisJcHJlZml4ICY9IE1BWF9JUFY0X1BSRUZJ
WCAtIDg7CiAKLQlmb3IgKGkgPSAwOyBpIDwgTUFYX0lQVjRfUFJFRklYICYmIChwcmVmaXggPT0g
MCB8fCBpIDwgcHJlZml4KTsKLQkgICAgIGkgKz0gOCkgewotCQlpZiAoaSA9PSAwKSB7Ci0JCQli
eXRlID0gaXAgJiAweGZmOwotCQkJc3ByaW50ZihwX2J1ZiwgIiVkIiwgYnl0ZSk7Ci0JCX0gZWxz
ZSB7Ci0JCQlieXRlID0gKGlwID4+IGkpICYgMHhmZjsKLQkJCXNwcmludGYocF9idWYsICIuJWQi
LCBieXRlKTsKLQkJfQorCWZvciAoaSA9IHByZWZpeDsgaSA+IDA7IGkgLT0gOCkgeworCQlieXRl
ID0gKGlwID4+IGkpICYgMHhmZjsKKwkJc3ByaW50ZihwX2J1ZiwgaSA8IHByZWZpeCA/ICIuJWQi
IDogIiVkIiwgYnl0ZSk7CiAJCXBfYnVmICs9IHN0cmxlbihwX2J1Zik7CiAJfQogCi0tIAoyLjIx
LjAKCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGlu
Zm8vbHRwCg==
