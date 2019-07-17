Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA5D6B753
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Jul 2019 09:21:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 57FCC3C1D12
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Jul 2019 09:21:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 85EA03C1C93
 for <ltp@lists.linux.it>; Wed, 17 Jul 2019 09:21:17 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 5FB0F1000939
 for <ltp@lists.linux.it>; Wed, 17 Jul 2019 09:21:11 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 476F330832DA;
 Wed, 17 Jul 2019 07:21:14 +0000 (UTC)
Received: from dhcp-3-207.nay.redhat.com (dhcp-3-207.nay.redhat.com
 [10.66.3.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B4BF760A9F;
 Wed, 17 Jul 2019 07:21:12 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it
Date: Wed, 17 Jul 2019 15:21:09 +0800
Message-Id: <20190717072109.7077-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Wed, 17 Jul 2019 07:21:14 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH] snd_timer: check if file /dev/snd/timer exist before
 opening
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

1. check if /dev/snd/timer exist

2. add tst_fzsync_pair_reset(&fzsync_pair, NULL) to reset variables
needed by fzsync. Especially for pair->exec_time_start, we use it to
control the test time in case that the execution loops timed out on
slow machine.

Signed-off-by: Li Wang <liwang@redhat.com>
Cc: Michael Moese <mmoese@suse.de>
---
 testcases/kernel/sound/snd_timer01.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/testcases/kernel/sound/snd_timer01.c b/testcases/kernel/sound/snd_timer01.c
index 36f0ce9fd..f62696659 100644
--- a/testcases/kernel/sound/snd_timer01.c
+++ b/testcases/kernel/sound/snd_timer01.c
@@ -67,6 +67,9 @@ static void *ioctl_thread(void *unused)
 
 static void setup(void)
 {
+	if(access("/dev/snd/timer", F_OK))
+		tst_brk(TCONF, "The file '/dev/snd/timer' is not exist");
+
 	tst_fzsync_pair_init(&fzsync_pair);
 	tst_taint_init(TST_TAINT_W | TST_TAINT_D);
 	snd_fd = SAFE_OPEN("/dev/snd/timer",
@@ -75,7 +78,8 @@ static void setup(void)
 
 static void cleanup(void)
 {
-	SAFE_CLOSE(snd_fd);
+	if (snd_fd > 0)
+		SAFE_CLOSE(snd_fd);
 }
 
 static void run(void)
@@ -95,6 +99,7 @@ static void run(void)
 	iov.iov_base = read_buf;
 	iov.iov_len = sizeof(read_buf) - 1;
 
+	tst_fzsync_pair_reset(&fzsync_pair, NULL);
 	while (tst_fzsync_run_a(&fzsync_pair)) {
 		nz = 0;
 		memset(read_buf, 0, sizeof(read_buf));
-- 
2.20.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
