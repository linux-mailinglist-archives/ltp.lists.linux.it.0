Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B07B92B1BAE
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Nov 2020 14:14:08 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 73BE83C5FBB
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Nov 2020 14:14:08 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 0E1C93C4FBC
 for <ltp@lists.linux.it>; Fri, 13 Nov 2020 14:13:42 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id BD7A920114B
 for <ltp@lists.linux.it>; Fri, 13 Nov 2020 14:13:41 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6950AABD1
 for <ltp@lists.linux.it>; Fri, 13 Nov 2020 13:13:41 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 13 Nov 2020 14:14:21 +0100
Message-Id: <20201113131428.13199-4-chrubis@suse.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201113131428.13199-1-chrubis@suse.cz>
References: <20201113131428.13199-1-chrubis@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 03/10] syscalls/accept: Make use of TEST_MACROS
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
index 4e30906f2..141400e54 100644
--- a/testcases/kernel/syscalls/accept/accept01.c
+++ b/testcases/kernel/syscalls/accept/accept01.c
@@ -95,21 +95,8 @@ void verify_accept(unsigned int nr)
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
+	TEST_FAIL(accept(*tcase->fd, tcase->sockaddr, &tcase->salen),
+	          tcase->experrno, "%s", tcase->desc);
 }
 
 static struct tst_test test = {
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
