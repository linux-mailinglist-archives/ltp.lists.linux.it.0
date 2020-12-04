Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5C22CEB84
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Dec 2020 10:59:55 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7F09B3C58ED
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Dec 2020 10:59:55 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 29D193C4C0E
 for <ltp@lists.linux.it>; Fri,  4 Dec 2020 10:59:37 +0100 (CET)
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id BB23C1400744
 for <ltp@lists.linux.it>; Fri,  4 Dec 2020 10:59:36 +0100 (CET)
Received: by mail-ej1-x644.google.com with SMTP id d17so7794436ejy.9
 for <ltp@lists.linux.it>; Fri, 04 Dec 2020 01:59:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Z68jG772eca5ubxG6/Rd8Cmcjn6oSanfclulof/5ulI=;
 b=sN9rGRSCg7jaKrSAB4ulAw41DaC5Kekns3vVMwwuEMBAVo//AcAo9CgW32CFW5539L
 ZYN7DxqiinYpLHpJsODZXVgyT6QwwQYea1ZSuBcJoE+WeVkS9IVdGf88eT407G0TtXx/
 DssQvQ8cm37Fsz3k6qKY9htjBDXAGb3I/uxZdQC9dlJkGeOuDWseT8KrcdHDnl4q6qDN
 FlaK37xRF3zQlqnvfsuWJIChfytC64En5wj7gyf8uPkxP+/31F8hSgJHG+2dVfz4TIcd
 1YrI3xhIhKn0S/tbCkLnFXbgFuB5FAF5wJKHKXFoCROIXN6WOyAeWIC0V8MKt23bNust
 ZmgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z68jG772eca5ubxG6/Rd8Cmcjn6oSanfclulof/5ulI=;
 b=e7JpTozLmAlDsM7wpVR1xuM4a5ttfre7G+T4XvBJNQhihuC+C1aPsnxHqPOpzM9eVM
 doEcVEhmGy4LJM4cGIy6dZX8BQxcrnAxxXxXKo6d0TPqmk/tTlwyhZBQwSrNvfmP5DBH
 ikIFyPOPQJJCjmXJ5dOnp/VTAwnvXXfnn0SDnGAu7fMM4tqvL+fuzSKvNATYu7ptGhiP
 LADNB3W4UTXfSBEjFW4AbCzLWLIw3QFyd9b2JxdqdXUxOHaveGRoRyoEWKQhvEzmQLz8
 x+LnXt7npdZHi6Ajqb26XKIYlKdcxi+zOqHz98qGIMGOiNgJ0V1gcFpYo+L7jh5tsC14
 s2bQ==
X-Gm-Message-State: AOAM532jFc4tTwr/rYMhDHkOFm58gANhI/L9di0VJbzsT+E8BJbBhzrp
 Jv4Lf0sYSDCO77IYWRXUnQ0MT/XqGTU=
X-Google-Smtp-Source: ABdhPJz5xHjWqyVJy5KFvNgMp3smUWXHU6jdaedctwS939I7KN3EzwJ8N4XWvhJJRiuyJT4UBN8rGA==
X-Received: by 2002:a17:906:b0d8:: with SMTP id
 bk24mr6261251ejb.113.1607075976351; 
 Fri, 04 Dec 2020 01:59:36 -0800 (PST)
Received: from localhost.localdomain ([31.210.181.203])
 by smtp.gmail.com with ESMTPSA id qp16sm2701811ejb.74.2020.12.04.01.59.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Dec 2020 01:59:35 -0800 (PST)
From: Amir Goldstein <amir73il@gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Date: Fri,  4 Dec 2020 11:59:27 +0200
Message-Id: <20201204095930.866421-3-amir73il@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201204095930.866421-1-amir73il@gmail.com>
References: <20201204095930.866421-1-amir73il@gmail.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 2/5] syscalls/fanotify: Use generic checks for
 fanotify_init flags
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Convert remaining tests to SAFE_FANOTIFY_INIT and use the generic
helpers to check requires kernel/fs support for fanotify_init flags
in advance.

Signed-off-by: Amir Goldstein <amir73il@gmail.com>
---
 .../kernel/syscalls/fanotify/fanotify10.c     | 26 ++++++++-----------
 .../kernel/syscalls/fanotify/fanotify11.c     | 21 ++++++---------
 .../kernel/syscalls/fanotify/fanotify16.c     | 14 ++--------
 3 files changed, 21 insertions(+), 40 deletions(-)

diff --git a/testcases/kernel/syscalls/fanotify/fanotify10.c b/testcases/kernel/syscalls/fanotify/fanotify10.c
index 404e57daa..cc164359f 100644
--- a/testcases/kernel/syscalls/fanotify/fanotify10.c
+++ b/testcases/kernel/syscalls/fanotify/fanotify10.c
@@ -57,6 +57,7 @@ static unsigned int fanotify_class[] = {
 	FAN_REPORT_DFID_NAME_FID,
 };
 #define NUM_CLASSES ARRAY_SIZE(fanotify_class)
+#define NUM_PRIORITIES 3
 
 #define GROUPS_PER_PRIO 3
 
@@ -64,6 +65,7 @@ static int fd_notify[NUM_CLASSES][GROUPS_PER_PRIO];
 
 static char event_buf[EVENT_BUF_LEN];
 static int exec_events_unsupported;
+static int fan_report_dfid_unsupported;
 static int filesystem_mark_unsupported;
 
 #define MOUNT_PATH "fs_mnt"
