Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 130E41C26F8
	for <lists+linux-ltp@lfdr.de>; Sat,  2 May 2020 18:28:26 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B93CE3C5924
	for <lists+linux-ltp@lfdr.de>; Sat,  2 May 2020 18:28:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 9E3673C591E
 for <ltp@lists.linux.it>; Sat,  2 May 2020 18:27:56 +0200 (CEST)
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id D664010016E1
 for <ltp@lists.linux.it>; Sat,  2 May 2020 18:27:55 +0200 (CEST)
Received: by mail-wm1-x344.google.com with SMTP id r26so3684282wmh.0
 for <ltp@lists.linux.it>; Sat, 02 May 2020 09:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=mMZLJtk+8Y6WzHGbIgfD1mBtDCj++/gvWnXLYCYNFjY=;
 b=qf8YNIlsHMDgAtXFu8x/2Ccvk1y1oBw/Lj0OKWwXpI1G7OWPyST/gpUZMQ1GdEztYj
 FYnkchuuapEorqWSnX5lqY79yfD2U3nfccqto5O0sZlPyCxdzac/YbVjFodxF5SZ3xN4
 USEzmxyLkgdZlNSgQ6aFTTMWjerrMujYMiPX93gPWiQWC+jkS+gSnOp978cIs2qbFLzZ
 5VxEtR0HkZN1PO1jcOLTE9r2n/FmGv/G4eqOc2iciMBjwY750uZQVkIpLSbSKRRPsRB/
 9p8wundobJFBDv5p/g6RmYKX90an1PP+zs90G7ob2vG89Dy7sBGHobx/9hapGbJ7iv4n
 Vl2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=mMZLJtk+8Y6WzHGbIgfD1mBtDCj++/gvWnXLYCYNFjY=;
 b=TXkbmsnqJqNRVhk5OJhbLuiIRPSjLejghfUY/lLWzB34oyRn6lGaRAf8Q0BW+TpMaQ
 IR3trxDmOjSHYH8+wVN3R1zelRUkaY0Cy1Rzs/9uo6KhiiEl9lut5EOmFPe2yqonENiN
 TDVOw1gYD0zbJ/vMY9UxuoiHSkigcj3Uoh31fNVOAgp1oz0dTvXg8LH0biKXLU+1uGxQ
 P0SmFzdpg7iRNy0JUWIkUHFj7ttBoMf/95m3HUkE7MVcjH4ZKMPS6mGQI56YYG1EEBVe
 lrFnTFVzSlFaLc9awtDyrmBdJYxK/5rgYq4QoWnUB02dlol0K6pqzWg9NGXkDBj+cD57
 WcdQ==
X-Gm-Message-State: AGi0Pub1L8abQgZkyoTY5/F9rfMPbgch2z7yM0Nvy73jJ+QHaEKBRsEg
 cHyVBYqRRAjKcUH7SGo0NV9P9een
X-Google-Smtp-Source: APiQypIlvzpv545YXZOZyrvJ1QzbOaB1e50oz7tlGwnJpE5fzGzkffHRqSsKSHLTVb7o8UQun7AmiA==
X-Received: by 2002:a05:600c:2255:: with SMTP id
 a21mr5360164wmm.150.1588436875242; 
 Sat, 02 May 2020 09:27:55 -0700 (PDT)
Received: from localhost.localdomain ([141.226.12.123])
 by smtp.gmail.com with ESMTPSA id n6sm10683053wrs.81.2020.05.02.09.27.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 May 2020 09:27:54 -0700 (PDT)
From: Amir Goldstein <amir73il@gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Date: Sat,  2 May 2020 19:27:43 +0300
Message-Id: <20200502162744.9589-4-amir73il@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200502162744.9589-1-amir73il@gmail.com>
References: <20200502162744.9589-1-amir73il@gmail.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v2 3/4] syscalls/fanotify: New test for FAN_MODIFY_DIR
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

- Watch dir modify events with name info
- Watch self delete events w/o name info
- Test inode and filesystem marks
- Check getting events for all file and dir names

