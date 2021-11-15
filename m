Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7047A4508DE
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Nov 2021 16:46:11 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D76EF3C8719
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Nov 2021 16:46:10 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4BA963C8693
 for <ltp@lists.linux.it>; Mon, 15 Nov 2021 16:46:02 +0100 (CET)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id A97F660070E
 for <ltp@lists.linux.it>; Mon, 15 Nov 2021 16:46:01 +0100 (CET)
Received: from ubuntu.localdomain (unknown [188.195.115.12])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 4FAC79F68B;
 Mon, 15 Nov 2021 15:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1636991160; bh=UH6OiOf6afN+pTDXD//3rn8cZGr3mE69nZIQ4EBMuc8=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=PNiTvJNvx0Id6zT8Ei9Gu5m+aAX2puCTNCDwaS9KFekBe8DRpEPc35CQDmKJH90MR
 OI91v4R/sxkBZliTQmATdvvY2jRxFBNUuugOTQ7o8lxj23w0XWdmJsu2/C9AZvqWso
 gFF682ZYZj3stjdlhjDHXwIqN3G3ArPaiXo6WZu8=
From: Joerg Vehlow <lkml@jv-coder.de>
To: ltp@lists.linux.it,
	bogdan.lezhepekov@suse.com,
	chrubis@suse.cz
Date: Mon, 15 Nov 2021 16:45:49 +0100
Message-Id: <20211115154549.514588-2-lkml@jv-coder.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211115154549.514588-1-lkml@jv-coder.de>
References: <20211115154549.514588-1-lkml@jv-coder.de>
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v2 2/2] realtime/matrix_mult: Fix test optimization
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

The actual load of the test was optimized away,
because there was no way to reach the memory
used for calculation from the outside of the function.

To fix this, the memory used for the matrices is now
allocated in the main thread and passed to the workload
function as a pointer. This should prevent optimization and
also allows for the matrices to be bigger, without overflowing
the stack.

Signed-off-by: Joerg Vehlow <joerg.vehlow@aox-tech.de>
---
 .../realtime/func/matrix_mult/matrix_mult.c   | 45 ++++++++++++-------
 1 file changed, 28 insertions(+), 17 deletions(-)

diff --git a/testcases/realtime/func/matrix_mult/matrix_mult.c b/testcases/realtime/func/matrix_mult/matrix_mult.c
index be1e1321b..1a4e8e80d 100644
--- a/testcases/realtime/func/matrix_mult/matrix_mult.c
+++ b/testcases/realtime/func/matrix_mult/matrix_mult.c
@@ -47,6 +47,12 @@ stats_container_t sdat, cdat, *curdat;
 stats_container_t shist, chist;
 static pthread_barrier_t mult_start;
 
+struct matrices {
+	double A[MATRIX_SIZE][MATRIX_SIZE];
+	double B[MATRIX_SIZE][MATRIX_SIZE];
+	double C[MATRIX_SIZE][MATRIX_SIZE];
+};
+
 static void usage(void)
 {
 	rt_help();
@@ -88,33 +94,30 @@ static void matrix_init(double A[MATRIX_SIZE][MATRIX_SIZE],
 	}
 }
 
-static void matrix_mult(int m_size)
+static void matrix_mult(struct matrices *matrices)
 {
-	double A[m_size][m_size];
-	double B[m_size][m_size];
-	double C[m_size][m_size];
 	int i, j, k;
 
-	matrix_init(A, B);
-	for (i = 0; i < m_size; i++) {
-		int i_m = m_size - i;
-		for (j = 0; j < m_size; j++) {
-			double sum = A[i_m][j] * B[j][i];
-			for (k = 0; k < m_size; k++)
-				sum += A[i_m][k] * B[k][j];
-			C[i][j] = sum;
+	matrix_init(matrices->A, matrices->B);
+	for (i = 0; i < MATRIX_SIZE; i++) {
+		int i_m = MATRIX_SIZE - i;
+		for (j = 0; j < MATRIX_SIZE; j++) {
+			double sum = matrices->A[i_m][j] *  matrices->B[j][i];
+			for (k = 0; k < MATRIX_SIZE; k++)
+				sum +=  matrices->A[i_m][k] *  matrices->B[k][j];
+			 matrices->C[i][j] = sum;
 		}
 	}
 }
 
-static void matrix_mult_record(int m_size, int index)
+static void matrix_mult_record(struct matrices *matrices, int index)
 {
 	nsec_t start, end, delta;
 	int i;
 
 	start = rt_gettime();
 	for (i = 0; i < ops; i++)
-		matrix_mult(MATRIX_SIZE);
+		matrix_mult(matrices);
 	end = rt_gettime();
 	delta = (long)((end - start) / NS_PER_US);
 	curdat->records[index].x = index;
@@ -146,6 +149,7 @@ static int set_affinity(void)
 static void *concurrent_thread(void *thread)
 {
 	struct thread *t = (struct thread *)thread;
+	struct matrices *matrices = (struct matrices *) t->arg;
 	int thread_id = (intptr_t) t->id;
 	int cpuid;
 	int i;
@@ -160,7 +164,7 @@ static void *concurrent_thread(void *thread)
 	index = iterations_percpu * thread_id;	/* To avoid stats overlapping */
 	pthread_barrier_wait(&mult_start);
 	for (i = 0; i < iterations_percpu; i++)
-		matrix_mult_record(MATRIX_SIZE, index++);
+		matrix_mult_record(matrices, index++);
 
 	return NULL;
 }
@@ -172,6 +176,10 @@ static int main_thread(void)
 	long smin = 0, smax = 0, cmin = 0, cmax = 0, delta = 0;
 	float savg, cavg;
 	int cpuid;
+	struct matrices *matrices[numcpus];
+
+	for (i = 0; i < numcpus; ++i)
+		matrices[i] = malloc(sizeof(struct matrices));
 
 	if (stats_container_init(&sdat, iterations) ||
 	    stats_container_init(&shist, HIST_BUCKETS) ||
@@ -200,7 +208,7 @@ static int main_thread(void)
 	printf("\nRunning sequential operations\n");
 	start = rt_gettime();
 	for (i = 0; i < iterations; i++)
-		matrix_mult_record(MATRIX_SIZE, i);
+		matrix_mult_record(matrices[0], i);
 	end = rt_gettime();
 	delta = (long)((end - start) / NS_PER_US);
 
@@ -232,7 +240,7 @@ static int main_thread(void)
 	online_cpu_id = -1;	/* Redispatch cpus */
 	/* Create numcpus-1 concurrent threads */
 	for (j = 0; j < numcpus; j++) {
-		tids[j] = create_fifo_thread(concurrent_thread, NULL, PRIO);
+		tids[j] = create_fifo_thread(concurrent_thread, matrices[j], PRIO);
 		if (tids[j] == -1) {
 			printf
 			    ("Thread creation failed (max threads exceeded?)\n");
@@ -284,6 +292,9 @@ static int main_thread(void)
 	     criteria);
 	printf("Result: %s\n", ret ? "FAIL" : "PASS");
 
+	for (i = 0; i < numcpus; i++)
+		free(matrices[i]);
+
 	return ret;
 }
 
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
