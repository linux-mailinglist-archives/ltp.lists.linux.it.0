Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C2E308D87
	for <lists+linux-ltp@lfdr.de>; Fri, 29 Jan 2021 20:42:06 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7ADB13C77E6
	for <lists+linux-ltp@lfdr.de>; Fri, 29 Jan 2021 20:42:05 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 723CA3C100E
 for <ltp@lists.linux.it>; Fri, 29 Jan 2021 20:42:00 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 1275D601D55
 for <ltp@lists.linux.it>; Fri, 29 Jan 2021 20:42:00 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8A416B115;
 Fri, 29 Jan 2021 19:41:59 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 29 Jan 2021 20:41:39 +0100
Message-Id: <20210129194144.31299-2-pvorel@suse.cz>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210129194144.31299-1-pvorel@suse.cz>
References: <20210129194144.31299-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v2 1/6] zram: Calculate dev_num variable
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

Instead of requiring to be set.

Reviewed-by: Cyril Hrubis <chrubis@suse.cz>
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
changes v1->v2:
Added paranoid check:
+	if [ $dev_num -le 0 ]; then
+		tst_brk TBROK "dev_num must be > 0"
+	fi

Kind regards,
Petr

 testcases/kernel/device-drivers/zram/zram01.sh   |  8 +++-----
 testcases/kernel/device-drivers/zram/zram02.sh   |  8 +++-----
 testcases/kernel/device-drivers/zram/zram_lib.sh | 16 ++++++++++++++--
 3 files changed, 20 insertions(+), 12 deletions(-)

diff --git a/testcases/kernel/device-drivers/zram/zram01.sh b/testcases/kernel/device-drivers/zram/zram01.sh
index 8de2c0cad..a795ff89f 100755
--- a/testcases/kernel/device-drivers/zram/zram01.sh
+++ b/testcases/kernel/device-drivers/zram/zram01.sh
@@ -1,6 +1,6 @@
 #!/bin/sh
 # Copyright (c) 2015 Oracle and/or its affiliates. All Rights Reserved.
-# Copyright (c) 2019 Petr Vorel <pvorel@suse.cz>
+# Copyright (c) 2019-2021 Petr Vorel <pvorel@suse.cz>
 # Author: Alexey Kodanev <alexey.kodanev@oracle.com>
 #
 # Test creates several zram devices with different filesystems on them.
@@ -11,10 +11,8 @@ TST_TESTFUNC="do_test"
 TST_NEEDS_CMDS="awk bc dd"
 . zram_lib.sh
 
-# Test will create the following number of zram devices:
-dev_num=4
-# This is a list of parameters for zram devices.
-# Number of items must be equal to 'dev_num' parameter.
+# List of parameters for zram devices.
+# For each number the test creates own zram device.
 zram_max_streams="2 3 5 8"
 
 FS_SIZE="402653184"
diff --git a/testcases/kernel/device-drivers/zram/zram02.sh b/testcases/kernel/device-drivers/zram/zram02.sh
index f97cf646c..b4d706568 100755
--- a/testcases/kernel/device-drivers/zram/zram02.sh
+++ b/testcases/kernel/device-drivers/zram/zram02.sh
@@ -1,6 +1,6 @@
 #!/bin/sh
 # Copyright (c) 2015 Oracle and/or its affiliates. All Rights Reserved.
-# Copyright (c) 2019 Petr Vorel <pvorel@suse.cz>
+# Copyright (c) 2019-2021 Petr Vorel <pvorel@suse.cz>
 # Author: Alexey Kodanev <alexey.kodanev@oracle.com>
 #
 # Test checks that we can create swap zram device.
@@ -9,10 +9,8 @@ TST_CNT=5
 TST_TESTFUNC="do_test"
 . zram_lib.sh
 
-# Test will create the following number of zram devices:
-dev_num=1
-# This is a list of parameters for zram devices.
-# Number of items must be equal to 'dev_num' parameter.
+# List of parameters for zram devices.
+# For each number the test creates own zram device.
 zram_max_streams="2"
 
 # The zram sysfs node 'disksize' value can be either in bytes,
diff --git a/testcases/kernel/device-drivers/zram/zram_lib.sh b/testcases/kernel/device-drivers/zram/zram_lib.sh
index 6fa6552ca..a7e8b9f5b 100755
--- a/testcases/kernel/device-drivers/zram/zram_lib.sh
+++ b/testcases/kernel/device-drivers/zram/zram_lib.sh
@@ -34,7 +34,19 @@ zram_cleanup()
 
 zram_load()
 {
+	local tmp
+
+	dev_num=0
+	for tmp in $zram_max_streams; do
+		dev_num=$((dev_num+1))
+	done
+
+	if [ $dev_num -le 0 ]; then
+		tst_brk TBROK "dev_num must be > 0"
+	fi
+
 	tst_res TINFO "create '$dev_num' zram device(s)"
+
 	modprobe zram num_devices=$dev_num || \
 		tst_brk TBROK "failed to insert zram module"
 
@@ -42,9 +54,9 @@ zram_load()
 
 	if [ "$dev_num_created" -ne "$dev_num" ]; then
 		tst_brk TFAIL "unexpected num of devices: $dev_num_created"
-	else
-		tst_res TPASS "test succeeded"
 	fi
+
+	tst_res TPASS "all zram devices successfully created"
 }
 
 zram_max_streams()
-- 
2.30.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
