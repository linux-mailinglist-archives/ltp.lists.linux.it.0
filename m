Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 183E24576F
	for <lists+linux-ltp@lfdr.de>; Fri, 14 Jun 2019 10:27:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DD96E294AD8
	for <lists+linux-ltp@lfdr.de>; Fri, 14 Jun 2019 10:27:08 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 18E08294A36
 for <ltp@lists.linux.it>; Fri, 14 Jun 2019 10:27:06 +0200 (CEST)
Received: from zimbra2.kalray.eu (zimbra2.kalray.eu [92.103.151.219])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 13CD4601843
 for <ltp@lists.linux.it>; Fri, 14 Jun 2019 10:27:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zimbra2.kalray.eu (Postfix) with ESMTP id A5FE527FC9BD
 for <ltp@lists.linux.it>; Fri, 14 Jun 2019 10:27:04 +0200 (CEST)
Received: from zimbra2.kalray.eu ([127.0.0.1])
 by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 38iDLXAe3tII; Fri, 14 Jun 2019 10:27:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zimbra2.kalray.eu (Postfix) with ESMTP id 4B47627F950C;
 Fri, 14 Jun 2019 10:27:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu 4B47627F950C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
 s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1560500822;
 bh=7yNuiWMNjEGrUkQEOlQVh+i4EdRr27GVEqY+8+l0uNc=;
 h=From:To:Date:Message-Id;
 b=LoZBSnmfKs9vOrpMUNb5sy44S6xfFOvBNuFtoAmS2r3F2IcmAYuWdJXqIexCQLUUE
 Y94/Tgnbn6VHWekGpWmgbkjNLcheEgmCb5m8QHjRn52KJPlw1qwAYcdthKwwUyuNsk
 Iwf71CG+4pFduF5Cuc2yYs3XQedg3NoQjkOOTYvs=
Received: from zimbra2.kalray.eu ([127.0.0.1])
 by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id G1DsWj7CnttG; Fri, 14 Jun 2019 10:27:02 +0200 (CEST)
Received: from junon.lin.mbt.kalray.eu (unknown [192.168.37.161])
 by zimbra2.kalray.eu (Postfix) with ESMTPSA id 30C7327F6615;
 Fri, 14 Jun 2019 10:27:02 +0200 (CEST)
From: Yann Sionneau <ysionneau@kalray.eu>
To: ltp@lists.linux.it
Date: Fri, 14 Jun 2019 10:26:45 +0200
Message-Id: <1560500805-26005-1-git-send-email-ysionneau@kalray.eu>
X-Mailer: git-send-email 1.8.3.1
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Cc: ysionneau@kalray.eu
Subject: [LTP] [PATCH v2] Fix use of results after being unmapped
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

VGhpcyBmaXhlcyBpc3N1ZSByZXBvcnRlZCB0aGVyZTogaHR0cHM6Ly9naXRodWIuY29tL2xpbnV4
LXRlc3QtcHJvamVjdC9sdHAvaXNzdWVzLzUzNwoKU2lnbmVkLW9mZi1ieTogWWFubiBTaW9ubmVh
dSA8eXNpb25uZWF1QGthbHJheS5ldT4KLS0tCiBsaWIvdHN0X3Rlc3QuYyB8IDUgKysrLS0KIDEg
ZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvbGliL3RzdF90ZXN0LmMgYi9saWIvdHN0X3Rlc3QuYwppbmRleCA5NWYzODlkLi43Mzk1OTk2
IDEwMDY0NAotLS0gYS9saWIvdHN0X3Rlc3QuYworKysgYi9saWIvdHN0X3Rlc3QuYwpAQCAtMTM4
LDYgKzEzOCw3IEBAIHN0YXRpYyB2b2lkIGNsZWFudXBfaXBjKHZvaWQpCiAJaWYgKHJlc3VsdHMp
IHsKIAkJbXN5bmMoKHZvaWQqKXJlc3VsdHMsIHNpemUsIE1TX1NZTkMpOwogCQltdW5tYXAoKHZv
aWQqKXJlc3VsdHMsIHNpemUpOworCQlyZXN1bHRzID0gTlVMTDsKIAl9CiB9CiAKQEAgLTkyMSwx
MCArOTIyLDEwIEBAIHN0YXRpYyB2b2lkIGRvX2NsZWFudXAodm9pZCkKIAlpZiAodHN0X3Rlc3Qt
PnNhdmVfcmVzdG9yZSkKIAkJdHN0X3N5c19jb25mX3Jlc3RvcmUoMCk7CiAKLQljbGVhbnVwX2lw
YygpOwotCiAJaWYgKHRzdF90ZXN0LT5yZXN0b3JlX3dhbGxjbG9jaykKIAkJdHN0X3dhbGxjbG9j
a19yZXN0b3JlKCk7CisKKwljbGVhbnVwX2lwYygpOwogfQogCiBzdGF0aWMgdm9pZCBydW5fdGVz
dHModm9pZCkKLS0gCjEuOC4zLjEKCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlz
dHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
