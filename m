Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D53F727E8E
	for <lists+linux-ltp@lfdr.de>; Thu, 23 May 2019 15:45:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A64373EA77D
	for <lists+linux-ltp@lfdr.de>; Thu, 23 May 2019 15:45:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 7D66F3EA193
 for <ltp@lists.linux.it>; Thu, 23 May 2019 15:45:51 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 3925D14060DA
 for <ltp@lists.linux.it>; Thu, 23 May 2019 15:45:50 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8F01DAD70
 for <ltp@lists.linux.it>; Thu, 23 May 2019 13:45:50 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 23 May 2019 15:45:49 +0200
Message-Id: <20190523134549.23103-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH] [COMMITTED] syscalls/fcntl33: Fix typo overlapfs ->
	overlayfs
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

U2lnbmVkLW9mZi1ieTogQ3lyaWwgSHJ1YmlzIDxjaHJ1YmlzQHN1c2UuY3o+Ci0tLQogdGVzdGNh
c2VzL2tlcm5lbC9zeXNjYWxscy9mY250bC9mY250bDMzLmMgfCAyICstCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS90ZXN0Y2FzZXMv
a2VybmVsL3N5c2NhbGxzL2ZjbnRsL2ZjbnRsMzMuYyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2Fs
bHMvZmNudGwvZmNudGwzMy5jCmluZGV4IDQzZGM1YTJhZi4uNjI3ODIzYzVjIDEwMDY0NAotLS0g
YS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2ZjbnRsL2ZjbnRsMzMuYworKysgYi90ZXN0Y2Fz
ZXMva2VybmVsL3N5c2NhbGxzL2ZjbnRsL2ZjbnRsMzMuYwpAQCAtMTE3LDcgKzExNyw3IEBAIHN0
YXRpYyB2b2lkIGRvX3Rlc3QodW5zaWduZWQgaW50IGkpCiAJaWYgKFRTVF9SRVQgPT0gLTEpIHsK
IAkJaWYgKHR5cGUgPT0gVFNUX09WRVJMQVlGU19NQUdJQyAmJiBUU1RfRVJSID09IEVBR0FJTikg
ewogCQkJdHN0X3JlcyhUSU5GTyB8IFRURVJSTk8sCi0JCQkJImZjbnRsKEZfU0VUTEVBU0UsIEZf
V1JMQ0spIGZhaWxlZCBvbiBvdmVybGFwZnMgYXMgZXhwZWN0ZWQiKTsKKwkJCQkiZmNudGwoRl9T
RVRMRUFTRSwgRl9XUkxDSykgZmFpbGVkIG9uIG92ZXJsYXlmcyBhcyBleHBlY3RlZCIpOwogCQl9
IGVsc2UgewogCQkJdHN0X3JlcyhURkFJTCB8IFRURVJSTk8sICJmY250bCgpIGZhaWxlZCB0byBz
ZXQgbGVhc2UiKTsKIAkJfQotLSAKMi4xOS4yCgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRw
czovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
