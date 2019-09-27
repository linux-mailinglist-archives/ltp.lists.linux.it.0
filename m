Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B64BFD8D
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Sep 2019 05:12:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 38F453C22F5
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Sep 2019 05:12:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 7AC343C1C7D
 for <ltp@lists.linux.it>; Fri, 27 Sep 2019 05:12:43 +0200 (CEST)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 5A7BD601038
 for <ltp@lists.linux.it>; Fri, 27 Sep 2019 05:12:39 +0200 (CEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Sep 2019 20:12:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,553,1559545200"; d="scan'208";a="219626668"
Received: from xpf-desktop.sh.intel.com ([10.239.13.102])
 by fmsmga002.fm.intel.com with ESMTP; 26 Sep 2019 20:12:35 -0700
From: Pengfei Xu <pengfei.xu@intel.com>
To: ltp <ltp@lists.linux.it>, Pengfei Xu <pengfei.xu@intel.com>,
 Neri Ricardo <ricardo.neri@intel.com>, Su Heng <heng.su@intel.com>
Date: Fri, 27 Sep 2019 11:19:30 +0800
Message-Id: <20190927031930.27425-1-pengfei.xu@intel.com>
X-Mailer: git-send-email 2.14.1
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH tbt_cases] umip_basic_test.c: update umip basic test
 for new kernel v5.4
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

After linux kernel v5.4 mainline, 64bit SGDT SIDT SMSW will return
dummy value and not trigger SIGSEGV due to kernel code change.
For detailed kernel update info, you could check v5.4 commit:
x86/umip: Add emulation (spoofing) for UMIP covered instructions in
64-bit processes as well

Signed-off-by: Pengfei Xu <pengfei.xu@intel.com>
---
 testcases/kernel/security/umip/umip_basic_test.c | 25 ++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/testcases/kernel/security/umip/umip_basic_test.c b/testcases/kernel/security/umip/umip_basic_test.c
index 37850ef9f..278ae92f6 100644
--- a/testcases/kernel/security/umip/umip_basic_test.c
+++ b/testcases/kernel/security/umip/umip_basic_test.c
@@ -21,6 +21,7 @@
 #include <string.h>
 #include <sys/wait.h>
 #include <signal.h>
+#include <linux/version.h>
 
 #include "tst_test.h"
 #include "tst_safe_stdio.h"
@@ -112,11 +113,31 @@ static void verify_umip_instruction(unsigned int n)
 
 	SAFE_WAITPID(pid, &status, 0);
 
+	switch (n) {
+	case 0:
+	case 1:
+	case 3:
+		/* after linux kernel v5.4 mainline, 64bit SGDT SIDT SMSW will return
+		   dummy value and not trigger SIGSEGV due to kernel code change */
+		#if LINUX_VERSION_CODE >= KERNEL_VERSION(5,4,0)
+			tst_res(TINFO, "Linux kernel version is after than v5.4");
+			if (WIFSIGNALED(status) && WTERMSIG(status) == SIGSEGV) {
+				tst_res(TFAIL, "Got SIGSEGV\n\n");
+				return;
+			}
+			tst_res(TPASS, "Didn't receive SIGSEGV, child exited with %s\n\n",
+				tst_strstatus(status));
+				return;
+		#else
+			tst_res(TINFO, "Linux kernel version is before than v5.4");
+		#endif
+	}
+
 	if (WIFSIGNALED(status) && WTERMSIG(status) == SIGSEGV) {
-		tst_res(TPASS, "Got SIGSEGV");
+		tst_res(TPASS, "Got SIGSEGV\n\n");
 		return;
 	}
-	tst_res(TFAIL, "Didn't receive SIGSEGV, child exited with %s",
+	tst_res(TFAIL, "Didn't receive SIGSEGV, child exited with %s\n\n",
 		tst_strstatus(status));
 }
 
-- 
2.14.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
