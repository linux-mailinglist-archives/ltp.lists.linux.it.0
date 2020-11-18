Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B650E2B7C45
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Nov 2020 12:19:19 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 347D93C5A08
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Nov 2020 12:19:19 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 4CFC83C280C
 for <ltp@lists.linux.it>; Wed, 18 Nov 2020 12:19:15 +0100 (CET)
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id A2EFC1A006ED
 for <ltp@lists.linux.it>; Wed, 18 Nov 2020 12:19:14 +0100 (CET)
Received: by mail-pl1-x642.google.com with SMTP id y22so815944plr.6
 for <ltp@lists.linux.it>; Wed, 18 Nov 2020 03:19:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NVhlBxsHxvm+1T0K+P9RyZVABnlrp13OsuRtaFnqryc=;
 b=uvk37y6Yt1wfljtTTiLJXD3nwNpVi3ncsu+bXXAOrwMt8lLCYM+iXjr68bNxXgQ0ne
 ZxBbnJq9nUVMozlDUQLMRZAgBrU6cMjHyfRpFRjbXPGi8BMJtM1sm8Enw6yXSjmlgnYV
 B45pWNwvwbTLm4sy18Zh45JhT/Qg1C8KpCqxGJ85hL3/XQ8erkGI+ZyC6cP3H9aoIFIO
 oNLn6fUnA+Z0q3kovcDnxUd8jDYJR4HtuVhuhDFAuRIazRQLPtpzVq2A1cpAPUdkdK4k
 uK+EPgvqcR1F5as6ur0k7LjtrBuCB+OSVYiOPi27MG1RIV0FXi8CEM0bXs/eRXwywIng
 rFSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NVhlBxsHxvm+1T0K+P9RyZVABnlrp13OsuRtaFnqryc=;
 b=tb3ThXQZtHHqyOorG1NZ069dhKAk11+UUcfKnYgioK7nHgq0Nb9ezcHdXwq+iiRB+8
 Ebfb5Fy2rxHTqkQKf1oCD3YE0SSp1bmup0QE9QUAYEdxI8cmNvz7Ehb/+cxl+XrWISOf
 9ogTEgrJL5P02jMB6KWyzFYaVyt6xnBNItqLZBbZ4wQv+V9n3IOX6YZRuUH312yGee33
 /aZk6oYUV+gfQVglvbGm9obBzjGhQTjrIaokh+gc/8r4W2rNpkm7Ml7AvYhjvNtLHjxo
 IDT4tDjnZEnl+7WTk1mUpO2rAjriUanYOcbtCdJWFB4D9tk3O5AjIRWb7SEZYcd8MC6G
 AeAw==
X-Gm-Message-State: AOAM533wtksETllML8EHbytS0o2YTfpuzq1ETuM8UX+5TtazTReqsjOH
 2K0Q8U8OHJ9WU+4Co/ZQRa7Vg6OpnhHIDQ==
X-Google-Smtp-Source: ABdhPJzc2Iqiby783XaEKTaamjd/F5n6YtJX0W+gOaiFdatwE0z067fMGfk/R/csrYO4nF54vCabmQ==
X-Received: by 2002:a17:90a:67c5:: with SMTP id
 g5mr3674393pjm.13.1605698352635; 
 Wed, 18 Nov 2020 03:19:12 -0800 (PST)
Received: from localhost ([122.172.12.172])
 by smtp.gmail.com with ESMTPSA id g85sm25150003pfb.4.2020.11.18.03.19.11
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 18 Nov 2020 03:19:11 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Wed, 18 Nov 2020 16:49:05 +0530
Message-Id: <4b831a20278083623bce96f9c4171b6cff9c4e46.1605698312.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls: select: Add test to verify clearing of fd
 sets
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

This adds a test to check if fd sets are cleared by select() or not in
the event of a timeout when the read descriptor is empty or the write
descriptor is full.

