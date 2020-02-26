Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B908A16F9E2
	for <lists+linux-ltp@lfdr.de>; Wed, 26 Feb 2020 09:43:00 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 529E13C251E
	for <lists+linux-ltp@lfdr.de>; Wed, 26 Feb 2020 09:43:00 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id A6E523C18F9
 for <ltp@lists.linux.it>; Wed, 26 Feb 2020 09:42:56 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 94D40600855
 for <ltp@lists.linux.it>; Wed, 26 Feb 2020 09:42:55 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id DEEE7AD31;
 Wed, 26 Feb 2020 08:42:54 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 26 Feb 2020 09:42:49 +0100
Message-Id: <20200226084249.29561-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] request_key04: Use TFAIL instead of TBROK
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

To fix unreported results error:
tst_test.c:1036: BROK: Test haven't reported results!

which also prevents to display kernel commit fix and CVE.

Fixes: 8ac26843e ("syscalls/request_key04: new test for request_key()
permission check bug")

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Hi,

obvious fix which I'd normally merge without sending to ML.
But there are 19 tests which use tst_res(TBROK, and at least some of
them are affected by this (i.e. don't unconditionally report any result
before tst_res(TBROK), so we might want to fix it different way.

Kind regards,
Petr

 testcases/kernel/syscalls/request_key/request_key04.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/kernel/syscalls/request_key/request_key04.c b/testcases/kernel/syscalls/request_key/request_key04.c
index da036bf3a..c125f4261 100644
--- a/testcases/kernel/syscalls/request_key/request_key04.c
+++ b/testcases/kernel/syscalls/request_key/request_key04.c
@@ -65,7 +65,7 @@ static void do_test(void)
 	if (TST_ERR == EACCES) {
 		tst_res(TPASS, "request_key() failed with EACCES as expected");
 	} else {
-		tst_res(TBROK | TTERRNO,
+		tst_res(TFAIL | TTERRNO,
 			"request_key() failed with unexpected error code");
 	}
 }
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
