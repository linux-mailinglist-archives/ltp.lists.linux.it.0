Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EFCCF329469
	for <lists+linux-ltp@lfdr.de>; Mon,  1 Mar 2021 23:02:35 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 81B903C7E84
	for <lists+linux-ltp@lfdr.de>; Mon,  1 Mar 2021 23:02:35 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 149BD3C6E8C
 for <ltp@lists.linux.it>; Mon,  1 Mar 2021 23:02:31 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id A2C461A006B9
 for <ltp@lists.linux.it>; Mon,  1 Mar 2021 23:02:31 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3993EAF44;
 Mon,  1 Mar 2021 22:02:31 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Mon,  1 Mar 2021 23:02:18 +0100
Message-Id: <20210301220222.22705-4-pvorel@suse.cz>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210301220222.22705-1-pvorel@suse.cz>
References: <20210301220222.22705-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 3/7] zram: Add zram_compress_alg() to zram02.sh
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Quit at setup in case there is no fs support (change in previous commit)
can lead to skipping zram_compress_alg(). Add it to zram02.sh where is no
such limitation and still keep it in zram01.sh since the tests
do depend on each other, the zram_fill_fs actually checks compression
ration, which only makes sense if compression is enabled.

Reviewed-by: Li Wang <liwang@redhat.com>
Reviewed-by: Cyril Hrubis <chrubis@suse.cz>
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Changes v2->v3:
* keep zram_compress_alg() also in zram01.sh (Cyril)

 testcases/kernel/device-drivers/zram/zram02.sh | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

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
2.30.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
