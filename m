Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C309430063B
	for <lists+linux-ltp@lfdr.de>; Fri, 22 Jan 2021 15:55:23 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0F6AA3C848E
	for <lists+linux-ltp@lfdr.de>; Fri, 22 Jan 2021 15:55:23 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id E38F63C6368
 for <ltp@lists.linux.it>; Fri, 22 Jan 2021 15:55:11 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 6F9F8201034
 for <ltp@lists.linux.it>; Fri, 22 Jan 2021 15:55:11 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AF3C7AD17;
 Fri, 22 Jan 2021 14:55:10 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 22 Jan 2021 15:54:55 +0100
Message-Id: <20210122145458.27964-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v5 0/3] Kernel module detection (own implementation)
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
Cc: kernel-team@android.com, Sandeep Patil <sspatil@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

hopefully the latest version.

Changes v4->v5:
* return code is -1 instead of 1 (should be safe, thus I kept it in the
same commit, but can move to separate commit)
* update doc in the header

NOTE: there is a bit of mess in return codes in the C API
(-1 vs 1 returned on error), but that's for another effort.

Kind regards,
Petr

diff --git include/tst_kernel.h include/tst_kernel.h
index 71ab9466b..9e17bb71e 100644
--- include/tst_kernel.h
+++ include/tst_kernel.h
@@ -13,9 +13,11 @@ int tst_kernel_bits(void);
 /**
  * Checks support for the kernel driver.
  *
- * @param name The name of the driver.
- * @return Returns 0 if the kernel has the driver or modprobe is missing.
+ * @param driver The name of the driver.
+ * @return Returns 0 if the kernel has the driver,
+ * -1 when driver is missing or config file not available.
+ * On Android *always* 0 (always expect the driver is available).
  */
-int tst_check_driver(const char *name);
+int tst_check_driver(const char *driver);
 
 #endif	/* TST_KERNEL_H__ */
diff --git lib/tst_kernel.c lib/tst_kernel.c
index b5caf7b20..c908bb04c 100644
--- lib/tst_kernel.c
+++ lib/tst_kernel.c
@@ -139,7 +140,7 @@ static int tst_check_driver_(const char *driver)
 		!tst_search_driver(driver, "modules.builtin"))
 		return 0;
 
-	return 1;
+	return -1;
 }
 
 int tst_check_driver(const char *driver)
@@ -157,7 +158,7 @@ int tst_check_driver(const char *driver)
 	if (!tst_check_driver_(driver))
 		return 0;
 
-	int ret = 1;
+	int ret = -1;
 
 	if (strrchr(driver, '-') || strrchr(driver, '_')) {
 		char *driver2 = strdup(driver);



Petr Vorel (3):
  tst_check_driver(): Fix kernel module detection on BusyBox
  zram: Fix module detection on BusyBox
  tst_net.sh: Require veth for netns (again)

 include/tst_kernel.h                          |   8 +-
 lib/tst_kernel.c                              | 105 ++++++++++++++++--
 .../kernel/device-drivers/zram/zram_lib.sh    |   6 +-
 testcases/lib/tst_net.sh                      |   1 +
 4 files changed, 101 insertions(+), 19 deletions(-)

-- 
2.30.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
