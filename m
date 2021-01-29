Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 958E6308D89
	for <lists+linux-ltp@lfdr.de>; Fri, 29 Jan 2021 20:42:25 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C72093C780D
	for <lists+linux-ltp@lfdr.de>; Fri, 29 Jan 2021 20:42:24 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 946F13C100E
 for <ltp@lists.linux.it>; Fri, 29 Jan 2021 20:42:00 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 5B6A21A00924
 for <ltp@lists.linux.it>; Fri, 29 Jan 2021 20:42:00 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 01B1EB118;
 Fri, 29 Jan 2021 19:42:00 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 29 Jan 2021 20:41:41 +0100
Message-Id: <20210129194144.31299-4-pvorel@suse.cz>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210129194144.31299-1-pvorel@suse.cz>
References: <20210129194144.31299-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v2 3/6] zram: Move zram_compress_alg() to zram02.sh
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

Quit at setup in case there is no fs support (change in previous commit)
can lead to skipping zram_compress_alg(). Move to zram02.sh where is no
such limitation.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
The same as in v1.

 testcases/kernel/device-drivers/zram/zram01.sh | 13 ++++++-------
 testcases/kernel/device-drivers/zram/zram02.sh | 11 ++++++-----
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/testcases/kernel/device-drivers/zram/zram01.sh b/testcases/kernel/device-drivers/zram/zram01.sh
index c5d4a3e51..5e99f8bb8 100755
--- a/testcases/kernel/device-drivers/zram/zram01.sh
+++ b/testcases/kernel/device-drivers/zram/zram01.sh
@@ -6,7 +6,7 @@
 # Test creates several zram devices with different filesystems on them.
 # It fills each device with zeros and checks that compression works.
 
-TST_CNT=7
+TST_CNT=6
 TST_TESTFUNC="do_test"
 TST_NEEDS_CMDS="awk bc dd grep"
 . zram_lib.sh
@@ -108,12 +108,11 @@ do_test()
 {
 	case $1 in
 	 1) zram_max_streams;;
-	 2) zram_compress_alg;;
-	 3) zram_set_disksizes;;
-	 4) zram_set_memlimit;;
-	 5) zram_makefs;;
-	 6) zram_mount;;
-	 7) zram_fill_fs;;
+	 2) zram_set_disksizes;;
+	 3) zram_set_memlimit;;
+	 4) zram_makefs;;
+	 5) zram_mount;;
+	 6) zram_fill_fs;;
 	esac
 }
 
diff --git a/testcases/kernel/device-drivers/zram/zram02.sh b/testcases/kernel/device-drivers/zram/zram02.sh
index b4d706568..d09977ec1 100755
--- a/testcases/kernel/device-drivers/zram/zram02.sh
+++ b/testcases/kernel/device-drivers/zram/zram02.sh
@@ -5,7 +5,7 @@
 #
 # Test checks that we can create swap zram device.
 
-TST_CNT=5
+TST_CNT=6
 TST_TESTFUNC="do_test"
 . zram_lib.sh
 
@@ -27,10 +27,11 @@ do_test()
 {
 	case $1 in
 	 1) zram_max_streams;;
-	 2) zram_set_disksizes;;
-	 3) zram_set_memlimit;;
-	 4) zram_makeswap;;
-	 5) zram_swapoff;;
+	 2) zram_compress_alg;;
+	 3) zram_set_disksizes;;
+	 4) zram_set_memlimit;;
+	 5) zram_makeswap;;
+	 6) zram_swapoff;;
 	esac
 }
 
-- 
2.30.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