Signed-off-by: Amir Goldstein <amir73il@gmail.com>
Reviewed-by: Petr Vorel <pvorel@suse.cz>
Reviewed-by: Cyril Hrubis <chrubis@suse.cz>
Reviewed-by: Matthew Bobrowski <mbobrowski@mbobrowski.org>
---
 runtest/syscalls                              |   1 +
 testcases/kernel/syscalls/fanotify/.gitignore |   1 +
 testcases/kernel/syscalls/fanotify/fanotify.h |  36 +-
 .../kernel/syscalls/fanotify/fanotify16.c     | 403 ++++++++++++++++++
 4 files changed, 438 insertions(+), 3 deletions(-)
 create mode 100644 testcases/kernel/syscalls/fanotify/fanotify16.c

diff --git a/runtest/syscalls b/runtest/syscalls
index cbab5730c..edd3e8de7 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -575,6 +575,7 @@ fanotify12 fanotify12
 fanotify13 fanotify13
 fanotify14 fanotify14
 fanotify15 fanotify15
+fanotify16 fanotify16
 
 ioperm01 ioperm01
 ioperm02 ioperm02
diff --git a/testcases/kernel/syscalls/fanotify/.gitignore b/testcases/kernel/syscalls/fanotify/.gitignore
index 68e4cc7aa..e7cf224fd 100644
--- a/testcases/kernel/syscalls/fanotify/.gitignore
+++ b/testcases/kernel/syscalls/fanotify/.gitignore
@@ -13,4 +13,5 @@
 /fanotify13
 /fanotify14
 /fanotify15
+/fanotify16
 /fanotify_child
