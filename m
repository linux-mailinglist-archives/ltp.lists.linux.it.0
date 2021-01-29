Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C6135308D8B
	for <lists+linux-ltp@lfdr.de>; Fri, 29 Jan 2021 20:42:45 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4EAEA3C781A
	for <lists+linux-ltp@lfdr.de>; Fri, 29 Jan 2021 20:42:45 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 204823C5A22
 for <ltp@lists.linux.it>; Fri, 29 Jan 2021 20:42:01 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 8609D1400550
 for <ltp@lists.linux.it>; Fri, 29 Jan 2021 20:42:00 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2B0F2B119;
 Fri, 29 Jan 2021 19:42:00 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 29 Jan 2021 20:41:42 +0100
Message-Id: <20210129194144.31299-5-pvorel@suse.cz>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210129194144.31299-1-pvorel@suse.cz>
References: <20210129194144.31299-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v2 4/6] zram: Move test specific functions out of
 zram_lib.sh
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

Refactoring, as code is confusing enough, when use global variables and
functions which are single test specific + there is zram_fill_fs already
in zram01.sh.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
The same as in v1.

 .../kernel/device-drivers/zram/zram01.sh      | 34 +++++++
 .../kernel/device-drivers/zram/zram02.sh      | 58 ++++++++++++
 .../kernel/device-drivers/zram/zram_lib.sh    | 92 -------------------
 3 files changed, 92 insertions(+), 92 deletions(-)

diff --git a/testcases/kernel/device-drivers/zram/zram01.sh b/testcases/kernel/device-drivers/zram/zram01.sh
index 5e99f8bb8..695de14a1 100755
--- a/testcases/kernel/device-drivers/zram/zram01.sh
+++ b/testcases/kernel/device-drivers/zram/zram01.sh
@@ -66,6 +66,40 @@ setup()
 	zram_load
 }
 
