Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 96858263524
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Sep 2020 19:57:38 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 502BD3C2CCF
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Sep 2020 19:57:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id F17033C2E8F
 for <ltp@lists.linux.it>; Wed,  9 Sep 2020 19:57:18 +0200 (CEST)
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 87AA9100079C
 for <ltp@lists.linux.it>; Wed,  9 Sep 2020 19:57:18 +0200 (CEST)
Received: by mail-wm1-x341.google.com with SMTP id e17so3165655wme.0
 for <ltp@lists.linux.it>; Wed, 09 Sep 2020 10:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=3SxaYBZJpJ4Mso3aGJmfNLoc/++Q0UZHYubuwhSE0bk=;
 b=RpsfW+DqV47OdKLwjfxCiwPdHCbcfoMHrbgco4H+RsOQ8B5I0fWcifAQTa55DUi2Ve
 6UEUYoLi7qnrSnkhH/kXZRiloCij0IhsmWs1jGOIawL14PNvTAVFJSEF76HEhNN7nkNP
 kF+yHVxK1go5cU2uduNc3StkrVS3Y72u+QNzvWfNfRpvXb8v8BJsCati/WzI/FqZqwdb
 LuzLh6Jaic4dTg0Xs9nucAVmTai0By1bKiDJmPdrJxy1ZzgpptTugdREBdyRMoorwRt4
 EleMxAwH+N3uzJYdfDQRFdMI+P9B3trV5Mxb/EH73FY2S+2EZ+qasPxu3Lu249iXXk7g
 qYUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=3SxaYBZJpJ4Mso3aGJmfNLoc/++Q0UZHYubuwhSE0bk=;
 b=VkWPF01sKjlu0woZaNCMD0ZMJmYlgUPPL9QRl/nrju8p6xcNOPgZ4agOxezi0A/vzQ
 b/elNjbNmMo9QqyJZY7Yk9vwSUqvOc/WLZX0iTK78HT3y3TINHXH4COvp1y7tJkMro9G
 9M5WvfDwr1xEMRpg3vDUTsg8LRw9Q4IGoDdvxX8wnDiDA4ls340HbThSGd65zCPawebX
 h3+2E0PMeWLBJ4fUJAWcMxuM+QApwotU54RZWZUBC/HWhUSObc2g7hQ8R0bhmoCE3zrA
 ZVXIHOMcbGa8W0EPf3e/tX87+6n3pUSuKnC6w8/jOR15zR8peRFcksmULnBfa7sq3mjY
 uTAA==
X-Gm-Message-State: AOAM532PQH14rYeB5pEtayB2T9nBN8HhlZZ4DD29sKlQLmFAh9uxjSlQ
 q8r/Rin2rnkn+Hgw1Sj9e0M=
X-Google-Smtp-Source: ABdhPJzuIRJAR7rAGwF1pfp0YtlcWlvSxW7xtqYjcAjsv9dWMdw6L9yxREJLcIe+H3VUHtr1jnNdiQ==
X-Received: by 2002:a1c:4886:: with SMTP id v128mr4703613wma.139.1599674238058; 
 Wed, 09 Sep 2020 10:57:18 -0700 (PDT)
Received: from localhost.localdomain ([141.226.8.56])
 by smtp.gmail.com with ESMTPSA id z83sm4979714wmb.4.2020.09.09.10.57.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2020 10:57:17 -0700 (PDT)
From: Amir Goldstein <amir73il@gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Date: Wed,  9 Sep 2020 20:56:59 +0300
Message-Id: <20200909175707.10670-3-amir73il@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200909175707.10670-1-amir73il@gmail.com>
References: <20200909175707.10670-1-amir73il@gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 02/10] syscalls/fanotify16: Adjust test to use
 FAN_REPORT_DFID_NAME
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

