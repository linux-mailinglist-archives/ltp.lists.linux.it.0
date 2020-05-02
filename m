Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B44851C26F6
	for <lists+linux-ltp@lfdr.de>; Sat,  2 May 2020 18:28:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 65B063C58FC
	for <lists+linux-ltp@lfdr.de>; Sat,  2 May 2020 18:28:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 589413C269D
 for <ltp@lists.linux.it>; Sat,  2 May 2020 18:27:53 +0200 (CEST)
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id C5B46200BBE
 for <ltp@lists.linux.it>; Sat,  2 May 2020 18:27:52 +0200 (CEST)
Received: by mail-wr1-x444.google.com with SMTP id j1so15608379wrt.1
 for <ltp@lists.linux.it>; Sat, 02 May 2020 09:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=x4YgmuTlBkVy22v9r/UqczWpq5lYChkFiLWLY5VuspU=;
 b=f39aJNDkTYES2Ko8vLRuny+xkCbs9Wte9Asc441tz0vr/kteHfGe/Jz32DubC7yJak
 +5uxyQAAwINSAJozAx0m8JfV5+kIpKOTnE+3lTmnzKhUiXMGl/RJIAVIP5Rv/DefLkXP
 I0YyaI0bcPe6FGJ/W2IyyB47qkuYwhcH+BMSUjGDM2KO44vdb6LrgO63SAMrQvJlePWh
 acTsZQEWAQk/zg5RnGLkenXUVqKpfbqJrllbVp8K1R4cDh9AmDgcDzPVUrSnsr6UPRqw
 ow9rue1YIVQwoJ+TMRJnFiYR/koQJi+CXmB2EkA/F0Z7qo7wkyoFTC4TIQGeChH3UTkv
 fZNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=x4YgmuTlBkVy22v9r/UqczWpq5lYChkFiLWLY5VuspU=;
 b=Y1QPU+S/GofStuja2NUL0H/RzhPJ+B4fqTSvKYx91HmU1UHTcaZusFn3HQgPHhaigN
 wadehDAmhQ3LbGeugDkWY5doN1NSuM+Hvcn6KmXC9x0zOGZYoVVjLAssZhXXKbI1fNKR
 fJYIxXzHgJHwm6yv61taoNLd9/mstNm8dNgOG91GEu86ptiUSy/WuLnrRNGF/VukIABz
 8iycy7QJ9qNolsdYjbjus13GxkgLqTCS6Nzb+11Pm7Yj14HZZnipNHRyxnKrvWXZBGb1
 Bh397x9nnyLRuJH3H5T8HUJQR4RgDdaTKSjFYwbKWE68csVVC4RLQppICv9aeugjfN3Q
 xiQg==
X-Gm-Message-State: AGi0PuZRa/UJ9UYGKlZKLzmHE14YYOfp6Qkx5lhwjsBOyMlx0uVO8hR5
 D52Lx6dUHF4gxy3xkGWurxo=
X-Google-Smtp-Source: APiQypKKA3xdFx4aXEvRl/KpQ6T12pLgg3Jz6vMaoy92RnzG/EogyFNcl3aPLtky7CP8sjOVceVakA==
X-Received: by 2002:a5d:408b:: with SMTP id o11mr2640404wrp.97.1588436872338; 
 Sat, 02 May 2020 09:27:52 -0700 (PDT)
Received: from localhost.localdomain ([141.226.12.123])
 by smtp.gmail.com with ESMTPSA id n6sm10683053wrs.81.2020.05.02.09.27.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 May 2020 09:27:51 -0700 (PDT)
From: Amir Goldstein <amir73il@gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Date: Sat,  2 May 2020 19:27:41 +0300
Message-Id: <20200502162744.9589-2-amir73il@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200502162744.9589-1-amir73il@gmail.com>
References: <20200502162744.9589-1-amir73il@gmail.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v2 1/4] syscalls/fanotify15: Minor corrections
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
- Use macro FAN_MOVE for FAN_MOVED_FROM | FAN_MOVED_TO

Signed-off-by: Amir Goldstein <amir73il@gmail.com>
Reviewed-by: Petr Vorel <pvorel@suse.cz>
Reviewed-by: Cyril Hrubis <chrubis@suse.cz>
Reviewed-by: Matthew Bobrowski <mbobrowski@mbobrowski.org>
---
 .../kernel/syscalls/fanotify/fanotify15.c     | 63 +++++++++++++------
 1 file changed, 43 insertions(+), 20 deletions(-)

diff --git a/testcases/kernel/syscalls/fanotify/fanotify15.c b/testcases/kernel/syscalls/fanotify/fanotify15.c
index e0d513025..2e860edb2 100644
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
@@ -56,24 +62,23 @@ static void do_test(void)
 	struct fanotify_event_info_fid *event_fid;
 
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
-	event_set[count].mask = FAN_CREATE | FAN_MOVED_FROM | FAN_MOVED_TO | \
-				FAN_DELETE;
+	/* All dirent events on testdir are merged */
+	event_set[count].mask = FAN_CREATE | FAN_MOVE | FAN_DELETE;
 	event_set[count].handle.handle_bytes = MAX_HANDLE_SZ;
 	fanotify_get_fid(TEST_DIR, &event_set[count].fsid,
 			 &event_set[count].handle);
@@ -82,9 +87,22 @@ static void do_test(void)
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
@@ -92,6 +110,9 @@ static void do_test(void)
 
 	SAFE_UNLINK(FILE2);
 
+	/* Read file events from the event queue */
+	len = SAFE_READ(0, fanotify_fd, events_buf, EVENT_BUF_LEN);
+
 	/*
 	 * Generate a sequence of events on a directory. Subsequent events
 	 * are merged, so it's required that we set FAN_ONDIR once in
@@ -99,8 +120,7 @@ static void do_test(void)
 	 * took place. Events on subdirectories are not merged with events
 	 * on non-subdirectories.
 	 */
-	event_set[count].mask = FAN_ONDIR | FAN_CREATE | FAN_MOVED_FROM | \
-				FAN_MOVED_TO | FAN_DELETE;
+	event_set[count].mask = FAN_ONDIR | FAN_CREATE | FAN_MOVE | FAN_DELETE;
 	event_set[count].handle.handle_bytes = MAX_HANDLE_SZ;
 	fanotify_get_fid(TEST_DIR, &event_set[count].fsid,
 			 &event_set[count].handle);
@@ -118,13 +138,12 @@ static void do_test(void)
 
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
 
@@ -141,7 +160,7 @@ static void do_test(void)
 				"Received unexpected file descriptor %d in "
 				"event. Expected to get FAN_NOFD(%d)",
 				metadata->fd, FAN_NOFD);
-		} else if (metadata->mask != event_set[i].mask) {
+		} else if (!(metadata->mask & event_set[i].mask)) {
 			tst_res(TFAIL,
 				"Got event: mask=%llx (expected %llx) "
 				"pid=%u fd=%d",
@@ -197,6 +216,10 @@ static void do_test(void)
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
