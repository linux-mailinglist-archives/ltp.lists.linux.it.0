Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F981B1F34
	for <lists+linux-ltp@lfdr.de>; Tue, 21 Apr 2020 08:50:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7067C3C62A1
	for <lists+linux-ltp@lfdr.de>; Tue, 21 Apr 2020 08:50:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 98C6D3C29B3
 for <ltp@lists.linux.it>; Tue, 21 Apr 2020 08:50:13 +0200 (CEST)
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 3234A600EA0
 for <ltp@lists.linux.it>; Tue, 21 Apr 2020 08:50:13 +0200 (CEST)
Received: by mail-wr1-x442.google.com with SMTP id k13so13927693wrw.7
 for <ltp@lists.linux.it>; Mon, 20 Apr 2020 23:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Nc9N6WE9csRzBQKfMz2lT3zMXF5sdnWyyEY5X7hmii4=;
 b=AGVp8ojoI0QYvPV+mFcRVDNrajINalsmeRRdeNR5tGqrHRQE8vzfd3e1Fb5BxW6Nrs
 JqgPIB3Om3A5vZgDoRiS9UUcI7F/7Hmb6fzMnXXkEV2w8FZnPp4JsszO2ZAMmSdKUz47
 NTpD0VdHMvV8XGUu+j5DqtaqFnjn5AgR5b2bWYfnptbDiY/urez5wUXfo0B0r/MDysgG
 GHopuPQe166mJUlDo2VMOEec5bQEqevpmeEl7DWNWJAf2pwx5yuJGjaLspfm81GH+2tZ
 B2WB/V+f3dEvrvnuOo5Dy5SX0PBa+vBAEfyF4XrxLlRBlakHsnOSkxbtdtmcK4+B2Fgr
 jgPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Nc9N6WE9csRzBQKfMz2lT3zMXF5sdnWyyEY5X7hmii4=;
 b=PIQV4tPVfCW0PYNELL+qqtcxSih+6Uxsd6kBip4E7w/RiFK4TiHuK6I+25y+/d0hit
 aMR1M2MMh7WagvG5izsVdxgrm+ynMLN2XrsEFOqOqerK90ptvR1NJky2/DPn63zQUPiJ
 4KVVQU97C+d3vEBwPfdGUKg4vARYhQkgu/Xu2nR3i/vKUxmdbMbf59YVWPA4z4qdTa2s
 dy7O9Ps2Sr4AWyYmq4MNJI/a6eQgWlC/6UNcoPlR3pDcc0uFOVIujRan0K69PafyVARK
 Q02xLA06IjddJdBAt30nqmAVswY2Mgoihl9Eoivglg3ETqIHj7jXd0p8yOTJIVcsXM6j
 T3og==
X-Gm-Message-State: AGi0PuZu4/FLYRtodQvry7SMWyhIM8M+4VNNDRdgGMIku//R8eqCSCmX
 ihf2djLqSwLN7MloDHG3LGU=
X-Google-Smtp-Source: APiQypJwgf3UlsjscNOlzFyv/3UwsgzwkOQpySvSHCNwci7ZcSsd2QDq3a6LowtFET4oCAHdAZl5OA==
X-Received: by 2002:adf:fad0:: with SMTP id a16mr24869010wrs.149.1587451812783; 
 Mon, 20 Apr 2020 23:50:12 -0700 (PDT)
Received: from localhost.localdomain ([141.226.12.123])
 by smtp.gmail.com with ESMTPSA id h16sm2698093wrw.36.2020.04.20.23.50.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2020 23:50:12 -0700 (PDT)
From: Amir Goldstein <amir73il@gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
Date: Tue, 21 Apr 2020 09:50:00 +0300
Message-Id: <20200421065002.12417-3-amir73il@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200421065002.12417-1-amir73il@gmail.com>
References: <20200421065002.12417-1-amir73il@gmail.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 2/4] syscalls/fanotify15: Minor corrections
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

- Fix calculation of events buffer size
- Read file events and dir events in two batches
- Generate FAN_MODIFY event explicitly with truncate() operation
  instead of FAN_ATTRIB event implicitly with create() operation
- FAN_MODIFY and FAN_DELETE_SELF may or may not be merged

Signed-off-by: Amir Goldstein <amir73il@gmail.com>
---
 .../kernel/syscalls/fanotify/fanotify15.c     | 58 ++++++++++++++-----
 1 file changed, 42 insertions(+), 16 deletions(-)

diff --git a/testcases/kernel/syscalls/fanotify/fanotify15.c b/testcases/kernel/syscalls/fanotify/fanotify15.c
index e0d513025..454441bfe 100644
--- a/testcases/kernel/syscalls/fanotify/fanotify15.c
+++ b/testcases/kernel/syscalls/fanotify/fanotify15.c
@@ -25,8 +25,14 @@
 #if defined(HAVE_SYS_FANOTIFY_H)
 #include <sys/fanotify.h>
 
-#define BUF_SIZE 256
-#define EVENT_MAX 256
+#define EVENT_MAX 10
+
+/* Size of the event structure, not including file handle */
+#define EVENT_SIZE (sizeof(struct fanotify_event_metadata) + \
+		    sizeof(struct fanotify_event_info_fid))
+/* Double events buffer size to account for file handles */
+#define EVENT_BUF_LEN (EVENT_MAX * EVENT_SIZE * 2)
+
 
 #define MOUNT_POINT "mntpoint"
 #define TEST_DIR MOUNT_POINT"/test_dir"
