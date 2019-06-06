Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B0237936
	for <lists+linux-ltp@lfdr.de>; Thu,  6 Jun 2019 18:10:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D86EB3EA9C7
	for <lists+linux-ltp@lfdr.de>; Thu,  6 Jun 2019 18:10:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 7FBC4298797
 for <ltp@lists.linux.it>; Thu,  6 Jun 2019 17:21:45 +0200 (CEST)
Received: from zimbra2.kalray.eu (zimbra2.kalray.eu [92.103.151.219])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 4C815600B8D
 for <ltp@lists.linux.it>; Thu,  6 Jun 2019 17:21:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zimbra2.kalray.eu (Postfix) with ESMTP id E040027FFC75
 for <ltp@lists.linux.it>; Thu,  6 Jun 2019 17:21:43 +0200 (CEST)
Received: from zimbra2.kalray.eu ([127.0.0.1])
 by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id nG72XU1hnaAO; Thu,  6 Jun 2019 17:21:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zimbra2.kalray.eu (Postfix) with ESMTP id 98FCD27FFC03;
 Thu,  6 Jun 2019 17:21:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu 98FCD27FFC03
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
 s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1559834497;
 bh=Z/lwHLU90ZURxfgEXGxJKK1QYj7QVykJ9ELjJa93ufE=;
 h=From:To:Date:Message-Id;
 b=iwMWWvQebbnym8gt8YprwCN52qpBq99YQ7+Ul2qXGGWKEFhQVVv+KV08vBa6lr6st
 Qjgot5Jiw1ul4fyy0i721FrHPk3PCs41PGBnMaYhqTOQrOXvBeRyU6cMHm4H6od8fL
 alZUFs9spICCrFVo72VWkAgwye1DMooadLn5WSI8=
Received: from zimbra2.kalray.eu ([127.0.0.1])
 by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id UdffvjQwO1ZI; Thu,  6 Jun 2019 17:21:37 +0200 (CEST)
Received: from junon.lin.mbt.kalray.eu (unknown [192.168.37.161])
 by zimbra2.kalray.eu (Postfix) with ESMTPSA id 799FF27FA151;
 Thu,  6 Jun 2019 17:21:37 +0200 (CEST)
From: Yann Sionneau <ysionneau@kalray.eu>
To: ltp@lists.linux.it
Date: Thu,  6 Jun 2019 17:21:17 +0200
Message-Id: <1559834477-21724-1-git-send-email-ysionneau@kalray.eu>
X-Mailer: git-send-email 1.8.3.1
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
X-Mailman-Approved-At: Thu, 06 Jun 2019 18:10:41 +0200
Cc: ysionneau@kalray.eu
Subject: [LTP] [PATCH] Fix use of results after being unmapped
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
LXRlc3QtcHJvamVjdC9sdHAvaXNzdWVzLzUzNwotLS0KIGxpYi90c3RfdGVzdC5jIHwgNiArKysr
LS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvbGliL3RzdF90ZXN0LmMgYi9saWIvdHN0X3Rlc3QuYwppbmRleCA5NWYzODlkLi43
M2VjYTU4IDEwMDY0NAotLS0gYS9saWIvdHN0X3Rlc3QuYworKysgYi9saWIvdHN0X3Rlc3QuYwpA
QCAtMTM4LDYgKzEzOCw3IEBAIHN0YXRpYyB2b2lkIGNsZWFudXBfaXBjKHZvaWQpCiAJaWYgKHJl
c3VsdHMpIHsKIAkJbXN5bmMoKHZvaWQqKXJlc3VsdHMsIHNpemUsIE1TX1NZTkMpOwogCQltdW5t
YXAoKHZvaWQqKXJlc3VsdHMsIHNpemUpOworCQlyZXN1bHRzID0gTlVMTDsKIAl9CiB9CiAKQEAg
LTkyMSwxMCArOTIyLDExIEBAIHN0YXRpYyB2b2lkIGRvX2NsZWFudXAodm9pZCkKIAlpZiAodHN0
X3Rlc3QtPnNhdmVfcmVzdG9yZSkKIAkJdHN0X3N5c19jb25mX3Jlc3RvcmUoMCk7CiAKLQljbGVh
bnVwX2lwYygpOwotCiAJaWYgKHRzdF90ZXN0LT5yZXN0b3JlX3dhbGxjbG9jaykKIAkJdHN0X3dh
bGxjbG9ja19yZXN0b3JlKCk7CisKKwljbGVhbnVwX2lwYygpOworCS8qIERvIG5vdCB1c2UgJ3Jl
c3VsdHMnIGFmdGVyIGNsZWFudXBfaXBjKCk6IGl0IGhhcyBiZWVuIHVubWFwcGVkLiAqLwogfQog
CiBzdGF0aWMgdm9pZCBydW5fdGVzdHModm9pZCkKLS0gCjEuOC4zLjEKCgotLSAKTWFpbGluZyBs
aXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
