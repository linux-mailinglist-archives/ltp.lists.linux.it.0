Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F55D2D5D46
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Dec 2020 15:15:25 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B9D713C7147
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Dec 2020 15:15:24 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 8D0453C4B5F
 for <ltp@lists.linux.it>; Thu, 10 Dec 2020 15:14:54 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 44EE5200C89
 for <ltp@lists.linux.it>; Thu, 10 Dec 2020 15:14:54 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D96EEAE2E
 for <ltp@lists.linux.it>; Thu, 10 Dec 2020 14:14:53 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 10 Dec 2020 15:15:41 +0100
Message-Id: <20201210141548.10982-4-chrubis@suse.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201210141548.10982-1-chrubis@suse.cz>
References: <20201210141548.10982-1-chrubis@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v2 03/10] syscalls/accept: Make use of TST_EXP_MACROS
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

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 testcases/kernel/syscalls/accept/accept01.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/testcases/kernel/syscalls/accept/accept01.c b/testcases/kernel/syscalls/accept/accept01.c
index 01d6db84c..8722f2c7f 100644
--- a/testcases/kernel/syscalls/accept/accept01.c
+++ b/testcases/kernel/syscalls/accept/accept01.c
@@ -97,21 +97,8 @@ void verify_accept(unsigned int nr)
 {
 	struct test_case *tcase = &tcases[nr];
 
-	TEST(accept(*tcase->fd, tcase->sockaddr, &tcase->salen));
-
-	if (TST_RET != -1) {
-		tst_res(TFAIL, "%s: returned %li, expected -1",
-				tcase->desc, TST_RET);
-		return;
-	}
-
-	if (TST_ERR != tcase->experrno) {
-		tst_res(TFAIL | TTERRNO, "%s: expected errno %s, got ",
-				tcase->desc, tst_strerrno(tcase->experrno));
-		return;
-	}
-
-	tst_res(TPASS | TTERRNO, "%s successful", tcase->desc);
+	TST_EXP_FAIL(accept(*tcase->fd, tcase->sockaddr, &tcase->salen),
+	             tcase->experrno, "%s", tcase->desc);
 }
 
 static struct tst_test test = {
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
