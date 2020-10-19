Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E18B292674
	for <lists+linux-ltp@lfdr.de>; Mon, 19 Oct 2020 13:37:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E9B713C31C7
	for <lists+linux-ltp@lfdr.de>; Mon, 19 Oct 2020 13:37:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 3ADCD3C26D3
 for <ltp@lists.linux.it>; Mon, 19 Oct 2020 13:37:50 +0200 (CEST)
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 7251C1A0036A
 for <ltp@lists.linux.it>; Mon, 19 Oct 2020 13:37:49 +0200 (CEST)
Received: by mail-pf1-x441.google.com with SMTP id 144so5849715pfb.4
 for <ltp@lists.linux.it>; Mon, 19 Oct 2020 04:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=NmojT54HTtFrI2qPkGQOKUj2z7/FuKGg5skIMExoCMo=;
 b=lo66rK1trbmDva8lxp/ByRLZKmXYnJXnQhfsugAbTzr8+XQgUOaVwgEIurYi1jNbwv
 jsFy5u8ze89nL5/+Z9QmHDEann+HTi95mcXqRWeLgbsnuuTJTxxhWvfJBehpstzmmXPC
 TCLF87tr1DA8I367G0DaN5p2miz4P05BMok5oqiOOCy0/r1+A8VYXGSUGKLwO/6s5F42
 RwMP76yRrBOZ2AOW+JtDVhNwGVw9ISI3rDQ6D1EkpFWC5d+BVnfpotAAUk3KimuiVZhK
 IifPBlhimcPKynFX6ZXv92wh7LTxYegt31e5H0BNl9cjeAIvkaFlFLeY+qRLvaRxW/MF
 12PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=NmojT54HTtFrI2qPkGQOKUj2z7/FuKGg5skIMExoCMo=;
 b=Hb7QMlHITUoK+DrsD04ekhWmLtipH2pvM1au2YrwvV6rfxwrbwnE+myYB84ajLtkoB
 Rv7MKdynQZYdyVg7GvoRoiLDKjjJaUdIDFL9aZZ4sKy+MU2WfuggzOCSs7c0I7SK8VKZ
 yrADWsD1Q6DtvqMD9uL7qSAcS+O6IUpEDgpEHgOy7ehRbz7mb5Y8W8xPpeJVROxzCX3w
 gOkdkm4VinDbN5TqYSrY4JGqCgFZyRq+3jR8Z4lCsiFL9LucX8m7281Vmi1xfje2lQ1x
 OGzPCV4i8QggSVsG6dQdPhnmU1oWL+01pVp2ljqRNcM9t/TabjrvJeEZXS3UXCPO3G4u
 8Zfw==
X-Gm-Message-State: AOAM53007RGpNbfYwX4Qtsn9NXszXfWtlQm1yhTTSF1SqnBgiS3tTqx9
 TQoR6XIrGbUVXUFpKKDB7PT3Wg==
X-Google-Smtp-Source: ABdhPJyyaYkwrcGESVR2jkE9aqj/6ZvGf6898AvtJdhwuWlzHbq+7urPY/PAJn+1+2zrbItbChSPzQ==
X-Received: by 2002:a62:2c16:0:b029:15d:8d2:2e6d with SMTP id
 s22-20020a622c160000b029015d08d22e6dmr5491897pfs.52.1603107467886; 
 Mon, 19 Oct 2020 04:37:47 -0700 (PDT)
Received: from localhost ([122.181.54.133])
 by smtp.gmail.com with ESMTPSA id gf20sm11565079pjb.55.2020.10.19.04.37.46
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 19 Oct 2020 04:37:46 -0700 (PDT)
Date: Mon, 19 Oct 2020 17:07:44 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20201019113744.7zr55gnv2tt2iuyt@vireshk-i7>
References: <6fbfc6919c0000e7a7745afbc3c94baab02603fa.1599558175.git.viresh.kumar@linaro.org>
 <e9bcd007772ffadd6326dca29532bb4d3f8e7f0a.1599558175.git.viresh.kumar@linaro.org>
 <20201014121509.GE31816@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201014121509.GE31816@yuki.lan>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V3 3/3] syscalls: select: Rename select04.c to
 select02.c
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 14-10-20, 14:15, Cyril Hrubis wrote:
> Hi!
> We will have to implement a test for the errors as well, so I wouldn't
> rename the test like this yet.

