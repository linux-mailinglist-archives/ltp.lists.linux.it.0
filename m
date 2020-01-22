Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D141456F8
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Jan 2020 14:43:25 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2C9553C2093
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Jan 2020 14:43:25 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 1BB2B3C038C
 for <ltp@lists.linux.it>; Wed, 22 Jan 2020 14:43:23 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 944BB200C99
 for <ltp@lists.linux.it>; Wed, 22 Jan 2020 14:43:22 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id EF374AFB7
 for <ltp@lists.linux.it>; Wed, 22 Jan 2020 13:43:21 +0000 (UTC)
From: Jorik Cronenberg <jcronenberg@suse.de>
To: ltp@lists.linux.it
Date: Wed, 22 Jan 2020 14:42:38 +0100
Message-Id: <20200122134239.28844-1-jcronenberg@suse.de>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] lib: Add timeout to TST_PROCESS_STATE_WAIT
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

Add the possibility to add a timeout to TST_PROCESS_STATE_WAIT.
Like checkpoints add TST_PROCESS_STATE_WAIT2()
for specifying a timeout. The original TST_PROCESS_STATE_WAIT()
works the same as before. Timeout can be specified in milliseconds.

Signed-off-by: Jorik Cronenberg <jcronenberg@suse.de>
---
 include/tst_process_state.h | 12 ++++++++----
 lib/tst_process_state.c     | 19 ++++++++++++++-----
 2 files changed, 22 insertions(+), 9 deletions(-)

diff --git a/include/tst_process_state.h b/include/tst_process_state.h
index fab0491d9..27a8ffc36 100644
--- a/include/tst_process_state.h
+++ b/include/tst_process_state.h
@@ -47,9 +47,13 @@
  */
 #ifdef TST_TEST_H__
 
+#define TST_PROCESS_STATE_WAIT2(pid, state, msec_timeout) \
+	tst_process_state_wait(__FILE__, __LINE__, NULL, \
+	                       (pid), (state), msec_timeout)
+
 #define TST_PROCESS_STATE_WAIT(pid, state) \
 	tst_process_state_wait(__FILE__, __LINE__, NULL, \
-	                       (pid), (state))
+	                       (pid), (state), 0)
 #else
 /*
  * The same as above but does not use tst_brkm() interface.
@@ -65,8 +69,8 @@ int tst_process_state_wait2(pid_t pid, const char state);
 	                        (pid), (state))
 #endif
 
-void tst_process_state_wait(const char *file, const int lineno,
-                            void (*cleanup_fn)(void),
-                            pid_t pid, const char state);
+int tst_process_state_wait(const char *file, const int lineno,
+                            void (*cleanup_fn)(void), pid_t pid,
+			    const char state, unsigned int msec_timeout);
 
 #endif /* TST_PROCESS_STATE__ */
diff --git a/lib/tst_process_state.c b/lib/tst_process_state.c
index 7a7824959..32b44992c 100644
--- a/lib/tst_process_state.c
+++ b/lib/tst_process_state.c
@@ -28,11 +28,12 @@
 #include "test.h"
 #include "tst_process_state.h"
 
-void tst_process_state_wait(const char *file, const int lineno,
-                            void (*cleanup_fn)(void),
-                            pid_t pid, const char state)
+int tst_process_state_wait(const char *file, const int lineno,
+                            void (*cleanup_fn)(void), pid_t pid,
+			    const char state, unsigned int msec_timeout)
 {
 	char proc_path[128], cur_state;
+	unsigned int msecs = 0;
 
 	snprintf(proc_path, sizeof(proc_path), "/proc/%i/stat", pid);
 
@@ -41,10 +42,18 @@ void tst_process_state_wait(const char *file, const int lineno,
 		                "%*i %*s %c", &cur_state);
 
 		if (state == cur_state)
-			return;
+			break;
 
-		usleep(10000);
+		usleep(1000);
+		msecs += 1;
+
+		if (msecs >= msec_timeout) {
+			errno = ETIMEDOUT;
+			return -1;
+		}
 	}
+
+	return 0;
 }
 
 int tst_process_state_wait2(pid_t pid, const char state)
-- 
2.24.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
