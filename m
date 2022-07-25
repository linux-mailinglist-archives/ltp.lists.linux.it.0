Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C0CCF57FD02
	for <lists+linux-ltp@lfdr.de>; Mon, 25 Jul 2022 12:07:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 973563C9481
	for <lists+linux-ltp@lfdr.de>; Mon, 25 Jul 2022 12:07:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B6BC93C0756
 for <ltp@lists.linux.it>; Mon, 25 Jul 2022 12:06:49 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 293AB1400273
 for <ltp@lists.linux.it>; Mon, 25 Jul 2022 12:06:47 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id CE67437588;
 Mon, 25 Jul 2022 10:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1658743606; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=S0+S/ZMw01s3DlNRCCKdnIXh+lb3T7CAeRaAqiJff4U=;
 b=S3H9e8Mv+Fc1pFJm+CJdCiE9H3yOrRJ8bQDbRoWwd2Mty5OTiH8V5shzULvuJUA2QKPy1j
 HQFw+gRtoHU4Nu8zrqppT1cqnOCACkG0KKBl5dDPA2OYMxDg65epfHL5dOU//RxCGEZW/X
 PkpivvDV+ovflNskeHGIZubXkgGE5JE=
Received: from g78.suse.de (unknown [10.163.24.226])
 by relay2.suse.de (Postfix) with ESMTP id 636162C149;
 Mon, 25 Jul 2022 10:06:46 +0000 (UTC)
To: ltp@lists.linux.it
Date: Mon, 25 Jul 2022 11:06:38 +0100
Message-Id: <20220725100641.11625-1-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v2 1/4] read_all: Add worker timeout and rewrite
 scheduling
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
From: Richard Palethorpe via ltp <ltp@lists.linux.it>
Reply-To: Richard Palethorpe <rpalethorpe@suse.com>
Cc: Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Kill and restart workers that take too long to read a file. The
default being 10% of max_runtime. A custom time can be set with the
new -t option.

This is to prevent a worker from blocking forever in a read. Currently
when this happens the whole test times out and any remaining files in
the worker's queue are not tested.

As a side effect we can now also set the timeout very low to cause
partial reads. However setting it to less than the time it takes to
start (fork) a new worker is treated as an error. Forking takes much
longer than most reads.

A number of other possible issues were fixed as well as a side effect
of changing the scheduling:

+ The worker queues are now filled in a
  "round robin" way. Before this only happened when -r was large
  enough.
+ When testing is finished the main process waits on the child procs before
  destroying the semaphores and worker queues.
+ max_runtime is set to 100 secs. This is so that the worker timeout
  is a round number.
+ Files which don't implement O_NONBLOCK and may block, no longer need
  to be avoided. Even if they refuse to die immediately;
  although this may result in TBROK due to zombie processes.

Note that with a worker timeout of 1s, 2 to 3 files will usually timeout on
my workstation. With 2s, none will. In any case testing completes in
under 3s for proc, sys or dev.

This is much faster than many other machines. It's quite likely the
worker timeout and max_runtime need to be increased on small and very
large machines. This can be done manually by setting LTP_RUNTIME_MUL.

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
Cc: Joerg Vehlow <lkml@jv-coder.de>
Cc: Li Wang <liwang@redhat.com>
Cc: Jan Stancek <jstancek@redhat.com>
---

Hi,

V2: This is completely different from V1 and can be treated as a new
    patch. However some requests were completed from V1

    * The file which probably caused a timeout is printed
    * max_runtime has been increased slightly more than requested
    * The worker timeout scales with LTP_RUNTIME_MUL which will
      hopefully deal with slower systems.

 testcases/kernel/fs/read_all/read_all.c | 381 +++++++++++++++++++-----
 1 file changed, 312 insertions(+), 69 deletions(-)

