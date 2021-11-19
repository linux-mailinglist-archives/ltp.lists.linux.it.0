Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E06456B13
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Nov 2021 08:46:49 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7A4723C89B5
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Nov 2021 08:46:49 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id EE7123C8982
 for <ltp@lists.linux.it>; Fri, 19 Nov 2021 08:46:15 +0100 (CET)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 24EB4601404
 for <ltp@lists.linux.it>; Fri, 19 Nov 2021 08:46:15 +0100 (CET)
Received: from ubuntu.localdomain (unknown [188.195.115.12])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 4D6479FE97;
 Fri, 19 Nov 2021 07:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1637307974; bh=XmdKdKn+DTHy75XptMZC+yNE1ctIhBSsje2bwjJGuXM=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=RPomEiIGT7g/dybEMLygXEn7I8m42SdH0jr6Pv/Aaijbzmch0+anxzgCDqJZ2if1m
 0sme2E87xI5kYEgcMuoqhUOF7X2aigVuy/NR4BEOdIXQ3rRlJGu7yVsxJqHR8as7Fv
 JBo559hl/u2OaIq08CnS8PXTKDImfYb+7N4cQLvg=
From: Joerg Vehlow <lkml@jv-coder.de>
To: ltp@lists.linux.it
Date: Fri, 19 Nov 2021 08:45:54 +0100
Message-Id: <20211119074602.857595-5-lkml@jv-coder.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211119074602.857595-1-lkml@jv-coder.de>
References: <20211119074602.857595-1-lkml@jv-coder.de>
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH 04/12] posix/conformance/interfaces: Fix
 unsued-variable for testfrmw
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

Thre is a global variable sc in testfrmw/threads_scenarii, that is used,
if the integrated main function (STD_MAIN) is used. However some tests
did not use this integrated main, but still used the variable. To be able to
get rid of all warnings, the variable is duplicated into these tests and only
defined by threads_scenarii, if STD_MAIN is defined

Signed-off-by: Joerg Vehlow <joerg.vehlow@aox-tech.de>
---
 .../conformance/interfaces/pthread_create/14-1.c              | 2 ++
 .../conformance/interfaces/pthread_create/3-2.c               | 2 ++
 .../conformance/interfaces/pthread_detach/1-2.c               | 2 ++
 .../conformance/interfaces/pthread_detach/2-2.c               | 1 +
 .../conformance/interfaces/pthread_detach/4-3.c               | 1 +
 .../conformance/interfaces/pthread_exit/6-1.c                 | 1 +
 .../conformance/interfaces/pthread_join/1-2.c                 | 2 ++
 .../conformance/interfaces/pthread_join/4-1.c                 | 1 +
 .../conformance/interfaces/pthread_join/6-3.c                 | 1 +
 .../conformance/interfaces/testfrmw/threads_scenarii.c        | 4 ++--
 10 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/testcases/open_posix_testsuite/conformance/interfaces/pthread_create/14-1.c b/testcases/open_posix_testsuite/conformance/interfaces/pthread_create/14-1.c
index c21860ba8..84d229afc 100644
--- a/testcases/open_posix_testsuite/conformance/interfaces/pthread_create/14-1.c
+++ b/testcases/open_posix_testsuite/conformance/interfaces/pthread_create/14-1.c
@@ -47,6 +47,8 @@ static volatile long sleep_time;
 /* number of pthread_create scenarios tested */
 static unsigned long count_ope;
 
