Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C65C12630C
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Dec 2019 14:12:50 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F17123C2392
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Dec 2019 14:12:49 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id AB6A23C2385
 for <ltp@lists.linux.it>; Thu, 19 Dec 2019 14:12:30 +0100 (CET)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 62BFC14016A6
 for <ltp@lists.linux.it>; Thu, 19 Dec 2019 14:12:29 +0100 (CET)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Dec 2019 05:12:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,332,1571727600"; d="scan'208";a="390529917"
Received: from xpf-desktop.sh.intel.com ([10.239.13.102])
 by orsmga005.jf.intel.com with ESMTP; 19 Dec 2019 05:12:26 -0800
From: Pengfei Xu <pengfei.xu@intel.com>
To: ltp <ltp@lists.linux.it>, Pengfei Xu <pengfei.xu@intel.com>,
 Neri Ricardo <ricardo.neri@intel.com>, Su Heng <heng.su@intel.com>,
 Cyril Hrubis <chrubis@suse.cz>
Date: Thu, 19 Dec 2019 21:18:54 +0800
Message-Id: <20191219131855.28799-3-pengfei.xu@intel.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20191219131855.28799-1-pengfei.xu@intel.com>
References: <20191219131855.28799-1-pengfei.xu@intel.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v4 3/4] lib: add any kconfig to match the expected
 value function into kconfig test
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

config01/02/03/04 should be passed for UMIP kconfig
All cases in config05 should be failed.

Signed-off-by: Pengfei Xu <pengfei.xu@intel.com>
---
 lib/newlib_tests/config01       | 1 +
 lib/newlib_tests/config02       | 1 +
 lib/newlib_tests/config03       | 1 +
 lib/newlib_tests/config04       | 1 +
 lib/newlib_tests/config05       | 2 ++
 lib/newlib_tests/test_kconfig.c | 1 +
 6 files changed, 7 insertions(+)

diff --git a/lib/newlib_tests/config01 b/lib/newlib_tests/config01
index 96d68d836..085c9368c 100644
--- a/lib/newlib_tests/config01
+++ b/lib/newlib_tests/config01
@@ -2,3 +2,4 @@
 CONFIG_MMU=y
 CONFIG_EXT4_FS=m
 CONFIG_PGTABLE_LEVELS=4
+CONFIG_X86_UMIP=y
diff --git a/lib/newlib_tests/config02 b/lib/newlib_tests/config02
index 2de45cff8..ca71d26c1 100644
--- a/lib/newlib_tests/config02
+++ b/lib/newlib_tests/config02
@@ -2,3 +2,4 @@
 # CONFIG_MMU is not set
 CONFIG_EXT4_FS=m
 CONFIG_PGTABLE_LEVELS=4
+CONFIG_X86_INTEL_UMIP=y
diff --git a/lib/newlib_tests/config03 b/lib/newlib_tests/config03
index 1a3b9e648..8a92def74 100644
--- a/lib/newlib_tests/config03
+++ b/lib/newlib_tests/config03
@@ -2,3 +2,4 @@
 CONFIG_MMU=y
 CONFIG_EXT4_FS=m
 CONFIG_PGTABLE_LEVELS=44
+CONFIG_X86_UMIP=y
diff --git a/lib/newlib_tests/config04 b/lib/newlib_tests/config04
index cce7051ae..424157fec 100644
--- a/lib/newlib_tests/config04
+++ b/lib/newlib_tests/config04
@@ -1,4 +1,5 @@
 # Unexpected CONFIG_EXT4_FS compiled in
 CONFIG_MMU=y
 CONFIG_EXT4_FS=y
+CONFIG_X86_INTEL_UMIP=y
 CONFIG_PGTABLE_LEVELS=4
diff --git a/lib/newlib_tests/config05 b/lib/newlib_tests/config05
index a9d7bab4d..e68fa8913 100644
--- a/lib/newlib_tests/config05
+++ b/lib/newlib_tests/config05
@@ -1,3 +1,5 @@
 # Everything is wrong
 CONFIG_EXT4_FS=y
 CONFIG_PGTABLE_LEVELS=44
+CONFIG_X86_UMI=y
+CONFIG_X86_INT_UMIP=y
diff --git a/lib/newlib_tests/test_kconfig.c b/lib/newlib_tests/test_kconfig.c
index d9c662fc5..9515b60e2 100644
--- a/lib/newlib_tests/test_kconfig.c
+++ b/lib/newlib_tests/test_kconfig.c
@@ -14,6 +14,7 @@ static const char *kconfigs[] = {
 	"CONFIG_MMU",
 	"CONFIG_EXT4_FS=m",
 	"CONFIG_PGTABLE_LEVELS=4",
+	"CONFIG_X86_INTEL_UMIP|CONFIG_X86_UMIP=y",
 	NULL
 };
 
-- 
2.14.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