diff --git a/testcases/kernel/fs/read_all/read_all.c b/testcases/kernel/fs/read_all/read_all.c
index a5b93b966..4449fe894 100644
--- a/testcases/kernel/fs/read_all/read_all.c
+++ b/testcases/kernel/fs/read_all/read_all.c
@@ -1,14 +1,14 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * Copyright (c) 2017 Richard Palethorpe <rpalethorpe@suse.com>
+ * Copyright (c) 2017-2022 Richard Palethorpe <rpalethorpe@suse.com>
  */
 /*
  * Perform a small read on every file in a directory tree.
  *
- * Useful for testing file systems like proc, sysfs and debugfs or anything
- * which exposes a file like API so long as it respects O_NONBLOCK. This test
- * is not concerned if a particular file in one of these file systems conforms
- * exactly to its specific documented behavior. Just whether reading from that
+ * Useful for testing file systems like proc, sysfs and debugfs or
+ * anything which exposes a file like API. This test is not concerned
+ * if a particular file in one of these file systems conforms exactly
+ * to its specific documented behavior. Just whether reading from that
  * file causes a serious error such as a NULL pointer dereference.
  *
  * It is not required to run this as root, but test coverage will be much
@@ -26,8 +26,10 @@
  * an IPC stress test on systems with large numbers of weak cores. This can be
  * overridden with the 'w' parameters.
  */
+#include <signal.h>
 #include <sys/types.h>
 #include <sys/stat.h>
+#include <sys/wait.h>
 #include <lapi/fnmatch.h>
 #include <stdlib.h>
 #include <stdio.h>
@@ -43,7 +45,10 @@
 #include <pwd.h>
 #include <grp.h>
 
+#include "tst_atomic.h"
+#include "tst_safe_clocks.h"
 #include "tst_test.h"
+#include "tst_timer.h"
 
 #define QUEUE_SIZE 16384
 #define BUFFER_SIZE 1024