The new FAN_DIR_MODIFY event was removed before final v5.7 release
and will be replaced with a new group flag FAN_REPORT_DFID_NAME to
report name info for FAN_CREATE, FAN_DELETE and FAN_MOVE events.
Adjust the test to use this new API.

Signed-off-by: Amir Goldstein <amir73il@gmail.com>
---
 testcases/kernel/syscalls/fanotify/fanotify.h | 11 ++-
 .../kernel/syscalls/fanotify/fanotify16.c     | 69 ++++++++++---------
 2 files changed, 44 insertions(+), 36 deletions(-)

diff --git a/testcases/kernel/syscalls/fanotify/fanotify.h b/testcases/kernel/syscalls/fanotify/fanotify.h
index 4a7959989..91535718b 100644
--- a/testcases/kernel/syscalls/fanotify/fanotify.h
+++ b/testcases/kernel/syscalls/fanotify/fanotify.h
@@ -89,9 +89,6 @@ static long fanotify_mark(int fd, unsigned int flags, uint64_t mask,
 #ifndef FAN_OPEN_EXEC_PERM
 #define FAN_OPEN_EXEC_PERM	0x00040000
 #endif
-#ifndef FAN_DIR_MODIFY
-#define FAN_DIR_MODIFY		0x00080000
-#endif
 
 /*
  * FAN_ALL_PERM_EVENTS has been deprecated, so any new permission events
@@ -103,6 +100,11 @@ static long fanotify_mark(int fd, unsigned int flags, uint64_t mask,
 #define LTP_ALL_PERM_EVENTS	(FAN_OPEN_PERM | FAN_OPEN_EXEC_PERM | \
 				 FAN_ACCESS_PERM)
 
+struct fanotify_group_type {
+	unsigned int flag;
+	const char * name;
+};
+
 struct fanotify_mark_type {
 	unsigned int flag;
 	const char * name;
@@ -201,6 +203,9 @@ static inline void fanotify_save_fid(const char *path,
 }
 #endif /* HAVE_NAME_TO_HANDLE_AT */
 
+#define INIT_FANOTIFY_GROUP_TYPE(t) \
+	{ FAN_ ## t, "FAN_" #t }
+
 #define INIT_FANOTIFY_MARK_TYPE(t) \
 	{ FAN_MARK_ ## t, "FAN_MARK_" #t }
 
diff --git a/testcases/kernel/syscalls/fanotify/fanotify16.c b/testcases/kernel/syscalls/fanotify/fanotify16.c
index d366a455f..f3fbd3bc0 100644
--- a/testcases/kernel/syscalls/fanotify/fanotify16.c
+++ b/testcases/kernel/syscalls/fanotify/fanotify16.c
@@ -5,7 +5,8 @@
  * Started by Amir Goldstein <amir73il@gmail.com>
  *
  * DESCRIPTION
- *     Check FAN_DIR_MODIFY events with name info
+ *     Check fanotify directory entry modification events with group
+ *     init flags FAN_REPORT_DFID_NAME (dir fid + name)
  */
 #define _GNU_SOURCE
 #include "config.h"
@@ -23,7 +24,6 @@
 
 #if defined(HAVE_SYS_FANOTIFY_H)
 #include <sys/fanotify.h>
-#include <sys/inotify.h>
 
 #define EVENT_MAX 10
 
@@ -59,27 +59,30 @@ static char event_buf[EVENT_BUF_LEN];
 
 static struct test_case_t {
 	const char *tname;
+	struct fanotify_group_type group;
 	struct fanotify_mark_type mark;
 	unsigned long mask;
 	struct fanotify_mark_type sub_mark;
 	unsigned long sub_mask;
 } test_cases[] = {
 	{
-		/* Filesystem watch for dir modify and delete self events */
-		"FAN_REPORT_FID on filesystem with FAN_DIR_MODIFY",
+		/* Filesystem watch for directory entry modification events */
+		"FAN_REPORT_DFID_NAME monitor filesystem for create/delete/move",
+		INIT_FANOTIFY_GROUP_TYPE(REPORT_DFID_NAME),
 		INIT_FANOTIFY_MARK_TYPE(FILESYSTEM),
-		FAN_DIR_MODIFY | FAN_DELETE_SELF | FAN_ONDIR,
+		FAN_CREATE | FAN_DELETE| FAN_MOVE | FAN_DELETE_SELF | FAN_ONDIR,
 		{},
 		0,
 	},
 	{
-		/* Recursive watches for dir modify events */
-		"FAN_REPORT_FID on directories with FAN_DIR_MODIFY",
+		/* Recursive watches for directory entry modification events */
+		"FAN_REPORT_DFID_NAME monitor directories for create/delete/move",
+		INIT_FANOTIFY_GROUP_TYPE(REPORT_DFID_NAME),
 		INIT_FANOTIFY_MARK_TYPE(INODE),
-		FAN_DIR_MODIFY,
-		/* Watches for delete self event on subdir */
+		FAN_CREATE | FAN_DELETE | FAN_MOVE | FAN_ONDIR,
+		/* Watches for directory entry modification events on subdir */
 		INIT_FANOTIFY_MARK_TYPE(INODE),
-		FAN_DIR_MODIFY | FAN_DELETE_SELF | FAN_ONDIR,
+		FAN_CREATE | FAN_DELETE | FAN_MOVE | FAN_DELETE_SELF | FAN_ONDIR,
 	},
 };
 
@@ -87,20 +90,23 @@ static void do_test(unsigned int number)
 {
 	int fd, len = 0, i = 0, test_num = 0, tst_count = 0;
 	struct test_case_t *tc = &test_cases[number];
+	struct fanotify_group_type *group = &tc->group;
 	struct fanotify_mark_type *mark = &tc->mark;
 	struct fanotify_mark_type *sub_mark = &tc->sub_mark;
 	struct fanotify_fid_t root_fid, dir_fid, file_fid;
 
 	tst_res(TINFO, "Test #%d: %s", number, tc->tname);
 
-	fd_notify = fanotify_init(FAN_REPORT_FID, 0);
+	fd_notify = fanotify_init(group->flag, 0);
 	if (fd_notify == -1) {
-		if (errno == EINVAL)
-			tst_brk(TCONF,
-				"FAN_REPORT_FID not supported by kernel");
+		if (errno == EINVAL) {
+			tst_res(TCONF,
+				"%s not supported by kernel", group->name);
+			return;
+		}
 
 		tst_brk(TBROK | TERRNO,
-			"fanotify_init(FAN_REPORT_FID, 0) failed");
+			"fanotify_init(%s, 0) failed", group->name);
 	}
 
 	/*
@@ -108,10 +114,6 @@ static void do_test(unsigned int number)
 	 */
 	if (fanotify_mark(fd_notify, FAN_MARK_ADD | mark->flag, tc->mask,
 			  AT_FDCWD, MOUNT_PATH) < 0) {
-		if (errno == EINVAL)
-			tst_brk(TCONF,
-				"FAN_DIR_MODIFY not supported by kernel");
-
 		tst_brk(TBROK | TERRNO,
 		    "fanotify_mark (%d, FAN_MARK_ADD | %s, 0x%lx, "
 		    "AT_FDCWD, '"MOUNT_PATH"') failed",
@@ -138,7 +140,7 @@ static void do_test(unsigned int number)
 		    fd_notify, sub_mark->name, tc->sub_mask, dname1);
 	}
 
-	event_set[tst_count].mask = FAN_DIR_MODIFY;
+	event_set[tst_count].mask = FAN_CREATE | FAN_ONDIR;
 	event_set[tst_count].fid = &root_fid;
 	strcpy(event_set[tst_count].name, DIR_NAME1);
 	tst_count++;
@@ -160,22 +162,22 @@ static void do_test(unsigned int number)
 	len += SAFE_READ(0, fd_notify, event_buf + len, EVENT_BUF_LEN - len);
 
 	/*
-	 * FAN_DIR_MODIFY events with the same name are merged.
+	 * FAN_CREATE|FAN_DELETE|FAN_MOVE events with the same name are merged.
 	 */
-	event_set[tst_count].mask = FAN_DIR_MODIFY;
+	event_set[tst_count].mask = FAN_CREATE | FAN_MOVED_FROM;
 	event_set[tst_count].fid = &dir_fid;
 	strcpy(event_set[tst_count].name, FILE_NAME1);
 	tst_count++;
-	event_set[tst_count].mask = FAN_DIR_MODIFY;
+	event_set[tst_count].mask = FAN_DELETE | FAN_MOVED_TO;
 	event_set[tst_count].fid = &dir_fid;
 	strcpy(event_set[tst_count].name, FILE_NAME2);
 	tst_count++;
-
 	/*
 	 * Directory watch does not get self events on children.
-	 * Filesystem watch gets self event w/o name info.
+	 * Filesystem watch gets self event w/o name info if FAN_REPORT_FID
+	 * is set.
 	 */
-	if (mark->flag == FAN_MARK_FILESYSTEM) {
+	if (mark->flag == FAN_MARK_FILESYSTEM && (group->flag & FAN_REPORT_FID)) {
 		event_set[tst_count].mask = FAN_DELETE_SELF;
 		event_set[tst_count].fid = &file_fid;
 		strcpy(event_set[tst_count].name, "");
@@ -188,19 +190,20 @@ static void do_test(unsigned int number)
 	/* Read more events on dirs */
 	len += SAFE_READ(0, fd_notify, event_buf + len, EVENT_BUF_LEN - len);
 
-	event_set[tst_count].mask = FAN_DIR_MODIFY;
+	event_set[tst_count].mask = FAN_MOVED_FROM | FAN_ONDIR;
 	event_set[tst_count].fid = &root_fid;
 	strcpy(event_set[tst_count].name, DIR_NAME1);
 	tst_count++;
-	event_set[tst_count].mask = FAN_DIR_MODIFY;
+	event_set[tst_count].mask = FAN_DELETE | FAN_MOVED_TO | FAN_ONDIR;
 	event_set[tst_count].fid = &root_fid;
 	strcpy(event_set[tst_count].name, DIR_NAME2);
 	tst_count++;
 	/*
-	 * Directory watch gets self event on itself w/o name info.
+	 * Directory watch gets self event on itself and filesystem watch gets
+	 * self event on all directories with name ".".
 	 */
 	event_set[tst_count].mask = FAN_DELETE_SELF | FAN_ONDIR;
-	strcpy(event_set[tst_count].name, "");
+	strcpy(event_set[tst_count].name, ".");
 	event_set[tst_count].fid = &dir_fid;
 	tst_count++;
 
@@ -224,8 +227,8 @@ static void do_test(unsigned int number)
 		file_handle = (struct file_handle *)event_fid->handle;
 		fhlen = file_handle->handle_bytes;
 		filename = (char *)file_handle->f_handle + fhlen;
-		namelen = ((char *)event + event->event_len) - filename;
-		/* End of event could have name, zero padding, both or none */
+		namelen = ((char *)event_fid + event_fid->hdr.len) - filename;
+		/* End of event_fid could have name, zero padding, both or none */
 		if (namelen > 0) {
 			namelen = strlen(filename);
 		} else {
@@ -236,7 +239,7 @@ static void do_test(unsigned int number)
 		if (expected->name[0]) {
 			info_type = FAN_EVENT_INFO_TYPE_DFID_NAME;
 		} else {
-			info_type = FAN_EVENT_INFO_TYPE_FID;
+			info_type = FAN_EVENT_INFO_TYPE_DFID;
 		}
 
 		if (test_num >= tst_count) {
-- 
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
