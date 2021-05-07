Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 81BB1376125
	for <lists+linux-ltp@lfdr.de>; Fri,  7 May 2021 09:30:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C5CB73C5671
	for <lists+linux-ltp@lfdr.de>; Fri,  7 May 2021 09:30:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E257A3C55DE
 for <ltp@lists.linux.it>; Fri,  7 May 2021 09:30:17 +0200 (CEST)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.114])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 57D45140144B
 for <ltp@lists.linux.it>; Fri,  7 May 2021 09:30:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=170520fj; t=1620372612; i=@fujitsu.com;
 bh=vJhv6kCtfcy1JtSkGDcQbkBGPLXxSAehW+dssn2QVVw=;
 h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
 b=UrAVeyEgXlJGqaKWYn4XwSAyQomh+6s/bOkX6kg929+TZn1jLVPAKvT7Y5a6b3EAu
 KB80SibI4gDyXFVriwkP864JUtoXih4h/3wPUy4POgfsHEVQMBpfXG2RlmPvLYDQ0r
 zptm9+ri3hc5m+dBkDwdv16j7/4krXYYhJ8F6buGSWkHYW92vZFFoLr/le/4Ijw6ib
 F2xcI2hiW2ffikbBK5TwUIzNjh3WiNaFrOt/Sdva3pLVsS+SQGsA34oTduz6Bq4bo6
 JsYRphIWIYwn2ohuGY33O8Dza++3s/66RIZbdfY4uXTL6mQrc3+F+x8u0uZmHhAuJu
 6sTpXSPMQbkSA==
Received: from [100.113.6.193] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-3.bemta.az-b.eu-central-1.aws.symcld.net id 53/13-23163-48CE4906;
 Fri, 07 May 2021 07:30:12 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrCIsWRWlGSWpSXmKPExsViZ8MxRbflzZQ
 Eg/t32SxWfN/B6MDose/3OtYAxijWzLyk/IoE1oyHt3+zF9xXrFjw5AV7A+MbmS5GLg4hgWYm
 ieZ1b9kgnF2MEid6J7N2MXJysAloSjzrXMAMYosISEh0NLxlB7GZBdQllk/6xdTFyMEhLBAls
 XxVIEiYRUBFYtmWp2wgNq+Ap8T1PwfBbAkBBYkpD98zQ8QFJU7OfMICMUZC4uCLF8wQNYoSlz
 q+MULYFRIzZmxjm8DIOwtJyywkLQsYmVYxWiYVZaZnlOQmZuboGhoY6BoaGuua6hqZGOolVuk
 m6aWW6ian5pUUJQJl9RLLi/WKK3OTc1L08lJLNjECAyylkPXjDsZDrz/oHWKU5GBSEuWdsnNK
 ghBfUn5KZUZicUZ8UWlOavEhRhkODiUJ3tRXQDnBotT01Iq0zBxgsMOkJTh4lER4vzwCSvMWF
 yTmFmemQ6ROMepy7Dw6bxGzEEtefl6qlDjvLZAZAiBFGaV5cCNgkXeJUVZKmJeRgYFBiKcgtS
 g3swRV/hWjOAejkjBvNMgUnsy8ErhNr4COYAI64uPaSSBHlCQipKQamMo0bDTlZUtESko3qfI
 55/x2WPdPuijpX97jxK9iZXszcnX0zloG1PxeFaobudHDSEu4lLd4ZS6Dhah1vcKqpjl/Yz23
 sUT2nRGeJ/JqKU+Op/2iOUsvbH5mJSO/tmajTonj1ngznuhOtRX7N5a5bPldY+H432yW4w8+4
 x39j0Ju+J76d+1ntPgJQZ64AyYBJ3h/Xpi+89/6Ohe7pu65Oas3XnkZ+mxCq6inu3xD6OZAfi
 bOYu6yYDb/UM61XsUlcw7//tVn/f3gFX/HTyU6Mruep8z81Zv/Vs7zv+7aXQxTDhyWcLj9T1u
 uSD3Z8z2X1KZpy9ffSWoJms79xWyXtUV72beNuYI5Z/RdNM4psRRnJBpqMRcVJwIAVDm33TcD
 AAA=