diff --git a/testcases/kernel/syscalls/fanotify/fanotify.h b/testcases/kernel/syscalls/fanotify/fanotify.h
index 6da7e765c..adb95c91a 100644
--- a/testcases/kernel/syscalls/fanotify/fanotify.h
+++ b/testcases/kernel/syscalls/fanotify/fanotify.h
@@ -41,6 +41,9 @@ static long fanotify_mark(int fd, unsigned int flags, uint64_t mask,
 #ifndef FAN_REPORT_TID
 #define FAN_REPORT_TID		0x00000100
 #endif
+#ifndef FAN_REPORT_FID
+#define FAN_REPORT_FID		0x00000200
+#endif
 
 #ifndef FAN_MARK_INODE
 #define FAN_MARK_INODE		0
@@ -79,9 +82,8 @@ static long fanotify_mark(int fd, unsigned int flags, uint64_t mask,
 #ifndef FAN_OPEN_EXEC_PERM
 #define FAN_OPEN_EXEC_PERM	0x00040000
 #endif
-
-#ifndef FAN_REPORT_FID
-#define FAN_REPORT_FID		0x00000200
+#ifndef FAN_DIR_MODIFY
+#define FAN_DIR_MODIFY		0x00080000
 #endif
 
 /*
@@ -106,6 +108,13 @@ typedef struct {
 #define __kernel_fsid_t lapi_fsid_t
 #endif /* __kernel_fsid_t */
 
+#ifndef FAN_EVENT_INFO_TYPE_FID
+#define FAN_EVENT_INFO_TYPE_FID		1
+#endif
+#ifndef FAN_EVENT_INFO_TYPE_DFID_NAME
+#define FAN_EVENT_INFO_TYPE_DFID_NAME	2
+#endif
+
 #ifndef HAVE_STRUCT_FANOTIFY_EVENT_INFO_HEADER
 struct fanotify_event_info_header {
 	uint8_t info_type;
@@ -155,6 +164,27 @@ static inline void fanotify_get_fid(const char *path, __kernel_fsid_t *fsid,
 			"name_to_handle_at(AT_FDCWD, %s, ...) failed", path);
 	}
 }
+
+struct fanotify_fid_t {
+	__kernel_fsid_t fsid;
+	struct file_handle handle;
+	char buf[MAX_HANDLE_SZ];
+};
+
+static inline void fanotify_save_fid(const char *path,
+				     struct fanotify_fid_t *fid)
+{
+	int *fh = (int *)(fid->handle.f_handle);
+
+	fh[0] = fh[1] = fh[2] = 0;
+	fid->handle.handle_bytes = MAX_HANDLE_SZ;
+	fanotify_get_fid(path, &fid->fsid, &fid->handle);
+
+	tst_res(TINFO,
+		"fid(%s) = %x.%x.%x.%x.%x...", path,
+		FSID_VAL_MEMBER(fid->fsid, 0), FSID_VAL_MEMBER(fid->fsid, 1),
+		fh[0], fh[1], fh[2]);
+}
 #endif /* HAVE_NAME_TO_HANDLE_AT */
 
 #define INIT_FANOTIFY_MARK_TYPE(t) \
diff --git a/testcases/kernel/syscalls/fanotify/fanotify16.c b/testcases/kernel/syscalls/fanotify/fanotify16.c
new file mode 100644
index 000000000..4d6d1383b
--- /dev/null
+++ b/testcases/kernel/syscalls/fanotify/fanotify16.c
@@ -0,0 +1,403 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 CTERA Networks. All Rights Reserved.
+ *
+ * Started by Amir Goldstein <amir73il@gmail.com>
+ *
+ * DESCRIPTION
+ *     Check FAN_DIR_MODIFY events with name info
+ */
+#define _GNU_SOURCE
+#include "config.h"
+
+#include <stdio.h>
+#include <sys/stat.h>
+#include <sys/types.h>
+#include <fcntl.h>
+#include <errno.h>
+#include <string.h>
+#include <sys/mount.h>
+#include <sys/syscall.h>
+#include "tst_test.h"
+#include "fanotify.h"
+
+#if defined(HAVE_SYS_FANOTIFY_H)
+#include <sys/fanotify.h>
+#include <sys/inotify.h>
+
+#define EVENT_MAX 10
+
+/* Size of the event structure, not including file handle */
+#define EVENT_SIZE (sizeof(struct fanotify_event_metadata) + \
+		    sizeof(struct fanotify_event_info_fid))
+/* Tripple events buffer size to account for file handles and names */
+#define EVENT_BUF_LEN (EVENT_MAX * EVENT_SIZE * 3)
+
+
+#define BUF_SIZE 256
+
+static char fname1[BUF_SIZE], fname2[BUF_SIZE];
+static char dname1[BUF_SIZE], dname2[BUF_SIZE];
+static int fd_notify;
+
+struct event_t {
+	unsigned long long mask;
+	struct fanotify_fid_t *fid;
+	char name[BUF_SIZE];
+};
+
+static struct event_t event_set[EVENT_MAX];
+
+static char event_buf[EVENT_BUF_LEN];
+
+#define DIR_NAME1 "test_dir1"
+#define DIR_NAME2 "test_dir2"
+#define FILE_NAME1 "test_file1"
+#define FILE_NAME2 "test_file2"
+#define MOUNT_PATH "fs_mnt"
+
+static struct test_case_t {
+	const char *tname;
+	struct fanotify_mark_type mark;
+	unsigned long mask;
+	struct fanotify_mark_type sub_mark;
+	unsigned long sub_mask;
+} test_cases[] = {
+	{
+		/* Filesystem watch for dir modify and delete self events */
+		"FAN_REPORT_FID on filesystem with FAN_DIR_MODIFY",
+		INIT_FANOTIFY_MARK_TYPE(FILESYSTEM),
+		FAN_DIR_MODIFY | FAN_DELETE_SELF | FAN_ONDIR,
+		{},
+		0,
+	},
+	{
+		/* Recursive watches for dir modify events */
+		"FAN_REPORT_FID on directories with FAN_DIR_MODIFY",
+		INIT_FANOTIFY_MARK_TYPE(INODE),
+		FAN_DIR_MODIFY,
+		/* Watches for delete self event on subdir */
+		INIT_FANOTIFY_MARK_TYPE(INODE),
+		FAN_DIR_MODIFY | FAN_DELETE_SELF | FAN_ONDIR,
+	},
+};
+
+static void do_test(unsigned int number)
+{
+	int fd, len = 0, i = 0, test_num = 0, tst_count = 0;
+	struct test_case_t *tc = &test_cases[number];
+	struct fanotify_mark_type *mark = &tc->mark;
+	struct fanotify_mark_type *sub_mark = &tc->sub_mark;
+	struct fanotify_fid_t root_fid, dir_fid, file_fid;
+
+	tst_res(TINFO, "Test #%d: %s", number, tc->tname);
+
+	fd_notify = fanotify_init(FAN_REPORT_FID, 0);
+	if (fd_notify == -1) {
+		if (errno == EINVAL)
+			tst_brk(TCONF,
+				"FAN_REPORT_FID not supported by kernel");
+
+		tst_brk(TBROK | TERRNO,
+			"fanotify_init(FAN_REPORT_FID, 0) failed");
+	}
+
+	/*
+	 * Watch dir modify events with name in filesystem/dir
+	 */
+	if (fanotify_mark(fd_notify, FAN_MARK_ADD | mark->flag, tc->mask,
+			  AT_FDCWD, MOUNT_PATH) < 0) {
+		if (errno == EINVAL)
+			tst_brk(TCONF,
+				"FAN_DIR_MODIFY not supported by kernel");
+
+		tst_brk(TBROK | TERRNO,
+		    "fanotify_mark (%d, FAN_MARK_ADD | %s, 0x%lx, "
+		    "AT_FDCWD, '"MOUNT_PATH"') failed",
+		    fd_notify, mark->name, tc->mask);
+	}
+
+	/* Save the mount root fid */
+	fanotify_save_fid(MOUNT_PATH, &root_fid);
+
+	/*
+	 * Create subdir and watch open events "on children" with name.
+	 */
+	SAFE_MKDIR(dname1, 0755);
+
+	/* Save the subdir fid */
+	fanotify_save_fid(dname1, &dir_fid);
+
+	if (tc->sub_mask &&
+	    fanotify_mark(fd_notify, FAN_MARK_ADD | sub_mark->flag, tc->sub_mask,
+			  AT_FDCWD, dname1) < 0) {
+		tst_brk(TBROK | TERRNO,
+		    "fanotify_mark (%d, FAN_MARK_ADD | %s, 0x%lx, "
+		    "AT_FDCWD, '%s') failed",
+		    fd_notify, sub_mark->name, tc->sub_mask, dname1);
+	}
+
+	event_set[tst_count].mask = FAN_DIR_MODIFY;
+	event_set[tst_count].fid = &root_fid;
+	strcpy(event_set[tst_count].name, DIR_NAME1);
+	tst_count++;
+
+	/* Generate modify events "on child" */
+	fd = SAFE_CREAT(fname1, 0755);
+
+	/* Save the file fid */
+	fanotify_save_fid(fname1, &file_fid);
+
+	SAFE_WRITE(1, fd, "1", 1);
+	SAFE_RENAME(fname1, fname2);
+	SAFE_CLOSE(fd);
+
+	/* Generate delete events with fname2 */
+	SAFE_UNLINK(fname2);
+
+	/* Read events on files in subdir */
+	len += SAFE_READ(0, fd_notify, event_buf + len, EVENT_BUF_LEN - len);
+
+	/*
+	 * FAN_DIR_MODIFY events with the same name are merged.
+	 */
+	event_set[tst_count].mask = FAN_DIR_MODIFY;
+	event_set[tst_count].fid = &dir_fid;
+	strcpy(event_set[tst_count].name, FILE_NAME1);
+	tst_count++;
+	event_set[tst_count].mask = FAN_DIR_MODIFY;
+	event_set[tst_count].fid = &dir_fid;
+	strcpy(event_set[tst_count].name, FILE_NAME2);
+	tst_count++;
+
+	/*
+	 * Directory watch does not get self events on children.
+	 * Filesystem watch gets self event w/o name info.
+	 */
+	if (mark->flag == FAN_MARK_FILESYSTEM) {
+		event_set[tst_count].mask = FAN_DELETE_SELF;
+		event_set[tst_count].fid = &file_fid;
+		strcpy(event_set[tst_count].name, "");
+		tst_count++;
+	}
+
+	SAFE_RENAME(dname1, dname2);
+	SAFE_RMDIR(dname2);
+
+	/* Read more events on dirs */
+	len += SAFE_READ(0, fd_notify, event_buf + len, EVENT_BUF_LEN - len);
+
+	event_set[tst_count].mask = FAN_DIR_MODIFY;
+	event_set[tst_count].fid = &root_fid;
+	strcpy(event_set[tst_count].name, DIR_NAME1);
+	tst_count++;
+	event_set[tst_count].mask = FAN_DIR_MODIFY;
+	event_set[tst_count].fid = &root_fid;
+	strcpy(event_set[tst_count].name, DIR_NAME2);
+	tst_count++;
+	/*
+	 * Directory watch gets self event on itself w/o name info.
+	 */
+	event_set[tst_count].mask = FAN_DELETE_SELF | FAN_ONDIR;
+	strcpy(event_set[tst_count].name, "");
+	event_set[tst_count].fid = &dir_fid;
+	tst_count++;
+
+	/*
+	 * Cleanup the marks
+	 */
+	SAFE_CLOSE(fd_notify);
+	fd_notify = -1;
+
+	while (i < len) {
+		struct event_t *expected = &event_set[test_num];
+		struct fanotify_event_metadata *event;
+		struct fanotify_event_info_fid *event_fid;
+		struct file_handle *file_handle;
+		unsigned int fhlen;
+		const char *filename;
+		int namelen, info_type;
+
+		event = (struct fanotify_event_metadata *)&event_buf[i];
+		event_fid = (struct fanotify_event_info_fid *)(event + 1);
+		file_handle = (struct file_handle *)event_fid->handle;
+		fhlen = file_handle->handle_bytes;
+		filename = (char *)file_handle->f_handle + fhlen;
+		namelen = ((char *)event + event->event_len) - filename;
+		/* End of event could have name, zero padding, both or none */
+		if (namelen > 0) {
+			namelen = strlen(filename);
+		} else {
+			filename = "";
+			namelen = 0;
+		}
+
+		if (expected->name[0]) {
+			info_type = FAN_EVENT_INFO_TYPE_DFID_NAME;
+		} else {
+			info_type = FAN_EVENT_INFO_TYPE_FID;
+		}
+
+		if (test_num >= tst_count) {
+			tst_res(TFAIL,
+				"got unnecessary event: mask=%llx "
+				"pid=%u fd=%d name='%s' "
+				"len=%d info_type=%d info_len=%d fh_len=%d",
+				(unsigned long long)event->mask,
+				(unsigned)event->pid, event->fd, filename,
+				event->event_len, event_fid->hdr.info_type,
+				event_fid->hdr.len, fhlen);
+		} else if (!fhlen || namelen < 0) {
+			tst_res(TFAIL,
+				"got event without fid: mask=%llx pid=%u fd=%d, "
+				"len=%d info_type=%d info_len=%d fh_len=%d",
+				(unsigned long long)event->mask,
+				(unsigned)event->pid, event->fd,
+				event->event_len, event_fid->hdr.info_type,
+				event_fid->hdr.len, fhlen);
+		} else if (event->mask != expected->mask) {
+			tst_res(TFAIL,
+				"got event: mask=%llx (expected %llx) "
+				"pid=%u fd=%d name='%s' "
+				"len=%d info_type=%d info_len=%d fh_len=%d",
+				(unsigned long long)event->mask, expected->mask,
+				(unsigned)event->pid, event->fd, filename,
+				event->event_len, event_fid->hdr.info_type,
+				event_fid->hdr.len, fhlen);
+		} else if (info_type != event_fid->hdr.info_type) {
+			tst_res(TFAIL,
+				"got event: mask=%llx pid=%u fd=%d, "
+				"len=%d info_type=%d expected(%d) info_len=%d fh_len=%d",
+				(unsigned long long)event->mask,
+				(unsigned)event->pid, event->fd,
+				event->event_len, event_fid->hdr.info_type,
+				info_type, event_fid->hdr.len, fhlen);
+		} else if (fhlen != expected->fid->handle.handle_bytes) {
+			tst_res(TFAIL,
+				"got event: mask=%llx pid=%u fd=%d name='%s' "
+				"len=%d info_type=%d info_len=%d fh_len=%d expected(%d)"
+				"fh_type=%d",
+				(unsigned long long)event->mask,
+				(unsigned)event->pid, event->fd, filename,
+				event->event_len, info_type,
+				event_fid->hdr.len, fhlen,
+				expected->fid->handle.handle_bytes,
+				file_handle->handle_type);
+		} else if (file_handle->handle_type !=
+			   expected->fid->handle.handle_type) {
+			tst_res(TFAIL,
+				"got event: mask=%llx pid=%u fd=%d name='%s' "
+				"len=%d info_type=%d info_len=%d fh_len=%d "
+				"fh_type=%d expected(%x)",
+				(unsigned long long)event->mask,
+				(unsigned)event->pid, event->fd, filename,
+				event->event_len, info_type,
+				event_fid->hdr.len, fhlen,
+				file_handle->handle_type,
+				expected->fid->handle.handle_type);
+		} else if (memcmp(file_handle->f_handle,
+				  expected->fid->handle.f_handle, fhlen)) {
+			tst_res(TFAIL,
+				"got event: mask=%llx pid=%u fd=%d name='%s' "
+				"len=%d info_type=%d info_len=%d fh_len=%d "
+				"fh_type=%d unexpected file handle (%x...)",
+				(unsigned long long)event->mask,
+				(unsigned)event->pid, event->fd, filename,
+				event->event_len, info_type,
+				event_fid->hdr.len, fhlen,
+				file_handle->handle_type,
+				*(int *)(file_handle->f_handle));
+		} else if (memcmp(&event_fid->fsid, &expected->fid->fsid,
+				  sizeof(event_fid->fsid)) != 0) {
+			tst_res(TFAIL,
+				"got event: mask=%llx pid=%u fd=%d name='%s' "
+				"len=%d info_type=%d info_len=%d fh_len=%d "
+				"fsid=%x.%x (expected %x.%x)",
+				(unsigned long long)event->mask,
+				(unsigned)event->pid, event->fd, filename,
+				event->event_len, info_type,
+				event_fid->hdr.len, fhlen,
+				FSID_VAL_MEMBER(event_fid->fsid, 0),
+				FSID_VAL_MEMBER(event_fid->fsid, 1),
+				FSID_VAL_MEMBER(expected->fid->fsid, 0),
+				FSID_VAL_MEMBER(expected->fid->fsid, 1));
+		} else if (strcmp(expected->name, filename)) {
+			tst_res(TFAIL,
+				"got event: mask=%llx "
+				"pid=%u fd=%d name='%s' expected('%s') "
+				"len=%d info_type=%d info_len=%d fh_len=%d",
+				(unsigned long long)event->mask,
+				(unsigned)event->pid, event->fd,
+				filename, expected->name,
+				event->event_len, event_fid->hdr.info_type,
+				event_fid->hdr.len, fhlen);
+		} else if (event->pid != getpid()) {
+			tst_res(TFAIL,
+				"got event: mask=%llx pid=%u "
+				"(expected %u) fd=%d name='%s' "
+				"len=%d info_type=%d info_len=%d fh_len=%d",
+				(unsigned long long)event->mask,
+				(unsigned)event->pid,
+				(unsigned)getpid(),
+				event->fd, filename,
+				event->event_len, event_fid->hdr.info_type,
+				event_fid->hdr.len, fhlen);
+		} else {
+			tst_res(TPASS,
+				"got event #%d: mask=%llx pid=%u fd=%d name='%s' "
+				"len=%d info_type=%d info_len=%d fh_len=%d",
+				test_num, (unsigned long long)event->mask,
+				(unsigned)event->pid, event->fd, filename,
+				event->event_len, event_fid->hdr.info_type,
+				event_fid->hdr.len, fhlen);
+		}
+
+		i += event->event_len;
+		if (event->fd > 0)
+			SAFE_CLOSE(event->fd);
+		test_num++;
+	}
+
+	for (; test_num < tst_count; test_num++) {
+		tst_res(TFAIL, "didn't get event: mask=%llx, name='%s'",
+			 event_set[test_num].mask, event_set[test_num].name);
+
+	}
+}
+
+static void setup(void)
+{
+	int fd;
+
+	/* Check kernel for fanotify support */
+	fd = SAFE_FANOTIFY_INIT(FAN_CLASS_NOTIF, O_RDONLY);
+	SAFE_CLOSE(fd);
+
+	sprintf(dname1, "%s/%s", MOUNT_PATH, DIR_NAME1);
+	sprintf(dname2, "%s/%s", MOUNT_PATH, DIR_NAME2);
+	sprintf(fname1, "%s/%s", dname1, FILE_NAME1);
+	sprintf(fname2, "%s/%s", dname1, FILE_NAME2);
+}
+
+static void cleanup(void)
+{
+	if (fd_notify > 0)
+		SAFE_CLOSE(fd_notify);
+}
+
+static struct tst_test test = {
+	.test = do_test,
+	.tcnt = ARRAY_SIZE(test_cases),
+	.dev_fs_flags = TST_FS_SKIP_FUSE,
+	.setup = setup,
+	.cleanup = cleanup,
+	.mount_device = 1,
+	.mntpoint = MOUNT_PATH,
+	.all_filesystems = 1,
+	.needs_tmpdir = 1,
+	.needs_root = 1
+};
+
+#else
+	TST_TEST_TCONF("system doesn't have required fanotify support");
+#endif
-- 
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
