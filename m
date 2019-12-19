Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 205C2125F41
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Dec 2019 11:37:13 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B106A3C2387
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Dec 2019 11:37:12 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 634E33C0302
 for <ltp@lists.linux.it>; Thu, 19 Dec 2019 11:36:58 +0100 (CET)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 68DC7609693
 for <ltp@lists.linux.it>; Thu, 19 Dec 2019 11:36:57 +0100 (CET)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Dec 2019 02:36:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,331,1571727600"; 
 d="scan'208,223";a="206161052"
Received: from xpf-desktop.sh.intel.com ([10.239.13.102])
 by orsmga007.jf.intel.com with ESMTP; 19 Dec 2019 02:36:51 -0800
From: Pengfei Xu <pengfei.xu@intel.com>
To: ltp <ltp@lists.linux.it>, Pengfei Xu <pengfei.xu@intel.com>,
 Neri Ricardo <ricardo.neri@intel.com>, Su Heng <heng.su@intel.com>,
 Cyril Hrubis <chrubis@suse.cz>
Date: Thu, 19 Dec 2019 18:43:21 +0800
Message-Id: <20191219104321.23267-2-pengfei.xu@intel.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20191219104321.23267-1-pengfei.xu@intel.com>
References: <20191219104321.23267-1-pengfei.xu@intel.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v2 2/2] umip_basic_test.c: improve kconfig check to
 avoid umip wrong abort case
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

From v5.5 main line, umip kconfig changed from "CONFIG_X86_INTEL_UMIP=y"
to "CONFIG_X86_UMIP=y".
We could use "CONFIG_X86_INTEL_UMIP|CONFIG_X86_UMIP=y" to check kconfig
CONFIG_X86_INTEL_UMIP=y(old kernel) or CONFIG_X86_UMIP=y(new kernel) for umip.

Signed-off-by: Pengfei Xu <pengfei.xu@intel.com>
---
 testcases/kernel/security/umip/umip_basic_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/kernel/security/umip/umip_basic_test.c b/testcases/kernel/security/umip/umip_basic_test.c
index 1baa26c52..24eca8890 100644
--- a/testcases/kernel/security/umip/umip_basic_test.c
+++ b/testcases/kernel/security/umip/umip_basic_test.c
@@ -171,7 +171,7 @@ static struct tst_test test = {
 	.forks_child = 1,
 	.test = verify_umip_instruction,
 	.needs_kconfigs = (const char *[]){
-		"CONFIG_X86_INTEL_UMIP=y",
+		"CONFIG_X86_INTEL_UMIP|CONFIG_X86_UMIP=y",
 		NULL
 	},
 	.needs_root = 1,
-- 
2.14.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
