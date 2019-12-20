Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8987F1277E3
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Dec 2019 10:19:14 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1E75C3C2368
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Dec 2019 10:19:14 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 1BAF93C147F
 for <ltp@lists.linux.it>; Fri, 20 Dec 2019 10:19:04 +0100 (CET)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 02F6C1A0BC45
 for <ltp@lists.linux.it>; Fri, 20 Dec 2019 10:19:02 +0100 (CET)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Dec 2019 01:19:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,335,1571727600"; d="scan'208";a="267480050"
Received: from xpf-desktop.sh.intel.com ([10.239.13.102])
 by FMSMGA003.fm.intel.com with ESMTP; 20 Dec 2019 01:19:00 -0800
From: Pengfei Xu <pengfei.xu@intel.com>
To: ltp <ltp@lists.linux.it>, Pengfei Xu <pengfei.xu@intel.com>,
 Neri Ricardo <ricardo.neri@intel.com>, Su Heng <heng.su@intel.com>,
 Kasten Robert <robert.a.kasten@intel.com>, Cyril Hrubis <chrubis@suse.cz>
Date: Fri, 20 Dec 2019 17:25:28 +0800
Message-Id: <20191220092529.3239-3-pengfei.xu@intel.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20191220092529.3239-1-pengfei.xu@intel.com>
References: <20191220092529.3239-1-pengfei.xu@intel.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v5 3/4] lib: add usage that any kconfig with or
 without expected value in document
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
 doc/test-writing-guidelines.txt | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/doc/test-writing-guidelines.txt b/doc/test-writing-guidelines.txt
index 79d857fea..2299b6982 100644
--- a/doc/test-writing-guidelines.txt
+++ b/doc/test-writing-guidelines.txt
@@ -1590,7 +1590,13 @@ aborted with 'TCONF' if any of the required options were not set.
 #include "tst_test.h"
 
 static const char *kconfigs[] = {
-	"CONFIG_X86_INTEL_UMIP",
+	"CONFIG_EXT4_FS=y",
+	"CONFIG_MMU",
+	/* one CONFIG_A without expected value, add |NA as the end is optional */
+	"CONFIG_MMU|NA",
+	"CONFIG_X86_INTEL_UMIP|CONFIG_X86_UMIP=y",
+	/* CONFIG_A|CONFIG_B without expected value, need to add |NA as the end */
+	"CONFIG_X86_INTEL_UMIP|CONFIG_X86_UMIP|NA",
 	NULL
 };
 
-- 
2.14.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
