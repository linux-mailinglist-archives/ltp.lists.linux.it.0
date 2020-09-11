Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA1926599F
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Sep 2020 08:51:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 91D913C4FB8
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Sep 2020 08:51:36 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 2EC4E3C25D9
 for <ltp@lists.linux.it>; Fri, 11 Sep 2020 08:51:33 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id AD9D71A00FA3
 for <ltp@lists.linux.it>; Fri, 11 Sep 2020 08:51:32 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 929F3AD29;
 Fri, 11 Sep 2020 06:51:47 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 11 Sep 2020 08:51:24 +0200
Message-Id: <20200911065124.18992-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v2 1/1] fanotify10: Skip non zero ignored_onchild
 tests for < v5.9
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
Cc: Jan Kara <jack@suse.cz>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

ignored mask in combination with flag FAN_EVENT_ON_CHILD has
undefined behavior on kernel < 5.9.

Also remove wrong kernel commit (left in e8189ff3c).

Acked-by: Jan Kara <jack@suse.cz>
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 testcases/kernel/syscalls/fanotify/fanotify10.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/testcases/kernel/syscalls/fanotify/fanotify10.c b/testcases/kernel/syscalls/fanotify/fanotify10.c
index 2c4401f61..64426b876 100644
--- a/testcases/kernel/syscalls/fanotify/fanotify10.c
+++ b/testcases/kernel/syscalls/fanotify/fanotify10.c
@@ -20,10 +20,10 @@
  *
  *     2f02fd3fa13e fanotify: fix ignore mask logic for events on child...
  *
- * Test cases #17-#23 are regression tests for commit:
+ * Test cases #17-#23 are regression tests for commit (from v5.9, unlikely to be
+ * backported thus not in .tags):
  *
  *     497b0c5a7c06 fsnotify: send event to parent and child with single...
- *     eca4784cbb18 fsnotify: send event to parent and child with single...
  */
 #define _GNU_SOURCE
 #include "config.h"
@@ -451,6 +451,12 @@ static void test_fanotify(unsigned int n)
 
 	tst_res(TINFO, "Test #%d: %s", n, tc->tname);
 
+	if (tc->ignored_onchild && tst_kvercmp(5, 9, 0) < 0) {
+		tst_res(TCONF, "ignored mask in combination with flag FAN_EVENT_ON_CHILD"
+				" has undefined behavior on kernel < 5.9");
+		return;
+	}
+
 	if (create_fanotify_groups(n) != 0)
 		goto cleanup;
 
@@ -567,7 +573,6 @@ static struct tst_test test = {
 	.tags = (const struct tst_tag[]) {
 		{"linux-git", "9bdda4e9cf2d"},
 		{"linux-git", "2f02fd3fa13e"},
-		{"linux-git", "497b0c5a7c06"},
 		{}
 	}
 };
-- 
2.28.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
