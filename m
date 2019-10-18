Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6F4DC20C
	for <lists+linux-ltp@lfdr.de>; Fri, 18 Oct 2019 12:05:26 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 294963C225A
	for <lists+linux-ltp@lfdr.de>; Fri, 18 Oct 2019 12:05:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 9B3153C14F6
 for <ltp@lists.linux.it>; Fri, 18 Oct 2019 12:05:24 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id EBB5F6018C7
 for <ltp@lists.linux.it>; Fri, 18 Oct 2019 12:05:23 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 54798793F4
 for <ltp@lists.linux.it>; Fri, 18 Oct 2019 10:05:22 +0000 (UTC)
Received: from dustball.brq.redhat.com (unknown [10.43.17.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CCE07600C1
 for <ltp@lists.linux.it>; Fri, 18 Oct 2019 10:05:21 +0000 (UTC)
From: Jan Stancek <jstancek@redhat.com>
To: ltp@lists.linux.it
Date: Fri, 18 Oct 2019 12:05:17 +0200
Message-Id: <c8843f2f4a325e820d030d9c7c36d7624f1baa82.1571393044.git.jstancek@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Fri, 18 Oct 2019 10:05:22 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH] lsmod01.sh: retry test couple times to lower false
 positives
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

Test sporadically fails with:
  lsmod01 1 TFAIL: lsmod output different from /proc/modules.
  36c36
  < loop 42057 2
  ---
  > loop 42057 1

commands runtest file runs mkswap01 before this test. That test is
using loop device, and udev is presumably still holding a reference
by the time lsmod01 test starts.

Repeat the test couple times to avoid racing with rest of the system.

Signed-off-by: Jan Stancek <jstancek@redhat.com>
---
 testcases/commands/lsmod/lsmod01.sh | 28 +++++++++++++++++++---------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/testcases/commands/lsmod/lsmod01.sh b/testcases/commands/lsmod/lsmod01.sh
index ad170dcd41b8..38ba8e0c94ad 100755
--- a/testcases/commands/lsmod/lsmod01.sh
+++ b/testcases/commands/lsmod/lsmod01.sh
@@ -10,31 +10,41 @@ TST_NEEDS_TMPDIR=1
 TST_NEEDS_CMDS="lsmod"
 . tst_test.sh
 
-lsmod_test()
+lsmod_matches_proc_modules()
 {
 	lsmod_output=$(lsmod | awk '!/Module/{print $1, $2, $3}' | sort)
 	if [ -z "$lsmod_output" ]; then
-		tst_res TFAIL "Failed to parse the output from lsmod"
-		return
+		tst_brk TBROK "Failed to parse the output from lsmod"
 	fi
 
-	modules_output=$(awk '{print $1, $2, $3}' /proc/modules | sort)
+	modules_output=$(awk '{print $1, $2, $3} 1' /proc/modules | sort)
 	if [ -z "$modules_output" ]; then
-		tst_res TFAIL "Failed to parse /proc/modules"
-		return
+		tst_brk TBROK "Failed to parse /proc/modules"
 	fi
 
 	if [ "$lsmod_output" != "$modules_output" ]; then
-		tst_res TFAIL "lsmod output different from /proc/modules."
+		tst_res TINFO "lsmod output different from /proc/modules."
 
 		echo "$lsmod_output" > temp1
 		echo "$modules_output" > temp2
 		diff temp1 temp2
 
-		return
+		return 1
 	fi
+	return 0
+}
 
-	tst_res TPASS "'lsmod' passed."
+lsmod_test()
+{
+	for i in $(seq 1 5); do
+		if lsmod_matches_proc_modules; then
+			tst_res TPASS "'lsmod' passed."
+			return
+		fi
+		tst_res TINFO "Trying again"
+		sleep 1
+	done
+	tst_res TFAIL "'lsmod' doesn't match /proc/modules output"
 }
 
 tst_run
-- 
1.8.3.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