Maybe just pick it up as is (so I don't need to resend it) and then
apply below patch:

-------------------------8<-------------------------

From b35b85ecaab98f3e3711a7f6fc2642c96657ee18 Mon Sep 17 00:00:00 2001
Message-Id: <b35b85ecaab98f3e3711a7f6fc2642c96657ee18.1603107392.git.viresh.kumar@linaro.org>
From: Viresh Kumar <viresh.kumar@linaro.org>
Date: Mon, 19 Oct 2020 17:06:02 +0530
Subject: [PATCH] syscalls: select: Add failure tests

This adds a variety of failure tests to select() syscall.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 runtest/syscalls                            |  1 +
 testcases/kernel/syscalls/select/.gitignore |  1 +
 testcases/kernel/syscalls/select/select03.c | 95 +++++++++++++++++++++
 3 files changed, 97 insertions(+)
 create mode 100644 testcases/kernel/syscalls/select/select03.c

diff --git a/runtest/syscalls b/runtest/syscalls
index 12ae10464d9f..0443f9f3d51b 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -1157,6 +1157,7 @@ sched_getattr02 sched_getattr02
 
 select01 select01
 select02 select02
+select03 select03
 
 semctl01 semctl01
 semctl02 semctl02
diff --git a/testcases/kernel/syscalls/select/.gitignore b/testcases/kernel/syscalls/select/.gitignore
index f5a43c23326a..b6bff2d4f961 100644
--- a/testcases/kernel/syscalls/select/.gitignore
+++ b/testcases/kernel/syscalls/select/.gitignore
@@ -1,2 +1,3 @@
 /select01
 /select02
+/select03
diff --git a/testcases/kernel/syscalls/select/select03.c b/testcases/kernel/syscalls/select/select03.c
new file mode 100644
index 000000000000..2de976cdd977
--- /dev/null
+++ b/testcases/kernel/syscalls/select/select03.c
@@ -0,0 +1,95 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 Linaro Ltd.
+ *
+ * Failure tests.
+ */
+
+#include <unistd.h>
+#include <errno.h>
+#include <sys/time.h>
+#include <sys/types.h>
+#include <fcntl.h>
+#include "select_var.h"
+
+static fd_set readfds_reg, writefds_reg, fds_closed;
+static fd_set *preadfds_reg = &readfds_reg, *pwritefds_reg = &writefds_reg;
+static fd_set *pfds_closed = &fds_closed, *nullfds = NULL, *faulty_fds;
+static int fd_closed, fd[2];
+static struct timeval timeout;
+static struct timeval *valid_to = &timeout, *invalid_to;
+
+static struct tcases {
+	char *name;
+	int nfds;
+	fd_set **readfds;
+	fd_set **writefds;
+	fd_set **exceptfds;
+	struct timeval **timeout;
+	int exp_errno;
+} tests[] = {
+	{ "Negative nfds", -1, &preadfds_reg, &pwritefds_reg, &nullfds, &valid_to, EINVAL },
+	{ "Invalid readfds", 6, &pfds_closed, &pwritefds_reg, &nullfds, &valid_to, EBADF },
+	{ "Invalid writefds", 6, &preadfds_reg, &pfds_closed, &nullfds, &valid_to, EBADF },
+	{ "Invalid exceptfds", 6, &preadfds_reg, &pwritefds_reg, &pfds_closed, &valid_to, EBADF },
+	{ "Faulty readfds", 6, &faulty_fds, &pwritefds_reg, &nullfds, &valid_to, EFAULT },
+	{ "Faulty writefds", 6, &preadfds_reg, &faulty_fds, &nullfds, &valid_to, EFAULT },
+	{ "Faulty exceptfds", 6, &preadfds_reg, &pwritefds_reg, &faulty_fds, &valid_to, EFAULT },
+	{ "Faulty timeout", 6, &preadfds_reg, &pwritefds_reg, &nullfds, &invalid_to, EFAULT },
+};
+
+static void run(unsigned int n)
+{
+	struct tcases *tc = &tests[n];
+
+	TEST(do_select(tc->nfds, *tc->readfds, *tc->writefds, *tc->exceptfds,
+		       *tc->timeout));
+
+	if (TST_RET != -1) {
+		tst_res(TFAIL, "%s: select() passed unexpectedly", tc->name);
+		return;
+	}
+
+	if (tc->exp_errno != TST_ERR) {
+		tst_res(TFAIL | TTERRNO, "%s: select()() should fail with %s",
+			tc->name, tst_strerrno(tc->exp_errno));
+		return;
+	}
+
+	tst_res(TPASS, "%s: select() failed as expected", tc->name);
+}
+
+static void setup(void)
+{
+	void *faulty_address;
+
+	select_info();
+
+	timeout.tv_sec = 0;
+	timeout.tv_usec = 100000;
+
+	/* Regular file */
+	fd_closed = SAFE_OPEN("tmpfile1", O_CREAT | O_RDWR, 0777);
+	FD_ZERO(&fds_closed);
+	FD_SET(fd_closed, &fds_closed);
+
+	SAFE_PIPE(fd);
+	FD_ZERO(&readfds_reg);
+	FD_ZERO(&writefds_reg);
+	FD_SET(fd[0], &readfds_reg);
+	FD_SET(fd[1], &writefds_reg);
+
+	SAFE_CLOSE(fd_closed);
+
+	faulty_address = tst_get_bad_addr(NULL);
+	invalid_to = faulty_address;
+	faulty_fds = faulty_address;
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
