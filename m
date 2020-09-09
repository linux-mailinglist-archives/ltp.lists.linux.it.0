Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E693226352A
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Sep 2020 19:58:28 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 984DA3C2C25
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Sep 2020 19:58:28 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 4DAA23C3228
 for <ltp@lists.linux.it>; Wed,  9 Sep 2020 19:57:26 +0200 (CEST)
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id F34871A00E5F
 for <ltp@lists.linux.it>; Wed,  9 Sep 2020 19:57:25 +0200 (CEST)
Received: by mail-wm1-x344.google.com with SMTP id q9so3169038wmj.2
 for <ltp@lists.linux.it>; Wed, 09 Sep 2020 10:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=O3mF9HS/Umpd6BDIUTfY84J4Iag8BHPy8RyC+lI9oUk=;
 b=YDZDyOrj24Xn6gLYTURjBqlRwE18PUsmE+06wRRkSx/nrSO5vwQObhGEm6YgxlP6+X
 FpPFl8gxPvyz1FR4IiN3iLkPd8jnnqclh8bZPjp6ThZZyvtD5cHB/MeRHZk8gT9zJ0io
 XbtYxm/aBrQypBgwh2njhrBclGOLbukvc9exaySpSBvooYs1wYB5emKjRAYXNAKOR6Ap
 lzOGN07gkUlPwRvE7TM57iZBE/KbmSrwM0flPqvL8IYUjl7IjDYV+ykt6uPdAXXm5009
 XojQqhzMUCFMfgnxtnxH6aIRPv+NrwPUID8Xnn9Pzt1gQQAR6daB861zusq8u9FXDdnD
 1H5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=O3mF9HS/Umpd6BDIUTfY84J4Iag8BHPy8RyC+lI9oUk=;
 b=oVjwv66eZTT2KUyBSa/t6xuHfLRMmh1FFK0vGq3X83HUevlV4YpWI51JSqt35iGM2n
 NFGooBw0zQAdoAKvI61BRPf7T6jHSwSnYTxjpyBO+F9M3/iENA5Ic7YvvAUwi/ilrTmm
 OeWKEsyqRVN3ey9dNHzOS+eXqrAFZu5uo47NvuFqoiYf3rvip/7qUtcebIYv3C0SYpXw
 PcQ052wrVRolmLitqqu32nBYtAQlJRCVOleKKXfvl9pvYIUaADDfM9JX51+4whMKm3RU
 eiSkmM71/sN7EL4Oh2cgZn4WF2syQKnqW5LDGCRcRENqIJ23CdSnKDrstvA+MJz3eHH5
 yUTQ==
X-Gm-Message-State: AOAM530a8FePEcKhY7hLmN4Afj3ViH2+gAGmK4KHNf6uDbtX8wuWZHXn
 Oac0BMCY4s04rwOg/NvuS2w=
X-Google-Smtp-Source: ABdhPJyL3sZJnLxD/3/aBvUA9WX8AzwMTJJSRR7QIanoPDRfiY1JOWP+PFQ/+hMvIp8KOtCabKhMFQ==
X-Received: by 2002:a1c:81c6:: with SMTP id c189mr4607916wmd.124.1599674245478; 
 Wed, 09 Sep 2020 10:57:25 -0700 (PDT)
Received: from localhost.localdomain ([141.226.8.56])
 by smtp.gmail.com with ESMTPSA id z83sm4979714wmb.4.2020.09.09.10.57.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2020 10:57:25 -0700 (PDT)
From: Amir Goldstein <amir73il@gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Date: Wed,  9 Sep 2020 20:57:04 +0300
Message-Id: <20200909175707.10670-8-amir73il@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200909175707.10670-1-amir73il@gmail.com>
References: <20200909175707.10670-1-amir73il@gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 07/10] syscalls/inotify: New test for watches on both
 parent and child
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

Check that an inotify event is reported to both watching parent and
watching child when the child metadata changes.

Signed-off-by: Amir Goldstein <amir73il@gmail.com>
---
 runtest/syscalls                              |   1 +
 testcases/kernel/syscalls/inotify/.gitignore  |   1 +
 testcases/kernel/syscalls/inotify/inotify10.c | 149 ++++++++++++++++++
 3 files changed, 151 insertions(+)
 create mode 100644 testcases/kernel/syscalls/inotify/inotify10.c

diff --git a/runtest/syscalls b/runtest/syscalls
index 376a2bc6b..b556fb85d 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -564,6 +564,7 @@ inotify06 inotify06
 inotify07 inotify07
 inotify08 inotify08
 inotify09 inotify09
+inotify10 inotify10
 
 fanotify01 fanotify01
 fanotify02 fanotify02
diff --git a/testcases/kernel/syscalls/inotify/.gitignore b/testcases/kernel/syscalls/inotify/.gitignore
index 32ccab5de..da9bfc767 100644
--- a/testcases/kernel/syscalls/inotify/.gitignore
+++ b/testcases/kernel/syscalls/inotify/.gitignore
@@ -7,3 +7,4 @@
 /inotify07
 /inotify08
 /inotify09
