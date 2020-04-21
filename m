Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DBBF51B1F35
	for <lists+linux-ltp@lfdr.de>; Tue, 21 Apr 2020 08:50:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7FF5C3C29A1
	for <lists+linux-ltp@lfdr.de>; Tue, 21 Apr 2020 08:50:46 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id E70393C29CA
 for <ltp@lists.linux.it>; Tue, 21 Apr 2020 08:50:14 +0200 (CEST)
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 80C13600CE6
 for <ltp@lists.linux.it>; Tue, 21 Apr 2020 08:50:14 +0200 (CEST)
Received: by mail-wm1-x341.google.com with SMTP id y24so2329218wma.4
 for <ltp@lists.linux.it>; Mon, 20 Apr 2020 23:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Vizo/7h+DNIo+oYns++2GWC3GgmSkwVcEsnXQ7O1hko=;
 b=kIcweVz/hi12KgeoUdMzJJ1uaGWGQdGqA9jRzZ7bKsRnRX5YRwwVxclvSajpLykPBz
 d42pp/x6+FmcLUPhu3GO52+GzmcxMOukPozA4lwYS0NE+Hjv1y7xNq0sE3MrC6y1ZqDZ
 hQlnVaK+FsQVbdgd2eC3CN4tSzQSgeXYYeyZz5VmcayG924IArpem6f/AllWGKXpkdcM
 KFKt/A43gzNoxVH7rP5sg7HSzJRG38T5vsWHdqcERrOdm8G7KFfqHXvyEqj/uUcSGfot
 niW/zVIAV7GZ22pgOflSR4/F1XUlBpAcUCAjg4FnGUosJrCZVF6chVfF1EnProiSbckj
 8xaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Vizo/7h+DNIo+oYns++2GWC3GgmSkwVcEsnXQ7O1hko=;
 b=I28m/kqpZVbnSc93zmhIVeNXoHh6Tv57kX0fg5w2B0zkX+B7MXE7y8XteNwQSpDLzm
 gOBeKNjFtzfBorzIaJFNgLcg7pkrBEUNfUHc/tV0rI4++XU36UmrzuqMvGOfY+4ZQwSS
 JBSWqMjwrdIX13YJkZGHzv5BgkMpxdw7NhBHfnRD27dko3M9pA1VI7Tgwn91l7rWVmmG
 w2DuGxwitiXIugaJWRMh8mo1EajNafscryY2wL1sI9fSsJ+BTC4C0IJ7YkHmYcRXO7lT
 tDXVJVzlxqIZawcwwANMk1mpnaIot8YQwbh1TOA/bBBIWRjdDclFW9sfNvifk+3n72Hc
 nAbA==
X-Gm-Message-State: AGi0PuauArFjN4T1PpX6/eTBLnJcoAra/1rnBYZN3HLP5zphGg5unGXG
 FAuSyBcIRjnYxxE/1wcOHm4=
X-Google-Smtp-Source: APiQypKFeOJ4ZL+D/u5VXorbPFk3uUYLofnjibuNB/+wjv1+WkcEiugPTCbOsFAYV2QCg3fYG8Vgyw==
X-Received: by 2002:a1c:3985:: with SMTP id g127mr3339770wma.102.1587451814049; 
 Mon, 20 Apr 2020 23:50:14 -0700 (PDT)
Received: from localhost.localdomain ([141.226.12.123])
 by smtp.gmail.com with ESMTPSA id h16sm2698093wrw.36.2020.04.20.23.50.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2020 23:50:13 -0700 (PDT)
From: Amir Goldstein <amir73il@gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
Date: Tue, 21 Apr 2020 09:50:01 +0300
Message-Id: <20200421065002.12417-4-amir73il@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200421065002.12417-1-amir73il@gmail.com>
References: <20200421065002.12417-1-amir73il@gmail.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 3/4] syscalls/fanotify15: Add a test case for inode
 marks
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
Cc: Matthew Bobrowski <mbobrowski@mbobrowski.org>, Jan Kara <jack@suse.cz>,
 ltp@lists.linux.it
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Test reporting events with fid also with recusrive inode marks:
- Test events "on self" (FAN_DELETE_SELF) on file and dir
- Test events "on child" (FAN_MODIFY) on file

With recursive inode marks, verify that the FAN_MODIFY event reported
to parent "on child" is merged with the FAN_MODIFY event reported to
child.

The new test case is a regression test for commit f367a62a7cad:

    fanotify: merge duplicate events on parent and child

Signed-off-by: Amir Goldstein <amir73il@gmail.com>
---
 .../kernel/syscalls/fanotify/fanotify15.c     | 76 +++++++++++++++++--
 1 file changed, 69 insertions(+), 7 deletions(-)

diff --git a/testcases/kernel/syscalls/fanotify/fanotify15.c b/testcases/kernel/syscalls/fanotify/fanotify15.c
index 454441bfe..bb1069139 100644
--- a/testcases/kernel/syscalls/fanotify/fanotify15.c
+++ b/testcases/kernel/syscalls/fanotify/fanotify15.c
@@ -9,6 +9,10 @@
  *	Test file that has been purposely designed to verify
  *	FAN_REPORT_FID functionality while using newly defined dirent
  *	events.
+ *
+ * Test case #1 is a regression test for commit f367a62a7cad:
+ *
+ *      fanotify: merge duplicate events on parent and child
  */
 #define _GNU_SOURCE
 #include "config.h"
@@ -53,29 +57,51 @@ static int fanotify_fd;
 static char events_buf[EVENT_BUF_LEN];
 static struct event_t event_set[EVENT_MAX];
 
