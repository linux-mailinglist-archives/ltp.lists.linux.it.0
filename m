Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3B9113CA0
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Dec 2019 08:55:48 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 400503C2444
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Dec 2019 08:55:48 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 03C6E3C23AF
 for <ltp@lists.linux.it>; Thu,  5 Dec 2019 08:55:42 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 2B62A1013175
 for <ltp@lists.linux.it>; Thu,  5 Dec 2019 08:55:40 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.69,280,1571673600"; d="scan'208";a="79630947"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 05 Dec 2019 15:55:36 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id E476A4CE1BED
 for <ltp@lists.linux.it>; Thu,  5 Dec 2019 15:47:00 +0800 (CST)
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Thu, 5 Dec 2019 15:55:30 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Thu, 5 Dec 2019 15:55:37 +0800
Message-ID: <1575532537-27105-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: E476A4CE1BED.AEFC5
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/userfaultfd01: Always require CAP_SYS_PTRACE
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

Since commit cefdca0a86be ("userfaultfd/sysctl: add vm.unprivileged_userfaultfd").
, it adds a global sysctl knob "vm.unprivileged_userfaultfd" to control whether
unprivileged users can use the userfaultfd system calls.  Set this to 1 to allow
unprivileged users to use the userfaultfd system calls, or set this to 0 to
restrict userfaultfd to only privileged users (with SYS_CAP_PTRACE capability).The
default value is 1. In order to use userfaultfd always, require CAP_SYS_PTRACE.

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 include/lapi/capability.h                             | 4 ++++
 testcases/kernel/syscalls/userfaultfd/userfaultfd01.c | 7 ++++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/include/lapi/capability.h b/include/lapi/capability.h
index 8833f0605..06c3f4921 100644
--- a/include/lapi/capability.h
+++ b/include/lapi/capability.h
@@ -24,6 +24,10 @@
 # define CAP_NET_RAW          13
 #endif
 
+#ifndef CAP_SYS_PTRACE
+# define CAP_SYS_PTRACE       19
+#endif
+
 #ifndef CAP_SYS_ADMIN
 # define CAP_SYS_ADMIN        21
 #endif
diff --git a/testcases/kernel/syscalls/userfaultfd/userfaultfd01.c b/testcases/kernel/syscalls/userfaultfd/userfaultfd01.c
index a5e142209..74d2d2253 100644
--- a/testcases/kernel/syscalls/userfaultfd/userfaultfd01.c
+++ b/testcases/kernel/syscalls/userfaultfd/userfaultfd01.c
@@ -19,6 +19,7 @@
 #include "tst_safe_macros.h"
 #include "tst_safe_pthread.h"
 #include "lapi/syscalls.h"
+#include "lapi/capability.h"
 
 static int page_size;
 static char *page;
@@ -114,7 +115,11 @@ static void run(void)
 static struct tst_test test = {
 	.test_all = run,
 	.min_kver = "4.3",
-	.timeout = 20
+	.timeout = 20,
+	.caps = (struct tst_cap []) {
+		TST_CAP(TST_CAP_REQ, CAP_SYS_PTRACE),
+		{}
+	}
 };
 
 #else
-- 
2.18.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
