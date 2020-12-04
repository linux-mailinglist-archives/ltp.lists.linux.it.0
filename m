Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id F031C2CE784
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Dec 2020 06:26:25 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 14DCB3C2B6F
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Dec 2020 06:26:22 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 4AB473C2402
 for <ltp@lists.linux.it>; Fri,  4 Dec 2020 06:25:48 +0100 (CET)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 8E4B6200056
 for <ltp@lists.linux.it>; Fri,  4 Dec 2020 06:25:43 +0100 (CET)
Received: from ubuntu.localdomain (unknown [188.192.65.157])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 7C2AA9F6B9;
 Fri,  4 Dec 2020 05:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1607059541; bh=avZZDk3sa2Td/Z7CnylB11Wwh1h09ewjsTY5x7QF+zM=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=JegXaVT/Nje4+62djNRf8conGGC2/ciIG/vuIcR/PxObfiV3IIaa8YDpBmtPVKMi3
 a68scFUQE6pOs53Pqt2wKHvewxxPHlQ9SMAeKO7ek4rxiYRp+99iSahpIiBnJtCS1I
 o+6+psarKF7CTjMZZjUlfBxd+mVcteCyPRYSKdmE=
From: Joerg Vehlow <lkml@jv-coder.de>
To: ltp@lists.linux.it,
	chrubis@suse.cz
Date: Fri,  4 Dec 2020 06:25:32 +0100
Message-Id: <20201204052532.409635-1-lkml@jv-coder.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH] realtime: Remove robust_api check
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

From: Joerg Vehlow <joerg.vehlow@aox-tech.de>

pthread_mutexattr_*robust is implemented in glibc for the last 10 years.
It is not required anymore to check if it is available.
Additonally the implementation is broken, because the macro
HAS_PTHREAD_MUTEXTATTR_ROBUST_APIS was not set.

Signed-off-by: Joerg Vehlow <joerg.vehlow@aox-tech.de>
---
 testcases/realtime/configure.ac               |  1 -
 testcases/realtime/func/pi-tests/sbrk_mutex.c | 11 -----------
 testcases/realtime/func/pi-tests/testpi-6.c   |  8 --------
 testcases/realtime/m4/check.m4                | 10 ----------
 4 files changed, 30 deletions(-)

diff --git a/testcases/realtime/configure.ac b/testcases/realtime/configure.ac
index 46a616bfc..e483caf0d 100644
--- a/testcases/realtime/configure.ac
+++ b/testcases/realtime/configure.ac
@@ -36,7 +36,6 @@ else
 fi
 
 REALTIME_CHECK_PRIO_INHERIT
-REALTIME_CHECK_ROBUST_APIS
 
 LTP_CHECK_EXP10
 
diff --git a/testcases/realtime/func/pi-tests/sbrk_mutex.c b/testcases/realtime/func/pi-tests/sbrk_mutex.c
index c0431d7da..7ed7969d9 100644
--- a/testcases/realtime/func/pi-tests/sbrk_mutex.c
+++ b/testcases/realtime/func/pi-tests/sbrk_mutex.c
@@ -45,8 +45,6 @@
 #include <unistd.h>
 #include "librttest.h"
 
-#if HAS_PTHREAD_MUTEXTATTR_ROBUST_APIS
-
 #define NUM_MUTEXES 5000
 #define NUM_THREADS 50
 #define NUM_CONCURRENT_LOCKS 50
@@ -150,12 +148,3 @@ int main(int argc, char *argv[])
 
 	return 0;
 }
-
-#else
-int main(void)
-{
-	printf
-	    ("Your system doesn't support the pthread robust mutexattr APIs\n");
-	return 1;
-}
-#endif
diff --git a/testcases/realtime/func/pi-tests/testpi-6.c b/testcases/realtime/func/pi-tests/testpi-6.c
index 96321f622..637d38355 100644
--- a/testcases/realtime/func/pi-tests/testpi-6.c
+++ b/testcases/realtime/func/pi-tests/testpi-6.c
@@ -41,7 +41,6 @@
 #include <unistd.h>
 #include <librttest.h>
 
-#if HAS_PTHREAD_MUTEXTATTR_ROBUST_APIS
 pthread_mutex_t child_mutex;
 
 void *child_thread(void *arg)
@@ -92,12 +91,5 @@ int do_test(int argc, char **argv)
 
 	return 0;
 }
-#else
-int do_test(int argc, char **argv)
-{
-	printf("Your system doesn't have robust pthread mutex support\n");
-	return 1;
-}
-#endif
 
 #include "test-skeleton.c"
diff --git a/testcases/realtime/m4/check.m4 b/testcases/realtime/m4/check.m4
index 5aa53bd42..e60ae1928 100644
--- a/testcases/realtime/m4/check.m4
+++ b/testcases/realtime/m4/check.m4
@@ -12,13 +12,3 @@ else
 	AC_MSG_RESULT(no)
 fi
 ])
-
-AC_DEFUN([REALTIME_CHECK_ROBUST_APIS],[
-	AC_CHECK_DECLS([pthread_mutexattr_getrobust, pthread_mutexattr_setrobust],[],[has_robust="no"],[[#include <pthread.h>]])
-	AC_MSG_CHECKING([for pthread_mutexattr_*robust* APIs])
-if test "x$has_robust" != "xno"; then
-	AC_MSG_RESULT(yes)
-else
-	AC_MSG_RESULT(no)
-fi
-])
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
