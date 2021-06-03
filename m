Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C95C9399DF9
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Jun 2021 11:44:04 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 51FB33C53B1
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Jun 2021 11:44:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B6F133C281C
 for <ltp@lists.linux.it>; Thu,  3 Jun 2021 11:44:00 +0200 (CEST)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id A0B5A140020B
 for <ltp@lists.linux.it>; Thu,  3 Jun 2021 11:43:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=170520fj; t=1622713434; i=@fujitsu.com;
 bh=Hnid40CYd6rMUqV2pJhxqKR7dFxAMzBFWScsk++IV4U=;
 h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
 MIME-Version:Content-Type;
 b=c2UxOiJ+QAtQ/6TGTrUzErx2cv+/G6GzdPW6V7dpzf1CDjr3wiytRs3lUvasCACRu
 jYHDQWVdgYq2gX0N8Yo25fu4f1LXIID4MeTCUyov5gNgRk7E+63Gup9BEyZGAxbaEk
 vvAiQ3+W5Jneq0KzTYqFuTbeqVplWwZ3YnWW0AtPssY9xlGuhqvmhwv70A4z+ggveZ
 89m7AsU4he4ibAyZ0ADAnFwKmPy3Oacqf2RgpTdTbexp9AJDaFwvkLMo0ex9kBgIH3
 o9VPJAPRRcP5uculDm0h8aBMXwq6R6rDVV9zQ+4OK6U1fs6mX1t/1zS4dKs32mil7e
 alCHUEwBXHOkg==
Received: from [100.113.1.143] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-2.bemta.az-a.eu-central-1.aws.symcld.net id 9B/E9-63525-A54A8B06;
 Thu, 03 Jun 2021 09:43:54 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrNIsWRWlGSWpSXmKPExsViZ8MxRTdqyY4
 EgzeXJCxWfN/B6MDose/3OtYAxijWzLyk/IoE1oylKz6wFTQoV7x+fI+pgfGbbBcjF4eQQDOT
 xPnJaxghnN2MEm3npjB1MXJysAloSjzrXMAMYosISEh0NLxlB7GZBdQllk/6BVYjLBAnseFtA
 5jNIqAicb9zOguIzSvgKdH3ax1Yr4SAgsSUh++BbA4OTgFViU8XbUHCQkDl17rXskGUC0qcnP
 mEBWK8hMTBFy+gWhUlLnV8Y4SwKyRmzNjGNoGRfxaSlllIWhYwMq1itEgqykzPKMlNzMzRNTQ
 w0DU0NNY10jU11Eus0k3USy3VTU7NKylKBErqJZYX6xVX5ibnpOjlpZZsYgSGY0ohk/EOxmuv
 P+gdYpTkYFIS5b3TviNBiC8pP6UyI7E4I76oNCe1+BCjDAeHkgRv5kKgnGBRanpqRVpmDjA2Y
 NISHDxKIryOi4DSvMUFibnFmekQqVOMuhw7j85bxCzEkpeflyolztsPUiQAUpRRmgc3Ahanlx
 hlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ86aDTOHJzCuB2/QK6AgmoCMEvLaBHFGSiJCSamD
 inbDEwlTH/tR2ocClG38dCk475SdmyN99VuGMv/ofMw+Zdvkcm/xVC5+1sfBt3rfCPMZ4zeko
 9u88e9S3JP6+mJX3vL5zw5pFd3PfXtet3hIT+CZkz+FGpzWqMYWP+h8+bl0xSW3VjNDqdM5Gw
 6xjexbOWWQR2/7jgKd0n8iNf++PWDGc1o5icgpnXG2YpSfxuPDj6rlxhZ9Tp5/Wjpkt2DPn+H
 XX797RKblGz7nX+zzsWTCt55hr0axn0bv3fD1w1W3Jx2+lhocM6qdcUxU/m5rCEHnplbHUhHM
 pMs8y7LnPmL59s/VivtOnvbNN3n7s5HjBFx+t5rF8T9ZTdQVJvz3Nhjv+vW3uPmkUtWKhEktx
 RqKhFnNRcSIAbqNIGk4DAAA=
X-Env-Sender: xuyang2018.jy@fujitsu.com
X-Msg-Ref: server-21.tower-232.messagelabs.com!1622713433!134832!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20779 invoked from network); 3 Jun 2021 09:43:54 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
 by server-21.tower-232.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 3 Jun 2021 09:43:54 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
 by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1539hjor021049
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
 for <ltp@lists.linux.it>; Thu, 3 Jun 2021 10:43:53 +0100
Received: from localhost.localdomain (10.167.220.84) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 3 Jun 2021 10:43:43 +0100
From: Yang Xu <xuyang2018.jy@fujitsu.com>
To: <ltp@lists.linux.it>
Date: Thu, 3 Jun 2021 17:44:04 +0800
Message-ID: <1622713444-21197-1-git-send-email-xuyang2018.jy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <YKzX7FPWGGROn6kR@pevik>
References: <YKzX7FPWGGROn6kR@pevik>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v2] syscalls/mallinfo2_01: Add a basic test for
 mallinfo2 when setting 2G size
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

Since these members of mallinfo struct use int data type, it will overflow
when allocating 2G size. mallinfo() is deprecated and we should use mallinfo2()
in the future. So we test mallinfo2 whether works well.

