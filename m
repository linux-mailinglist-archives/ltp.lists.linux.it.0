Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 593B01B78C9
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Apr 2020 17:04:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 29B6F3C2911
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Apr 2020 17:04:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 79A513C2904
 for <ltp@lists.linux.it>; Fri, 24 Apr 2020 17:04:25 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id B33EE1A01484
 for <ltp@lists.linux.it>; Fri, 24 Apr 2020 17:04:24 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 6FCBCAC53
 for <ltp@lists.linux.it>; Fri, 24 Apr 2020 15:04:23 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 24 Apr 2020 17:04:22 +0200
Message-Id: <20200424150422.17467-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH] Add env variable as workaround for test issues in VMs
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

Timer tests often fail on sleep overrun when LTP is running inside a VM.
The main cause is usually that the VM doesn't get enough CPU time to wake up
the test process in time.

Disable upper bound checks in the tst_timer_test library if LTP_VM_ENV is set
to non-zero value.

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---
 doc/user-guide.txt   |  1 +
 include/tst_test.h   |  2 ++
 lib/tst_test.c       | 11 +++++++++++
 lib/tst_timer_test.c |  8 +++++++-
 4 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/doc/user-guide.txt b/doc/user-guide.txt
index 13865bc88..20f9c50ad 100644
--- a/doc/user-guide.txt
+++ b/doc/user-guide.txt
@@ -16,6 +16,7 @@ For running LTP network tests see `testcases/network/README.md`.
 | 'LTP_TIMEOUT_MUL'     | Multiply timeout, must be number >= 1 (> 1 is useful for
                           slow machines to avoid unexpected timeout).
                           Variable is also used in shell tests, but ceiled to int.
+| 'LTP_VM_ENV'          | Set to '1' if LTP is run inside a virtual machine.
 | 'PATH'                | It's required to addjust path:
                           `PATH="$PATH:$LTPROOT/testcases/bin"`
 | 'TMPDIR'              | Base directory for template directory, which is required by C tests
diff --git a/include/tst_test.h b/include/tst_test.h
index 5bedb4f6f..8e02003c9 100644
--- a/include/tst_test.h
+++ b/include/tst_test.h
@@ -301,6 +301,8 @@ unsigned int tst_timeout_remaining(void);
 unsigned int tst_multiply_timeout(unsigned int timeout);
 void tst_set_timeout(int timeout);
 
+int tst_vm_env(void);
+
 
 /*
  * Returns path to the test temporary directory in a newly allocated buffer.
diff --git a/lib/tst_test.c b/lib/tst_test.c
index 64cd3ac33..4facd4bf8 100644
--- a/lib/tst_test.c
+++ b/lib/tst_test.c
@@ -1378,3 +1378,14 @@ void tst_flush(void)
 		tst_brk(TBROK | TERRNO, "fflush(stdout) failed");
 
 }
+
+int tst_vm_env(void)
+{
+	const char *env = getenv("LTP_VM_ENV");
+
+	if (env) {
+		return atoi(env);
+	}
+
+	return 0;
+}
diff --git a/lib/tst_timer_test.c b/lib/tst_timer_test.c
index 13e9deff2..ff3a53c36 100644
--- a/lib/tst_timer_test.c
+++ b/lib/tst_timer_test.c
@@ -26,6 +26,7 @@ static long long *samples;
 static unsigned int cur_sample;
 static unsigned int monotonic_resolution;
 static unsigned int timerslack;
+static int virt_env;
 
 static char *print_frequency_plot;
 static char *file_name;
@@ -306,7 +307,7 @@ void do_timer_test(long long usec, unsigned int nsamples)
 		samples[nsamples-1], samples[0], median,
 		1.00 * trunc_mean / keep_samples, discard);
 
-	if (trunc_mean > (nsamples - discard) * usec + threshold) {
+	if (!virt_env && trunc_mean > (nsamples - discard) * usec + threshold) {
 		tst_res(TFAIL, "%s slept for too long", scall);
 
 		if (!print_frequency_plot)
@@ -343,6 +344,11 @@ static void timer_setup(void)
 	if (setup)
 		setup();
 
+	/*
+	 * Running tests in VM may cause timing issues, disable upper bound
+	 * checks if LTP_VM_ENV is set to non-zero.
+	 */
+	virt_env = tst_vm_env();
 	tst_clock_getres(CLOCK_MONOTONIC, &t);
 
 	tst_res(TINFO, "CLOCK_MONOTONIC resolution %lins", (long)t.tv_nsec);
-- 
2.26.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
