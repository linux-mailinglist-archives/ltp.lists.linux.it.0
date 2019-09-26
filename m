Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E2BBF0EE
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Sep 2019 13:16:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 348AD3C22C9
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Sep 2019 13:16:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 28D153C1E0F
 for <ltp@lists.linux.it>; Thu, 26 Sep 2019 13:16:06 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id ED2BF200B38
 for <ltp@lists.linux.it>; Thu, 26 Sep 2019 13:16:05 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 330617FDF4;
 Thu, 26 Sep 2019 11:16:04 +0000 (UTC)
Received: from dustball.brq.redhat.com (unknown [10.43.17.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 83B0360CD0;
 Thu, 26 Sep 2019 11:16:03 +0000 (UTC)
From: Jan Stancek <jstancek@redhat.com>
To: ltp@lists.linux.it,
	chrubis@suse.cz
Date: Thu, 26 Sep 2019 13:15:58 +0200
Message-Id: <a9fc2ff0c27317ae8ac2d56a819eeac5a281dd86.1569496399.git.jstancek@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Thu, 26 Sep 2019 11:16:04 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/bpf: auto bump RLIMIT_MEMLOCK
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

eBPF tests may fail (-EPERM) if max locked memory limit is too low.
User-space tools such as perf started increasing MELOCK limit to
avoid this problem.

LTP follows same approach and will attempt to raise RLIMIT_MEMLOCK
if possible, otherwise prints an info message.

Link: http://lists.linux.it/pipermail/ltp/2019-August/013349.html
Link: https://lkml.org/lkml/2019/7/17/714
Signed-off-by: Jan Stancek <jstancek@redhat.com>
---
 testcases/kernel/syscalls/bpf/bpf_common.h | 31 ++++++++++++++++++++++++++++++
 testcases/kernel/syscalls/bpf/bpf_map01.c  |  3 +++
 testcases/kernel/syscalls/bpf/bpf_prog01.c |  3 +++
 3 files changed, 37 insertions(+)
 create mode 100644 testcases/kernel/syscalls/bpf/bpf_common.h

diff --git a/testcases/kernel/syscalls/bpf/bpf_common.h b/testcases/kernel/syscalls/bpf/bpf_common.h
new file mode 100644
index 000000000000..03e46c5d427e
--- /dev/null
+++ b/testcases/kernel/syscalls/bpf/bpf_common.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (c) 2019 Linux Test Project
+ */
+
+#ifndef LTP_BPF_COMMON_H
+#define LTP_BPF_COMMON_H
+
+#define BPF_MEMLOCK_ADD (256*1024)
+
+void rlimit_bump_memlock(void)
+{
+	struct rlimit memlock_r;
+
+	SAFE_GETRLIMIT(RLIMIT_MEMLOCK, &memlock_r);
+	memlock_r.rlim_cur += BPF_MEMLOCK_ADD;
+	tst_res(TINFO, "Raising RLIMIT_MEMLOCK to %ld",
+		(long)memlock_r.rlim_cur);
+
+	if (memlock_r.rlim_cur <= memlock_r.rlim_max) {
+		SAFE_SETRLIMIT(RLIMIT_MEMLOCK, &memlock_r);
+	} else if ((geteuid() == 0)) {
+		memlock_r.rlim_max += BPF_MEMLOCK_ADD;
+		SAFE_SETRLIMIT(RLIMIT_MEMLOCK, &memlock_r);
+	} else {
+		tst_res(TINFO, "Can't raise RLIMIT_MEMLOCK, test may fail "
+			"due to lack of max locked memory");
+	}
+}
+
+#endif
diff --git a/testcases/kernel/syscalls/bpf/bpf_map01.c b/testcases/kernel/syscalls/bpf/bpf_map01.c
index 13dde0b4e12f..49d32776ef41 100644
--- a/testcases/kernel/syscalls/bpf/bpf_map01.c
+++ b/testcases/kernel/syscalls/bpf/bpf_map01.c
@@ -17,6 +17,7 @@
 #include "config.h"
 #include "tst_test.h"
 #include "lapi/bpf.h"
+#include "bpf_common.h"
 
 #define VAL_SZ 1024
 
@@ -140,6 +141,8 @@ static void setup(void)
 {
 	unsigned int i;
 
+	rlimit_bump_memlock();
+
 	memcpy(key8, "12345678", 8);
 	memset(key4, 0, 4);
 
diff --git a/testcases/kernel/syscalls/bpf/bpf_prog01.c b/testcases/kernel/syscalls/bpf/bpf_prog01.c
index 3252f92774d1..46a909fe2ec4 100644
--- a/testcases/kernel/syscalls/bpf/bpf_prog01.c
+++ b/testcases/kernel/syscalls/bpf/bpf_prog01.c
@@ -27,6 +27,7 @@
 #include "tst_test.h"
 #include "lapi/socket.h"
 #include "lapi/bpf.h"
+#include "bpf_common.h"
 
 const char MSG[] = "Ahoj!";
 static char *msg;
@@ -94,6 +95,8 @@ int load_prog(int fd)
 
 void setup(void)
 {
+	rlimit_bump_memlock();
+
 	memcpy(prog, PROG, sizeof(PROG));
 	memcpy(msg, MSG, sizeof(MSG));
 }
-- 
1.8.3.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
