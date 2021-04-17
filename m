Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C6281362CFF
	for <lists+linux-ltp@lfdr.de>; Sat, 17 Apr 2021 04:51:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 658333C01F4
	for <lists+linux-ltp@lfdr.de>; Sat, 17 Apr 2021 04:51:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 899B93C01F4
 for <ltp@lists.linux.it>; Sat, 17 Apr 2021 04:51:48 +0200 (CEST)
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id B643B601B36
 for <ltp@lists.linux.it>; Sat, 17 Apr 2021 04:51:46 +0200 (CEST)
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4FMcwz3vNQz7vS0
 for <ltp@lists.linux.it>; Sat, 17 Apr 2021 10:49:23 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.63) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.498.0; Sat, 17 Apr 2021 10:51:32 +0800
From: Zhao Gongyi <zhaogongyi@huawei.com>
To: <ltp@lists.linux.it>
Date: Sat, 17 Apr 2021 10:51:23 +0800
Message-ID: <20210417025123.15764-1-zhaogongyi@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.63]
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH] openposix: Correct typos of TEST
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

For those:
	testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getschedpolicy/2-1.c
	testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setinheritsched/2-3.c
	testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setinheritsched/2-4.c
	testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setschedparam/1-3.c
	testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setschedparam/1-4.c
	testcases/open_posix_testsuite/conformance/interfaces/sem_timedwait/6-2.c
	testcases/open_posix_testsuite/conformance/interfaces/sem_wait/1-2.c
	testcases/open_posix_testsuite/functional/threads/condvar/pthread_cond_wait_1.c
	testcases/open_posix_testsuite/functional/threads/condvar/pthread_cond_wait_2.c
	testcases/open_posix_testsuite/functional/threads/schedule/1-1.c
	testcases/open_posix_testsuite/functional/threads/schedule/1-2.c

Signed-off-by: Zhao Gongyi <zhaogongyi@huawei.com>
---
 .../conformance/interfaces/pthread_attr_getschedpolicy/2-1.c    | 2 +-
 .../conformance/interfaces/pthread_attr_setinheritsched/2-3.c   | 2 +-
 .../conformance/interfaces/pthread_attr_setinheritsched/2-4.c   | 2 +-
 .../conformance/interfaces/pthread_attr_setschedparam/1-3.c     | 2 +-
 .../conformance/interfaces/pthread_attr_setschedparam/1-4.c     | 2 +-
 .../conformance/interfaces/sem_timedwait/6-2.c                  | 2 +-
 .../open_posix_testsuite/conformance/interfaces/sem_wait/1-2.c  | 2 +-
 .../functional/threads/condvar/pthread_cond_wait_1.c            | 2 +-
 .../functional/threads/condvar/pthread_cond_wait_2.c            | 2 +-
 .../open_posix_testsuite/functional/threads/schedule/1-1.c      | 2 +-
 .../open_posix_testsuite/functional/threads/schedule/1-2.c      | 2 +-
 11 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getschedpolicy/2-1.c b/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getschedpolicy/2-1.c
index 80dc2c2be..70818e29e 100644
--- a/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getschedpolicy/2-1.c
+++ b/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getschedpolicy/2-1.c
@@ -19,7 +19,7 @@
 #include <stdlib.h>
 #include "posixtest.h"

-#define TEST "1-1"
+#define TEST "2-1"
 #define FUNCTION "pthread_attr_getschedpolicy"
 #define ERROR_PREFIX "unexpected error: " FUNCTION " " TEST ": "

diff --git a/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setinheritsched/2-3.c b/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setinheritsched/2-3.c
index a1047651c..ae268c822 100644
--- a/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setinheritsched/2-3.c
+++ b/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setinheritsched/2-3.c
@@ -21,7 +21,7 @@
 #include <stdlib.h>
 #include "posixtest.h"

-#define TEST "4-1"
+#define TEST "2-3"
 #define AREA "scheduler"
 #define ERROR_PREFIX "unexpected error: " AREA " " TEST ": "

diff --git a/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setinheritsched/2-4.c b/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setinheritsched/2-4.c
index 85ac35e73..dbc6abfc7 100644
--- a/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setinheritsched/2-4.c
+++ b/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setinheritsched/2-4.c
@@ -21,7 +21,7 @@
 #include <stdlib.h>
 #include "posixtest.h"

-#define TEST "4-2"
+#define TEST "2-4"
 #define AREA "scheduler"
 #define ERROR_PREFIX "unexpected error: " AREA " " TEST ": "

diff --git a/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setschedparam/1-3.c b/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setschedparam/1-3.c
index 1f0289013..a09227d8d 100644
--- a/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setschedparam/1-3.c
+++ b/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setschedparam/1-3.c
@@ -21,7 +21,7 @@
 #include <stdlib.h>
 #include "posixtest.h"

-#define TEST "3-1"
+#define TEST "1-3"
 #define AREA "scheduler"
 #define ERROR_PREFIX "unexpected error: " AREA " " TEST ": "