@@ -44,7 +50,7 @@ struct event_t {
 };
 
 static int fanotify_fd;
-static char events_buf[BUF_SIZE];
+static char events_buf[EVENT_BUF_LEN];
 static struct event_t event_set[EVENT_MAX];
 
 static void do_test(void)
@@ -55,23 +61,24 @@ static void do_test(void)
 	struct fanotify_event_metadata *metadata;
 	struct fanotify_event_info_fid *event_fid;
 
+
 	if (fanotify_mark(fanotify_fd, FAN_MARK_ADD | FAN_MARK_FILESYSTEM,
-				FAN_CREATE | FAN_DELETE | FAN_ATTRIB |
-				FAN_MOVED_FROM | FAN_MOVED_TO |
-				FAN_DELETE_SELF | FAN_ONDIR,
+				FAN_CREATE | FAN_DELETE | FAN_MOVE |
+				FAN_MODIFY | FAN_DELETE_SELF | FAN_ONDIR,
 				AT_FDCWD, TEST_DIR) == -1) {
 		if (errno == ENODEV)
 			tst_brk(TCONF,
 				"FAN_REPORT_FID not supported on %s "
 				"filesystem", tst_device->fs_type);
 		tst_brk(TBROK | TERRNO,
-			"fanotify_mark(%d, FAN_MARK_ADD, FAN_CREATE | "
-			"FAN_DELETE | FAN_MOVED_FROM | FAN_MOVED_TO | "
-			"FAN_DELETE_SELF | FAN_ONDIR, AT_FDCWD, %s) failed",
+			"fanotify_mark(%d, FAN_MARK_ADD | FAN_MARK_FILESYSTEM, "
+			"FAN_CREATE | FAN_DELETE | FAN_MOVE | "
+			"FAN_MODIFY | FAN_DELETE_SELF | FAN_ONDIR, "
+			"AT_FDCWD, %s) failed",
 			fanotify_fd, TEST_DIR);
 	}
 
-	/* Generate a sequence of events */
+	/* All dirent events on testdir are merged */
 	event_set[count].mask = FAN_CREATE | FAN_MOVED_FROM | FAN_MOVED_TO | \
 				FAN_DELETE;
 	event_set[count].handle.handle_bytes = MAX_HANDLE_SZ;
@@ -82,9 +89,22 @@ static void do_test(void)
 	fd = SAFE_CREAT(FILE1, 0644);
 	SAFE_CLOSE(fd);
 
+	/*
+	 * Event on child file is not merged with dirent events.
+	 */
+	event_set[count].mask = FAN_MODIFY;
+	event_set[count].handle.handle_bytes = MAX_HANDLE_SZ;
+	fanotify_get_fid(FILE1, &event_set[count].fsid,
+			 &event_set[count].handle);
+	count++;
+
+	SAFE_TRUNCATE(FILE1, 1);
 	SAFE_RENAME(FILE1, FILE2);
 
-	event_set[count].mask = FAN_ATTRIB | FAN_DELETE_SELF;
+	/*
+	 * FAN_DELETE_SELF may be merged with FAN_MODIFY event above.
+	 */
+	event_set[count].mask = FAN_DELETE_SELF;
 	event_set[count].handle.handle_bytes = MAX_HANDLE_SZ;
 	fanotify_get_fid(FILE2, &event_set[count].fsid,
 			 &event_set[count].handle);
@@ -92,6 +112,9 @@ static void do_test(void)
 
 	SAFE_UNLINK(FILE2);
 
+	/* Read file events from the event queue */
+	len = SAFE_READ(0, fanotify_fd, events_buf, EVENT_BUF_LEN);
+
 	/*
 	 * Generate a sequence of events on a directory. Subsequent events
 	 * are merged, so it's required that we set FAN_ONDIR once in
@@ -118,13 +141,12 @@ static void do_test(void)
 
 	SAFE_RMDIR(DIR2);
 
-	/* Read events from the event queue */
-	len = SAFE_READ(0, fanotify_fd, events_buf, BUF_SIZE);
+	/* Read dir events from the event queue */
+	len += SAFE_READ(0, fanotify_fd, events_buf + len, EVENT_BUF_LEN - len);
 
 	/* Process each event in buffer */
 	for (i = 0, metadata = (struct fanotify_event_metadata *) events_buf;
-		FAN_EVENT_OK(metadata, len);
-		metadata = FAN_EVENT_NEXT(metadata,len), i++) {
+		FAN_EVENT_OK(metadata, len); i++) {
 		event_fid = (struct fanotify_event_info_fid *) (metadata + 1);
 		event_file_handle = (struct file_handle *) event_fid->handle;
 
@@ -141,7 +163,7 @@ static void do_test(void)
 				"Received unexpected file descriptor %d in "
 				"event. Expected to get FAN_NOFD(%d)",
 				metadata->fd, FAN_NOFD);
-		} else if (metadata->mask != event_set[i].mask) {
+		} else if (!(metadata->mask & event_set[i].mask)) {
 			tst_res(TFAIL,
 				"Got event: mask=%llx (expected %llx) "
 				"pid=%u fd=%d",
@@ -197,6 +219,10 @@ static void do_test(void)
 				*(unsigned long *)
 				event_file_handle->f_handle);
 		}
+		metadata->mask  &= ~event_set[i].mask;
+		/* No events left in current mask? Go for next event */
+		if (metadata->mask == 0)
+			metadata = FAN_EVENT_NEXT(metadata, len);
 	}
 
 	for (; i < count; i++)
-- 
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
