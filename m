Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF042CEB88
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Dec 2020 11:00:28 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3BD263C4C0F
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Dec 2020 11:00:28 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 245E53C58E9
 for <ltp@lists.linux.it>; Fri,  4 Dec 2020 10:59:41 +0100 (CET)
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id CD888200FD5
 for <ltp@lists.linux.it>; Fri,  4 Dec 2020 10:59:40 +0100 (CET)
Received: by mail-ej1-x643.google.com with SMTP id n26so7820340eju.6
 for <ltp@lists.linux.it>; Fri, 04 Dec 2020 01:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=svSO34I/VfcgIbgCom3JarBphso/yZTKpYYNjygr4Gg=;
 b=GLM41DohrSX9aq6Ujysl0uOsDF9dRbKGsVYBwJwAlBUg4FBgtlB2NsQhsf9vuiDvSv
 dtxYJY5Y4q5okD4xKKqlsVwR2kgh6VE6A/VuOLNK04y7VrxJQB2jCI6qcNPMrJypEh4q
 pWzoPgs06pY3FhTbnkR6OG7RAYtO4bHM4XIuER6Wr23inPn9PtAlSkAaYJBGbX1hV5/3
 1/9uZm1Hq5LduwBkkR+u8jR61hXHq7+QuizfA5KdX7fPHGXf078QoNZNPP/imGyUeiUo
 r8VAhAaAw8/Kn1zt5EpJDKvEH48boDmCmA5XKWZra9YjZhONrlngugcXl0gK6wO79Njp
 tvMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=svSO34I/VfcgIbgCom3JarBphso/yZTKpYYNjygr4Gg=;
 b=QlrCYhdQZk9XIfANolFadppJG+1k+4b4a8NEO4qzLRYXaQw9zP6SGz08x6GoG9l1VO
 kwOX8goau0YxSSh6jKWZAjzwjvOATpFnnJSn8hVWfQzLycwspPjqzOCnUdzRWYNv8OMK
 dalfjcwCUb9JioGNN6rI/0+K0CzrP5NlqH0KSCQPNA4tqRHkTT4YdOHpxL92ij/ssa6b
 vBvbnNH1VrDQ46LnleLlPWh5xuj/WeW7fWi2sVY2nt54Mfx29nMFw4qmglwxgPqQoM9I
 waXTA+awNFVAs9lvenIz6QKmqnlutLQN+qAKHA3B931MXpIUEELa7tygbtGBH9SB37dV
 r36Q==
X-Gm-Message-State: AOAM533mm/UHFkFnDFReffE7FykRctc2JyKGEiSaepmCZTkOCso4gXmL
 6WwvvQdZSrv0mhHPgsTVSebEeDKu0UM=
X-Google-Smtp-Source: ABdhPJy58ermqKF20LBPLWRMA4vCNpYfb/GL3g8Y5DC9NXWIe5CHw1v5VY6sqPrxO1HKtuPM8qbu5Q==
X-Received: by 2002:a17:906:17d1:: with SMTP id
 u17mr6199854eje.6.1607075980442; 
 Fri, 04 Dec 2020 01:59:40 -0800 (PST)
Received: from localhost.localdomain ([31.210.181.203])
 by smtp.gmail.com with ESMTPSA id qp16sm2701811ejb.74.2020.12.04.01.59.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Dec 2020 01:59:39 -0800 (PST)
From: Amir Goldstein <amir73il@gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Date: Fri,  4 Dec 2020 11:59:30 +0200
Message-Id: <20201204095930.866421-6-amir73il@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201204095930.866421-1-amir73il@gmail.com>
References: <20201204095930.866421-1-amir73il@gmail.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 5/5] syscalls/fanotify09: Add test case for events
 with filename info
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

Kernel v5.9 has a bug when there is a mark on filesystem or mount
interested in events with filename AND there is an additional
mark on a parent watching children.

In some situations the event is reported to filesystem or mount mark
without the filename info.

This bug is fixed by kernel commit 7372e79c9eb9:
  fanotify: fix logic of reporting name info with watched parent

The test case requires a blockdev filesystem.

Signed-off-by: Amir Goldstein <amir73il@gmail.com>
---
 .../kernel/syscalls/fanotify/fanotify09.c     | 49 ++++++++++++++++---
 1 file changed, 42 insertions(+), 7 deletions(-)

diff --git a/testcases/kernel/syscalls/fanotify/fanotify09.c b/testcases/kernel/syscalls/fanotify/fanotify09.c
index 0f1923981..25b6b8be1 100644
--- a/testcases/kernel/syscalls/fanotify/fanotify09.c
+++ b/testcases/kernel/syscalls/fanotify/fanotify09.c
@@ -19,6 +19,10 @@
  * Test case #2 is a regression test for commit 55bf882c7f13:
  *
  *      fanotify: fix merging marks masks with FAN_ONDIR
+ *
+ * Test case #5 is a regression test for commit 7372e79c9eb9:
+ *
+ *      fanotify: fix logic of reporting name info with watched parent
  */
 #define _GNU_SOURCE
 #include "config.h"
@@ -53,15 +57,19 @@ static int fd_notify[NUM_GROUPS];
 
 static char event_buf[EVENT_BUF_LEN];
 
+#define MOUNT_PATH "fs_mnt"
 #define MOUNT_NAME "mntpoint"
 #define DIR_NAME "testdir"
 #define FILE2_NAME "testfile"
 static int mount_created;
 