Signed-off-by: Yang Xu <xuyang2018.jy@fujitsu.com>
---
 configure.ac                                  |  1 +
 runtest/syscalls                              |  2 +
 .../syscalls/mallinfo/mallinfo_common.h       | 19 ++++++++
 .../kernel/syscalls/mallinfo2/.gitignore      |  1 +
 testcases/kernel/syscalls/mallinfo2/Makefile  | 11 +++++
 .../kernel/syscalls/mallinfo2/mallinfo2_01.c  | 46 +++++++++++++++++++
 6 files changed, 80 insertions(+)
 create mode 100644 testcases/kernel/syscalls/mallinfo2/.gitignore
 create mode 100644 testcases/kernel/syscalls/mallinfo2/Makefile
 create mode 100644 testcases/kernel/syscalls/mallinfo2/mallinfo2_01.c

diff --git a/configure.ac b/configure.ac
index 136d82d09..eb675b367 100644
--- a/configure.ac
+++ b/configure.ac
@@ -102,6 +102,7 @@ AC_CHECK_FUNCS_ONCE([ \
     io_uring_enter \
     kcmp \
     mallinfo \
+    mallinfo2 \
     mallopt \
     mkdirat \
     mknodat \
diff --git a/runtest/syscalls b/runtest/syscalls
index 9df181b76..11bb58a83 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -692,6 +692,8 @@ lstat02_64 lstat02_64
 
 mallinfo02 mallinfo02
 
+mallinfo2_01 mallinfo2_01
+
 mallopt01 mallopt01
 
 mbind01 mbind01
diff --git a/testcases/kernel/syscalls/mallinfo/mallinfo_common.h b/testcases/kernel/syscalls/mallinfo/mallinfo_common.h
index a00cc7a64..d64a9344b 100644
--- a/testcases/kernel/syscalls/mallinfo/mallinfo_common.h
+++ b/testcases/kernel/syscalls/mallinfo/mallinfo_common.h
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
+ * Copyright (C) 2020 Free Software Foundation, Inc.
  * Copyright (c) 2021 FUJITSU LIMITED. All rights reserved.
  * Author: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
  */
@@ -28,4 +29,22 @@ static inline void print_mallinfo(const char *msg, struct mallinfo *m)
 }
 #endif
 
+#ifdef HAVE_MALLINFO2
+static inline void print_mallinfo2(const char *msg, struct mallinfo2 *m)
+{
+	tst_res(TINFO, "%s...", msg);
+#define P2(f) tst_res(TINFO, "%s: %ld", #f, m->f)
+	P2(arena);
+	P2(ordblks);
+	P2(smblks);
+	P2(hblks);
+	P2(hblkhd);
+	P2(usmblks);
+	P2(fsmblks);
+	P2(uordblks);
+	P2(fordblks);
+	P2(keepcost);
+}
+#endif
+
 #endif
diff --git a/testcases/kernel/syscalls/mallinfo2/.gitignore b/testcases/kernel/syscalls/mallinfo2/.gitignore
new file mode 100644
index 000000000..349222c14
--- /dev/null
+++ b/testcases/kernel/syscalls/mallinfo2/.gitignore
@@ -0,0 +1 @@
+/mallinfo2_01
diff --git a/testcases/kernel/syscalls/mallinfo2/Makefile b/testcases/kernel/syscalls/mallinfo2/Makefile
new file mode 100644
index 000000000..b3c7d9552
--- /dev/null
+++ b/testcases/kernel/syscalls/mallinfo2/Makefile
@@ -0,0 +1,11 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# Copyright (c) International Business Machines  Corp., 2001
+# Copyright (c) 2021 FUJITSU LIMITED. All rights reserved.
+
+top_srcdir		?= ../../../..
+
+include $(top_srcdir)/include/mk/testcases.mk
+
+CFLAGS += -I../mallinfo
+
+include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/mallinfo2/mallinfo2_01.c b/testcases/kernel/syscalls/mallinfo2/mallinfo2_01.c
new file mode 100644
index 000000000..9811f95c0
--- /dev/null
+++ b/testcases/kernel/syscalls/mallinfo2/mallinfo2_01.c
@@ -0,0 +1,46 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2021 FUJITSU LIMITED. All rights reserved.
+ * Author: Yang Xu <xuyang2018.jy@fujitsu.com>
+ */
+
+/*\
+ * [DESCRIPTION]
+ *
+ * Basic mallinfo2() test.
+ *
+ * Test members of struct mallinfo2() whether overflow when setting 2G size.
+ */
+
+#include "mallinfo_common.h"
+#include "tst_safe_macros.h"
+
+#ifdef HAVE_MALLINFO2
+
+void test_mallinfo2(void)
+{
+	struct mallinfo2 info;
+	char *buf;
+	size_t size = 2UL * 1024UL * 1024UL * 1024UL;
+
+	buf = malloc(size);
+	if (!buf) {
+		tst_res(TCONF, "Current system can not malloc 2G space, skip it");
+		return;
+	}
+	info = mallinfo2();
+	if (info.hblkhd < size) {
+		print_mallinfo2("Test malloc 2G", &info);
+		tst_brk(TFAIL, "The member of struct mallinfo2 overflow?");
+	}
+	tst_res(TPASS, "The member of struct mallinfo2 doesn't overflow");
+	free(buf);
+}
+
+static struct tst_test test = {
+	.test_all = test_mallinfo2,
+};
+
+#else
+TST_TEST_TCONF("system doesn't implement non-POSIX mallinfo2()");
+#endif
-- 
2.23.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
