Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 464D47BA0C1
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Oct 2023 16:44:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E22103D0519
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Oct 2023 16:44:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id F2EBF3CF7AF
 for <ltp@lists.linux.it>; Thu,  5 Oct 2023 16:43:38 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 3AE2C1A00ED5
 for <ltp@lists.linux.it>; Thu,  5 Oct 2023 16:43:37 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 65CD7218B8;
 Thu,  5 Oct 2023 14:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1696517017; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xmd6wzSCWNJPchDqjNnNWGHdPA86VN9PptphTtdEEjw=;
 b=p2QHMW+jGJuznIyF50TSu9eqM51jigbzFMrlVnrIIRsW6DaDvZJrnrSPp5xVKAzcZ7EIyM
 iypqK83RkVzKvyjyL5hC93ixC50tcQz8o0ES4gOWwOWkYgZ/F5JV7eklMsYyZ2XFfAyMN8
 Mb3nQWDbDdFjBpIg/gLEHF1sZM8T084=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1696517017;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xmd6wzSCWNJPchDqjNnNWGHdPA86VN9PptphTtdEEjw=;
 b=GeoXc6tEfcrjPaHF/TNGVrppswO4v3aK+5yGK0M0NuJGmM2Uu+bY81HZC30A77BNh224Mi
 t1+ieswDNwIMOyCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3EC68139C2;
 Thu,  5 Oct 2023 14:43:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id AHOEDZnLHmXGOAAAMHmgww
 (envelope-from <andrea.cervesato@suse.de>); Thu, 05 Oct 2023 14:43:37 +0000
From: Andrea Cervesato <andrea.cervesato@suse.de>
To: ltp@lists.linux.it
Date: Thu,  5 Oct 2023 16:43:35 +0200
Message-Id: <20231005144335.16509-3-andrea.cervesato@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231005144335.16509-1-andrea.cervesato@suse.de>
References: <20231005144335.16509-1-andrea.cervesato@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.0.1 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v3 2/2] Add gettid02 test
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

From: Andrea Cervesato <andrea.cervesato@suse.com>

This new test is checking if __NR_gettid syscall is properly handling a
multi-threaded application, by assigning a different TID for each
thread.

Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.com>
Reviewed-by: Marius Kittler <mkittler@suse.de>
---
Removed useless comulative comparision in threads ID check

 runtest/syscalls                            |  1 +
 testcases/kernel/syscalls/gettid/.gitignore |  1 +
 testcases/kernel/syscalls/gettid/Makefile   |  4 +-
 testcases/kernel/syscalls/gettid/gettid02.c | 63 +++++++++++++++++++++
 4 files changed, 68 insertions(+), 1 deletion(-)
 create mode 100644 testcases/kernel/syscalls/gettid/gettid02.c

diff --git a/runtest/syscalls b/runtest/syscalls
index 8652e0bd3..bba266ea3 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -538,6 +538,7 @@ getsockopt01 getsockopt01
 getsockopt02 getsockopt02
 
 gettid01 gettid01
+gettid02 gettid02
 
 gettimeofday01 gettimeofday01
 gettimeofday02 gettimeofday02
diff --git a/testcases/kernel/syscalls/gettid/.gitignore b/testcases/kernel/syscalls/gettid/.gitignore
index 78dce3499..9014f7c3a 100644
--- a/testcases/kernel/syscalls/gettid/.gitignore
+++ b/testcases/kernel/syscalls/gettid/.gitignore
@@ -1 +1,2 @@
 /gettid01
+/gettid02
diff --git a/testcases/kernel/syscalls/gettid/Makefile b/testcases/kernel/syscalls/gettid/Makefile
index 4e9982f76..5345eb0f5 100644
--- a/testcases/kernel/syscalls/gettid/Makefile
+++ b/testcases/kernel/syscalls/gettid/Makefile
@@ -10,7 +10,9 @@ top_srcdir		?= ../../../..
 include $(top_srcdir)/include/mk/testcases.mk
 
 ifeq ($(ANDROID), 1)
-FILTER_OUT_MAKE_TARGETS	+= gettid01
+FILTER_OUT_MAKE_TARGETS	+= gettid01 gettid02
 endif
 
+gettid02: LDLIBS += -lpthread
+
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/gettid/gettid02.c b/testcases/kernel/syscalls/gettid/gettid02.c
new file mode 100644
index 000000000..61f115fc9
--- /dev/null
+++ b/testcases/kernel/syscalls/gettid/gettid02.c
@@ -0,0 +1,63 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2023 SUSE LLC Andrea Cervesato <andrea.cervesato@suse.com>
+ */
+/*\
+ * [Description]
+ *
+ * This test spawns multiple threads, then check for each one of them if the
+ * parent ID is different AND if the thread ID is different from all the other
+ * spwaned threads.
+ */
+
+#include "tst_test.h"
+#include "lapi/syscalls.h"
+#include "tst_safe_pthread.h"
+
+#define THREADS_NUM 10
+
+static pid_t tids[THREADS_NUM];
+
+static void *threaded(void *arg)
+{
+	int i = *(int *)arg;
+	pid_t pid, tid;
+
+	pid = tst_syscall(__NR_getpid);
+	tid = tst_syscall(__NR_gettid);
+
+	TST_EXP_EXPR(pid != tid,
+		"parent ID (%d) differs from thread[%d] ID (%d)",
+		pid, i, tid);
+
+	return (void *)tst_syscall(__NR_gettid);
+}
+
+static void run(void)
+{
+	pthread_t thread;
+	int error = 0;
+
+	for (int i = 0; i < THREADS_NUM; i++) {
+		SAFE_PTHREAD_CREATE(&thread, NULL, threaded, &i);
+		SAFE_PTHREAD_JOIN(thread, (void **)&tids[i]);
+	}
+
+	for (int i = 0; i < THREADS_NUM; i++) {
+		for (int j = i + 1; j < THREADS_NUM; j++) {
+			if (tids[i] == tids[j]) {
+				tst_res(TINFO, "thread[%d] and thread[%d] have the same ID", i, j);
+				error = 1;
+			}
+		}
+	}
+
+	if (error)
+		tst_res(TFAIL, "Some threads have the same TID");
+	else
+		tst_res(TPASS, "All threads have a different TID");
+}
+
+static struct tst_test test = {
+	.test_all = run,
+};
-- 
2.35.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