X-Env-Sender: xuyang2018.jy@fujitsu.com
X-Msg-Ref: server-6.tower-248.messagelabs.com!1620372611!330010!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1019 invoked from network); 7 May 2021 07:30:12 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
 by server-6.tower-248.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 7 May 2021 07:30:12 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
 by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1477U4hk004533
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
 for <ltp@lists.linux.it>; Fri, 7 May 2021 08:30:11 +0100
Received: from localhost.localdomain (10.167.220.84) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 7 May 2021 08:30:02 +0100
From: Yang Xu <xuyang2018.jy@fujitsu.com>
To: <ltp@lists.linux.it>
Date: Fri, 7 May 2021 15:30:38 +0800
Message-ID: <1620372638-25690-1-git-send-email-xuyang2018.jy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
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
Subject: [LTP] [PATCH] syscalls/mallinfo201: Add a basic test for mallinfo2
 when setting 2G size
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
 .../syscalls/mallinfo/mallinfo_common.h       | 18 +++++++
 .../kernel/syscalls/mallinfo2/.gitignore      |  1 +
 testcases/kernel/syscalls/mallinfo2/Makefile  |  8 ++++
 .../kernel/syscalls/mallinfo2/mallinfo201.c   | 47 +++++++++++++++++++
 6 files changed, 77 insertions(+)
 create mode 100644 testcases/kernel/syscalls/mallinfo2/.gitignore
 create mode 100644 testcases/kernel/syscalls/mallinfo2/Makefile
 create mode 100644 testcases/kernel/syscalls/mallinfo2/mallinfo201.c

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
index aa7fa24dd..ea48efd26 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -693,6 +693,8 @@ lstat02_64 lstat02_64
 mallinfo01 mallinfo01
 mallinfo02 mallinfo02
 
+mallinfo201 mallinfo201
+
 mallopt01 mallopt01
 
 mbind01 mbind01
diff --git a/testcases/kernel/syscalls/mallinfo/mallinfo_common.h b/testcases/kernel/syscalls/mallinfo/mallinfo_common.h
index a00cc7a64..e7737b270 100644
--- a/testcases/kernel/syscalls/mallinfo/mallinfo_common.h
+++ b/testcases/kernel/syscalls/mallinfo/mallinfo_common.h
@@ -28,4 +28,22 @@ static inline void print_mallinfo(const char *msg, struct mallinfo *m)
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
index 000000000..848f00130
--- /dev/null
+++ b/testcases/kernel/syscalls/mallinfo2/.gitignore
@@ -0,0 +1 @@
+/mallinfo201
diff --git a/testcases/kernel/syscalls/mallinfo2/Makefile b/testcases/kernel/syscalls/mallinfo2/Makefile
new file mode 100644
index 000000000..044619fb8
--- /dev/null
+++ b/testcases/kernel/syscalls/mallinfo2/Makefile
@@ -0,0 +1,8 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# Copyright (c) International Business Machines  Corp., 2001
+
+top_srcdir		?= ../../../..
+
+include $(top_srcdir)/include/mk/testcases.mk
+
+include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/mallinfo2/mallinfo201.c b/testcases/kernel/syscalls/mallinfo2/mallinfo201.c
new file mode 100644
index 000000000..0bc2520a0
--- /dev/null
+++ b/testcases/kernel/syscalls/mallinfo2/mallinfo201.c
@@ -0,0 +1,47 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2021 FUJITSU LIMITED. All rights reserved.
+ * Author: Yang Xu <xuyang2018.jy@fujitsu.com>
+ */
+
+/*\
+ * [DESCRIPTION]
+ *
+ * Basic mallinfo2() test. Test the member of struct mallinfo2
+ * whether overflow when setting 2G size. mallinfo() is deprecated
+ * since the type used for the fields is too small. We should use
+ * mallinfo2() and it was added since glibc 2.33.
+ */
+
+#include "../mallinfo/mallinfo_common.h"
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
