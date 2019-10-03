Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 15321CA147
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Oct 2019 17:43:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5B8313C23B2
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Oct 2019 17:43:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id D25103C136F
 for <ltp@lists.linux.it>; Thu,  3 Oct 2019 17:43:13 +0200 (CEST)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 3CF75601E39
 for <ltp@lists.linux.it>; Thu,  3 Oct 2019 17:43:11 +0200 (CEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Oct 2019 08:43:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,252,1566889200"; d="scan'208";a="367081189"
Received: from xpf-desktop.sh.intel.com ([10.239.13.102])
 by orsmga005.jf.intel.com with ESMTP; 03 Oct 2019 08:43:08 -0700
From: Pengfei Xu <pengfei.xu@intel.com>
To: ltp <ltp@lists.linux.it>, Pengfei Xu <pengfei.xu@intel.com>,
 Neri Ricardo <ricardo.neri@intel.com>, Su Heng <heng.su@intel.com>,
 Cyril Hrubis <chrubis@suse.cz>
Date: Thu,  3 Oct 2019 23:50:01 +0800
Message-Id: <20191003155001.17751-1-pengfei.xu@intel.com>
X-Mailer: git-send-email 2.14.1
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v2] umip_basic_test.c: update umip basic test for new
 kernel v5.4
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
 testcases/kernel/security/umip/umip_basic_test.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/testcases/kernel/security/umip/umip_basic_test.c b/testcases/kernel/security/umip/umip_basic_test.c
index 37850ef9f..5a2b71013 100644
--- a/testcases/kernel/security/umip/umip_basic_test.c
+++ b/testcases/kernel/security/umip/umip_basic_test.c
@@ -112,6 +112,25 @@ static void verify_umip_instruction(unsigned int n)
 
 	SAFE_WAITPID(pid, &status, 0);
 
+	switch (n) {
+	case 0:
+	case 1:
+	case 3:
+		/* after linux kernel v5.4 mainline, 64bit SGDT SIDT SMSW will return
+		   dummy value and not trigger SIGSEGV due to kernel code change */
+		if ((tst_kvercmp(5, 4, 0)) >= 0) {
+			tst_res(TINFO, "Linux kernel version is v5.4 or after than v5.4");
+			if (WIFSIGNALED(status) && WTERMSIG(status) == SIGSEGV) {
+				tst_res(TFAIL, "Got SIGSEGV");
+				return;
+			}
+			tst_res(TPASS, "Didn't receive SIGSEGV, child exited with %s",
+				tst_strstatus(status));
+			return;
+		} else
+			tst_res(TINFO, "Linux kernel version is before than v5.4");
+	}
+
 	if (WIFSIGNALED(status) && WTERMSIG(status) == SIGSEGV) {
 		tst_res(TPASS, "Got SIGSEGV");
 		return;
-- 
2.14.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