+zram_makefs()
+{
+	local i=0
+	local fs
+
+	for fs in $zram_filesystems; do
+		tst_res TINFO "make $fs filesystem on /dev/zram$i"
+		mkfs.$fs /dev/zram$i > err.log 2>&1
+		if [ $? -ne 0 ]; then
+			cat err.log
+			tst_brk TFAIL "failed to make $fs on /dev/zram$i"
+		fi
+
+		i=$(($i + 1))
+		[ $i -eq $dev_num ] && break
+	done
+
+	tst_res TPASS "zram_makefs succeeded"
+}
+
+zram_mount()
+{
+	local i=0
+
+	for i in $(seq 0 $(($dev_num - 1))); do
+		tst_res TINFO "mount /dev/zram$i"
+		mkdir zram$i
+		ROD mount /dev/zram$i zram$i
+		dev_mounted=$i
+	done
+
+	tst_res TPASS "mount of zram device(s) succeeded"
+}
+
 zram_fill_fs()
 {
 	for i in $(seq 0 $(($dev_num - 1))); do
diff --git a/testcases/kernel/device-drivers/zram/zram02.sh b/testcases/kernel/device-drivers/zram/zram02.sh
index d09977ec1..803b8dc29 100755
--- a/testcases/kernel/device-drivers/zram/zram02.sh
+++ b/testcases/kernel/device-drivers/zram/zram02.sh
@@ -23,6 +23,64 @@ zram_max_streams="2"
 zram_sizes="107374182400" # 100GB
 zram_mem_limits="1M"
 
+zram_compress_alg()
+{
+	if tst_kvcmp -lt "3.15"; then
+		tst_res TCONF "device attribute comp_algorithm is"\
+			"introduced since kernel v3.15, the running kernel"\
+			"does not support it"
+		return
+	fi
+
+	local i=0
+
+	tst_res TINFO "test that we can set compression algorithm"
+	local algs="$(sed 's/[][]//g' /sys/block/zram0/comp_algorithm)"
+	tst_res TINFO "supported algs: $algs"
+
+	local dev_max=$(($dev_num - 1))
+
+	for i in $(seq 0 $dev_max); do
+		for alg in $algs; do
+			local sys_path="/sys/block/zram${i}/comp_algorithm"
+			echo "$alg" >  $sys_path || \
+				tst_brk TFAIL "can't set '$alg' to $sys_path"
+			tst_res TINFO "$sys_path = '$alg' ($i/$dev_max)"
+		done
+	done
+
+	tst_res TPASS "test succeeded"
+}
+
+zram_makeswap()
+{
+	tst_res TINFO "make swap with zram device(s)"
+	tst_require_cmds mkswap swapon swapoff
+	local i=0
+
+	for i in $(seq 0 $(($dev_num - 1))); do
+		ROD mkswap /dev/zram$i
+		ROD swapon /dev/zram$i
+		tst_res TINFO "done with /dev/zram$i"
+		dev_makeswap=$i
+	done
+
+	tst_res TPASS "making zram swap succeeded"
+}
+
+zram_swapoff()
+{
+	tst_require_cmds swapoff
+	local i
+
+	for i in $(seq 0 $dev_makeswap); do
+		ROD swapoff /dev/zram$i
+	done
+	dev_makeswap=-1
+
+	tst_res TPASS "swapoff completed"
+}
+
 do_test()
 {
 	case $1 in
diff --git a/testcases/kernel/device-drivers/zram/zram_lib.sh b/testcases/kernel/device-drivers/zram/zram_lib.sh
index d4aaf0c3e..26ed1846b 100755
--- a/testcases/kernel/device-drivers/zram/zram_lib.sh
+++ b/testcases/kernel/device-drivers/zram/zram_lib.sh
@@ -89,35 +89,6 @@ zram_max_streams()
 	tst_res TPASS "test succeeded"
 }
 
-zram_compress_alg()
-{
-	if tst_kvcmp -lt "3.15"; then
-		tst_res TCONF "device attribute comp_algorithm is"\
-			"introduced since kernel v3.15, the running kernel"\
-			"does not support it"
-		return
-	fi
-
-	local i=0
-
-	tst_res TINFO "test that we can set compression algorithm"
-	local algs="$(sed 's/[][]//g' /sys/block/zram0/comp_algorithm)"
-	tst_res TINFO "supported algs: $algs"
-
-	local dev_max=$(($dev_num - 1))
-
-	for i in $(seq 0 $dev_max); do
-		for alg in $algs; do
-			local sys_path="/sys/block/zram${i}/comp_algorithm"
-			echo "$alg" >  $sys_path || \
-				tst_brk TFAIL "can't set '$alg' to $sys_path"
-			tst_res TINFO "$sys_path = '$alg' ($i/$dev_max)"
-		done
-	done
-
-	tst_res TPASS "test succeeded"
-}
-
 zram_set_disksizes()
 {
 	local i=0
@@ -163,66 +134,3 @@ zram_set_memlimit()
 
 	tst_res TPASS "test succeeded"
 }
-
-zram_makeswap()
-{
-	tst_res TINFO "make swap with zram device(s)"
-	tst_require_cmds mkswap swapon swapoff
-	local i=0
-
-	for i in $(seq 0 $(($dev_num - 1))); do
-		ROD mkswap /dev/zram$i
-		ROD swapon /dev/zram$i
-		tst_res TINFO "done with /dev/zram$i"
-		dev_makeswap=$i
-	done
-
-	tst_res TPASS "making zram swap succeeded"
-}
-
-zram_swapoff()
-{
-	tst_require_cmds swapoff
-	local i
-
-	for i in $(seq 0 $dev_makeswap); do
-		ROD swapoff /dev/zram$i
-	done
-	dev_makeswap=-1
-
-	tst_res TPASS "swapoff completed"
-}
-
-zram_makefs()
-{
-	local i=0
-	local fs
-
-	for fs in $zram_filesystems; do
-		tst_res TINFO "make $fs filesystem on /dev/zram$i"
-		mkfs.$fs /dev/zram$i > err.log 2>&1
-		if [ $? -ne 0 ]; then
-			cat err.log
-			tst_brk TFAIL "failed to make $fs on /dev/zram$i"
-		fi
-
-		i=$(($i + 1))
-		[ $i -eq $dev_num ] && break
-	done
-
-	tst_res TPASS "zram_makefs succeeded"
-}
-
-zram_mount()
-{
-	local i=0
-
-	for i in $(seq 0 $(($dev_num - 1))); do
-		tst_res TINFO "mount /dev/zram$i"
-		mkdir zram$i
-		ROD mount /dev/zram$i zram$i
-		dev_mounted=$i
-	done
-
-	tst_res TPASS "mount of zram device(s) succeeded"
-}
-- 
2.30.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