diff --git a/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setschedparam/1-4.c b/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setschedparam/1-4.c
index 5e13ea407..ee06d4390 100644
--- a/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setschedparam/1-4.c
+++ b/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setschedparam/1-4.c
@@ -21,7 +21,7 @@
 #include <stdlib.h>
 #include "posixtest.h"

-#define TEST "3-2"
+#define TEST "1-4"
 #define AREA "scheduler"
 #define ERROR_PREFIX "unexpected error: " AREA " " TEST ": "

diff --git a/testcases/open_posix_testsuite/conformance/interfaces/sem_timedwait/6-2.c b/testcases/open_posix_testsuite/conformance/interfaces/sem_timedwait/6-2.c
index f957191bf..1ad0fad33 100644
--- a/testcases/open_posix_testsuite/conformance/interfaces/sem_timedwait/6-2.c
+++ b/testcases/open_posix_testsuite/conformance/interfaces/sem_timedwait/6-2.c
@@ -22,7 +22,7 @@
 #include <time.h>
 #include "posixtest.h"

-#define TEST "5-1"
+#define TEST "6-2"
 #define FUNCTION "sem_timedwait"
 #define ERROR_PREFIX "unexpected error: " FUNCTION " " TEST ": "

diff --git a/testcases/open_posix_testsuite/conformance/interfaces/sem_wait/1-2.c b/testcases/open_posix_testsuite/conformance/interfaces/sem_wait/1-2.c
index ad2e47519..bbfe45250 100644
--- a/testcases/open_posix_testsuite/conformance/interfaces/sem_wait/1-2.c
+++ b/testcases/open_posix_testsuite/conformance/interfaces/sem_wait/1-2.c
@@ -20,7 +20,7 @@
 #include <signal.h>
 #include "posixtest.h"

-#define TEST "2-1"
+#define TEST "1-2"
 #define FUNCTION "sem_wait"
 #define ERROR_PREFIX "unexpected error: " FUNCTION " " TEST ": "

diff --git a/testcases/open_posix_testsuite/functional/threads/condvar/pthread_cond_wait_1.c b/testcases/open_posix_testsuite/functional/threads/condvar/pthread_cond_wait_1.c
index 53dea8bc6..9226c50b6 100644
--- a/testcases/open_posix_testsuite/functional/threads/condvar/pthread_cond_wait_1.c
+++ b/testcases/open_posix_testsuite/functional/threads/condvar/pthread_cond_wait_1.c
@@ -27,7 +27,7 @@
 #include "posixtest.h"
 #include "safe_helpers.h"

-#define TEST "5-1"
+#define TEST "pthread_cond_wait_1"
 #define AREA "scheduler"
 #define ERROR_PREFIX "unexpected error: " AREA " " TEST ": "

diff --git a/testcases/open_posix_testsuite/functional/threads/condvar/pthread_cond_wait_2.c b/testcases/open_posix_testsuite/functional/threads/condvar/pthread_cond_wait_2.c
index 3b1af3cd7..5073e9c9d 100644
--- a/testcases/open_posix_testsuite/functional/threads/condvar/pthread_cond_wait_2.c
+++ b/testcases/open_posix_testsuite/functional/threads/condvar/pthread_cond_wait_2.c
@@ -27,7 +27,7 @@
 #include "posixtest.h"
 #include "safe_helpers.h"

-#define TEST "5-1"
+#define TEST "pthread_cond_wait_2"
 #define AREA "scheduler"
 #define ERROR_PREFIX "unexpected error: " AREA " " TEST ": "

diff --git a/testcases/open_posix_testsuite/functional/threads/schedule/1-1.c b/testcases/open_posix_testsuite/functional/threads/schedule/1-1.c
index 293a15126..b221809d9 100644
--- a/testcases/open_posix_testsuite/functional/threads/schedule/1-1.c
+++ b/testcases/open_posix_testsuite/functional/threads/schedule/1-1.c
@@ -28,7 +28,7 @@
 #include "posixtest.h"
 #include "safe_helpers.h"

-#define TEST "5-4"
+#define TEST "1-1"
 #define AREA "scheduler"
 #define ERROR_PREFIX "unexpected error: " AREA " " TEST ": "

diff --git a/testcases/open_posix_testsuite/functional/threads/schedule/1-2.c b/testcases/open_posix_testsuite/functional/threads/schedule/1-2.c
index b5b7006e2..8614d5733 100644
--- a/testcases/open_posix_testsuite/functional/threads/schedule/1-2.c
+++ b/testcases/open_posix_testsuite/functional/threads/schedule/1-2.c
@@ -27,7 +27,7 @@
 #include "posixtest.h"
 #include "safe_helpers.h"

-#define TEST "5-5"
+#define TEST "1-2"
 #define AREA "scheduler"
 #define ERROR_PREFIX "unexpected error: " AREA " " TEST ": "

--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