@@ -55,11 +60,15 @@ struct queue {
 	int front;
 	int back;
 	char data[QUEUE_SIZE];
+	char popped[BUFFER_SIZE];
 };
 
 struct worker {
+	int i;
 	pid_t pid;
 	struct queue *q;
+	int last_seen;
+	unsigned int kill_sent:1;
 };
 
 enum dent_action {
@@ -80,6 +89,9 @@ static char *str_max_workers;
 static long max_workers = 15;
 static struct worker *workers;
 static char *drop_privs;
+static char *str_worker_timeout;
+static int worker_timeout;
+static int timeout_warnings_left = 15;
 
 static char *blacklist[] = {
 	NULL, /* reserved for -e parameter */
@@ -90,7 +102,18 @@ static char *blacklist[] = {
 	"/sys/*/cpu??*(?)/*",	/* cpu* entries with 2 or more digits */
 };
 
-static int queue_pop(struct queue *q, char *buf)
+static long long epoch;
+
+static int atomic_timestamp(void)
+{
+	struct timespec now;
+
+	SAFE_CLOCK_GETTIME(CLOCK_MONOTONIC_RAW, &now);
+
+	return tst_timespec_to_us(now) - epoch;
+}
+
+static int queue_pop(struct queue *q)
 {
 	int i = q->front, j = 0;
 
@@ -100,7 +123,7 @@ static int queue_pop(struct queue *q, char *buf)
 		return 0;
 
 	while (q->data[i]) {
-		buf[j] = q->data[i];
+		q->popped[j] = q->data[i];
 
 		if (++j >= BUFFER_SIZE - 1)
 			tst_brk(TBROK, "Buffer is too small for path");
@@ -108,7 +131,7 @@ static int queue_pop(struct queue *q, char *buf)
 		 i = (i + 1) % QUEUE_SIZE;
 	}
 
-	buf[j] = '\0';
+	q->popped[j] = '\0';
 	tst_atomic_store((i + 1) % QUEUE_SIZE, &q->front);
 
 	return 1;
@@ -186,62 +209,68 @@ static int is_blacklisted(const char *path)
 	return 0;
 }
 
-static void read_test(const char *path)
+static void worker_heartbeat(const int worker)
+{
+	tst_atomic_store(atomic_timestamp(), &workers[worker].last_seen);
+}
+
+static int worker_elapsed(const int worker)
+{
+	struct worker *const w = workers + worker;
+
+	return atomic_timestamp() - tst_atomic_load(&w->last_seen);
+}
+
+static int worker_ttl(const int worker)
+{
+	return MAX(0, worker_timeout - worker_elapsed(worker));
+}
+
+static void read_test(const int worker, const char *const path)
 {
 	char buf[BUFFER_SIZE];
 	int fd;
 	ssize_t count;
+	const pid_t pid = workers[worker].pid;
+	int elapsed;
 
 	if (is_blacklisted(path))
 		return;
 
 	if (verbose)
-		tst_res(TINFO, "%s(%s)", __func__, path);
+		tst_res(TINFO, "Worker %d: %s(%s)", pid, __func__, path);
 
 	fd = open(path, O_RDONLY | O_NONBLOCK);
 	if (fd < 0) {
-		if (!quiet)
-			tst_res(TINFO | TERRNO, "open(%s)", path);
+		if (!quiet) {
+			tst_res(TINFO | TERRNO, "Worker %d (%d): open(%s)",
+				pid, worker, path);
+		}
 		return;
 	}
 
+	worker_heartbeat(worker);
 	count = read(fd, buf, sizeof(buf) - 1);
+	elapsed = worker_elapsed(worker);
+
 	if (count > 0 && verbose) {
 		sanitize_str(buf, count);
-		tst_res(TINFO, "read(%s, buf) = %zi, buf = %s",
-			path, count, buf);
+		tst_res(TINFO,
+			"Worker %d (%d): read(%s, buf) = %zi, buf = %s, elapsed = %dus",
+			pid, worker, path, count, buf, elapsed);
 	} else if (!count && verbose) {
-		tst_res(TINFO, "read(%s) = EOF", path);
+		tst_res(TINFO,
+			"Worker %d (%d): read(%s) = EOF, elapsed = %dus",
+			pid, worker, path, elapsed);
 	} else if (count < 0 && !quiet) {
-		tst_res(TINFO | TERRNO, "read(%s)", path);
+		tst_res(TINFO | TERRNO,
+			"Worker %d (%d): read(%s), elapsed = %dus",
+			pid, worker, path, elapsed);
 	}
 
 	SAFE_CLOSE(fd);
 }
 
-static int worker_run(struct worker *self)
-{
-	char buf[BUFFER_SIZE];
-	struct sigaction term_sa = {
-		.sa_handler = SIG_IGN,
-		.sa_flags = 0,
-	};
-	struct queue *q = self->q;
-
-	sigaction(SIGTTIN, &term_sa, NULL);
-
-	while (1) {
-		if (!queue_pop(q, buf))
-			break;
-
-		read_test(buf);
-	}
-
-	queue_destroy(q, 1);
-	tst_flush();
-	return 0;
-}
-
 static void maybe_drop_privs(void)
 {
 	struct passwd *nobody;
@@ -266,6 +295,39 @@ static void maybe_drop_privs(void)
 		tst_brk(TBROK | TTERRNO, "Failed to use nobody uid");
 }
 
+static int worker_run(int worker)
+{
+	struct sigaction term_sa = {
+		.sa_handler = SIG_IGN,
+		.sa_flags = 0,
+	};
+	struct worker *const self = workers + worker;
+	struct queue *q = self->q;
+
+	sigaction(SIGTTIN, &term_sa, NULL);
+	maybe_drop_privs();
+	self->pid = getpid();
+
+	if (!worker_ttl(self->i)) {
+		tst_brk(TBROK,
+			"Worker timeout is too short; restarts take >%dus",
+			worker_elapsed(self->i));
+	}
+
+	while (1) {
+		worker_heartbeat(worker);
+
+		if (!queue_pop(q))
+			break;
+
+		read_test(worker, q->popped);
+	}
+
+	queue_destroy(q, 1);
+	tst_flush();
+	return 0;
+}
+
 static void spawn_workers(void)
 {
 	int i;
@@ -274,41 +336,135 @@ static void spawn_workers(void)
 	memset(workers, 0, worker_count * sizeof(*workers));
 
 	for (i = 0; i < worker_count; i++) {
+		wa[i].i = i;
 		wa[i].q = queue_init();
+		wa[i].last_seen = atomic_timestamp();
 		wa[i].pid = SAFE_FORK();
-		if (!wa[i].pid) {
-			maybe_drop_privs();
-			exit(worker_run(wa + i));
+		if (!wa[i].pid)
+			exit(worker_run(i));
+	}
+}
+
+static void restart_worker(const int worker)
+{
+	struct worker *const w = workers + worker;
+	int wstatus, ret, i, q_len;
+
+	if (!w->kill_sent) {
+		SAFE_KILL(w->pid, SIGKILL);
+		w->kill_sent = 1;
+		worker_heartbeat(worker);
+	}
+
+	ret = waitpid(w->pid, &wstatus, WNOHANG);
+
+	if (!ret) {
+		if (worker_ttl(worker) > 0)
+			return;
+
+		if (!quiet || timeout_warnings_left) {
+			tst_res(TINFO,
+				"Worker %d (%d): Timeout waiting after kill",
+				w->pid, worker);
 		}
+	} else if (ret != w->pid) {
+		tst_brk(TBROK | TERRNO, "Worker %d (%d): waitpid = %d",
+			w->pid, worker, ret);
+	}
+
+	w->kill_sent = 0;
+
+	if (!w->q->popped[0]) {
+		tst_brk(TBROK,
+			"Worker %d (%d): Timed out, but doesn't appear to be reading anything",
+			w->pid, worker);
+	}
+
+	if (!quiet || timeout_warnings_left) {
+		tst_res(TINFO, "Worker %d (%d): Last popped '%s'",
+			w->pid, worker, w->q->popped);
+	}
+
+	/* Make sure the queue length and semaphore match. Threre is a
+	 * race in qeue_pop where the semaphore can be decremented
+	 * then the worker killed before updating q->front
+	 */
+	q_len = 0;
+	i = w->q->front;
+	while (i != w->q->back) {
+		if (!w->q->data[i])
+			q_len++;
+
+		i = (i + 1) % QUEUE_SIZE;
 	}
+
+	ret = sem_destroy(&w->q->sem);
+	if (ret == -1)
+		tst_brk(TBROK | TERRNO, "sem_destroy");
+	ret = sem_init(&w->q->sem, 1, q_len);
+	if (ret == -1)
+		tst_brk(TBROK | TERRNO, "sem_init");
+
+	worker_heartbeat(worker);
+	w->pid = SAFE_FORK();
+
+	if (!w->pid)
+		exit(worker_run(worker));
 }
 
-static void work_push_retry(int worker, const char *buf)
+static void check_timeout_warnings_limit(void)
 {
-	int i, ret, worker_min, worker_max, usleep_time = 100;
+	if (!quiet)
+		return;
 
-	if (worker < 0) {
-		/* pick any, try -worker first */
-		worker_min = worker * (-1);
-		worker_max = worker_count;
-	} else {
-		/* keep trying worker */
-		worker_min = worker;
-		worker_max = worker + 1;
+	timeout_warnings_left--;
+
+	if (timeout_warnings_left)
+		return;
+
+	tst_res(TINFO,
+		"Silencing timeout warnings; consider increasing LTP_RUNTIME_MUL or removing -q");
+}
+
+static int try_push_work(const int worker, const char *buf)
+{
+	int ret = 0;
+	int elapsed;
+	struct worker *const w = workers + worker;
+
+	if (w->kill_sent) {
+		restart_worker(worker);
+		return 0;
 	}
-	i = worker_min;
 
-	for (;;) {
-		ret = queue_push(workers[i].q, buf);
-		if (ret == 1)
-			break;
+	ret = queue_push(w->q, buf);
+	if (ret)
+		return 1;
 
-		if (++i >= worker_max) {
-			i = worker_min;
-			if (usleep_time < 100000)
-				usleep_time *= 2;
-			usleep(usleep_time);
+	elapsed = worker_elapsed(worker);
+
+	if (elapsed > worker_timeout) {
+		if (!quiet || timeout_warnings_left) {
+			tst_res(TINFO,
+				"Worker %d (%d): Stuck for %dus, restarting it",
+				w->pid, worker, elapsed);
+			check_timeout_warnings_limit();
 		}
+		restart_worker(worker);
+	}
+
+	return 0;
+}
+
+static void push_work(const int worker, const char *buf)
+{
+	int sleep_time = 1;
+
+	while (!try_push_work(worker, buf)) {
+		const int ttl = worker_ttl(worker);
+
+		sleep_time = MIN(2 * sleep_time, ttl);
+		usleep(sleep_time);
 	}
 }
 
@@ -322,8 +478,16 @@ static void stop_workers(void)
 
 	for (i = 0; i < worker_count; i++) {
 		if (workers[i].q)
-			work_push_retry(i, stop_code);
+			push_work(i, stop_code);
 	}
+}
+
+static void destroy_workers(void)
+{
+	int i;
+
+	if (!workers)
+		return;
 
 	for (i = 0; i < worker_count; i++) {
 		if (workers[i].q) {
@@ -333,19 +497,41 @@ static void stop_workers(void)
 	}
 }
 
-static void rep_sched_work(const char *path, int rep)
+static int sched_work(const int first_worker,
+		      const char *path, int repetitions)
 {
 	int i, j;
+	int min_ttl = worker_timeout, sleep_time = 1;
+	int pushed, workers_pushed = 0;
 
-	for (i = j = 0; i < rep; i++, j++) {
+	for (i = 0, j = first_worker; i < repetitions; j++) {
 		if (j >= worker_count)
 			j = 0;
-		work_push_retry(-j, path);
+
+		if (j == first_worker && !workers_pushed) {
+			sleep_time = MIN(2 * sleep_time, min_ttl);
+			usleep(sleep_time);
+			min_ttl = worker_timeout;
+		}
+
+		if (j == first_worker)
+			workers_pushed = 0;
+
+		pushed = try_push_work(j, path);
+		i += pushed;
+		workers_pushed += pushed;
+
+		if (!pushed)
+			min_ttl = MIN(min_ttl, worker_ttl(j));
 	}
+
+	return j;
 }
 
 static void setup(void)
 {
+	struct timespec now;
+
 	if (tst_parse_int(str_reads, &reads, 1, INT_MAX))
 		tst_brk(TBROK,
 			"Invalid reads (-r) argument: '%s'", str_reads);
@@ -368,11 +554,63 @@ static void setup(void)
 	if (!worker_count)
 		worker_count = MIN(MAX(tst_ncpus() - 1, 1), max_workers);
 	workers = SAFE_MALLOC(worker_count * sizeof(*workers));
+
+	if (tst_parse_int(str_worker_timeout, &worker_timeout, 1, INT_MAX)) {
+		tst_brk(TBROK,
+			"Invalid worker timeout (-t) argument: '%s'",
+			str_worker_count);
+	}
+
+	if (worker_timeout) {
+		tst_res(TINFO, "Worker timeout forcibly set to %dms",
+			worker_timeout);
+	} else {
+		worker_timeout = 10 * tst_remaining_runtime();
+		tst_res(TINFO, "Worker timeout set to 10%% of max_runtime: %dms",
+			worker_timeout);
+	}
+	worker_timeout *= 1000;
+
+	SAFE_CLOCK_GETTIME(CLOCK_MONOTONIC_RAW, &now);
+	epoch = tst_timespec_to_us(now);
+}
+
+static void reap_children(void)
+{
+	int status, bad_exit = 0;
+	pid_t pid;
+
+	for (;;) {
+		pid = wait(&status);
+
+		if (pid > 0) {
+			if (!WIFEXITED(status))
+				bad_exit = 1;
+
+			continue;
+		}
+
+		if (errno == ECHILD)
+			break;
+
+		if (errno == EINTR)
+			continue;
+
+		tst_brk(TBROK | TERRNO, "wait() failed");
+	}
+
+	if (!bad_exit)
+		return;
+
+	tst_res(TINFO,
+		"Zombie workers detected; consider increasing LTP_RUNTIME_MUL");
 }
 
 static void cleanup(void)
 {
 	stop_workers();
+	reap_children();
+	destroy_workers();
 	free(workers);
 }
 
@@ -383,6 +621,7 @@ static void visit_dir(const char *path)
 	struct stat dent_st;
 	char dent_path[MAX_PATH];
 	enum dent_action act;
+	int last_sched = 0;
 
 	dir = opendir(path);
 	if (!dir) {
@@ -430,7 +669,7 @@ static void visit_dir(const char *path)
 		if (act == DA_VISIT)
 			visit_dir(dent_path);
 		else if (act == DA_READ)
-			rep_sched_work(dent_path, reads);
+			last_sched = sched_work(last_sched, dent_path, reads);
 	}
 
 	if (closedir(dir))
@@ -441,9 +680,11 @@ static void run(void)
 {
 	spawn_workers();
 	visit_dir(root_dir);
+
 	stop_workers();
+	reap_children();
+	destroy_workers();
 
-	tst_reap_children();
 	tst_res(TPASS, "Finished reading files");
 }
 
@@ -465,11 +706,13 @@ static struct tst_test test = {
 		 "Count Override the worker count. Ignores (-w) and the processor count."},
 		{"p", &drop_privs,
 		 "Drop privileges; switch to the nobody user."},
+		{"t:", &str_worker_timeout,
+		 "Milliseconds a worker has to read a file before it is restarted"},
 		{}
 	},
 	.setup = setup,
 	.cleanup = cleanup,
 	.test_all = run,
 	.forks_child = 1,
+	.max_runtime = 100,
 };
-
-- 
2.36.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
