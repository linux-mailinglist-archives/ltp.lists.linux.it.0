Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DBAB263526
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Sep 2020 19:57:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 582B53C2F2B
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Sep 2020 19:57:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 902933C2C93
 for <ltp@lists.linux.it>; Wed,  9 Sep 2020 19:57:21 +0200 (CEST)
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 065A01400437
 for <ltp@lists.linux.it>; Wed,  9 Sep 2020 19:57:21 +0200 (CEST)
Received: by mail-wr1-x441.google.com with SMTP id z4so3943088wrr.4
 for <ltp@lists.linux.it>; Wed, 09 Sep 2020 10:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=OnDb0Tq+FfdfCUteExEO5WzYp3RhLgmbZ/KhKNDo66g=;
 b=cWykvxYtoVQwosGQbBbkxXH193/7ozKpNUAomPN0hIetxwMQ8TVWuXPrr1GceQIJ4+
 p5DRa48fJLA5oBzX3V8ijjN54UdMtc7Lxv3PNjFTe4IKStXRrFVLt85Ge1/taHTJMgC5
 UImXmTWd30hm25Y/P3QbiMRPDJkHhnMul/P5XdMSJol/YQNNePPthVhJbEj8PZNgX2ox
 lxtpvOSLIrCq7eBO8kRYDxgi2YsKuILkuqpRMlzTPL912e7LL4pOFwQ3Y6BlJPmDhCZq
 JUbr2LiJ6VvHF9o5TO+dRB977haWk4jr35+xIgu9HsR+htERdIfTxjjoN6t07OOS6XhZ
 hcww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=OnDb0Tq+FfdfCUteExEO5WzYp3RhLgmbZ/KhKNDo66g=;
 b=ommuTpkDK0LGkwIE2WPu7jtpfJuA5WKMgknsbYp0P70IYd85NGJrujp93e37dN+JSw
 ko8h7SgHhhmB0qYoeA06vBZ56MJZQfyiwA10qCDR3KFgDJQSxZBzvpG/5tlGHBvu+nzQ
 3sZd/i2mC3ujIIWm2gia1TR9rKE7N99ukN3ukYbOjhEdQXubIXQmiJEt/rPv8+FJetBW
 wH0uAXr/msmBk2w0YdyoA9xTxxELBSSo1C5u2mlO3g4eFRcpe9akQp9UC1i87ZWg5rG8
 7oTR3b3gKhEFca1Gw4QLFTEMunxT7In79ptLGXdEuc5hcFZAhEFV9PfD4ky65BiIL+nv
 FULQ==
X-Gm-Message-State: AOAM533qUvv16Vq7WEEepUq5ABIOpIph+HXnelq17+T9cGnh/sOBxKfh
 Aw0wknhLbcsQ9QF7dJcQPWOYrPxfMM4=
X-Google-Smtp-Source: ABdhPJy25j2+BOpYQtQVlQDz8/gKjHvB4dmLyg+pEflwfOBQiVS7wz6G5lJiEyXf6EDUnnAQVP+wMA==
X-Received: by 2002:adf:9c93:: with SMTP id d19mr5090041wre.275.1599674240559; 
 Wed, 09 Sep 2020 10:57:20 -0700 (PDT)
Received: from localhost.localdomain ([141.226.8.56])
 by smtp.gmail.com with ESMTPSA id z83sm4979714wmb.4.2020.09.09.10.57.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2020 10:57:20 -0700 (PDT)
From: Amir Goldstein <amir73il@gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Date: Wed,  9 Sep 2020 20:57:01 +0300
Message-Id: <20200909175707.10670-5-amir73il@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200909175707.10670-1-amir73il@gmail.com>
References: <20200909175707.10670-1-amir73il@gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 04/10] syscalls/fanotify16: Add test cases more init
 flag combinations
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

Test more combination of flags FAN_REPORT_DIR_FID, FAN_REPORT_FID
and FAN_REPORT_NAME.

Reporting different information per event may result in different event
merging.  For example, with FAN_REPORT_DFID_NAME, create/open/moved_from
of "file1" are merged and moved_to/delete/close of "file2" are merged.
With FAN_REPORT_DIR_FID, open/close of the file are merged (dir fid +
child fid info are the same) and create/move/delete of file are merged
(dir fid info is the same).

Signed-off-by: Amir Goldstein <amir73il@gmail.com>
---
 testcases/kernel/syscalls/fanotify/fanotify.h |   8 ++
 .../kernel/syscalls/fanotify/fanotify16.c     | 110 ++++++++++++++++--
 2 files changed, 108 insertions(+), 10 deletions(-)

