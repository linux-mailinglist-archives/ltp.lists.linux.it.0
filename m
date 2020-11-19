Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D64E2B8C7B
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Nov 2020 08:40:38 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 123A13C25AB
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Nov 2020 08:40:38 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 3DFAE3C25AB
 for <ltp@lists.linux.it>; Thu, 19 Nov 2020 08:40:32 +0100 (CET)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 341FC1400DFF
 for <ltp@lists.linux.it>; Thu, 19 Nov 2020 08:40:29 +0100 (CET)
IronPort-SDR: 6viDPdwBtApawLeW3h2RMDIJ0sr9tMLfmAjNQXvqdhFJSIeJhcCtWV7jP571SN73qJkEKdTeF3
 qyALhTRok9kQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9809"; a="170466052"
X-IronPort-AV: E=Sophos;i="5.77,489,1596524400"; d="scan'208";a="170466052"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2020 23:40:27 -0800
IronPort-SDR: 706vSphKUxKyAUIzgdi9SDKh2p0pOMNR9vBM2ojUOOnnWEzwKLSSAcVLz+loldX0cAiG867jbY
 bkyeZ1/vYVLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,489,1596524400"; d="scan'208";a="476712394"
Received: from fedora29.sh.intel.com ([10.239.183.87])
 by orsmga004.jf.intel.com with ESMTP; 18 Nov 2020 23:40:24 -0800
From: Pengfei Xu <pengfei.xu@intel.com>
To: ltp <ltp@lists.linux.it>, Pengfei Xu <pengfei.xu@intel.com>,
 Neri Ricardo <ricardo.neri@intel.com>, Su Heng <heng.su@intel.com>,
 Cyril Hrubis <chrubis@suse.cz>, Li Wang <liwang@redhat.com>,
 Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Date: Thu, 19 Nov 2020 15:28:27 -0500
Message-Id: <20201119202827.5783-1-pengfei.xu@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=2.5 required=7.0 tests=DATE_IN_FUTURE_12_24,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH] kernel/security/umip: update umip basic test for
 kernel v5.10 update
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

After linux kernel v5.10 mainline, SLDT and STR will return
dummy value and not trigger SIGSEGV due to v5.10 kernel code change.
For detailed kernel update info, you could search below in v5.10 git log:
"x86/umip: Add emulation/spoofing for SLDT and STR instructions"
Commit link info: https://lkml.org/lkml/2020/7/10/1206
Update umip basic test to match with expected results.

Signed-off-by: Pengfei Xu <pengfei.xu@intel.com>
---
 .../kernel/security/umip/umip_basic_test.c      | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/testcases/kernel/security/umip/umip_basic_test.c b/testcases/kernel/security/umip/umip_basic_test.c
index 13c317022..d581c5bf1 100644
--- a/testcases/kernel/security/umip/umip_basic_test.c
+++ b/testcases/kernel/security/umip/umip_basic_test.c
@@ -129,6 +129,23 @@ static void verify_umip_instruction(unsigned int n)
 			return;
 		} else
 			tst_res(TINFO, "Linux kernel version is before than v5.4");
+		break;
+	case 2:
+	case 4:
+		/* after Linux kernel v5.10 mainline, SLDT and STR will return
+		   dummy value and not trigger SIGSEGV due to kernel code change */
+		if ((tst_kvercmp(5, 10, 0)) >= 0) {
+			tst_res(TINFO, "Linux kernel version is v5.10 or higher");
+			if (WIFSIGNALED(status) && WTERMSIG(status) == SIGSEGV) {
+				tst_res(TFAIL, "Got SIGSEGV");
+				return;
+			}
+			tst_res(TPASS, "Didn't receive SIGSEGV, child exited with %s",
+				tst_strstatus(status));
+			return;
+		} else
+			tst_res(TINFO, "Linux kernel version is earlier than v5.10");
+		break;
 	}
 
 	if (WIFSIGNALED(status) && WTERMSIG(status) == SIGSEGV) {
-- 
2.20.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
