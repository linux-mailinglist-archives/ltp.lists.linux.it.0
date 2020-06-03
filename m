Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 90AA81ECF19
	for <lists+linux-ltp@lfdr.de>; Wed,  3 Jun 2020 13:54:38 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 80BB73C1F2A
	for <lists+linux-ltp@lfdr.de>; Wed,  3 Jun 2020 13:54:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 8CECA3C0358
 for <ltp@lists.linux.it>; Wed,  3 Jun 2020 13:54:33 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id D6D8520090C
 for <ltp@lists.linux.it>; Wed,  3 Jun 2020 13:54:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591185270;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:content-type:content-type;
 bh=oiQcMYFy8LSMCPkEr4P5cTyK2aRnziQHORMDUhDn6HQ=;
 b=BUnK5rNtf3O2DSbi0/U0yRXyZxFHRnCA0fBOfL8vZhB85AH/HTv9LAANPVnee4VXiDMHwV
 Ah59D3CYv72OGuxbmhu1Xc2XaJBG4l8j3AXPj+b5sb97BCVihoNNIyMVmMpwjp/1704ZWV
 4TnIv/Y0nmd4BX0+Hr08ICq3JtLfRos=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-377-p2a5BGjONpKLsQViqGOElg-1; Wed, 03 Jun 2020 07:54:29 -0400
X-MC-Unique: p2a5BGjONpKLsQViqGOElg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1D91080058E
 for <ltp@lists.linux.it>; Wed,  3 Jun 2020 11:54:28 +0000 (UTC)
Received: from janakin.usersys.redhat.com (unknown [10.43.17.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9656D10013D6
 for <ltp@lists.linux.it>; Wed,  3 Jun 2020 11:54:27 +0000 (UTC)
From: Jan Stancek <jstancek@redhat.com>
To: ltp@lists.linux.it
Date: Wed,  3 Jun 2020 13:54:23 +0200
Message-Id: <588f29555a93919a5ea47e5cf786eca6a08f85f1.1591185180.git.jstancek@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/mknod07: whiteout creation no longer
 requires privileges
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Since commit a3c751a50fe6 ("vfs: allow unprivileged whiteout creation"),
privileges are no longer required to create whiteout (0,0) char device.

Use /dev/null instead for EPERM test.

Signed-off-by: Jan Stancek <jstancek@redhat.com>
---
 testcases/kernel/syscalls/mknod/mknod07.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/testcases/kernel/syscalls/mknod/mknod07.c b/testcases/kernel/syscalls/mknod/mknod07.c
index 69cff02d95d1..829199061532 100644
--- a/testcases/kernel/syscalls/mknod/mknod07.c
+++ b/testcases/kernel/syscalls/mknod/mknod07.c
@@ -43,6 +43,7 @@
 #include <sys/types.h>
 #include <sys/stat.h>
 #include <sys/mount.h>
+#include <sys/sysmacros.h>
 
 #include "test.h"
 #include "safe_macros.h"
@@ -69,13 +70,14 @@ static struct test_case_t {
 	char *pathname;
 	int mode;
 	int exp_errno;
+	int major, minor;
 } test_cases[] = {
-	{ "testdir_1/tnode_1", SOCKET_MODE, EACCES },
-	{ "testdir_1/tnode_2", FIFO_MODE, EACCES },
-	{ "tnode_3", CHR_MODE, EPERM },
-	{ "tnode_4", BLK_MODE, EPERM },
-	{ "mntpoint/tnode_5", SOCKET_MODE, EROFS },
-	{ elooppathname, FIFO_MODE, ELOOP },
+	{ "testdir_1/tnode_1", SOCKET_MODE, EACCES, 0, 0 },
+	{ "testdir_1/tnode_2", FIFO_MODE, EACCES, 0, 0 },
+	{ "tnode_3", CHR_MODE, EPERM, 1, 3 },
+	{ "tnode_4", BLK_MODE, EPERM, 0, 0 },
+	{ "mntpoint/tnode_5", SOCKET_MODE, EROFS, 0, 0 },
+	{ elooppathname, FIFO_MODE, ELOOP, 0, 0 },
 };
 
 char *TCID = "mknod07";
@@ -149,7 +151,8 @@ static void setup(void)
 
 static void mknod_verify(const struct test_case_t *test_case)
 {
-	TEST(mknod(test_case->pathname, test_case->mode, 0));
+	TEST(mknod(test_case->pathname, test_case->mode,
+		makedev(test_case->major, test_case->minor)));
 
 	if (TEST_RETURN != -1) {
 		tst_resm(TFAIL, "mknod succeeded unexpectedly");
-- 
2.18.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
