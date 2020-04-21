Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 699D91B1F32
	for <lists+linux-ltp@lfdr.de>; Tue, 21 Apr 2020 08:50:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EE9843C29CB
	for <lists+linux-ltp@lfdr.de>; Tue, 21 Apr 2020 08:50:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 59AC33C2994
 for <ltp@lists.linux.it>; Tue, 21 Apr 2020 08:50:12 +0200 (CEST)
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id F32F7600EA0
 for <ltp@lists.linux.it>; Tue, 21 Apr 2020 08:50:11 +0200 (CEST)
Received: by mail-wr1-x444.google.com with SMTP id s10so5980456wrr.0
 for <ltp@lists.linux.it>; Mon, 20 Apr 2020 23:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Y8WZ76d/ZzoqUnjeRyaGKZ3m3YW2udWjlvXOXDdAOZ0=;
 b=J+QgF/bqla9cvsKzSQQ7PS5buIby02is0HCONBXevtr90GZ4++ROl8aoMk3npLwg3d
 J0MIg2IfJFE3T83EzigWSXiCuPxN464Y5QBpd1TzWI3nI9A5EWx94NF+OXPjGINQm7js
 ABnJLSLymJxLs+KjaWbcxNAqYTBo8vb2hXumfhC+m3LXS2YpBU8v/ZIQtatVvHB+QgEM
 FdE3g92hqMj1Br07cwcMzZC9/4OYwVxF6TnkgT/QrvZUcOhZLBJYJqgzWrWTmExFXYLx
 ner7NRSkD9EyW1OEV2TOhqCRu9qj3JzkfRZG8xSH8TGd6i4pWCNK3G19CHrMFydK5tUy
 3D7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Y8WZ76d/ZzoqUnjeRyaGKZ3m3YW2udWjlvXOXDdAOZ0=;
 b=qjE+oQxxLF5JTTfcsl5iact7xOAmlOYXZWU+yzc2SnkZZH2pteaxYnjP6El8H8RJ3H
 rze9j0fUjnvBFmzNeA9DlKhLTo+0lzpzrIzV+y4FMgvhbHoVxtddkLJEOT2LMqktv9Bn
 PqcvBGeyfwf59/F7SpJDk1djF/k3Q0EO1oDxe++gChdNYDff2xd50IlT/VhxDikRXKMm
 94k5LL5fuXivR9ss+E7PqOJksAhV/R3kse/Ru9VmeqoHJrBpM778BP2NZZXtqzd15ivb
 84JzbVmIZKiBa0bgML6NoUH/qxp5FGd+8q/BHeEZY9yWYscaXUAV5MRyaexoKl2/gyjn
 S8yQ==
X-Gm-Message-State: AGi0PuZ4LYMwbXwRRos9NvXJBoW5TQkKtU3E0FjdrFzHigmATgunXP+6
 2+jOgk2BNg6vgr5XcF9xngo=
X-Google-Smtp-Source: APiQypKQHGFsZ98UKFXq0XgaTpF5vx6RFTIuj6n0ePsHFoADheJ3jSyu9dzPmlshWxICSKIfipz9nQ==
X-Received: by 2002:a5d:6a04:: with SMTP id m4mr24064141wru.326.1587451811578; 
 Mon, 20 Apr 2020 23:50:11 -0700 (PDT)
Received: from localhost.localdomain ([141.226.12.123])
 by smtp.gmail.com with ESMTPSA id h16sm2698093wrw.36.2020.04.20.23.50.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2020 23:50:11 -0700 (PDT)
From: Amir Goldstein <amir73il@gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
Date: Tue, 21 Apr 2020 09:49:59 +0300
Message-Id: <20200421065002.12417-2-amir73il@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200421065002.12417-1-amir73il@gmail.com>
References: <20200421065002.12417-1-amir73il@gmail.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 1/4] syscalls/fanotify09: Check merging of events on
 directories
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

In a setup of mount mark and directory inode mark the FAN_ONDIR flag
set on one mark should not imply that all events in the other mark mask
are expected on directories as well.

Add a regression test case for commit 55bf882c7f13:
   fanotify: fix merging marks masks with FAN_ONDIR

Signed-off-by: Amir Goldstein <amir73il@gmail.com>
---
 .../kernel/syscalls/fanotify/fanotify09.c     | 46 +++++++++++++------
 1 file changed, 32 insertions(+), 14 deletions(-)