Suggested-by: Cyril Hrubis <chrubis@suse.cz>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 runtest/syscalls                            |  1 +
 testcases/kernel/syscalls/select/.gitignore |  1 +
 testcases/kernel/syscalls/select/select04.c | 82 +++++++++++++++++++++
 3 files changed, 84 insertions(+)
 create mode 100644 testcases/kernel/syscalls/select/select04.c

diff --git a/runtest/syscalls b/runtest/syscalls
index aeacb8bc8312..a5363277f478 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -1159,6 +1159,7 @@ sched_getattr02 sched_getattr02
 select01 select01
 select02 select02
 select03 select03
+select04 select04
 
 semctl01 semctl01
 semctl02 semctl02
diff --git a/testcases/kernel/syscalls/select/.gitignore b/testcases/kernel/syscalls/select/.gitignore
index b6bff2d4f961..9d64cb8b8a1b 100644
--- a/testcases/kernel/syscalls/select/.gitignore
+++ b/testcases/kernel/syscalls/select/.gitignore
@@ -1,3 +1,4 @@
 /select01
 /select02
 /select03
+/select04
diff --git a/testcases/kernel/syscalls/select/select04.c b/testcases/kernel/syscalls/select/select04.c
new file mode 100644
index 000000000000..8106dea8b3dc
--- /dev/null
+++ b/testcases/kernel/syscalls/select/select04.c
@@ -0,0 +1,82 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 Linaro Limited. All rights reserved.
+ * Author: Viresh Kumar <viresh.kumar@linaro.org>
+ *
+ * Test to check if fd sets are cleared by select() or not.
+ */
+
+#include <unistd.h>
+#include <errno.h>
+#include <sys/time.h>
+#include <sys/types.h>
+#include <fcntl.h>
+#include "select_var.h"
+
+static fd_set readfds_pipe, writefds_pipe;
+static int fd_empty[2], fd_full[2];
+
+static struct tcases {
+	int *fd;
+	fd_set *readfds;
+	fd_set *writefds;
+	char *desc;
+} tests[] = {
+	{&fd_empty[0], &readfds_pipe, NULL, "No data to read"},
+	{&fd_full[1], NULL, &writefds_pipe, "No space to write"},
+};
+
+static void run(unsigned int n)
+{
+	struct tcases *tc = &tests[n];
+	struct timeval timeout;
+
+	timeout.tv_sec = 0;
+	timeout.tv_usec = 100000;
+
+	TEST(do_select(*tc->fd + 1, tc->readfds, tc->writefds, 0, &timeout));
+
+	if (TST_RET) {
+		tst_res(TFAIL, "%s: select() should have timed out", tc->desc);
+		return;
+	}
+
+	if ((tc->readfds && FD_ISSET(*tc->fd, tc->readfds)) ||
+	    (tc->writefds && FD_ISSET(*tc->fd, tc->writefds))) {
+		tst_res(TFAIL, "%s: select() didn't clear the fd set", tc->desc);
+		return;
+	}
+
+	tst_res(TPASS, "%s: select() cleared the fd set", tc->desc);
+}
+
+static void setup(void)
+{
+	int buf = 0;
+
+	select_info();
+
+	SAFE_PIPE(fd_empty);
+	FD_ZERO(&readfds_pipe);
+	FD_SET(fd_empty[0], &readfds_pipe);
+
+	SAFE_PIPE2(fd_full, O_NONBLOCK);
+	FD_ZERO(&writefds_pipe);
+	FD_SET(fd_full[1], &writefds_pipe);
+
+	/* Make the write buffer full for fd_full */
+	do {
+		TEST(write(fd_full[1], &buf, sizeof(buf)));
+	} while (TST_RET != -1);
+
+	if (TST_ERR != EAGAIN)
+		tst_res(TFAIL | TTERRNO, "write() failed with unexpected error");
+}
+
+static struct tst_test test = {
+	.test = run,
+	.tcnt = ARRAY_SIZE(tests),
+	.test_variants = TEST_VARIANTS,
+	.setup = setup,
+	.needs_tmpdir = 1,
+};
-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
