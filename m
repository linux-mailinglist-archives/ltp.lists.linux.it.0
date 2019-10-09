Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 96934D1196
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Oct 2019 16:43:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id ECEFD3C2270
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Oct 2019 16:43:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id EAF273C2145
 for <ltp@lists.linux.it>; Wed,  9 Oct 2019 16:43:03 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 24C8B100136E
 for <ltp@lists.linux.it>; Wed,  9 Oct 2019 16:41:33 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 229E610F2E80
 for <ltp@lists.linux.it>; Wed,  9 Oct 2019 14:43:01 +0000 (UTC)
Received: from dustball.brq.redhat.com (unknown [10.43.17.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9CE905D9CD
 for <ltp@lists.linux.it>; Wed,  9 Oct 2019 14:43:00 +0000 (UTC)
From: Jan Stancek <jstancek@redhat.com>
To: ltp@lists.linux.it
Date: Wed,  9 Oct 2019 16:42:54 +0200
Message-Id: <8c5d507fd19bc3110561ed1c666b7ac47442e09e.1570632125.git.jstancek@redhat.com>
In-Reply-To: <26d555b1d9deddb5a6f0a93a7c7d3b00e8abc1ff.1570616598.git.jstancek@redhat.com>
References: <26d555b1d9deddb5a6f0a93a7c7d3b00e8abc1ff.1570616598.git.jstancek@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.66]); Wed, 09 Oct 2019 14:43:01 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v2] read_all: retry to queue work for any worker
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

read_all is currently retrying only for short time period and it's
retrying to queue for same worker. If that worker is busy, it easily
hits timeout.

For example 'kernel_page_tables' on aarch64 can take long time to open/read:
  # time dd if=/sys/kernel/debug/kernel_page_tables of=/dev/null count=1 bs=1024
  1+0 records in
  1+0 records out
  1024 bytes (1.0 kB, 1.0 KiB) copied, 13.0531 s, 0.1 kB/s

  real    0m13.066s
  user    0m0.000s
  sys     0m13.059s

Rather than retrying to queue for specific worker, pick any that can accept
the work and keep trying until we succeed or hit test timeout.

Signed-off-by: Jan Stancek <jstancek@redhat.com>
---
 testcases/kernel/fs/read_all/read_all.c | 33 +++++++++++++++++++++++++++++++--
 1 file changed, 31 insertions(+), 2 deletions(-)

v2: Increase sleep gradually.

diff --git a/testcases/kernel/fs/read_all/read_all.c b/testcases/kernel/fs/read_all/read_all.c
index 3dac20e02638..7beb08ccf712 100644
--- a/testcases/kernel/fs/read_all/read_all.c
+++ b/testcases/kernel/fs/read_all/read_all.c
@@ -282,6 +282,35 @@ static void spawn_workers(void)
 	}
 }
 
+static void work_push_retry(int worker, const char *buf)
+{
+	int i, ret, worker_min, worker_max, usleep_time = 100;
+
+	if (worker < 0) {
+		/* pick any, try -worker first */
+		worker_min = worker * (-1);
+		worker_max = worker_count;
+	} else {
+		/* keep trying worker */
+		worker_min = worker;
+		worker_max = worker + 1;
+	}
+	i = worker_min;
+
+	for (;;) {
+		ret = queue_push(workers[i].q, buf);
+		if (ret == 1)
+			break;
+
+		if (++i >= worker_max) {
+			i = worker_min;
+			if (usleep_time < 100000)
+				usleep_time *= 2;
+			usleep(usleep_time);
+		}
+	}
+}
+
 static void stop_workers(void)
 {
 	const char stop_code[1] = { '\0' };
@@ -292,7 +321,7 @@ static void stop_workers(void)
 
 	for (i = 0; i < worker_count; i++) {
 		if (workers[i].q)
-			TST_RETRY_FUNC(queue_push(workers[i].q, stop_code), 1);
+			work_push_retry(i, stop_code);
 	}
 
 	for (i = 0; i < worker_count; i++) {
@@ -310,7 +339,7 @@ static void rep_sched_work(const char *path, int rep)
 	for (i = j = 0; i < rep; i++, j++) {
 		if (j >= worker_count)
 			j = 0;
-		TST_RETRY_FUNC(queue_push(workers[j].q, path), 1);
+		work_push_retry(-j, path);
 	}
 }
 
-- 
1.8.3.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