-static void do_test(void)
+static struct test_case_t {
+	struct fanotify_mark_type mark;
+	unsigned long mask;
+} test_cases[] = {
+	{
+		/* Watch filesystem including events "on self" */
+		INIT_FANOTIFY_MARK_TYPE(FILESYSTEM),
+		FAN_DELETE_SELF,
+	},
+	{
+		/* Watch directory including events "on children" */
+		INIT_FANOTIFY_MARK_TYPE(INODE),
+		FAN_EVENT_ON_CHILD,
+	},
+};
+
+static void do_test(unsigned int number)
 {
 	int i, fd, len, count = 0;
 
 	struct file_handle *event_file_handle;
 	struct fanotify_event_metadata *metadata;
 	struct fanotify_event_info_fid *event_fid;
+	struct test_case_t *tc = &test_cases[number];
+	struct fanotify_mark_type *mark = &tc->mark;
 
+	tst_res(TINFO,
+		"Test #%d: FAN_REPORT_FID with mark type: %s",
+		number, mark->name);
 
-	if (fanotify_mark(fanotify_fd, FAN_MARK_ADD | FAN_MARK_FILESYSTEM,
+
+	if (fanotify_mark(fanotify_fd, FAN_MARK_ADD | mark->flag, tc->mask |
 				FAN_CREATE | FAN_DELETE | FAN_MOVE |
-				FAN_MODIFY | FAN_DELETE_SELF | FAN_ONDIR,
+				FAN_MODIFY | FAN_ONDIR,
 				AT_FDCWD, TEST_DIR) == -1) {
 		if (errno == ENODEV)
 			tst_brk(TCONF,
 				"FAN_REPORT_FID not supported on %s "
 				"filesystem", tst_device->fs_type);
 		tst_brk(TBROK | TERRNO,
-			"fanotify_mark(%d, FAN_MARK_ADD | FAN_MARK_FILESYSTEM, "
+			"fanotify_mark(%d, FAN_MARK_ADD | %s, "
 			"FAN_CREATE | FAN_DELETE | FAN_MOVE | "
-			"FAN_MODIFY | FAN_DELETE_SELF | FAN_ONDIR, "
+			"FAN_MODIFY | FAN_ONDIR, "
 			"AT_FDCWD, %s) failed",
-			fanotify_fd, TEST_DIR);
+			fanotify_fd, mark->name, TEST_DIR);
 	}
 
 	/* All dirent events on testdir are merged */
@@ -89,8 +115,21 @@ static void do_test(void)
 	fd = SAFE_CREAT(FILE1, 0644);
 	SAFE_CLOSE(fd);
 
+	/* Recursive watch file for events "on self" */
+	if (mark->flag == FAN_MARK_INODE &&
+	    fanotify_mark(fanotify_fd, FAN_MARK_ADD | mark->flag,
+			  FAN_MODIFY | FAN_DELETE_SELF,
+			  AT_FDCWD, FILE1) == -1) {
+		tst_brk(TBROK | TERRNO,
+			"fanotify_mark(%d, FAN_MARK_ADD | %s, "
+			"FAN_DELETE_SELF, AT_FDCWD, %s) failed",
+			fanotify_fd, mark->name, FILE1);
+	}
+
 	/*
 	 * Event on child file is not merged with dirent events.
+	 * FAN_MODIFY event reported on file mark should be merged with the
+	 * FAN_MODIFY event reported on parent directory watch.
 	 */
 	event_set[count].mask = FAN_MODIFY;
 	event_set[count].handle.handle_bytes = MAX_HANDLE_SZ;
@@ -131,6 +170,17 @@ static void do_test(void)
 
 	SAFE_MKDIR(DIR1, 0755);
 
+	/* Recursive watch subdir for events "on self" */
+	if (mark->flag == FAN_MARK_INODE &&
+	    fanotify_mark(fanotify_fd, FAN_MARK_ADD | mark->flag,
+			  FAN_DELETE_SELF | FAN_ONDIR,
+			  AT_FDCWD, DIR1) == -1) {
+		tst_brk(TBROK | TERRNO,
+			"fanotify_mark(%d, FAN_MARK_ADD | %s,"
+			"FAN_DELETE_SELF | FAN_ONDIR, AT_FDCWD, %s) failed",
+			fanotify_fd, mark->name, DIR1);
+	}
+
 	SAFE_RENAME(DIR1, DIR2);
 
 	event_set[count].mask = FAN_ONDIR | FAN_DELETE_SELF;
@@ -144,6 +194,17 @@ static void do_test(void)
 	/* Read dir events from the event queue */
 	len += SAFE_READ(0, fanotify_fd, events_buf + len, EVENT_BUF_LEN - len);
 
+	/*
+	 * Cleanup the mark
+	 */
+	if (fanotify_mark(fanotify_fd, FAN_MARK_FLUSH | mark->flag, 0,
+			  AT_FDCWD, TEST_DIR) < 0) {
+		tst_brk(TBROK | TERRNO,
+			"fanotify_mark (%d, FAN_MARK_FLUSH | %s, 0,"
+			"AT_FDCWD, '"TEST_DIR"') failed",
+			fanotify_fd, mark->name);
+	}
+
 	/* Process each event in buffer */
 	for (i = 0, metadata = (struct fanotify_event_metadata *) events_buf;
 		FAN_EVENT_OK(metadata, len); i++) {
@@ -262,7 +323,8 @@ static struct tst_test test = {
 	.mount_device = 1,
 	.mntpoint = MOUNT_POINT,
 	.all_filesystems = 1,
-	.test_all = do_test,
+	.test = do_test,
+	.tcnt = ARRAY_SIZE(test_cases),
 	.setup = do_setup,
 	.cleanup = do_cleanup
 };
-- 
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