@@ -294,21 +296,8 @@ static int create_fanotify_groups(unsigned int n)
 
 	for (p = 0; p < num_classes; p++) {
 		for (i = 0; i < GROUPS_PER_PRIO; i++) {
-			fd_notify[p][i] = fanotify_init(fanotify_class[p] |
-							FAN_NONBLOCK, O_RDONLY);
-			if (fd_notify[p][i] == -1) {
-				if (errno == EINVAL &&
-				    fanotify_class[p] & FAN_REPORT_NAME) {
-					tst_res(TCONF,
-						"FAN_REPORT_NAME not supported by kernel?");
-					/* Do not try creating this group again */
-					num_classes--;
-					return -1;
-				}
-
-				tst_brk(TBROK | TERRNO,
-					"fanotify_init(%x, 0) failed", fanotify_class[p]);
-			}
+			fd_notify[p][i] = SAFE_FANOTIFY_INIT(fanotify_class[p] |
+							     FAN_NONBLOCK, O_RDONLY);
 
 			/*
 			 * Add mark for each group.
@@ -518,6 +507,13 @@ static void setup(void)
 {
 	exec_events_unsupported = fanotify_events_supported_by_kernel(FAN_OPEN_EXEC);
 	filesystem_mark_unsupported = fanotify_mark_supported_by_kernel(FAN_MARK_FILESYSTEM);
+	fan_report_dfid_unsupported = fanotify_init_flags_supported_on_fs(FAN_REPORT_DFID_NAME,
+									  MOUNT_PATH);
+	if (fan_report_dfid_unsupported) {
+		FANOTIFY_INIT_FLAGS_ERR_MSG(FAN_REPORT_DFID_NAME, fan_report_dfid_unsupported);
+		/* Limit tests to legacy priority classes */
+		num_classes = NUM_PRIORITIES;
+	}
 
 	/* Create another bind mount at another path for generating events */
 	SAFE_MKDIR(MNT2_PATH, 0755);
diff --git a/testcases/kernel/syscalls/fanotify/fanotify11.c b/testcases/kernel/syscalls/fanotify/fanotify11.c
index 785b5c5a5..f3b60cecb 100644
--- a/testcases/kernel/syscalls/fanotify/fanotify11.c
+++ b/testcases/kernel/syscalls/fanotify/fanotify11.c
@@ -36,6 +36,8 @@
 #define gettid() syscall(SYS_gettid)
 static int tid;
 
+static int fan_report_tid_unsupported;
+
 void *thread_create_file(void *arg LTP_ATTRIBUTE_UNUSED)
 {
 	char tid_file[64] = {0};
@@ -63,17 +65,13 @@ void test01(unsigned int i)
 			i, (tcases[i] & FAN_REPORT_TID) ? "with" : "without",
 			tgid, tid, event.pid);
 
-	fd_notify = fanotify_init(tcases[i], 0);
-	if (fd_notify < 0) {
-		if (errno == EINVAL && (tcases[i] & FAN_REPORT_TID)) {
-			tst_res(TCONF,
-				"FAN_REPORT_TID not supported in kernel?");
-			return;
-		}
-		tst_brk(TBROK | TERRNO, "fanotify_init(0x%x, 0) failed",
-				tcases[i]);
+	if (fan_report_tid_unsupported && (tcases[i] & FAN_REPORT_TID)) {
+		FANOTIFY_INIT_FLAGS_ERR_MSG(FAN_REPORT_TID, fan_report_tid_unsupported);
+		return;
 	}
 
+	fd_notify = SAFE_FANOTIFY_INIT(tcases[i], 0);
+
 	SAFE_FANOTIFY_MARK(fd_notify, FAN_MARK_ADD,
 			FAN_ALL_EVENTS | FAN_EVENT_ON_CHILD, AT_FDCWD, ".");
 
@@ -96,10 +94,7 @@ void test01(unsigned int i)
 
 static void setup(void)
 {
-	int fd;
-
-	fd = SAFE_FANOTIFY_INIT(FAN_CLASS_NOTIF, O_RDONLY);
-	SAFE_CLOSE(fd);
+	fan_report_tid_unsupported = fanotify_init_flags_supported_by_kernel(FAN_REPORT_TID);
 }
 
 static struct tst_test test = {
diff --git a/testcases/kernel/syscalls/fanotify/fanotify16.c b/testcases/kernel/syscalls/fanotify/fanotify16.c
index a4409df14..5ffaec92f 100644
--- a/testcases/kernel/syscalls/fanotify/fanotify16.c
+++ b/testcases/kernel/syscalls/fanotify/fanotify16.c
@@ -158,17 +158,7 @@ static void do_test(unsigned int number)
 
 	tst_res(TINFO, "Test #%d: %s", number, tc->tname);
 
-	fd_notify = fanotify_init(group->flag, 0);
-	if (fd_notify == -1) {
-		if (errno == EINVAL) {
-			tst_res(TCONF,
-				"%s not supported by kernel", group->name);
-			return;
-		}
-
-		tst_brk(TBROK | TERRNO,
-			"fanotify_init(%s, 0) failed", group->name);
-	}
+	fd_notify = SAFE_FANOTIFY_INIT(group->flag, 0);
 
 	/*
 	 * Watch dir modify events with name in filesystem/dir
@@ -551,7 +541,7 @@ check_match:
 
 static void setup(void)
 {
-	REQUIRE_FANOTIFY_INIT_FLAGS_SUPPORTED_ON_FS(FAN_REPORT_FID, MOUNT_PATH);
+	REQUIRE_FANOTIFY_INIT_FLAGS_SUPPORTED_ON_FS(FAN_REPORT_DIR_FID, MOUNT_PATH);
 
 	sprintf(dname1, "%s/%s", MOUNT_PATH, DIR_NAME1);
 	sprintf(dname2, "%s/%s", MOUNT_PATH, DIR_NAME2);
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
