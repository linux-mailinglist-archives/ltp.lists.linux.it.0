Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0F25BA60
	for <lists+linux-ltp@lfdr.de>; Mon,  1 Jul 2019 13:09:08 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 05C893C1D78
	for <lists+linux-ltp@lfdr.de>; Mon,  1 Jul 2019 13:09:08 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id E97C53C1D52
 for <ltp@lists.linux.it>; Mon,  1 Jul 2019 13:09:05 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 9FAA31400BF2
 for <ltp@lists.linux.it>; Mon,  1 Jul 2019 13:09:04 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 19F1AAE78
 for <ltp@lists.linux.it>; Mon,  1 Jul 2019 11:09:03 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Mon,  1 Jul 2019 13:08:57 +0200
Message-Id: <20190701110857.5895-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [COMMITTED] [PATCH] syscalls/acct01: Remove cleanup
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

* There is no need to remove files in the temporary directory, it's
  deleted recursively on test exit anyways

* This fixes issue #540 where the test produced warnings on kernel with
  BSD_PROCESS_ACCT turned off

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 testcases/kernel/syscalls/acct/acct01.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/testcases/kernel/syscalls/acct/acct01.c b/testcases/kernel/syscalls/acct/acct01.c
index f58e02584..ec570017b 100644
--- a/testcases/kernel/syscalls/acct/acct01.c
+++ b/testcases/kernel/syscalls/acct/acct01.c
@@ -91,12 +91,6 @@ static void setup(void)
 	memset(nametoolong, 'a', PATH_MAX+1);
 }
 
-static void cleanup(void)
-{
-	SAFE_UNLINK(TEST_TMPFILE);
-	SAFE_UNLINK(TEST_ELOOP);
-}
-
 static void verify_acct(unsigned int nr)
 {
 	struct test_case *tcase = &tcases[nr];
@@ -131,6 +125,5 @@ static struct tst_test test = {
 	.needs_rofs = 1,
 	.tcnt = ARRAY_SIZE(tcases),
 	.setup = setup,
-	.cleanup = cleanup,
 	.test = verify_acct,
 };
-- 
2.19.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
