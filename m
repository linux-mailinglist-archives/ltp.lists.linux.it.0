Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F90C147C0A
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Jan 2020 10:49:16 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 36BD43C2395
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Jan 2020 10:49:16 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 9B9A13C2379
 for <ltp@lists.linux.it>; Fri, 24 Jan 2020 10:49:14 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id C34A9600672
 for <ltp@lists.linux.it>; Fri, 24 Jan 2020 10:49:12 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 6CB92AAC2
 for <ltp@lists.linux.it>; Fri, 24 Jan 2020 09:49:13 +0000 (UTC)
From: Jorik Cronenberg <jcronenberg@suse.de>
To: ltp@lists.linux.it
Date: Fri, 24 Jan 2020 10:48:18 +0100
Message-Id: <20200124094819.11710-1-jcronenberg@suse.de>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v2 1/2] lib: Add timeout to TST_PROCESS_STATE_WAIT
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

Add a timeout to TST_PROCESS_STATE_WAIT. Timeout can be
specified in milliseconds. After timeout it returns -1
and sets errno to ETIMEDOUT. Specifying a timeout of 0
makes it for the most part function like the old
TST_PROCESS_STATE_WAIT.

Update all existing testcases that used TST_PROCESS_STATE_WAIT
and the new test library.

Signed-off-by: Jorik Cronenberg <jcronenberg@suse.de>
---
v2:
removed TST_PROCESS_STATE_WAIT2
change all existing testcases that use TST_PROCESS_STATE_WAIT and
new testlib
change doc to reflect changes

also while going through tests I noticed that my previous
implementation was broken and did timeout even with timeout
set to 0, that should now also be fixed.

 doc/test-writing-guidelines.txt               |  7 +++++--
 include/tst_process_state.h                   | 12 ++++++------
 lib/tst_process_state.c                       | 19 ++++++++++++++-----
 testcases/kernel/mem/mtest01/mtest01.c        |  2 +-
 testcases/kernel/syscalls/clone/clone08.c     |  2 +-
 .../syscalls/futex/futex_cmp_requeue01.c      |  2 +-
 .../kernel/syscalls/ipc/msgsnd/msgsnd05.c     |  2 +-
 .../kernel/syscalls/ipc/msgsnd/msgsnd06.c     |  2 +-
 testcases/kernel/syscalls/pause/pause01.c     |  2 +-
 testcases/kernel/syscalls/wait4/wait401.c     |  2 +-
 10 files changed, 32 insertions(+), 20 deletions(-)

diff --git a/doc/test-writing-guidelines.txt b/doc/test-writing-guidelines.txt
index f0aa69ad4..bfc3b5554 100644
--- a/doc/test-writing-guidelines.txt
+++ b/doc/test-writing-guidelines.txt
@@ -820,11 +820,14 @@ For the details of the interface, look into the 'include/tst_checkpoint.h'.
  * Z - zombie process
  * T - process is traced
  */
-TST_PROCESS_STATE_WAIT(pid, state)
+TST_PROCESS_STATE_WAIT(pid, state, msec_timeout)
 -------------------------------------------------------------------------------
 
 The 'TST_PROCESS_STATE_WAIT()' waits until process 'pid' is in requested
-'state'. The call polls +/proc/pid/stat+ to get this information.
+'state' or timeout is reached. The call polls +/proc/pid/stat+ to get this
+information. A timeout of 0 will wait infinitely.
+
+On timeout -1 is returned and errno set to ETIMEDOUT.
 
 It's mostly used with state 'S' which means that process is sleeping in kernel
 for example in 'pause()' or any other blocking syscall.
diff --git a/include/tst_process_state.h b/include/tst_process_state.h
index fab0491d9..a070e0921 100644
--- a/include/tst_process_state.h
+++ b/include/tst_process_state.h
@@ -47,9 +47,9 @@
  */
 #ifdef TST_TEST_H__
 
-#define TST_PROCESS_STATE_WAIT(pid, state) \
+#define TST_PROCESS_STATE_WAIT(pid, state, msec_timeout) \
 	tst_process_state_wait(__FILE__, __LINE__, NULL, \
-	                       (pid), (state))
+	                       (pid), (state), (msec_timeout))
 #else
 /*
  * The same as above but does not use tst_brkm() interface.
@@ -62,11 +62,11 @@ int tst_process_state_wait2(pid_t pid, const char state);
 
 # define TST_PROCESS_STATE_WAIT(cleanup_fn, pid, state) \
 	 tst_process_state_wait(__FILE__, __LINE__, (cleanup_fn), \
-	                        (pid), (state))
+	                        (pid), (state), 0)
 #endif
 
-void tst_process_state_wait(const char *file, const int lineno,
-                            void (*cleanup_fn)(void),
-                            pid_t pid, const char state);
+int tst_process_state_wait(const char *file, const int lineno,
+                            void (*cleanup_fn)(void), pid_t pid,
+			    const char state, unsigned int msec_timeout);
 
 #endif /* TST_PROCESS_STATE__ */
diff --git a/lib/tst_process_state.c b/lib/tst_process_state.c
index 7a7824959..323684b55 100644
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
+		if (msecs >= msec_timeout && msec_timeout) {
+			errno = ETIMEDOUT;
+			return -1;
+		}
 	}
