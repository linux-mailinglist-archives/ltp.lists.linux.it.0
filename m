Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C17927BE16
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Sep 2020 09:35:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 012853C4CA4
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Sep 2020 09:35:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id E9D0A3C2985
 for <ltp@lists.linux.it>; Tue, 29 Sep 2020 09:35:08 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 2A318600ACA
 for <ltp@lists.linux.it>; Tue, 29 Sep 2020 09:35:07 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 74E71AD79;
 Tue, 29 Sep 2020 07:35:07 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 29 Sep 2020 09:35:01 +0200
Message-Id: <20200929073501.4598-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] io_destroy01: TCONF when unsupported
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

to fix test on kernel built without CONFIG_AIO=y.

Cleanup: use return instead of else, join string.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Hi,

simple patch, but can wait after release.
I can move cleanup into separate commit.

Kind regards,
Petr

 testcases/kernel/syscalls/io_destroy/io_destroy01.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/testcases/kernel/syscalls/io_destroy/io_destroy01.c b/testcases/kernel/syscalls/io_destroy/io_destroy01.c
index 560d7b3fb..5c5c59335 100644
--- a/testcases/kernel/syscalls/io_destroy/io_destroy01.c
+++ b/testcases/kernel/syscalls/io_destroy/io_destroy01.c
@@ -32,14 +32,19 @@ static void verify_io_destroy(void)
 		return;
 	}
 
+	if (TST_RET == -ENOSYS) {
+		tst_res(TCONF, "io_destroy() not supported");
+		return;
+	}
+
 	if (TST_RET == -EINVAL) {
 		tst_res(TPASS,
 			"io_destroy() failed as expected, returned -EINVAL");
-	} else {
-		tst_res(TFAIL, "io_destroy() failed unexpectedly, "
-			"returned -%s expected -EINVAL",
-			tst_strerrno(-TST_RET));
+		return;
 	}
+
+	tst_res(TFAIL, "io_destroy() failed unexpectedly, returned -%s expected -EINVAL",
+		tst_strerrno(-TST_RET));
 }
 
 static struct tst_test test = {
-- 
2.28.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
