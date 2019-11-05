Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2DFEFCC3
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Nov 2019 12:58:06 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5D8153C22C6
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Nov 2019 12:58:06 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 4B17D3C220E
 for <ltp@lists.linux.it>; Tue,  5 Nov 2019 12:58:05 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 0FBAB1000D86
 for <ltp@lists.linux.it>; Tue,  5 Nov 2019 12:58:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572955082;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=LGgvs3refpNMF2LgVWXtX7zpose5aQToZZt5xHJqtLo=;
 b=La2hkumrsptKu58WaWo12Dar79PGmxnSGnuGmhnKBA4gQSK9w8LD4jlwwATofuUdcm1EFe
 Kg5SNqa2MM2oNs5srCZoaeWj1OaME6XjAzJMK2ipK0+j2YIOc3V6nKG3PoFR5umSk5H87G
 aoxZQmgOUnvRWWkKlozPhKGHplsyIOI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-181-vu6Xop1OPgCPFVf2fsmzIg-1; Tue, 05 Nov 2019 06:58:01 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0CACA800683
 for <ltp@lists.linux.it>; Tue,  5 Nov 2019 11:58:00 +0000 (UTC)
Received: from dustball.brq.redhat.com (unknown [10.43.17.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7B99E63620
 for <ltp@lists.linux.it>; Tue,  5 Nov 2019 11:57:59 +0000 (UTC)
From: Jan Stancek <jstancek@redhat.com>
To: ltp@lists.linux.it
Date: Tue,  5 Nov 2019 12:57:52 +0100
Message-Id: <48e9d0f8ed25dd69dc97fe31c4446a30cd990b06.1572954996.git.jstancek@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: vu6Xop1OPgCPFVf2fsmzIg-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH/RFC] tst_process_state_wait: wait for schedstats to
 settle when state == S
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

There can be a gap between task state update and process being scheduled
off from runqueue. For example futex_wait_queue_me() updates task state
before it queues the futex:

  static void futex_wait_queue_me(struct futex_hash_bucket *hb, struct futex_q *q,
				  struct hrtimer_sleeper *timeout)
  {
	  /*
	   * The task state is guaranteed to be set before another task can
	   * wake it. set_current_state() is implemented using smp_store_mb() and
	   * queue_me() calls spin_unlock() upon completion, both serializing
	   * access to the hash list and forcing another memory barrier.
	   */
	  set_current_state(TASK_INTERRUPTIBLE);
	  queue_me(q, hb);

This can lead to test assuming, that child process is already queued on
futex and try to requeue futexes early (example below is modified to use
2 children: 1 wake, 1 requeue):
  futex_cmp_requeue01.c:107: FAIL: futex_cmp_requeue() requeues 0 waiters, expected 1

In addition to tst_process_state_wait() waiting on 'S' state, also wait
for /proc/pid/schedstats' sum_exec_runtime and run_delay to settle:
  1) time spent on the cpu
  2) time spent waiting on a runqueue

Signed-off-by: Jan Stancek <jstancek@redhat.com>
---
 lib/tst_process_state.c | 55 +++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 53 insertions(+), 2 deletions(-)

diff --git a/lib/tst_process_state.c b/lib/tst_process_state.c
index 7a7824959d72..a24b49092ef2 100644
--- a/lib/tst_process_state.c
+++ b/lib/tst_process_state.c
@@ -28,6 +28,51 @@
 #include "test.h"
 #include "tst_process_state.h"
 
+#define SETTLE_SLEEP_US 20000 
+#define MAX_SETTLE_SLEEP_US (5 * SETTLE_SLEEP_US)
+
+/*
+ * When schedstats settle we have more confidence process ('S') has
+ * been scheduled off from runqueue.
+ */
+static void schedstat_settle(const char *file, const int lineno, pid_t pid)
+{
+	char ss_path[128];
+	int sleep = 0;
+
+	snprintf(ss_path, sizeof(ss_path), "/proc/%i/schedstat", pid);
+	if (access(ss_path, F_OK)) {
+		/* CONFIG_SCHED_INFO is likely disabled */
+		usleep(MAX_SETTLE_SLEEP_US);
+		return;
+	}
+
+	for (;;) {
+		unsigned long long sum_exec, run_delay, sum_exec2, run_delay2;
+		int ret = 0;
+
+		ret |= file_scanf(file, lineno, ss_path, "%llu %llu",
+			&sum_exec, &run_delay);
+		usleep(SETTLE_SLEEP_US);
+		sleep += SETTLE_SLEEP_US;
+		ret |= file_scanf(file, lineno, ss_path, "%llu %llu",
+			&sum_exec2, &run_delay2);
+
+		if (ret) {
+			tst_resm(TWARN, "Error parsing %s", ss_path);
+			return;
+		}
+
+		if (sum_exec == sum_exec2 && run_delay == run_delay2)
+			return;
+
+		if (sleep >= MAX_SETTLE_SLEEP_US) {
+			tst_resm(TWARN, "MAX_SETTLE_SLEEP_US reached");
+			return;
+		}
+	}
+}
+
 void tst_process_state_wait(const char *file, const int lineno,
                             void (*cleanup_fn)(void),
                             pid_t pid, const char state)
@@ -40,8 +85,11 @@ void tst_process_state_wait(const char *file, const int lineno,
 		safe_file_scanf(file, lineno, cleanup_fn, proc_path,
 		                "%*i %*s %c", &cur_state);
 
-		if (state == cur_state)
+		if (state == cur_state) {
+			if (state == 'S')
+				schedstat_settle(file, lineno, pid);
 			return;
+		}
 
 		usleep(10000);
 	}
@@ -69,8 +117,11 @@ int tst_process_state_wait2(pid_t pid, const char state)
 		}
 		fclose(f);
 
-		if (state == cur_state)
+		if (state == cur_state) {
+			if (state == 'S')
+				schedstat_settle(__FILE__, __LINE__, pid);
 			return 0;
+		}
 
 		usleep(10000);
 	}
-- 
1.8.3.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