diff --git a/testcases/kernel/syscalls/fanotify/fanotify.h b/testcases/kernel/syscalls/fanotify/fanotify.h
index 91535718b..a9154f993 100644
--- a/testcases/kernel/syscalls/fanotify/fanotify.h
+++ b/testcases/kernel/syscalls/fanotify/fanotify.h
@@ -52,6 +52,14 @@ static long fanotify_mark(int fd, unsigned int flags, uint64_t mask,
 #define FAN_REPORT_DFID_NAME     (FAN_REPORT_DIR_FID | FAN_REPORT_NAME)
 #endif
 
+/* Non-uapi convenience macros */
+#ifndef FAN_REPORT_DFID_NAME_FID
+#define FAN_REPORT_DFID_NAME_FID (FAN_REPORT_DFID_NAME | FAN_REPORT_FID)
+#endif
+#ifndef FAN_REPORT_DFID_FID
+#define FAN_REPORT_DFID_FID      (FAN_REPORT_DIR_FID | FAN_REPORT_FID)
+#endif
+
 #ifndef FAN_MARK_INODE
 #define FAN_MARK_INODE		0
 #endif
diff --git a/testcases/kernel/syscalls/fanotify/fanotify16.c b/testcases/kernel/syscalls/fanotify/fanotify16.c
index 76f053fd7..c8c7a9ee8 100644
--- a/testcases/kernel/syscalls/fanotify/fanotify16.c
+++ b/testcases/kernel/syscalls/fanotify/fanotify16.c
@@ -6,7 +6,11 @@
  *
  * DESCRIPTION
  *     Check fanotify directory entry modification events, events on child and
- *     on self with group init flags FAN_REPORT_DFID_NAME (dir fid + name)
+ *     on self with group init flags:
+ *     - FAN_REPORT_DFID_NAME (dir fid + name)
+ *     - FAN_REPORT_DIR_FID   (dir fid)
+ *     - FAN_REPORT_DIR_FID | FAN_REPORT_FID   (dir fid + child fid)
+ *     - FAN_REPORT_DFID_NAME | FAN_REPORT_FID (dir fid + name + child fid)
  */
 #define _GNU_SOURCE
 #include "config.h"
@@ -84,6 +88,63 @@ static struct test_case_t {
 		FAN_CREATE | FAN_DELETE | FAN_MOVE | FAN_DELETE_SELF | FAN_MOVE_SELF | FAN_ONDIR |
 		FAN_OPEN | FAN_CLOSE | FAN_EVENT_ON_CHILD,
 	},
+	{
+		"FAN_REPORT_DIR_FID monitor filesystem for create/delete/move/open/close",
+		INIT_FANOTIFY_GROUP_TYPE(REPORT_DIR_FID),
+		INIT_FANOTIFY_MARK_TYPE(FILESYSTEM),
+		FAN_CREATE | FAN_DELETE | FAN_MOVE | FAN_DELETE_SELF | FAN_MOVE_SELF | FAN_ONDIR,
+		/* Mount watch for events possible on children */
+		INIT_FANOTIFY_MARK_TYPE(MOUNT),
+		FAN_OPEN | FAN_CLOSE | FAN_ONDIR,
+	},
+	{
+		"FAN_REPORT_DIR_FID monitor directories for create/delete/move/open/close",
+		INIT_FANOTIFY_GROUP_TYPE(REPORT_DIR_FID),
+		INIT_FANOTIFY_MARK_TYPE(INODE),
+		FAN_CREATE | FAN_DELETE | FAN_MOVE | FAN_ONDIR,
+		/* Watches for self events on subdir and events on subdir's children */
+		INIT_FANOTIFY_MARK_TYPE(INODE),
+		FAN_CREATE | FAN_DELETE | FAN_MOVE | FAN_DELETE_SELF | FAN_MOVE_SELF | FAN_ONDIR |
+		FAN_OPEN | FAN_CLOSE | FAN_EVENT_ON_CHILD,
+	},
+	{
+		"FAN_REPORT_DFID_FID monitor filesystem for create/delete/move/open/close",
+		INIT_FANOTIFY_GROUP_TYPE(REPORT_DFID_FID),
+		INIT_FANOTIFY_MARK_TYPE(FILESYSTEM),
+		FAN_CREATE | FAN_DELETE | FAN_MOVE | FAN_DELETE_SELF | FAN_MOVE_SELF | FAN_ONDIR,
+		/* Mount watch for events possible on children */
+		INIT_FANOTIFY_MARK_TYPE(MOUNT),
+		FAN_OPEN | FAN_CLOSE | FAN_ONDIR,
+	},
+	{
+		"FAN_REPORT_DFID_FID monitor directories for create/delete/move/open/close",
+		INIT_FANOTIFY_GROUP_TYPE(REPORT_DFID_FID),
+		INIT_FANOTIFY_MARK_TYPE(INODE),
+		FAN_CREATE | FAN_DELETE | FAN_MOVE | FAN_ONDIR,
+		/* Watches for self events on subdir and events on subdir's children */
+		INIT_FANOTIFY_MARK_TYPE(INODE),
+		FAN_CREATE | FAN_DELETE | FAN_MOVE | FAN_DELETE_SELF | FAN_MOVE_SELF | FAN_ONDIR |
+		FAN_OPEN | FAN_CLOSE | FAN_EVENT_ON_CHILD,
+	},
+	{
+		"FAN_REPORT_DFID_NAME_FID monitor filesystem for create/delete/move/open/close",
+		INIT_FANOTIFY_GROUP_TYPE(REPORT_DFID_NAME_FID),
+		INIT_FANOTIFY_MARK_TYPE(FILESYSTEM),
+		FAN_CREATE | FAN_DELETE | FAN_MOVE | FAN_DELETE_SELF | FAN_MOVE_SELF | FAN_ONDIR,
+		/* Mount watch for events possible on children */
+		INIT_FANOTIFY_MARK_TYPE(MOUNT),
+		FAN_OPEN | FAN_CLOSE | FAN_ONDIR,
+	},
+	{
+		"FAN_REPORT_DFID_NAME_FID monitor directories for create/delete/move/open/close",
+		INIT_FANOTIFY_GROUP_TYPE(REPORT_DFID_NAME_FID),
+		INIT_FANOTIFY_MARK_TYPE(INODE),
+		FAN_CREATE | FAN_DELETE | FAN_MOVE | FAN_ONDIR,
+		/* Watches for self events on subdir and events on subdir's children */
+		INIT_FANOTIFY_MARK_TYPE(INODE),
+		FAN_CREATE | FAN_DELETE | FAN_MOVE | FAN_DELETE_SELF | FAN_MOVE_SELF | FAN_ONDIR |
+		FAN_OPEN | FAN_CLOSE | FAN_EVENT_ON_CHILD,
+	},
 };
 
 static void do_test(unsigned int number)