+
+	return 0;
 }
 
 int tst_process_state_wait2(pid_t pid, const char state)
diff --git a/testcases/kernel/mem/mtest01/mtest01.c b/testcases/kernel/mem/mtest01/mtest01.c
index 446d26897..f08d3943f 100644
--- a/testcases/kernel/mem/mtest01/mtest01.c
+++ b/testcases/kernel/mem/mtest01/mtest01.c
@@ -227,7 +227,7 @@ static void mem_test(void)
 			alloc_maxbytes / 1024, write_msg);
 
 	for (i = 0; i < pid_cntr; i++) {
-		TST_PROCESS_STATE_WAIT(pid_list[i], 'T');
+		TST_PROCESS_STATE_WAIT(pid_list[i], 'T', 0);
 		kill(pid_list[i], SIGCONT);
 	}
 }
diff --git a/testcases/kernel/syscalls/clone/clone08.c b/testcases/kernel/syscalls/clone/clone08.c
index aace30806..8e115b042 100644
--- a/testcases/kernel/syscalls/clone/clone08.c
+++ b/testcases/kernel/syscalls/clone/clone08.c
@@ -159,7 +159,7 @@ static void test_clone_stopped(int t)
 
 	child = clone_child(&test_cases[t]);
 
-	TST_PROCESS_STATE_WAIT(child, 'T');
+	TST_PROCESS_STATE_WAIT(child, 'T', 0);
 
 	stopped_flag = 0;
 
diff --git a/testcases/kernel/syscalls/futex/futex_cmp_requeue01.c b/testcases/kernel/syscalls/futex/futex_cmp_requeue01.c
index a2e899b8d..f5e88a0d5 100644
--- a/testcases/kernel/syscalls/futex/futex_cmp_requeue01.c
+++ b/testcases/kernel/syscalls/futex/futex_cmp_requeue01.c
@@ -87,7 +87,7 @@ static void verify_futex_cmp_requeue(unsigned int n)
 	}
 
 	for (i = 0; i < tc->num_waiters; i++)
-		TST_PROCESS_STATE_WAIT(pid[i], 'S');
+		TST_PROCESS_STATE_WAIT(pid[i], 'S', 0);
 
 	tst_res(TINFO, "Test %d: waiters: %d, wakes: %d, requeues: %d",
 		n, tc->num_waiters, tc->set_wakes, tc->set_requeues);
diff --git a/testcases/kernel/syscalls/ipc/msgsnd/msgsnd05.c b/testcases/kernel/syscalls/ipc/msgsnd/msgsnd05.c
index e169831e0..ace32cdaa 100644
--- a/testcases/kernel/syscalls/ipc/msgsnd/msgsnd05.c
+++ b/testcases/kernel/syscalls/ipc/msgsnd/msgsnd05.c
@@ -80,7 +80,7 @@ static void do_test(unsigned int n)
 		_exit(0);
 	}
 
-	TST_PROCESS_STATE_WAIT(pid, 'S');
+	TST_PROCESS_STATE_WAIT(pid, 'S', 0);
 	SAFE_KILL(pid, SIGHUP);
 	tst_reap_children();
 }
diff --git a/testcases/kernel/syscalls/ipc/msgsnd/msgsnd06.c b/testcases/kernel/syscalls/ipc/msgsnd/msgsnd06.c
index e7855e844..9f462b672 100644
--- a/testcases/kernel/syscalls/ipc/msgsnd/msgsnd06.c
+++ b/testcases/kernel/syscalls/ipc/msgsnd/msgsnd06.c
@@ -57,7 +57,7 @@ static void do_test(void)
 		_exit(0);
 	}
 
-	TST_PROCESS_STATE_WAIT(pid, 'S');
+	TST_PROCESS_STATE_WAIT(pid, 'S', 0);
 
 	SAFE_MSGCTL(queue_id, IPC_RMID, NULL);
 
diff --git a/testcases/kernel/syscalls/pause/pause01.c b/testcases/kernel/syscalls/pause/pause01.c
index d44e7972a..c88248da0 100644
--- a/testcases/kernel/syscalls/pause/pause01.c
+++ b/testcases/kernel/syscalls/pause/pause01.c
@@ -38,7 +38,7 @@ static void do_test(void)
 		do_child();
 
 	TST_CHECKPOINT_WAIT(0);
-	TST_PROCESS_STATE_WAIT(pid, 'S');
+	TST_PROCESS_STATE_WAIT(pid, 'S', 0);
 	kill(pid, SIGINT);
 
 	/*
diff --git a/testcases/kernel/syscalls/wait4/wait401.c b/testcases/kernel/syscalls/wait4/wait401.c
index fa0de693a..ed42d8659 100644
--- a/testcases/kernel/syscalls/wait4/wait401.c
+++ b/testcases/kernel/syscalls/wait4/wait401.c
@@ -25,7 +25,7 @@ static void run(void)
 
 	pid = SAFE_FORK();
 	if (!pid) {
-		TST_PROCESS_STATE_WAIT(getppid(), 'S');
+		TST_PROCESS_STATE_WAIT(getppid(), 'S', 0);
 		exit(0);
 	}
 
-- 
2.25.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
