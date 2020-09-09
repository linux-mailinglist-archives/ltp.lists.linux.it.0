Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A45B263525
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Sep 2020 19:57:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 521FA3C2C0E
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Sep 2020 19:57:47 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 8A2DA3C2C43
 for <ltp@lists.linux.it>; Wed,  9 Sep 2020 19:57:20 +0200 (CEST)
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 1987A1A00E3A
 for <ltp@lists.linux.it>; Wed,  9 Sep 2020 19:57:20 +0200 (CEST)
Received: by mail-wr1-x444.google.com with SMTP id x14so3884595wrl.12
 for <ltp@lists.linux.it>; Wed, 09 Sep 2020 10:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=I2/TEQ3hdW1F8PkxGJQDHzwgXbLG3e9+AmpyMNd2k0w=;
 b=s6t3zAZ7FpyWvchq09EO3fUzz1/23e0KHQNgeNkqZR5B7lcDYiBIApo7f4YCHPCCcy
 CGaIM0eaCEkq9tCLx/zqgNG2l+lC13VbRAwMrN+gybCOi6ojxwiN1JQWwbNBgJQa0EBY
 xoaxeCiX5GOXDMTM17az/nq5A6bVn0DvWJa0wOjO8ScUZMpiqz7nYwGhTwWXcZmqfMnG
 cVZTXvVM0+NmoYQocioMGmr+oTL9UEniM9taZaJTlXCXzsY7JDzAg0E7IdulDea0bbAz
 sP/iUNA+LfCYLepVTZUNbMi2hx3C47AdSoyJ6tGPzxK1e53TkV1OJGXuU7kD41j9QOY+
 z/Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=I2/TEQ3hdW1F8PkxGJQDHzwgXbLG3e9+AmpyMNd2k0w=;
 b=lXwN1iF298ySjDPmbU/2VbABOLF63ygqwYIXHgCDWH7RWZai3WXbtEgXyFc0RtM8ie
 4r8anl4tgWIrRIXD4Kk/p/G4pnVRYOUi1hoIsKYBaBFhRQKd1YPY5QdxSPiEom+hIwSd
 bh7Q5F+67MiD66oiy7ertVEzlRnfKnQt3HwtftfR59kIKSo40BPl32K43C4SHdyszUdB
 N/2vyapVrQfc7uEZGVdI3XMDFpieEseDWW0iFUiqEV+ocyN8Z76e9ZHYMaRsvdBNs22N
 iD/l0M+O4JHi1N1i3whhLNtVI8H1TvQGLN/u3XWmuBwTdJF2cPOIqZd6xg4ErnasnGmt
 UTaw==
X-Gm-Message-State: AOAM531NqTq5fZyrmp/VFforkJhYl4Ie23YPhBwBegLOiwzMmiXZu3ap
 M92M3fQ7ulb+DXSXo6LSP7k=
X-Google-Smtp-Source: ABdhPJzqiUlZ7BCc6qQTm2dvi2MzdIYTQXcDcg9PnH95T7ECYNc5Sv/+BQfohPzvDZxv3fm//cQRiA==
X-Received: by 2002:adf:a35d:: with SMTP id d29mr4997933wrb.307.1599674239320; 
 Wed, 09 Sep 2020 10:57:19 -0700 (PDT)
Received: from localhost.localdomain ([141.226.8.56])
 by smtp.gmail.com with ESMTPSA id z83sm4979714wmb.4.2020.09.09.10.57.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2020 10:57:18 -0700 (PDT)
From: Amir Goldstein <amir73il@gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Date: Wed,  9 Sep 2020 20:57:00 +0300
Message-Id: <20200909175707.10670-4-amir73il@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200909175707.10670-1-amir73il@gmail.com>
References: <20200909175707.10670-1-amir73il@gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 03/10] syscalls/fanotify16: Test more event types with
 name
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
Cc: Jan Kara <jack@suse.cz>, ltp@lists.linux.it
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

- Test events "on child" reported with name
- Test events on directory itself reported with name "."
- Test move self event on directory and file

Events open/close are not supported on filesystem mark, so they are set
on either a subdir inode mark or mount mark.

Events "on child" may or may not be merged with directory modification
events with same file name, depending on group init flags, so relax the
exact check to event mask and instead, just expect that all execpted
event types will arrive.

Signed-off-by: Amir Goldstein <amir73il@gmail.com>
---
 .../kernel/syscalls/fanotify/fanotify16.c     | 102 +++++++++++++-----
 1 file changed, 77 insertions(+), 25 deletions(-)

diff --git a/testcases/kernel/syscalls/fanotify/fanotify16.c b/testcases/kernel/syscalls/fanotify/fanotify16.c
index f3fbd3bc0..76f053fd7 100644
--- a/testcases/kernel/syscalls/fanotify/fanotify16.c
+++ b/testcases/kernel/syscalls/fanotify/fanotify16.c
@@ -5,8 +5,8 @@
  * Started by Amir Goldstein <amir73il@gmail.com>
  *
  * DESCRIPTION
