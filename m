Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF14321C1C
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Feb 2021 17:03:25 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DF3FE3C80F7
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Feb 2021 17:03:24 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 83BA93C2C91
 for <ltp@lists.linux.it>; Mon, 22 Feb 2021 17:02:50 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id AE22B6009C1
 for <ltp@lists.linux.it>; Mon, 22 Feb 2021 17:02:49 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 56312AFD8;
 Mon, 22 Feb 2021 16:02:49 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 22 Feb 2021 17:02:43 +0100
Message-Id: <20210222160243.507-5-pvorel@suse.cz>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210222160243.507-1-pvorel@suse.cz>
References: <20210222160243.507-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 4/4] semctl09: Add glibc-git tag
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Also fix formatting:

* remove new line at "to the kernel"
* put glibc info out of docparse (this info is included in glibc-git)

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 testcases/kernel/syscalls/ipc/semctl/semctl09.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/testcases/kernel/syscalls/ipc/semctl/semctl09.c b/testcases/kernel/syscalls/ipc/semctl/semctl09.c
index f0c757cdd..8cdadd061 100644
--- a/testcases/kernel/syscalls/ipc/semctl/semctl09.c
+++ b/testcases/kernel/syscalls/ipc/semctl/semctl09.c
@@ -23,15 +23,20 @@
  * completely different meaning than their names seems to suggest.
  *
  * We also calling semctl() directly by syscall(), because of a glibc bug:
- * * semctl SEM_STAT_ANY fails to pass the buffer specified by the caller
- * * to the kernel.
- * * https://sourceware.org/bugzilla/show_bug.cgi?id=26637
  *
+ * semctl SEM_STAT_ANY fails to pass the buffer specified by the caller
+ * to the kernel.
+ *
+ * https://sourceware.org/bugzilla/show_bug.cgi?id=26637
+\*/
+
+/*
  * The glibc bug was fixed in:
+ *
  * * commit  574500a108be1d2a6a0dc97a075c9e0a98371aba
  * * Author: Dmitry V. Levin <ldv@altlinux.org>
  * * Date:   Tue, 29 Sep 2020 17:10:20 +0000 (14:10 -0300)
-\*/
+ */
 
 #include <stdio.h>
 #include <pwd.h>
@@ -200,4 +205,8 @@ static struct tst_test test = {
 	.tcnt = ARRAY_SIZE(tests),
 	.test_variants = 2,
 	.needs_root = 1,
+	.tags = (const struct tst_tag[]) {
+		{"glibc-git", "574500a108be"},
+		{}
+	}
 };
-- 
2.30.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
