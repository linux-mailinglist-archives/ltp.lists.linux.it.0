Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C55EE1277E5
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Dec 2019 10:19:25 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 693C63C2357
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Dec 2019 10:19:25 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 412303C147F
 for <ltp@lists.linux.it>; Fri, 20 Dec 2019 10:19:04 +0100 (CET)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id D474960CD26
 for <ltp@lists.linux.it>; Fri, 20 Dec 2019 10:19:02 +0100 (CET)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Dec 2019 01:19:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,335,1571727600"; d="scan'208";a="267480046"
Received: from xpf-desktop.sh.intel.com ([10.239.13.102])
 by FMSMGA003.fm.intel.com with ESMTP; 20 Dec 2019 01:18:58 -0800
From: Pengfei Xu <pengfei.xu@intel.com>
To: ltp <ltp@lists.linux.it>, Pengfei Xu <pengfei.xu@intel.com>,
 Neri Ricardo <ricardo.neri@intel.com>, Su Heng <heng.su@intel.com>,
 Kasten Robert <robert.a.kasten@intel.com>, Cyril Hrubis <chrubis@suse.cz>
Date: Fri, 20 Dec 2019 17:25:27 +0800
Message-Id: <20191220092529.3239-2-pengfei.xu@intel.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20191220092529.3239-1-pengfei.xu@intel.com>
References: <20191220092529.3239-1-pengfei.xu@intel.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v5 2/4] lib: add any kconfig with or without expected
 value into kconfig test
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
 lib/newlib_tests/config05       | 4 ++++
 lib/newlib_tests/test_kconfig.c | 5 +++++
 6 files changed, 13 insertions(+)

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
index a9d7bab4d..85c8ad22f 100644
--- a/lib/newlib_tests/config05
+++ b/lib/newlib_tests/config05
@@ -1,3 +1,7 @@
 # Everything is wrong
 CONFIG_EXT4_FS=y
 CONFIG_PGTABLE_LEVELS=44
+CONFIG_X86_UMI=y
+CONFIG_X86_UMIPP=y
+CONFIG_X86_INTEL_UMI=y
+CONFIG_X86_INTEL_UMIPP=y
diff --git a/lib/newlib_tests/test_kconfig.c b/lib/newlib_tests/test_kconfig.c
index d9c662fc5..d3a1c2b0b 100644
--- a/lib/newlib_tests/test_kconfig.c
+++ b/lib/newlib_tests/test_kconfig.c
@@ -12,8 +12,13 @@ static void do_test(void)
 
 static const char *kconfigs[] = {
 	"CONFIG_MMU",
+	/* one CONFIG_A without expected value, |NA as the end is optional */
+	"CONFIG_MMU|NA",
 	"CONFIG_EXT4_FS=m",
 	"CONFIG_PGTABLE_LEVELS=4",
+	"CONFIG_X86_INTEL_UMIP|CONFIG_X86_UMIP=y",
+	/* CONFIG_A|CONFIG_B without expected value, need to add |NA as the end */
+	"CONFIG_X86_INTEL_UMIP|CONFIG_X86_UMIP|NA",
 	NULL
 };
 
-- 
2.14.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