- *     Check fanotify directory entry modification events with group
- *     init flags FAN_REPORT_DFID_NAME (dir fid + name)
+ *     Check fanotify directory entry modification events, events on child and
+ *     on self with group init flags FAN_REPORT_DFID_NAME (dir fid + name)
  */
 #define _GNU_SOURCE
 #include "config.h"
@@ -25,7 +25,7 @@
 #if defined(HAVE_SYS_FANOTIFY_H)
 #include <sys/fanotify.h>
 
-#define EVENT_MAX 10
+#define EVENT_MAX 20
 
 /* Size of the event structure, not including file handle */
 #define EVENT_SIZE (sizeof(struct fanotify_event_metadata) + \
@@ -66,29 +66,29 @@ static struct test_case_t {
 	unsigned long sub_mask;
 } test_cases[] = {
 	{
-		/* Filesystem watch for directory entry modification events */
-		"FAN_REPORT_DFID_NAME monitor filesystem for create/delete/move",
+		"FAN_REPORT_DFID_NAME monitor filesystem for create/delete/move/open/close",
 		INIT_FANOTIFY_GROUP_TYPE(REPORT_DFID_NAME),
 		INIT_FANOTIFY_MARK_TYPE(FILESYSTEM),
-		FAN_CREATE | FAN_DELETE| FAN_MOVE | FAN_DELETE_SELF | FAN_ONDIR,
-		{},
-		0,
+		FAN_CREATE | FAN_DELETE | FAN_MOVE | FAN_DELETE_SELF | FAN_MOVE_SELF | FAN_ONDIR,
+		/* Mount watch for events possible on children */
+		INIT_FANOTIFY_MARK_TYPE(MOUNT),
+		FAN_OPEN | FAN_CLOSE | FAN_ONDIR,
 	},
 	{
-		/* Recursive watches for directory entry modification events */
-		"FAN_REPORT_DFID_NAME monitor directories for create/delete/move",
+		"FAN_REPORT_DFID_NAME monitor directories for create/delete/move/open/close",
 		INIT_FANOTIFY_GROUP_TYPE(REPORT_DFID_NAME),
 		INIT_FANOTIFY_MARK_TYPE(INODE),
 		FAN_CREATE | FAN_DELETE | FAN_MOVE | FAN_ONDIR,
-		/* Watches for directory entry modification events on subdir */
+		/* Watches for self events on subdir and events on subdir's children */
 		INIT_FANOTIFY_MARK_TYPE(INODE),
-		FAN_CREATE | FAN_DELETE | FAN_MOVE | FAN_DELETE_SELF | FAN_ONDIR,
+		FAN_CREATE | FAN_DELETE | FAN_MOVE | FAN_DELETE_SELF | FAN_MOVE_SELF | FAN_ONDIR |
+		FAN_OPEN | FAN_CLOSE | FAN_EVENT_ON_CHILD,
 	},
 };
 
 static void do_test(unsigned int number)
 {
-	int fd, len = 0, i = 0, test_num = 0, tst_count = 0;
+	int fd, dirfd, len = 0, i = 0, test_num = 0, tst_count = 0;
 	struct test_case_t *tc = &test_cases[number];
 	struct fanotify_group_type *group = &tc->group;
 	struct fanotify_mark_type *mark = &tc->mark;
@@ -125,8 +125,10 @@ static void do_test(unsigned int number)
 
 	/*
 	 * Create subdir and watch open events "on children" with name.
+	 * Make it a mount root.
 	 */
 	SAFE_MKDIR(dname1, 0755);
+	SAFE_MOUNT(dname1, dname1, "none", MS_BIND, NULL);
 
 	/* Save the subdir fid */
 	fanotify_save_fid(dname1, &dir_fid);
@@ -153,6 +155,7 @@ static void do_test(unsigned int number)
 
 	SAFE_WRITE(1, fd, "1", 1);
 	SAFE_RENAME(fname1, fname2);
+
 	SAFE_CLOSE(fd);
 
 	/* Generate delete events with fname2 */
@@ -168,6 +171,16 @@ static void do_test(unsigned int number)
 	event_set[tst_count].fid = &dir_fid;
 	strcpy(event_set[tst_count].name, FILE_NAME1);
 	tst_count++;
+	/*
+	 * Event on non-dir child with the same name may be merged with the
+	 * directory entry modification events above, unless FAN_REPORT_FID is
+	 * set and child fid is reported.
+	 */
+	event_set[tst_count].mask = FAN_OPEN;
+	event_set[tst_count].fid = &dir_fid;
+	strcpy(event_set[tst_count].name, FILE_NAME1);
+	tst_count++;
+
 	event_set[tst_count].mask = FAN_DELETE | FAN_MOVED_TO;
 	event_set[tst_count].fid = &dir_fid;
 	strcpy(event_set[tst_count].name, FILE_NAME2);
@@ -178,11 +191,37 @@ static void do_test(unsigned int number)
 	 * is set.
 	 */
 	if (mark->flag == FAN_MARK_FILESYSTEM && (group->flag & FAN_REPORT_FID)) {
-		event_set[tst_count].mask = FAN_DELETE_SELF;
+		event_set[tst_count].mask = FAN_DELETE_SELF | FAN_MOVE_SELF;
 		event_set[tst_count].fid = &file_fid;
 		strcpy(event_set[tst_count].name, "");
 		tst_count++;
 	}
+	event_set[tst_count].mask = FAN_CLOSE_WRITE;
+	event_set[tst_count].fid = &dir_fid;
+	strcpy(event_set[tst_count].name, FILE_NAME2);
+	tst_count++;
+
+	dirfd = SAFE_OPEN(dname1, O_RDONLY | O_DIRECTORY);
+	SAFE_CLOSE(dirfd);
+
+	SAFE_UMOUNT(dname1);
+
+	/*
+	 * Directory watch gets open/close events on itself and on its subdirs.
+	 * Filesystem watch gets open/close event on all directories with name ".".
+	 */
+	event_set[tst_count].mask = FAN_OPEN | FAN_CLOSE_NOWRITE | FAN_ONDIR;
+	event_set[tst_count].fid = &dir_fid;
+	strcpy(event_set[tst_count].name, ".");
+	tst_count++;
+	/*
+	 * Directory watch gets self event on itself and filesystem watch gets
+	 * self event on all directories with name ".".
+	 */
+	event_set[tst_count].mask = FAN_DELETE_SELF | FAN_MOVE_SELF | FAN_ONDIR;
+	event_set[tst_count].fid = &dir_fid;
+	strcpy(event_set[tst_count].name, ".");
+	tst_count++;
 
 	SAFE_RENAME(dname1, dname2);
 	SAFE_RMDIR(dname2);
@@ -198,14 +237,8 @@ static void do_test(unsigned int number)
 	event_set[tst_count].fid = &root_fid;
 	strcpy(event_set[tst_count].name, DIR_NAME2);
 	tst_count++;
-	/*
-	 * Directory watch gets self event on itself and filesystem watch gets
-	 * self event on all directories with name ".".
-	 */
-	event_set[tst_count].mask = FAN_DELETE_SELF | FAN_ONDIR;
-	strcpy(event_set[tst_count].name, ".");
-	event_set[tst_count].fid = &dir_fid;
-	tst_count++;
+	/* Expect no more events */
+	event_set[tst_count].mask = 0;
 
 	/*
 	 * Cleanup the marks
@@ -220,7 +253,7 @@ static void do_test(unsigned int number)
 		struct file_handle *file_handle;
 		unsigned int fhlen;
 		const char *filename;
-		int namelen, info_type;
+		int namelen, info_type, mask_match;
 
 		event = (struct fanotify_event_metadata *)&event_buf[i];
 		event_fid = (struct fanotify_event_info_fid *)(event + 1);
@@ -242,6 +275,16 @@ static void do_test(unsigned int number)
 			info_type = FAN_EVENT_INFO_TYPE_DFID;
 		}
 
+		/*
+		 * Event may contain more than the expected mask, but it must
+		 * have all the bits in expected mask.
+		 * Expected event on dir must not get event on non dir and the
+		 * other way around.
+		 */
+		mask_match = ((event->mask & expected->mask) &&
+			      !(expected->mask & ~event->mask) &&
+			      !((event->mask ^ expected->mask) & FAN_ONDIR));
+
 		if (test_num >= tst_count) {
 			tst_res(TFAIL,
 				"got unnecessary event: mask=%llx "
@@ -259,7 +302,7 @@ static void do_test(unsigned int number)
 				(unsigned)event->pid, event->fd,
 				event->event_len, event_fid->hdr.info_type,
 				event_fid->hdr.len, fhlen);
-		} else if (event->mask != expected->mask) {
+		} else if (!mask_match) {
 			tst_res(TFAIL,
 				"got event: mask=%llx (expected %llx) "
 				"pid=%u fd=%d name='%s' "
@@ -356,10 +399,19 @@ static void do_test(unsigned int number)
 				event_fid->hdr.len, fhlen);
 		}
 
+		if (test_num < tst_count)
+			test_num++;
+
+		if (mask_match) {
+			/* In case of merged event match next expected mask */
+			event->mask &= ~expected->mask | FAN_ONDIR;
+			if (event->mask & ~FAN_ONDIR)
+				continue;
+		}
+
 		i += event->event_len;
 		if (event->fd > 0)
 			SAFE_CLOSE(event->fd);
-		test_num++;
 	}
 
 	for (; test_num < tst_count; test_num++) {
-- 
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
