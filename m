Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7C25B88A
	for <lists+linux-ltp@lfdr.de>; Mon,  1 Jul 2019 12:03:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D73593C1D8C
	for <lists+linux-ltp@lfdr.de>; Mon,  1 Jul 2019 12:03:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id E7C523C1D6D
 for <ltp@lists.linux.it>; Mon,  1 Jul 2019 12:03:51 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 5B8671A00FF7
 for <ltp@lists.linux.it>; Mon,  1 Jul 2019 12:03:49 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 44DD23B702
 for <ltp@lists.linux.it>; Mon,  1 Jul 2019 10:03:48 +0000 (UTC)
Received: from dhcp-3-207.nay.redhat.com (dhcp-3-207.nay.redhat.com
 [10.66.3.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 33EDB5D9C3;
 Mon,  1 Jul 2019 10:03:46 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it
Date: Mon,  1 Jul 2019 18:03:43 +0800
Message-Id: <20190701100343.3406-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Mon, 01 Jul 2019 10:03:48 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [RFC PATCH] lib: add tst_no_corefile to avoid corefile dumping
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

Signed-off-by: Li Wang <liwang@redhat.com>
Cc: Jan Stancek <jstancek@redhat.com>
---
 include/tst_safe_macros.h                        | 16 ++++++++++++++++
 testcases/kernel/security/umip/umip_basic_test.c |  2 ++
 testcases/kernel/syscalls/ipc/shmat/shmat01.c    | 16 +++-------------
 3 files changed, 21 insertions(+), 13 deletions(-)

diff --git a/include/tst_safe_macros.h b/include/tst_safe_macros.h
index 53a888c80..110e2984f 100644
--- a/include/tst_safe_macros.h
+++ b/include/tst_safe_macros.h
@@ -394,6 +394,22 @@ static inline int safe_setrlimit(const char *file, const int lineno,
 #define SAFE_SETRLIMIT(resource, rlim) \
 	safe_setrlimit(__FILE__, __LINE__, (resource), (rlim))
 
+/*
+ * Crash is expected, avoid dumping corefile.
+ * 1 is a special value, that disables core-to-pipe.
+ * At the same time it is small enough value for
+ * core-to-file, so it skips creating cores as well.
+ */
+static inline void tst_no_corefile(void)
+{
+       struct rlimit r;
+
+       r.rlim_cur = 1;
+       r.rlim_max = 1;
+       SAFE_SETRLIMIT(RLIMIT_CORE, &r);
+       tst_res(TINFO, "Avoid dumping corefile in following test");
+}
+
 typedef void (*sighandler_t)(int);
 static inline sighandler_t safe_signal(const char *file, const int lineno,
 				       int signum, sighandler_t handler)
diff --git a/testcases/kernel/security/umip/umip_basic_test.c b/testcases/kernel/security/umip/umip_basic_test.c
index c34d4a1f6..0a86f0727 100644
--- a/testcases/kernel/security/umip/umip_basic_test.c
+++ b/testcases/kernel/security/umip/umip_basic_test.c
@@ -86,6 +86,8 @@ static void verify_umip_instruction(unsigned int n)
 
 	pid = SAFE_FORK();
 	if (pid == 0) {
+		tst_no_corefile();
+
 		switch (n) {
 		case 0:
 			asm_sgdt();
diff --git a/testcases/kernel/syscalls/ipc/shmat/shmat01.c b/testcases/kernel/syscalls/ipc/shmat/shmat01.c
index aa9dfd4e5..415af01ec 100644
--- a/testcases/kernel/syscalls/ipc/shmat/shmat01.c
+++ b/testcases/kernel/syscalls/ipc/shmat/shmat01.c
@@ -59,19 +59,9 @@ static void *expected_addr(void *in_addr, void *out_addr)
 
 static void do_child(int *in_addr, int expect_crash)
 {
-	if (expect_crash) {
-		/*
-		 * Crash is expected, avoid dumping corefile.
-		 * 1 is a special value, that disables core-to-pipe.
-		 * At the same time it is small enough value for
-		 * core-to-file, so it skips creating cores as well.
-		*/
-		struct rlimit r;
-
-		r.rlim_cur = 1;
-		r.rlim_max = 1;
-		SAFE_SETRLIMIT(RLIMIT_CORE, &r);
-	}
+	if (expect_crash)
+		tst_no_corefile();
+
 	*in_addr = 10;
 
 	exit(0);
-- 
2.20.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
