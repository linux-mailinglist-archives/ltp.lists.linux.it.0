Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4D01BD827
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Apr 2020 11:26:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 46BEB3C5ED7
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Apr 2020 11:26:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 3A1443C2804
 for <ltp@lists.linux.it>; Wed, 29 Apr 2020 11:26:04 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 8BF591A016ED
 for <ltp@lists.linux.it>; Wed, 29 Apr 2020 11:26:03 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D85F6AD6B
 for <ltp@lists.linux.it>; Wed, 29 Apr 2020 09:26:01 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 29 Apr 2020 11:26:01 +0200
Message-Id: <20200429092601.6325-2-mdoucha@suse.cz>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200429092601.6325-1-mdoucha@suse.cz>
References: <20200429092601.6325-1-mdoucha@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v3 2/2] Skip oversleep checks in timer tests under VM
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
the test process in time. Disable oversleep tests if tst_is_virt() detects
any hypervisor.

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---

Changes since v1: Use tst_is_virt() instead of env variable.
Changes since v2: Fixed comment.

 lib/tst_timer_test.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/lib/tst_timer_test.c b/lib/tst_timer_test.c
index 13e9deff2..196c51272 100644
--- a/lib/tst_timer_test.c
+++ b/lib/tst_timer_test.c
@@ -26,6 +26,7 @@ static long long *samples;
 static unsigned int cur_sample;
 static unsigned int monotonic_resolution;
 static unsigned int timerslack;
+static int virt_env;
 
 static char *print_frequency_plot;
 static char *file_name;
@@ -306,7 +307,10 @@ void do_timer_test(long long usec, unsigned int nsamples)
 		samples[nsamples-1], samples[0], median,
 		1.00 * trunc_mean / keep_samples, discard);
 
-	if (trunc_mean > (nsamples - discard) * usec + threshold) {
+	if (virt_env) {
+		tst_res(TINFO,
+			"Virtualisation detected, skipping oversleep checks");
+	} else if (trunc_mean > (nsamples - discard) * usec + threshold) {
 		tst_res(TFAIL, "%s slept for too long", scall);
 
 		if (!print_frequency_plot)
@@ -343,6 +347,11 @@ static void timer_setup(void)
 	if (setup)
 		setup();
 
+	/*
+	 * Running tests in VM may cause timing issues, disable upper bound
+	 * checks if any hypervisor is detected.
+	 */
+	virt_env = tst_is_virt(VIRT_ANY);
 	tst_clock_getres(CLOCK_MONOTONIC, &t);
 
 	tst_res(TINFO, "CLOCK_MONOTONIC resolution %lins", (long)t.tv_nsec);
-- 
2.26.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
