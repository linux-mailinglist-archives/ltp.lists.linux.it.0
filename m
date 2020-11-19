Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1442B8BC5
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Nov 2020 07:41:45 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 113393C59F7
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Nov 2020 07:41:45 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 2B14F3C27FA
 for <ltp@lists.linux.it>; Thu, 19 Nov 2020 07:41:41 +0100 (CET)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 5BD0D1400DF1
 for <ltp@lists.linux.it>; Thu, 19 Nov 2020 07:41:38 +0100 (CET)
IronPort-SDR: Apd0w+M0lKjyo+YUR/SH/UEKiKbflgBUn/o8XDG2QA6QBaXbGe3N/jwREiMhMcBpVENVXkEDmI
 pVZTaNb7OKTg==
X-IronPort-AV: E=McAfee;i="6000,8403,9809"; a="189326707"
X-IronPort-AV: E=Sophos;i="5.77,489,1596524400"; d="scan'208";a="189326707"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2020 22:41:34 -0800
IronPort-SDR: B6PwkS6BSmmjKzN58d1s/clcUEixopvGlowY91xzc0rkIShtdjL7c18CIAOvrm7PCRq4K7Ot4u
 o5GdfU3Kt+LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,489,1596524400"; d="scan'208";a="476693294"
Received: from fedora29.sh.intel.com ([10.239.183.87])
 by orsmga004.jf.intel.com with ESMTP; 18 Nov 2020 22:41:32 -0800
From: Pengfei Xu <pengfei.xu@intel.com>
To: ltp <ltp@lists.linux.it>, Pengfei Xu <pengfei.xu@intel.com>,
 Neri Ricardo <ricardo.neri@intel.com>, Su Heng <heng.su@intel.com>,
 Cyril Hrubis <chrubis@suse.cz>, Li Wang <liwang@redhat.com>,
 Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Date: Thu, 19 Nov 2020 14:29:34 -0500
Message-Id: <20201119192934.5653-1-pengfei.xu@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=2.5 required=7.0 tests=DATE_IN_FUTURE_12_24,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH] lib/tst_kconfig: Fix unexpected error when checking
 Kconfig containing numbers
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

Fix unexpected error when checking Kconfig containing numbers after commit:
eeed458492cc7dc01ad3a5fff500b09d1fda4922:"lib/tst_kconfig: Validate variables",
unexpected error sample is as below:
"
CONFIG_X86_INTEL_UMIP=y
        ^
Unexpected character in variable name

CONFIG_X86_UMIP=y
        ^
Unexpected character in variable name

tst_kconfig.c:475: TBROK: Invalid kconfig variables!
"

Signed-off-by: Pengfei Xu <pengfei.xu@intel.com>
---
 lib/tst_kconfig.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/lib/tst_kconfig.c b/lib/tst_kconfig.c
index 72830703c..8dc623952 100644
--- a/lib/tst_kconfig.c
+++ b/lib/tst_kconfig.c
@@ -262,6 +262,11 @@ static int validate_var(const struct tst_expr_tok *var)
 			continue;
 		}
 
+		if (c >= '0' && c <= '9') {
+			i++;
+			continue;
+		}
+
 		if (c == '=') {
 			i++;
 			break;
-- 
2.20.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