diff --git a/testcases/kernel/syscalls/fanotify/fanotify09.c b/testcases/kernel/syscalls/fanotify/fanotify09.c
index 0f6a9e864..68a4e5081 100644
--- a/testcases/kernel/syscalls/fanotify/fanotify09.c
+++ b/testcases/kernel/syscalls/fanotify/fanotify09.c
@@ -15,6 +15,10 @@
  * Test case #2 is a regression test for commit b469e7e47c8a:
  *
  *      fanotify: fix handling of events on child sub-directory
+ *
+ * Test case #3 is a regression test for commit 55bf882c7f13:
+ *
+ *      fanotify: fix merging marks masks with FAN_ONDIR
  */
 #define _GNU_SOURCE
 #include "config.h"
@@ -57,16 +61,25 @@ static int mount_created;
 static struct tcase {
 	const char *tname;
 	unsigned int ondir;
+	const char *testdir;
 	int nevents;
 } tcases[] = {
 	{
 		"Events on children with both inode and mount marks",
 		0,
+		DIR_NAME,
 		1,
 	},
 	{
 		"Events on children and subdirs with both inode and mount marks",
 		FAN_ONDIR,
+		DIR_NAME,
+		2,
+	},
+	{
+		"Events on files and dirs with both inode and mount marks",
+		FAN_ONDIR,
+		".",
 		2,
 	},
 };
@@ -125,6 +138,20 @@ static void cleanup_fanotify_groups(void)
 	}
 }
 
+static void event_res(int ttype, int group,
+		      struct fanotify_event_metadata *event)
+{
+	int len;
+	sprintf(symlnk, "/proc/self/fd/%d", event->fd);
+	len = readlink(symlnk, fdpath, sizeof(fdpath));
+	if (len < 0)
+		len = 0;
+	fdpath[len] = 0;
+	tst_res(ttype, "group %d got event: mask %llx pid=%u fd=%d path=%s",
+		group, (unsigned long long)event->mask,
+		(unsigned)event->pid, event->fd, fdpath);
+}
+
 static void verify_event(int group, struct fanotify_event_metadata *event,
 			 uint32_t expect)
 {
@@ -139,15 +166,7 @@ static void verify_event(int group, struct fanotify_event_metadata *event,
 			(unsigned long long)event->mask, (unsigned)event->pid,
 			(unsigned)getpid(), event->fd);
 	} else {
-		int len;
-		sprintf(symlnk, "/proc/self/fd/%d", event->fd);
-		len = readlink(symlnk, fdpath, sizeof(fdpath));
-		if (len < 0)
-			len = 0;
-		fdpath[len] = 0;
-		tst_res(TPASS, "group %d got event: mask %llx pid=%u fd=%d path=%s",
-			group, (unsigned long long)event->mask,
-			(unsigned)event->pid, event->fd, fdpath);
+		event_res(TPASS, group, event);
 	}
 }
 
@@ -167,9 +186,9 @@ static void test_fanotify(unsigned int n)
 	 */
 	SAFE_FILE_PRINTF(fname, "1");
 	/*
-	 * generate FAN_CLOSE_NOWRITE event on a child subdir.
+	 * generate FAN_CLOSE_NOWRITE event on a testdir (subdir or ".")
 	 */
-	dirfd = SAFE_OPEN(DIR_NAME, O_RDONLY);
+	dirfd = SAFE_OPEN(tc->testdir, O_RDONLY);
 	if (dirfd >= 0)
 		SAFE_CLOSE(dirfd);
 
@@ -210,13 +229,12 @@ static void test_fanotify(unsigned int n)
 
 	/*
 	 * Then verify the rest of the groups did not get the MODIFY event and
-	 * did not get the FAN_CLOSE_NOWRITE event on subdir.
+	 * did not get the FAN_CLOSE_NOWRITE event on testdir.
 	 */
 	for (i = 1; i < NUM_GROUPS; i++) {
 		ret = read(fd_notify[i], event_buf, FAN_EVENT_METADATA_LEN);
 		if (ret > 0) {
-			tst_res(TFAIL, "group %d got event", i);
-			verify_event(i, event, FAN_CLOSE_NOWRITE);
+			event_res(TFAIL, i, event);
 			if (event->fd != FAN_NOFD)
 				SAFE_CLOSE(event->fd);
 			continue;
-- 
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