@@ -174,17 +235,31 @@ static void do_test(unsigned int number)
 	/*
 	 * Event on non-dir child with the same name may be merged with the
 	 * directory entry modification events above, unless FAN_REPORT_FID is
-	 * set and child fid is reported.
+	 * set and child fid is reported. If FAN_REPORT_FID is set but
+	 * FAN_REPORT_NAME is not set, then FAN_CREATE above is merged with
+	 * FAN_DELETE below and FAN_OPEN will be merged with FAN_CLOSE.
 	 */
-	event_set[tst_count].mask = FAN_OPEN;
-	event_set[tst_count].fid = &dir_fid;
-	strcpy(event_set[tst_count].name, FILE_NAME1);
-	tst_count++;
+	if (group->flag & FAN_REPORT_NAME) {
+		event_set[tst_count].mask = FAN_OPEN;
+		event_set[tst_count].fid = &dir_fid;
+		strcpy(event_set[tst_count].name, FILE_NAME1);
+		tst_count++;
+	}
 
 	event_set[tst_count].mask = FAN_DELETE | FAN_MOVED_TO;
 	event_set[tst_count].fid = &dir_fid;
 	strcpy(event_set[tst_count].name, FILE_NAME2);
 	tst_count++;
+	/*
+	 * When not reporting name, open of FILE_NAME1 is merged
+	 * with close of FILE_NAME2.
+	 */
+	if (!(group->flag & FAN_REPORT_NAME)) {
+		event_set[tst_count].mask = FAN_OPEN | FAN_CLOSE_WRITE;
+		event_set[tst_count].fid = &dir_fid;
+		strcpy(event_set[tst_count].name, "");
+		tst_count++;
+	}
 	/*
 	 * Directory watch does not get self events on children.
 	 * Filesystem watch gets self event w/o name info if FAN_REPORT_FID
@@ -196,10 +271,17 @@ static void do_test(unsigned int number)
 		strcpy(event_set[tst_count].name, "");
 		tst_count++;
 	}
-	event_set[tst_count].mask = FAN_CLOSE_WRITE;
-	event_set[tst_count].fid = &dir_fid;
-	strcpy(event_set[tst_count].name, FILE_NAME2);
-	tst_count++;
+	/*
+	 * When reporting name, close of FILE_NAME2 is not merged with
+	 * open of FILE_NAME1 and it is received after the merged self
+	 * events.
+	 */
+	if (group->flag & FAN_REPORT_NAME) {
+		event_set[tst_count].mask = FAN_CLOSE_WRITE;
+		event_set[tst_count].fid = &dir_fid;
+		strcpy(event_set[tst_count].name, FILE_NAME2);
+		tst_count++;
+	}
 
 	dirfd = SAFE_OPEN(dname1, O_RDONLY | O_DIRECTORY);
 	SAFE_CLOSE(dirfd);
@@ -269,8 +351,16 @@ static void do_test(unsigned int number)
 			namelen = 0;
 		}
 
+		if (!(group->flag & FAN_REPORT_NAME))
+			expected->name[0] = 0;
+
 		if (expected->name[0]) {
 			info_type = FAN_EVENT_INFO_TYPE_DFID_NAME;
+		} else if (expected->mask & FAN_ONDIR) {
+			info_type = FAN_EVENT_INFO_TYPE_DFID;
+		} else if (expected->mask & (FAN_DELETE_SELF | FAN_MOVE_SELF)) {
+			/* Self event on non-dir has only child fid */
+			info_type = FAN_EVENT_INFO_TYPE_FID;
 		} else {
 			info_type = FAN_EVENT_INFO_TYPE_DFID;
 		}
-- 
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