+/inotify10
diff --git a/testcases/kernel/syscalls/inotify/inotify10.c b/testcases/kernel/syscalls/inotify/inotify10.c
new file mode 100644
index 000000000..1c43915a8
--- /dev/null
+++ b/testcases/kernel/syscalls/inotify/inotify10.c
@@ -0,0 +1,149 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2020 CTERA Networks. All Rights Reserved.
+ *
+ * Started by Amir Goldstein <amir73il@gmail.com>
+ *
+ * DESCRIPTION
+ *     Check that event is reported to both watching parent and watching child
+ */
+
+#include "config.h"
+
+#if defined(HAVE_SYS_INOTIFY_H)
+# include <sys/inotify.h>
+#endif
+#include <errno.h>
+#include <string.h>
+#include "tst_test.h"
+#include "inotify.h"
+
+#if defined(HAVE_SYS_INOTIFY_H)
+
+#define EVENT_MAX 10
+/* Size of the event structure, not including the name */
+#define EVENT_SIZE  (sizeof(struct inotify_event))
+#define EVENT_BUF_LEN        (EVENT_MAX * (EVENT_SIZE + 16))
+
+
+#define BUF_SIZE 256
+
+struct event_t {
+	char name[BUF_SIZE];
+	unsigned int mask;
+	int wd;
+};
+
+#define	TEST_DIR	"test_dir"
+#define	TEST_FILE	"test_file"
+
+struct event_t event_set[EVENT_MAX];
+
+char event_buf[EVENT_BUF_LEN];
+
+int fd_notify;
+
+static void verify_inotify(void)
+{
+	int i = 0, test_num = 0, len;
+	int wd_parent, wd_dir, wd_file;
+	int test_cnt = 0;
+
+	fd_notify = SAFE_MYINOTIFY_INIT();
+
+	/* Set watch on both parent dir and children */
+	wd_parent = SAFE_MYINOTIFY_ADD_WATCH(fd_notify, ".", IN_ATTRIB);
+	wd_dir = SAFE_MYINOTIFY_ADD_WATCH(fd_notify, TEST_DIR, IN_ATTRIB);
+	wd_file = SAFE_MYINOTIFY_ADD_WATCH(fd_notify, TEST_FILE, IN_ATTRIB);
+
+	/*
+	 * Generate events on file and subdir that should be reported to parent
+	 * dir with name and to children without name.
+	 */
+	SAFE_CHMOD(TEST_DIR, 0755);
+	SAFE_CHMOD(TEST_FILE, 0644);
+
+	event_set[test_cnt].wd = wd_parent;
+	event_set[test_cnt].mask = IN_ATTRIB | IN_ISDIR;
+	strcpy(event_set[test_cnt].name, TEST_DIR);
+	test_cnt++;
+	event_set[test_cnt].wd = wd_dir;
+	event_set[test_cnt].mask = IN_ATTRIB | IN_ISDIR;
+	strcpy(event_set[test_cnt].name, "");
+	test_cnt++;
+	event_set[test_cnt].wd = wd_parent;
+	event_set[test_cnt].mask = IN_ATTRIB;
+	strcpy(event_set[test_cnt].name, TEST_FILE);
+	test_cnt++;
+	event_set[test_cnt].wd = wd_file;
+	event_set[test_cnt].mask = IN_ATTRIB;
+	strcpy(event_set[test_cnt].name, "");
+	test_cnt++;
+
+	len = read(fd_notify, event_buf, EVENT_BUF_LEN);
+	if (len == -1)
+		tst_brk(TBROK | TERRNO, "read failed");
+
+	while (i < len) {
+		struct event_t *expected = &event_set[test_num];
+		struct inotify_event *event;
+		event = (struct inotify_event *)&event_buf[i];
+		if (test_num >= test_cnt) {
+			tst_res(TFAIL,
+				"got unnecessary event: "
+				"wd=%d mask=%04x len=%u "
+				"name=\"%.*s\"", event->wd, event->mask,
+				event->len, event->len, event->name);
+
+		} else if (expected->wd == event->wd &&
+			   expected->mask == event->mask &&
+			   !strncmp(expected->name, event->name, event->len)) {
+			tst_res(TPASS,
+				"got event: wd=%d mask=%04x "
+				"cookie=%u len=%u name=\"%.*s\"",
+				event->wd, event->mask, event->cookie,
+				event->len, event->len, event->name);
+
+		} else {
+			tst_res(TFAIL, "got event: wd=%d (expected %d) "
+				"mask=%04x (expected %x) len=%u "
+				"name=\"%.*s\" (expected \"%s\")",
+				event->wd, expected->wd,
+				event->mask, expected->mask,
+				event->len, event->len,
+				event->name, expected->name);
+		}
+		test_num++;
+		i += EVENT_SIZE + event->len;
+	}
+
+	for (; test_num < test_cnt; test_num++) {
+		tst_res(TFAIL, "didn't get event: mask=%04x ",
+			event_set[test_num].mask);
+	}
+
+	SAFE_CLOSE(fd_notify);
+}
+
+static void setup(void)
+{
+	SAFE_MKDIR(TEST_DIR, 00700);
+	SAFE_FILE_PRINTF(TEST_FILE, "1");
+}
+
+static void cleanup(void)
+{
+	if (fd_notify > 0)
+		SAFE_CLOSE(fd_notify);
+}
+
+static struct tst_test test = {
+	.needs_tmpdir = 1,
+	.setup = setup,
+	.cleanup = cleanup,
+	.test_all = verify_inotify,
+};
+
+#else
+	TST_TEST_TCONF("system doesn't have required inotify support");
+#endif /* defined(HAVE_SYS_INOTIFY_H) */
-- 
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
