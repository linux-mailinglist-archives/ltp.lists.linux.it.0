Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BECA442BF3
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Nov 2021 11:58:12 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8DB453C71BE
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Nov 2021 11:58:11 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C875D3C6349
 for <ltp@lists.linux.it>; Tue,  2 Nov 2021 11:58:07 +0100 (CET)
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 717471A005E8
 for <ltp@lists.linux.it>; Tue,  2 Nov 2021 11:58:06 +0100 (CET)
Received: by mail-pg1-x52d.google.com with SMTP id n23so9153977pgh.8
 for <ltp@lists.linux.it>; Tue, 02 Nov 2021 03:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=6qhnOTltiVlJpM2c/mEhWEe2pn2chPWGq2CZwlksfHc=;
 b=EPdwsQienLeZQc0YHqjzlKiLBHcTjnXJm5TLpV2gHtMJvDYuz0Hf/9vAAQXr0SRSDI
 x7ia8RF/knZn+SvBlcV1jUL2CEga6PFVYXUlPLy9NkqqEdX6K4TwFMqW4a/TV8BhuDG7
 fFb995OxjzgyYfIoV5/TqxWe0CgGYB5vadaU54mh/VCX5Jogu6Z4AE4cSCXwBl5/GGYe
 5rVvxEoQIsY52Tq/EvT1Rwt7Xc67Z8xL0IY05iaU6xvUCn/KCBkDR36YWwPXOJyEXhGE
 zTObOOCQgVBucSpRC2LH4AVL2eopSt0Ujn9D6WE+jJAtxjRonVC8JNRoQrn60B52HZqk
 ipuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6qhnOTltiVlJpM2c/mEhWEe2pn2chPWGq2CZwlksfHc=;
 b=sp/dXsx65afGK88adETuuTd/VLEfQ/d6to55WfUYCh1cp0yDS3mbhrSOLi/BrS1iO2
 1OPhAr/cmf0k5nmL7i9wUE/0SjEzRpZe5Y7CPGLv8mKMXXbmHIBe30ib4jlz2JZClRRc
 u2mPTZELY6XEwW8M5sSnAwHnwNT7MA9SMTSGjMVnw9ZZOxVu9nna4Qm5M4yB8Lj/flJ/
 KnUEwcO7KKvfAhpiAECH/L6VTRRGJ/XG09JPS90i59h9kgsioME7Q3RAsHV4ChZuyqSp
 G2q4rPbstJfkLtOqZ8WjURwo+TNwI4D6Eve0kgFZok67naOEA0BHmqjvKnvvEn3Ww71J
 epag==
X-Gm-Message-State: AOAM531ppMJAIOxuGqrdarmrq1ZqX1mTIiy8+Rsw+oZwatEpChVMYeGE
 leOYHYCVYpIcWfEPyozUpzB1fOQ+Mj0EPw==
X-Google-Smtp-Source: ABdhPJykxElDhy/wlKL4pcjI3p79goi36JhqoOj/ZIgLP8Noaqh0jCie+oHpD97KDxhGf5m5NkD1jA==
X-Received: by 2002:a63:78a:: with SMTP id 132mr26791524pgh.83.1635850684416; 
 Tue, 02 Nov 2021 03:58:04 -0700 (PDT)
Received: from google.com (64.157.240.35.bc.googleusercontent.com.
 [35.240.157.64])
 by smtp.gmail.com with ESMTPSA id x17sm18000381pfa.209.2021.11.02.03.58.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 03:58:03 -0700 (PDT)
Date: Tue, 2 Nov 2021 10:57:57 +0000
To: ltp@lists.linux.it
Message-ID: <229fb61317343cf30d481d05da272657c7572f59.1635849607.git.repnop@google.com>
References: <cover.1635849607.git.repnop@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1635849607.git.repnop@google.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-14.9 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,
 SPF_PASS,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v2 2/2] syscalls/fanotify21: add new test checking the
 returned pidfd from fanotify in FAN_REPORT_PIDFD mode
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
From: Matthew Bobrowski via ltp <ltp@lists.linux.it>
Reply-To: Matthew Bobrowski <repnop@google.com>
Cc: jack@suse.cz
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

A new test that performs verification on the values returned within
the struct fanotify_event_info_pidfd record when the notification
group has been intialized in FAN_REPORT_PIDFD mode.

