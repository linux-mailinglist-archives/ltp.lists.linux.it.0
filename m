Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B5B32946E
	for <lists+linux-ltp@lfdr.de>; Mon,  1 Mar 2021 23:03:09 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DD4413C6E96
	for <lists+linux-ltp@lfdr.de>; Mon,  1 Mar 2021 23:03:08 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 7BD063C65A9
 for <ltp@lists.linux.it>; Mon,  1 Mar 2021 23:02:32 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id D415A10005C3
 for <ltp@lists.linux.it>; Mon,  1 Mar 2021 23:02:31 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6BC40AF47;
 Mon,  1 Mar 2021 22:02:31 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Mon,  1 Mar 2021 23:02:19 +0100
Message-Id: <20210301220222.22705-5-pvorel@suse.cz>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210301220222.22705-1-pvorel@suse.cz>
References: <20210301220222.22705-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 4/7] zram: Move test specific functions out of
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Refactoring, as code is confusing enough, when use global variables and
functions which are single test specific + there is zram_fill_fs already
in zram01.sh.

Reviewed-by: Li Wang <liwang@redhat.com>
Reviewed-by: Cyril Hrubis <chrubis@suse.cz>
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Changes v2->v3:
* keep zram_compress_alg() here due it's use in zram01.sh (Cyril)

 .../kernel/device-drivers/zram/zram01.sh      | 33 ++++++++++
 .../kernel/device-drivers/zram/zram02.sh      | 29 +++++++++
 .../kernel/device-drivers/zram/zram_lib.sh    | 62 -------------------
 3 files changed, 62 insertions(+), 62 deletions(-)

diff --git a/testcases/kernel/device-drivers/zram/zram01.sh b/testcases/kernel/device-drivers/zram/zram01.sh
index 54f7d0ebd..6dce89325 100755
--- a/testcases/kernel/device-drivers/zram/zram01.sh
+++ b/testcases/kernel/device-drivers/zram/zram01.sh
@@ -66,6 +66,39 @@ setup()
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
index d09977ec1..f0421ce7f 100755
--- a/testcases/kernel/device-drivers/zram/zram02.sh
+++ b/testcases/kernel/device-drivers/zram/zram02.sh
@@ -23,6 +23,35 @@ zram_max_streams="2"
 zram_sizes="107374182400" # 100GB
 zram_mem_limits="1M"
 
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
index c0a9f4618..65e431e86 100755
--- a/testcases/kernel/device-drivers/zram/zram_lib.sh
+++ b/testcases/kernel/device-drivers/zram/zram_lib.sh
@@ -161,65 +161,3 @@ zram_set_memlimit()
 
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
2.30.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