+static int fan_report_dfid_unsupported;
+
 static struct tcase {
 	const char *tname;
 	struct fanotify_mark_type mark;
 	unsigned int ondir;
+	unsigned int report_name;
 	const char *close_nowrite;
 	int nevents;
 } tcases[] = {
@@ -69,6 +77,7 @@ static struct tcase {
 		"Events on non-dir child with both parent and mount marks",
 		INIT_FANOTIFY_MARK_TYPE(MOUNT),
 		0,
+		0,
 		DIR_NAME,
 		1,
 	},
@@ -76,6 +85,7 @@ static struct tcase {
 		"Events on non-dir child and subdir with both parent and mount marks",
 		INIT_FANOTIFY_MARK_TYPE(MOUNT),
 		FAN_ONDIR,
+		0,
 		DIR_NAME,
 		2,
 	},
@@ -83,6 +93,7 @@ static struct tcase {
 		"Events on non-dir child and parent with both parent and mount marks",
 		INIT_FANOTIFY_MARK_TYPE(MOUNT),
 		FAN_ONDIR,
+		0,
 		".",
 		2,
 	},
@@ -90,6 +101,7 @@ static struct tcase {
 		"Events on non-dir child and subdir with both parent and subdir marks",
 		INIT_FANOTIFY_MARK_TYPE(INODE),
 		FAN_ONDIR,
+		0,
 		DIR_NAME,
 		2,
 	},
@@ -97,6 +109,15 @@ static struct tcase {
 		"Events on non-dir children with both parent and mount marks",
 		INIT_FANOTIFY_MARK_TYPE(MOUNT),
 		0,
+		0,
+		FILE2_NAME,
+		2,
+	},
+	{
+		"Events on non-dir child with both parent and mount marks and filename info",
+		INIT_FANOTIFY_MARK_TYPE(MOUNT),
+		0,
+		FAN_REPORT_DFID_NAME,
 		FILE2_NAME,
 		2,
 	},
@@ -105,12 +126,15 @@ static struct tcase {
 static void create_fanotify_groups(struct tcase *tc)
 {
 	struct fanotify_mark_type *mark = &tc->mark;
-	unsigned int i, onchild, ondir = tc->ondir;
+	unsigned int i, onchild, report_name, ondir = tc->ondir;
 
 	for (i = 0; i < NUM_GROUPS; i++) {
-		fd_notify[i] = SAFE_FANOTIFY_INIT(FAN_CLASS_NOTIF |
-						  FAN_NONBLOCK,
-						  O_RDONLY);
+		/*
+		 * The first group may request events with filename info.
+		 */
+		report_name = (i == 0) ? tc->report_name : 0;
+		fd_notify[i] = SAFE_FANOTIFY_INIT(FAN_CLASS_NOTIF | report_name |
+						  FAN_NONBLOCK, O_RDONLY);
 
 		/*
 		 * Add subdir or mount mark for each group with CLOSE event,
@@ -217,6 +241,11 @@ static void test_fanotify(unsigned int n)
 
 	tst_res(TINFO, "Test #%d: %s", n, tc->tname);
 
+	if (fan_report_dfid_unsupported && tc->report_name) {
+		FANOTIFY_INIT_FLAGS_ERR_MSG(FAN_REPORT_DFID_NAME, fan_report_dfid_unsupported);
+		return;
+	}
+
 	create_fanotify_groups(tc);
 
 	/*
@@ -249,10 +278,11 @@ static void test_fanotify(unsigned int n)
 			ret, tc->nevents * (int)FAN_EVENT_METADATA_LEN);
 	}
 	event = (struct fanotify_event_metadata *)event_buf;
-	verify_event(0, event, FAN_MODIFY, "");
+	verify_event(0, event, FAN_MODIFY, tc->report_name ? fname : "");
 	event = FAN_EVENT_NEXT(event, ret);
 	if (tc->nevents > 1) {
-		verify_event(0, event, FAN_CLOSE_NOWRITE, "");
+		verify_event(0, event, FAN_CLOSE_NOWRITE,
+			     tc->report_name ? (tc->ondir ? "." : tc->close_nowrite) : "");
 		event = FAN_EVENT_NEXT(event, ret);
 	}
 	if (ret > 0) {
@@ -304,8 +334,11 @@ static void test_fanotify(unsigned int n)
 
 static void setup(void)
 {
+	fan_report_dfid_unsupported = fanotify_init_flags_supported_on_fs(FAN_REPORT_DFID_NAME,
+									  MOUNT_PATH);
+
 	SAFE_MKDIR(MOUNT_NAME, 0755);
-	SAFE_MOUNT(MOUNT_NAME, MOUNT_NAME, "none", MS_BIND, NULL);
+	SAFE_MOUNT(MOUNT_PATH, MOUNT_NAME, "none", MS_BIND, NULL);
 	mount_created = 1;
 	SAFE_CHDIR(MOUNT_NAME);
 	SAFE_MKDIR(DIR_NAME, 0755);
@@ -330,6 +363,8 @@ static struct tst_test test = {
 	.tcnt = ARRAY_SIZE(tcases),
 	.setup = setup,
 	.cleanup = cleanup,
+	.mount_device = 1,
+	.mntpoint = MOUNT_PATH,
 	.needs_tmpdir = 1,
 	.needs_root = 1,
 	.tags = (const struct tst_tag[]) {
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