Signed-off-by: Matthew Bobrowski <repnop@google.com>
Reviewed-by: Amir Goldstein <amir73il@gmail.com>
---
Changes since v1:
 - Adapted do_setup() to make use of the
   REQUIRE_FANOTIFY_INIT_FLAGS_SUPPORTED_BY_KERNEL() rather than open
   coding it.

 - For parsing procfs information, rather than reimplementing parsing
   utility functions, make use of the existing SAFE_FILE_LINES_SCANF()
   library function.

 testcases/kernel/syscalls/fanotify/.gitignore |   1 +
 .../kernel/syscalls/fanotify/fanotify21.c     | 306 ++++++++++++++++++
 2 files changed, 307 insertions(+)
 create mode 100644 testcases/kernel/syscalls/fanotify/fanotify21.c

diff --git a/testcases/kernel/syscalls/fanotify/.gitignore b/testcases/kernel/syscalls/fanotify/.gitignore
index c99e6fff7..35e73b91e 100644
--- a/testcases/kernel/syscalls/fanotify/.gitignore
+++ b/testcases/kernel/syscalls/fanotify/.gitignore
@@ -18,4 +18,5 @@
 /fanotify18
 /fanotify19
 /fanotify20
+/fanotify21
 /fanotify_child
diff --git a/testcases/kernel/syscalls/fanotify/fanotify21.c b/testcases/kernel/syscalls/fanotify/fanotify21.c
new file mode 100644
index 000000000..e842dad17
--- /dev/null
+++ b/testcases/kernel/syscalls/fanotify/fanotify21.c
@@ -0,0 +1,306 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2021 Google. All Rights Reserved.
+ *
+ * Started by Matthew Bobrowski <repnop@google.com>
+ */
+
+/*\
+ * [Description]
+ *
+ * A test which verifies whether the returned struct
+ * fanotify_event_info_pidfd in FAN_REPORT_PIDFD mode contains the
+ * expected set of information.
+ */
+
+#define _GNU_SOURCE
+#include <stdio.h>
+#include <ctype.h>
+#include <stdlib.h>
+#include <string.h>
+#include "tst_test.h"
+#include "tst_safe_stdio.h"
+#include "lapi/pidfd_open.h"
+
+#ifdef HAVE_SYS_FANOTIFY_H
+#include "fanotify.h"
+
+#define BUF_SZ		4096
+#define MOUNT_PATH	"fs_mnt"
+#define TEST_FILE	MOUNT_PATH "/testfile"
+
+struct pidfd_fdinfo_t {
+	int pos;
+	int flags;
+	int mnt_id;
+	int pid;
+	int ns_pid;
+};
+
+struct test_case_t {
+	char *name;
+	int fork;
+	int want_pidfd_err;
+} test_cases[] = {
+	{
+		"return a valid pidfd for event created by self",
+		0,
+		0,
+	},
+	{
+		"return invalid pidfd for event created by terminated child",
+		1,
+		FAN_NOPIDFD,
+	},
+};
+
+static int fanotify_fd;
+static char event_buf[BUF_SZ];
+static struct pidfd_fdinfo_t *self_pidfd_fdinfo = NULL;
+
+static struct pidfd_fdinfo_t *read_pidfd_fdinfo(int pidfd)
+{
+	char *fdinfo_path;
+	struct pidfd_fdinfo_t *pidfd_fdinfo;
+
+	pidfd_fdinfo = SAFE_MALLOC(sizeof(struct pidfd_fdinfo_t));
+
+	SAFE_ASPRINTF(&fdinfo_path, "/proc/self/fdinfo/%d", pidfd);
+	SAFE_FILE_LINES_SCANF(fdinfo_path, "pos: %d", &pidfd_fdinfo->pos);
+	SAFE_FILE_LINES_SCANF(fdinfo_path, "flags: %d", &pidfd_fdinfo->flags);
+	SAFE_FILE_LINES_SCANF(fdinfo_path, "mnt_id: %d", &pidfd_fdinfo->mnt_id);
+	SAFE_FILE_LINES_SCANF(fdinfo_path, "Pid: %d", &pidfd_fdinfo->pid);
+	SAFE_FILE_LINES_SCANF(fdinfo_path, "NSpid: %d", &pidfd_fdinfo->ns_pid);
+
+	free(fdinfo_path);
+
+	return pidfd_fdinfo;
+}
+
+static void generate_event(void)
+{
+	int fd;
+
+	/* Generate a single FAN_OPEN event on the watched object. */
+	fd = SAFE_OPEN(TEST_FILE, O_RDONLY);
+	SAFE_CLOSE(fd);
+}
+
+static void do_fork(void)
+{
+	int status;
+	pid_t child;
+
+	child = SAFE_FORK();
+	if (child == 0) {
+		SAFE_CLOSE(fanotify_fd);
+		generate_event();
+		exit(EXIT_SUCCESS);
+	}
+
+	SAFE_WAITPID(child, &status, 0);
+	if (WIFEXITED(status) && WEXITSTATUS(status) != 0)
+		tst_brk(TBROK,
+			"child process terminated incorrectly");
+}
+
+static void do_setup(void)
+{
+	int pidfd;
+
+	SAFE_TOUCH(TEST_FILE, 0666, NULL);
+
+	/*
+	 * An explicit check for FAN_REPORT_PIDFD is performed early
+	 * on in the test initialization as it's a prerequisite for
+	 * all test cases.
+	 */
+	REQUIRE_FANOTIFY_INIT_FLAGS_SUPPORTED_BY_KERNEL(FAN_REPORT_PIDFD);
+
+	fanotify_fd = SAFE_FANOTIFY_INIT(FAN_REPORT_PIDFD, O_RDONLY);
+	SAFE_FANOTIFY_MARK(fanotify_fd, FAN_MARK_ADD, FAN_OPEN, AT_FDCWD,
+			   TEST_FILE);
+
+	pidfd = pidfd_open(getpid(), 0);
+	if (pidfd < 0) {
+		tst_brk(TBROK | TERRNO,
+			"pidfd=%d, pidfd_open(%d, 0) failed",
+			pidfd, getpid());
+	}
+
+	self_pidfd_fdinfo = read_pidfd_fdinfo(pidfd);
+	if (self_pidfd_fdinfo == NULL) {
+		tst_brk(TBROK,
+			"pidfd=%d, failed to read pidfd fdinfo",
+			pidfd);
+	}
+}
+
+static void do_test(unsigned int num)
+{
+	int i = 0, len;
+	struct test_case_t *tc = &test_cases[num];
+
+	tst_res(TINFO, "Test #%d: %s", num, tc->name);
+
+	/*
+	 * Generate the event in either self or a child process. Event
+	 * generation in a child process is done so that the FAN_NOPIDFD case
+	 * can be verified.
+	 */
+	if (tc->fork)
+		do_fork();
+	else
+		generate_event();
+
+	/*
+	 * Read all of the queued events into the provided event
+	 * buffer.
+	 */
+	len = SAFE_READ(0, fanotify_fd, event_buf, sizeof(event_buf));
+	while(i < len) {
+		struct fanotify_event_metadata *event;
+		struct fanotify_event_info_pidfd *info;
+		struct pidfd_fdinfo_t *event_pidfd_fdinfo = NULL;
+
+		event = (struct fanotify_event_metadata *)&event_buf[i];
+		info = (struct fanotify_event_info_pidfd *)(event + 1);
+
+		/*
+		 * Checks ensuring that pidfd information record object header
+		 * fields are set correctly.
+		 */
+		if (info->hdr.info_type != FAN_EVENT_INFO_TYPE_PIDFD) {
+			tst_res(TFAIL,
+				"unexpected info_type received in info "
+				"header (expected: %d, got: %d",
+				FAN_EVENT_INFO_TYPE_PIDFD,
+				info->hdr.info_type);
+			info = NULL;
+			goto next_event;
+		} else if (info->hdr.len !=
+			   sizeof(struct fanotify_event_info_pidfd)) {
+			tst_res(TFAIL,
+				"unexpected info object length "
+				"(expected: %lu, got: %d",
+				sizeof(struct fanotify_event_info_pidfd),
+				info->hdr.len);
+			info = NULL;
+			goto next_event;
+		}
+
+		/*
+		 * Check if pidfd information object reported any errors during
+		 * creation and whether they're expected.
+		 */
+		if (info->pidfd < 0 && !tc->want_pidfd_err) {
+			tst_res(TFAIL,
+				"pidfd creation failed for pid: %u with pidfd error value "
+				"set to: %d",
+				(unsigned)event->pid,
+				info->pidfd);
+			goto next_event;
+		} else if (tc->want_pidfd_err &&
+			   info->pidfd != tc->want_pidfd_err) {
+			tst_res(TFAIL,
+				"pidfd set to an unexpected error: %d for pid: %u",
+				info->pidfd,
+				(unsigned)event->pid);
+			goto next_event;
+		} else if (tc->want_pidfd_err &&
+			   info->pidfd == tc->want_pidfd_err) {
+			tst_res(TPASS,
+				"pid: %u terminated before pidfd was created, "
+				"pidfd set to the value of: %d, as expected",
+				(unsigned)event->pid,
+				FAN_NOPIDFD);
+			goto next_event;
+		}
+
+		/*
+		 * No pidfd errors occurred, continue with verifying pidfd
+		 * fdinfo validity.
+		 */
+		event_pidfd_fdinfo = read_pidfd_fdinfo(info->pidfd);
+		if (event_pidfd_fdinfo == NULL) {
+			tst_brk(TBROK,
+				"reading fdinfo for pidfd: %d "
+				"describing pid: %u failed",
+				info->pidfd,
+				(unsigned)event->pid);
+			goto next_event;
+		} else if (event_pidfd_fdinfo->pid != event->pid) {
+			tst_res(TFAIL,
+				"pidfd provided for incorrect pid "
+				"(expected pidfd for pid: %u, got pidfd for "
+				"pid: %u)",
+				(unsigned)event->pid,
+				(unsigned)event_pidfd_fdinfo->pid);
+			goto next_event;
+		} else if (memcmp(event_pidfd_fdinfo, self_pidfd_fdinfo,
+				  sizeof(struct pidfd_fdinfo_t))) {
+			tst_res(TFAIL,
+				"pidfd fdinfo values for self and event differ "
+				"(expected pos: %d, flags: %x, mnt_id: %d, "
+				"pid: %d, ns_pid: %d, got pos: %d, "
+				"flags: %x, mnt_id: %d, pid: %d, ns_pid: %d",
+				self_pidfd_fdinfo->pos,
+				self_pidfd_fdinfo->flags,
+				self_pidfd_fdinfo->mnt_id,
+				self_pidfd_fdinfo->pid,
+				self_pidfd_fdinfo->ns_pid,
+				event_pidfd_fdinfo->pos,
+				event_pidfd_fdinfo->flags,
+				event_pidfd_fdinfo->mnt_id,
+				event_pidfd_fdinfo->pid,
+				event_pidfd_fdinfo->ns_pid);
+			goto next_event;
+		} else {
+			tst_res(TPASS,
+				"got an event with a valid pidfd info record, "
+				"mask: %lld, pid: %u, fd: %d, "
+				"pidfd: %d, info_type: %d, info_len: %d",
+				(unsigned long long)event->mask,
+				(unsigned)event->pid,
+				event->fd,
+				info->pidfd,
+				info->hdr.info_type,
+				info->hdr.len);
+		}
+
+next_event:
+		i += event->event_len;
+		if (event->fd >= 0)
+			SAFE_CLOSE(event->fd);
+
+		if (info && info->pidfd >= 0)
+			SAFE_CLOSE(info->pidfd);
+
+		if (event_pidfd_fdinfo)
+			free(event_pidfd_fdinfo);
+	}
+}
+
+static void do_cleanup(void)
+{
+	if (fanotify_fd >= 0)
+		SAFE_CLOSE(fanotify_fd);
+
+	if (self_pidfd_fdinfo)
+		free(self_pidfd_fdinfo);
+}
+
+static struct tst_test test = {
+	.setup = do_setup,
+	.test = do_test,
+	.tcnt = ARRAY_SIZE(test_cases),
+	.cleanup = do_cleanup,
+	.all_filesystems = 1,
+	.needs_root = 1,
+	.mntpoint = MOUNT_PATH,
+	.forks_child = 1,
+};
+
+#else
+	TST_TEST_TCONF("system doesn't have required fanotify support");
+#endif /* HAVE_SYS_FANOTIFY_H */
-- 
2.33.1.1089.g2158813163f-goog

/M

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
