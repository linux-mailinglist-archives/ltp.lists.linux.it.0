Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E74DE1C2
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Oct 2019 03:23:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 41B863C22DA
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Oct 2019 03:23:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id EBC9F3C22C5
 for <ltp@lists.linux.it>; Mon, 21 Oct 2019 03:22:59 +0200 (CEST)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 70F281A0044C
 for <ltp@lists.linux.it>; Mon, 21 Oct 2019 03:22:56 +0200 (CEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Oct 2019 18:22:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,321,1566889200"; d="scan'208";a="187391977"
Received: from xpf-desktop.sh.intel.com ([10.239.13.102])
 by orsmga007.jf.intel.com with ESMTP; 20 Oct 2019 18:22:52 -0700
From: Pengfei Xu <pengfei.xu@intel.com>
To: ltp <ltp@lists.linux.it>, Pengfei Xu <pengfei.xu@intel.com>,
 Neri Ricardo <ricardo.neri@intel.com>, Su Heng <heng.su@intel.com>,
 Cyril Hrubis <chrubis@suse.cz>
Date: Mon, 21 Oct 2019 09:29:40 +0800
Message-Id: <20191021012940.31678-1-pengfei.xu@intel.com>
X-Mailer: git-send-email 2.14.1
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH] umip_basic_test.c: remove useless new lines print
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

Signed-off-by: Pengfei Xu <pengfei.xu@intel.com>
---
 testcases/kernel/security/umip/umip_basic_test.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/testcases/kernel/security/umip/umip_basic_test.c b/testcases/kernel/security/umip/umip_basic_test.c
index 5a2b71013..1baa26c52 100644
--- a/testcases/kernel/security/umip/umip_basic_test.c
+++ b/testcases/kernel/security/umip/umip_basic_test.c
@@ -47,7 +47,7 @@ static void asm_sidt(void)
 	unsigned char val[IDT_LEN];
 
 	memset(val, 0, sizeof(val));
-	tst_res(TINFO, "TEST sidt, sidt result save at [%p]\n", val);
+	tst_res(TINFO, "TEST sidt, sidt result save at [%p]", val);
 	asm volatile("sidt %0\n" : "=m" (val));
 	exit(0);
 }
@@ -56,7 +56,7 @@ static void asm_sldt(void)
 {
 	unsigned long val;
 
-	tst_res(TINFO, "TEST sldt, sldt result save at [%p]\n", &val);
+	tst_res(TINFO, "TEST sldt, sldt result save at [%p]", &val);
 	asm volatile("sldt %0\n" : "=m" (val));
 	exit(0);
 }
@@ -65,7 +65,7 @@ static void asm_smsw(void)
 {
 	unsigned long val;
 
-	tst_res(TINFO, "TEST smsw, smsw result save at [%p]\n", &val);
+	tst_res(TINFO, "TEST smsw, smsw result save at [%p]", &val);
 	asm volatile("smsw %0\n" : "=m" (val));
 	exit(0);
 }
@@ -74,7 +74,7 @@ static void asm_str(void)
 {
 	unsigned long val;
 
-	tst_res(TINFO, "TEST str, str result save at [%p]\n", &val);
+	tst_res(TINFO, "TEST str, str result save at [%p]", &val);
 	asm volatile("str %0\n" : "=m" (val));
 	exit(0);
 }
-- 
2.14.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