+static unsigned int sc;
+
 static unsigned long long current_time_usec(void)
 {
 	struct timeval now;
diff --git a/testcases/open_posix_testsuite/conformance/interfaces/pthread_create/3-2.c b/testcases/open_posix_testsuite/conformance/interfaces/pthread_create/3-2.c
index 433ccd8fe..3197bdf67 100644
--- a/testcases/open_posix_testsuite/conformance/interfaces/pthread_create/3-2.c
+++ b/testcases/open_posix_testsuite/conformance/interfaces/pthread_create/3-2.c
@@ -104,6 +104,8 @@
 
 static sem_t semsync[2];		/* These semaphores will only be used in child process! */
 
+static unsigned int sc;
+
 /* The overflow function is used to test the stack overflow */
 static void *overflow(void *arg)
 {
diff --git a/testcases/open_posix_testsuite/conformance/interfaces/pthread_detach/1-2.c b/testcases/open_posix_testsuite/conformance/interfaces/pthread_detach/1-2.c
index a6eb391ef..28a7e9ea9 100644
--- a/testcases/open_posix_testsuite/conformance/interfaces/pthread_detach/1-2.c
+++ b/testcases/open_posix_testsuite/conformance/interfaces/pthread_detach/1-2.c
@@ -91,6 +91,8 @@
 /***********************************    Real Test   *****************************************/
 /********************************************************************************************/
 
+static unsigned int sc;
+
 static void *threaded(void *arg)
 {
 	int ret = 0;
diff --git a/testcases/open_posix_testsuite/conformance/interfaces/pthread_detach/2-2.c b/testcases/open_posix_testsuite/conformance/interfaces/pthread_detach/2-2.c
index 8a406fe44..a2c5cc657 100644
--- a/testcases/open_posix_testsuite/conformance/interfaces/pthread_detach/2-2.c
+++ b/testcases/open_posix_testsuite/conformance/interfaces/pthread_detach/2-2.c
@@ -93,6 +93,7 @@
 /********************************************************************************************/
 
 static sem_t sem_sync;
+static unsigned int sc;
 
 static void *threaded(void *arg)
 {
diff --git a/testcases/open_posix_testsuite/conformance/interfaces/pthread_detach/4-3.c b/testcases/open_posix_testsuite/conformance/interfaces/pthread_detach/4-3.c
index fc3a50bef..126f5aa82 100644
--- a/testcases/open_posix_testsuite/conformance/interfaces/pthread_detach/4-3.c
+++ b/testcases/open_posix_testsuite/conformance/interfaces/pthread_detach/4-3.c
@@ -61,6 +61,7 @@ static sem_t semsig1;
 static unsigned long count_sig;
 static long sleep_time;
 static sigset_t usersigs;
+static unsigned int sc;
 
 struct thestruct {
 	int sig;
diff --git a/testcases/open_posix_testsuite/conformance/interfaces/pthread_exit/6-1.c b/testcases/open_posix_testsuite/conformance/interfaces/pthread_exit/6-1.c
index b21e43d7b..639e508c2 100644
--- a/testcases/open_posix_testsuite/conformance/interfaces/pthread_exit/6-1.c
+++ b/testcases/open_posix_testsuite/conformance/interfaces/pthread_exit/6-1.c
@@ -98,6 +98,7 @@
 /* This will be used to control that atexit() has been called */
 static int *ctl;
 static long mf;
+static unsigned int sc;
 
 static void clnp(void)
 {
diff --git a/testcases/open_posix_testsuite/conformance/interfaces/pthread_join/1-2.c b/testcases/open_posix_testsuite/conformance/interfaces/pthread_join/1-2.c
index 34c410967..25e623fdb 100644
--- a/testcases/open_posix_testsuite/conformance/interfaces/pthread_join/1-2.c
+++ b/testcases/open_posix_testsuite/conformance/interfaces/pthread_join/1-2.c
@@ -48,6 +48,8 @@
 
 #include "../testfrmw/threads_scenarii.c"
 
+static unsigned int sc;
+
 static void *threaded(void *arg)
 {
 	int ret = 0;
diff --git a/testcases/open_posix_testsuite/conformance/interfaces/pthread_join/4-1.c b/testcases/open_posix_testsuite/conformance/interfaces/pthread_join/4-1.c
index b7bc56eac..6b19992ba 100644
--- a/testcases/open_posix_testsuite/conformance/interfaces/pthread_join/4-1.c
+++ b/testcases/open_posix_testsuite/conformance/interfaces/pthread_join/4-1.c
@@ -46,6 +46,7 @@
 #include "../testfrmw/threads_scenarii.c"
 
 static pthread_mutex_t mtx = PTHREAD_MUTEX_INITIALIZER;
+static unsigned int sc;
 
 /* 1st thread function */
 static void *threaded(void *arg PTS_ATTRIBUTE_UNUSED)
diff --git a/testcases/open_posix_testsuite/conformance/interfaces/pthread_join/6-3.c b/testcases/open_posix_testsuite/conformance/interfaces/pthread_join/6-3.c
index 7325defc3..ecf0498fa 100644
--- a/testcases/open_posix_testsuite/conformance/interfaces/pthread_join/6-3.c
+++ b/testcases/open_posix_testsuite/conformance/interfaces/pthread_join/6-3.c
@@ -56,6 +56,7 @@ static unsigned long count_sig;
 #endif
 
 static sigset_t usersigs;
+static unsigned int sc;
 
 struct thestruct {
 	int sig;
diff --git a/testcases/open_posix_testsuite/conformance/interfaces/testfrmw/threads_scenarii.c b/testcases/open_posix_testsuite/conformance/interfaces/testfrmw/threads_scenarii.c
index baf30a87c..645aff604 100644
--- a/testcases/open_posix_testsuite/conformance/interfaces/testfrmw/threads_scenarii.c
+++ b/testcases/open_posix_testsuite/conformance/interfaces/testfrmw/threads_scenarii.c
@@ -482,10 +482,10 @@ static void scenar_fini(void)
 	}
 }
 
-static unsigned int sc;
-
 #ifdef STD_MAIN
 
+static unsigned int sc;
+
 static void *threaded(void *arg);
 
 int main(void)
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
