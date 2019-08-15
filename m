Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 508B28E4A8
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Aug 2019 07:58:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CB2653C1D75
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Aug 2019 07:58:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 450D33C1D18
 for <ltp@lists.linux.it>; Thu, 15 Aug 2019 07:58:46 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 94DF62011E7
 for <ltp@lists.linux.it>; Thu, 15 Aug 2019 07:58:45 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9667CAFE3;
 Thu, 15 Aug 2019 05:58:43 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 15 Aug 2019 07:58:36 +0200
Message-Id: <20190815055836.13634-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v3] zram01: Improve error detection
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

* TBROK when detected size is 0 (+ print dd stderr, if any)
* TBROK if actually used memory is 0, this fixes division by 0:

Sometimes free reports no memory use by zram, which leads to division by 0:
zram01 8 TINFO: zram used 0M, zram disk sizes 104857600M
/opt/ltp/testcases/bin/zram01.sh: line 87: 100 * 104857600 / 0: division by 0 (error token is "0")

Suggested-by: Alexey Kodanev <alexey.kodanev@oracle.com>
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Hi Alexey,

feel free to send your fix if this is not what you meant.

Kind regards,
Petr

Changes v2->v3:
* print last dd error (if any) only when $b -eq 0

Changes v2->v3:
* add TBROK when $b -eq 0
* print last dd error, if any
---

 testcases/kernel/device-drivers/zram/zram01.sh | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/testcases/kernel/device-drivers/zram/zram01.sh b/testcases/kernel/device-drivers/zram/zram01.sh
index b3ed5170d..c0d46ed75 100755
--- a/testcases/kernel/device-drivers/zram/zram01.sh
+++ b/testcases/kernel/device-drivers/zram/zram01.sh
@@ -67,9 +67,13 @@ zram_fill_fs()
 		while true; do
 			dd conv=notrunc if=/dev/zero of=zram${i}/file \
 				oflag=append count=1 bs=1024 status=none \
-				> /dev/null 2>&1 || break
+				2>err.txt || break
 			b=$(($b + 1))
 		done
+		if [ $b -eq 0 ]; then
+			[ -s err.txt ] && tst_resm TWARN "dd error: $(cat err.txt)"
+			tst_brkm TBROK "cannot fill zram"
+		fi
 		tst_resm TINFO "zram$i can be filled with '$b' KB"
 	done
 
@@ -82,6 +86,8 @@ zram_fill_fs()
 		total_size=$(($total_size + $s))
 	done
 
+	[ $used_mem -eq 0 ] && tst_brkm TBROK "no memory used by zram"
+
 	tst_resm TINFO "zram used ${used_mem}M, zram disk sizes ${total_size}M"
 
 	local v=$((100 * $total_size / $used_mem))
-- 
2.22.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
