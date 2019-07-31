Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2FF7B9B4
	for <lists+linux-ltp@lfdr.de>; Wed, 31 Jul 2019 08:33:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4F6613C1D02
	for <lists+linux-ltp@lfdr.de>; Wed, 31 Jul 2019 08:33:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 957B73C194D
 for <ltp@lists.linux.it>; Wed, 31 Jul 2019 08:33:29 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id B4C54600F09
 for <ltp@lists.linux.it>; Wed, 31 Jul 2019 08:33:30 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 930B6AC11;
 Wed, 31 Jul 2019 06:33:26 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 31 Jul 2019 08:33:20 +0200
Message-Id: <20190731063320.4898-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH] zram01: Fix division by 0
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

Sometimes free reports no memory use by zram, which leads to division by 0:
zram01 8 TINFO: zram used 0M, zram disk sizes 104857600M
/opt/ltp/testcases/bin/zram01.sh: line 87: 100 * 104857600 / 0: division by 0 (error token is "0")

TBROK the test in that case.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 testcases/kernel/device-drivers/zram/zram01.sh | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/testcases/kernel/device-drivers/zram/zram01.sh b/testcases/kernel/device-drivers/zram/zram01.sh
index 7d3951aa5..79e18cbb7 100755
--- a/testcases/kernel/device-drivers/zram/zram01.sh
+++ b/testcases/kernel/device-drivers/zram/zram01.sh
@@ -82,6 +82,11 @@ zram_fill_fs()
 		total_size=$(($total_size + $s))
 	done
 
+	if [ $used_mem -eq 0 ]; then
+		tst_resm TBROK "no memory used by zram"
+		return
+	fi
+
 	tst_resm TINFO "zram used ${used_mem}M, zram disk sizes ${total_size}M"
 
 	local v=$((100 * $total_size / $used_mem))
-- 
2.22.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
