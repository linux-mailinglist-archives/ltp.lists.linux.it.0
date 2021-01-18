Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3A02F9FD2
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Jan 2021 13:34:46 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 78D683C30BD
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Jan 2021 13:34:45 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 42DC83C0354
 for <ltp@lists.linux.it>; Mon, 18 Jan 2021 13:34:42 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id E649114002D9
 for <ltp@lists.linux.it>; Mon, 18 Jan 2021 13:34:41 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 548BDB93C;
 Mon, 18 Jan 2021 12:34:41 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 18 Jan 2021 13:34:33 +0100
Message-Id: <20210118123433.17071-3-pvorel@suse.cz>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210118123433.17071-1-pvorel@suse.cz>
References: <20210118123433.17071-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [RFC PATCH 2/2] zram: Fix module detection on BusyBox
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

BusyBox modinfo implementation does not exit with 0 when module not
found. Our own API implementation used for module detection in
tst_check_driver() was fixed in previous commit thus use it.

Reported-by: Leo Yu-Chi Liang <ycliang@andestech.com>
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 testcases/kernel/device-drivers/zram/zram_lib.sh | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/testcases/kernel/device-drivers/zram/zram_lib.sh b/testcases/kernel/device-drivers/zram/zram_lib.sh
index 3f4d1d55f..bdbf2453a 100755
--- a/testcases/kernel/device-drivers/zram/zram_lib.sh
+++ b/testcases/kernel/device-drivers/zram/zram_lib.sh
@@ -1,6 +1,6 @@
 #!/bin/sh
 # Copyright (c) 2015 Oracle and/or its affiliates. All Rights Reserved.
-# Copyright (c) 2019 Petr Vorel <pvorel@suse.cz>
+# Copyright (c) 2019-2021 Petr Vorel <pvorel@suse.cz>
 # Author: Alexey Kodanev <alexey.kodanev@oracle.com>
 
 dev_makeswap=-1
@@ -9,6 +9,7 @@ dev_mounted=-1
 TST_NEEDS_TMPDIR=1
 TST_SETUP="zram_load"
 TST_CLEANUP="zram_cleanup"
+TST_NEEDS_DRIVERS="zram"
 . tst_test.sh
 
 zram_cleanup()
@@ -210,6 +211,3 @@ zram_mount()
 
 	tst_res TPASS "mount of zram device(s) succeeded"
 }
-
-modinfo zram > /dev/null 2>&1 ||
-	tst_brk TCONF "zram not configured in kernel"
-- 
2.29.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
