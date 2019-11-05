Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B74EF7B3
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Nov 2019 10:03:44 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D2C5D3C22CB
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Nov 2019 10:03:43 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 8E38E3C22BD
 for <ltp@lists.linux.it>; Tue,  5 Nov 2019 10:03:41 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id C4507140184C
 for <ltp@lists.linux.it>; Tue,  5 Nov 2019 10:03:40 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 38ADDB324;
 Tue,  5 Nov 2019 09:03:40 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Tue,  5 Nov 2019 10:03:39 +0100
Message-Id: <20191105090339.6522-2-mdoucha@suse.cz>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191105090339.6522-1-mdoucha@suse.cz>
References: <20191105082322.GA16218@dell5510>
 <20191105090339.6522-1-mdoucha@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v2 1/1] Fix compression ratio calculation in zram01
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

zram01 uses `free -m` to measure zram memory usage. The results are nonsense
because they are polluted by all running processes on the system.

Use /sys/block/zram<id>/mm_stat to measure memory usage instead. The file is
available since kernel 4.1.

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---
 .../kernel/device-drivers/zram/zram01.sh      | 38 +++++++++----------
 1 file changed, 17 insertions(+), 21 deletions(-)

diff --git a/testcases/kernel/device-drivers/zram/zram01.sh b/testcases/kernel/device-drivers/zram/zram01.sh
index 9508211ab..4c9adee7b 100755
--- a/testcases/kernel/device-drivers/zram/zram01.sh
+++ b/testcases/kernel/device-drivers/zram/zram01.sh
@@ -58,8 +58,7 @@ TST_CLEANUP="zram_cleanup"
 
 zram_fill_fs()
 {
-	tst_test_cmds awk bc dd free
-	local mem_free0=$(free -m | awk 'NR==2 {print $4}')
+	tst_test_cmds awk bc dd
 
 	for i in $(seq 0 $(($dev_num - 1))); do
 		tst_resm TINFO "fill zram$i..."
@@ -74,30 +73,27 @@ zram_fill_fs()
 			[ -s err.txt ] && tst_resm TWARN "dd error: $(cat err.txt)"
 			tst_brkm TBROK "cannot fill zram"
 		fi
-		tst_resm TINFO "zram$i can be filled with '$b' KB"
-	done
-
-	local mem_free1=$(free -m | awk 'NR==2 {print $4}')
-	local used_mem=$(($mem_free0 - $mem_free1))
-
-	local total_size=0
-	for sm in $zram_sizes; do
-		local s=$(echo $sm | sed 's/M//')
-		total_size=$(($total_size + $s))
-	done
+		tst_resm TPASS "zram$i can be filled with '$b' KB"
 
-	[ $used_mem -eq 0 ] && tst_brkm TBROK "no memory used by zram"
+		if [ ! -f "/sys/block/zram$i/mm_stat" ]; then
+			if [ $i -eq 0 ]; then
+				tst_resm TCONF "zram compression ratio test requires zram mm_stat sysfs file"
+			fi
 
-	tst_resm TINFO "zram used ${used_mem}M, zram disk sizes ${total_size}M"
+			continue
+		fi
 
-	local v=$((100 * $total_size / $used_mem))
+		local compr_size=`cat "/sys/block/zram$i/mm_stat" | awk '{print $2}'`
+		local v=$((100 * 1024 * $b / $compr_size))
+		local r=`echo "scale=2; $v / 100 " | bc`
 
-	if [ "$v" -lt 100 ]; then
-		tst_resm TFAIL "compression ratio: 0.$v:1"
-		return
-	fi
+		if [ "$v" -lt 100 ]; then
+			tst_resm TFAIL "compression ratio: $r:1"
+			break
+		fi
 
-	tst_resm TPASS "compression ratio: $(echo "scale=2; $v / 100 " | bc):1"
+		tst_resm TPASS "compression ratio: $r:1"
+	done
 }
 
 zram_load
-- 
2.23.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
