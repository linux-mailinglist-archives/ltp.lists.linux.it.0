Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7084AEBCA
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Feb 2022 09:05:39 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C7F0A3C9B5E
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Feb 2022 09:05:38 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6BEC83C6912
 for <ltp@lists.linux.it>; Wed,  9 Feb 2022 09:05:35 +0100 (CET)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 69EC81401135
 for <ltp@lists.linux.it>; Wed,  9 Feb 2022 09:05:32 +0100 (CET)
Received: from canpemm500005.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4JtslH6tNgzZfX4
 for <ltp@lists.linux.it>; Wed,  9 Feb 2022 16:01:15 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.63) by
 canpemm500005.china.huawei.com (7.192.104.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Wed, 9 Feb 2022 16:05:28 +0800
To: <ltp@lists.linux.it>
Date: Wed, 9 Feb 2022 16:05:10 +0800
Message-ID: <20220209080510.167709-1-zhaogongyi@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.63]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 canpemm500005.china.huawei.com (7.192.104.229)
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v2] fanotify/fanotify04: Bugfix for running with
 option of "-i 500"
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
From: Zhao Gongyi via ltp <ltp@lists.linux.it>
Reply-To: Zhao Gongyi <zhaogongyi@huawei.com>
Cc: jack@suse.cz
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

When we running the testcase with option of "-i 500", the test
will fail:
...
fanotify04.c:163: TPASS: No event as expected
fanotify04.c:71: TPASS: fanotify_mark (3, FAN_MARK_ADD | 0, FAN_OPEN, AT_FDCWD, 'symlink_160172') succeeded
fanotify04.c:127: TPASS: event generated properly for type 100000
fanotify04.c:113: TBROK: read(3,0x55c783185280,0) failed, returned -1: EINVAL (22)
...

Signed-off-by: Zhao Gongyi <zhaogongyi@huawei.com>
---
v1->v2: Clear the compile warnings.

 .../kernel/syscalls/fanotify/fanotify04.c     | 21 ++++++-------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/testcases/kernel/syscalls/fanotify/fanotify04.c b/testcases/kernel/syscalls/fanotify/fanotify04.c
index b23d7a9a3..8c3c179b1 100644
--- a/testcases/kernel/syscalls/fanotify/fanotify04.c
+++ b/testcases/kernel/syscalls/fanotify/fanotify04.c
@@ -24,11 +24,8 @@
 #ifdef HAVE_SYS_FANOTIFY_H
 #include "fanotify.h"

-#define EVENT_MAX 1024
 /* size of the event structure, not counting name */
 #define EVENT_SIZE  (sizeof (struct fanotify_event_metadata))
-/* reasonable guess as to size of 1024 events */
-#define EVENT_BUF_LEN        (EVENT_MAX * EVENT_SIZE)

 #define BUF_SIZE 256
 #define TST_TOTAL 9
@@ -37,9 +34,7 @@ static char fname[BUF_SIZE];
 static char sname[BUF_SIZE];
 static char dir[BUF_SIZE];
 static int fd_notify;
-
-static int len;
-static char event_buf[EVENT_BUF_LEN];
+static char event_buf[EVENT_SIZE];

 static char *expect_str_fail(int expect)
 {
@@ -104,16 +99,12 @@ static void open_dir(char *file)

 static void verify_event(int mask)
 {
-	int ret;
 	struct fanotify_event_metadata *event;
 	struct stat st;

 	/* Read the event */
-	ret = SAFE_READ(0, fd_notify, event_buf + len,
-			EVENT_BUF_LEN - len);
-	event = (struct fanotify_event_metadata *)&event_buf[len];
-	len += ret;
-
+	SAFE_READ(0, fd_notify, event_buf, EVENT_SIZE);
+	event = (struct fanotify_event_metadata *)&event_buf;
 	if (event->mask != FAN_OPEN) {
 		tst_res(TFAIL, "got unexpected event %llx",
 			(unsigned long long)event->mask);
@@ -146,11 +137,11 @@ static void verify_no_event(void)
 {
 	int ret;

-	ret = read(fd_notify, event_buf + len, EVENT_BUF_LEN - len);
+	ret = read(fd_notify, event_buf, EVENT_SIZE);
 	if (ret != -1) {
 		struct fanotify_event_metadata *event;

-		event = (struct fanotify_event_metadata *)&event_buf[len];
+		event = (struct fanotify_event_metadata *)&event_buf;
 		tst_res(TFAIL, "seen unexpected event (mask %llx)",
 			(unsigned long long)event->mask);
 		/* Cleanup fd from the event */
@@ -158,7 +149,7 @@ static void verify_no_event(void)
 			SAFE_CLOSE(event->fd);
 	} else if (errno != EAGAIN) {
 		tst_res(TFAIL | TERRNO, "read(%d, buf, %zu) failed", fd_notify,
-			EVENT_BUF_LEN);
+			EVENT_SIZE);
 	} else {
 		tst_res(TPASS, "No event as expected");
 	}
--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
