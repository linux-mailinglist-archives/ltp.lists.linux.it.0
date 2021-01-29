Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 88ACE308D8C
	for <lists+linux-ltp@lfdr.de>; Fri, 29 Jan 2021 20:42:56 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 32CA73C7817
	for <lists+linux-ltp@lfdr.de>; Fri, 29 Jan 2021 20:42:56 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 2B5F63C77F8
 for <ltp@lists.linux.it>; Fri, 29 Jan 2021 20:42:00 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 288891A00900
 for <ltp@lists.linux.it>; Fri, 29 Jan 2021 20:42:00 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BEE1AB117;
 Fri, 29 Jan 2021 19:41:59 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 29 Jan 2021 20:41:40 +0100
Message-Id: <20210129194144.31299-3-pvorel@suse.cz>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210129194144.31299-1-pvorel@suse.cz>
References: <20210129194144.31299-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=LOTS_OF_MONEY,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v2 2/6] zram01.sh: Generate test setup variables in
 setup
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

Generate variables in setup, based on output of tst_supported_fs.
This is more clean approach and it fixes various things:

* Error when there is no filesystem support and also mkfs.ext2
  (fallback) not installed:
/opt/ltp/testcases/bin/zram01.sh: line 198: mkfs.ext2: not found
Instead quit if there is no fs support. But this can lead to skipping
zram_compress_alg(), it will be solved next commit by moving
zram_compress_alg() to zram02.sh.

* Having ext2 as fallback could lead to run it more than once.
There is no much point to do that.

* Drop tst_require_cmds mkfs check, because mkfs is not actually needed.

Improvements:

* Test all suitable filesystems (will need increase timeout).

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
changes v1->v2:
Completely rewritten.

 .../kernel/device-drivers/zram/zram01.sh      | 62 ++++++++++++++-----
 .../kernel/device-drivers/zram/zram_lib.sh    | 18 +++---
 2 files changed, 56 insertions(+), 24 deletions(-)

diff --git a/testcases/kernel/device-drivers/zram/zram01.sh b/testcases/kernel/device-drivers/zram/zram01.sh
index a795ff89f..c5d4a3e51 100755
--- a/testcases/kernel/device-drivers/zram/zram01.sh
+++ b/testcases/kernel/device-drivers/zram/zram01.sh
@@ -8,23 +8,25 @@
 
 TST_CNT=7
 TST_TESTFUNC="do_test"
-TST_NEEDS_CMDS="awk bc dd"
+TST_NEEDS_CMDS="awk bc dd grep"
 . zram_lib.sh
+TST_SETUP="setup"
 
-# List of parameters for zram devices.
-# For each number the test creates own zram device.
-zram_max_streams="2 3 5 8"
-
-FS_SIZE="402653184"
-FS_TYPE="btrfs"
+get_btrfs_size()
+{
+	local ram_size
 
-RAM_SIZE=$(awk '/MemTotal:/ {print $2}' /proc/meminfo)
-if [ "$RAM_SIZE" -lt 1048576 ]; then
-	tst_res TINFO "not enough space for Btrfs"
-	FS_SIZE="26214400"
-	FS_TYPE="ext2"
-fi
+	ram_size=$(awk '/MemTotal:/ {print $2}' /proc/meminfo)
+	if [ "$ram_size" -lt 1048576 ]; then
+		tst_res TINFO "not enough space for Btrfs"
+		return 1
+	fi
+	return 0
+}
 
+# List of parameters for zram devices.
+# For each number the test creates own zram device.
+# NOTE about size:
 # The zram sysfs node 'disksize' value can be either in bytes,
 # or you can use mem suffixes. But in some old kernels, mem
 # suffixes are not supported, for example, in RHEL6.6GA's kernel
@@ -32,9 +34,37 @@ fi
 # not support mem suffixes, in some newer kernels, they use
 # memparse() which supports mem suffixes. So here we just use
 # bytes to make sure everything works correctly.
-zram_sizes="26214400 26214400 26214400 $FS_SIZE"
-zram_mem_limits="25M 25M 25M $((FS_SIZE/1024/1024))M"
-zram_filesystems="ext3 ext4 xfs $FS_TYPE"
+generate_vars()
+{
+	local fs limit size stream=-1
+	dev_num=0
+
+	for fs in $(tst_supported_fs | grep -v -e fat -e ntfs -e fuse); do
+		size="26214400"
+		limit="25M"
+		if [ "$fs" = "btrfs" ]; then
+			get_btrfs_size || continue
+			size="402653184"
+			limit="$((size/1024/1024))M"
+		fi
+
+		stream=$((stream+3))
+		dev_num=$((dev_num+1))
+		zram_filesystems="$zram_filesystems $fs"
+		zram_mem_limits="$zram_mem_limits $limit"
+		zram_sizes="$zram_sizes $size"
+		zram_max_streams="$zram_max_streams $stream"
+	done
+
+	[ $dev_num -eq 0 ] && \
+		tst_brk TCONF "no suitable filesystem"
+}
+
+setup()
+{
+	generate_vars
+	zram_load
+}
 
 zram_fill_fs()
 {
diff --git a/testcases/kernel/device-drivers/zram/zram_lib.sh b/testcases/kernel/device-drivers/zram/zram_lib.sh
index a7e8b9f5b..d4aaf0c3e 100755
--- a/testcases/kernel/device-drivers/zram/zram_lib.sh
+++ b/testcases/kernel/device-drivers/zram/zram_lib.sh
@@ -36,10 +36,12 @@ zram_load()
 {
 	local tmp
 
-	dev_num=0
-	for tmp in $zram_max_streams; do
-		dev_num=$((dev_num+1))
-	done
+	if [ -z "$dev_num" ]; then
+		dev_num=0
+		for tmp in $zram_max_streams; do
+			dev_num=$((dev_num+1))
+		done
+	fi
 
 	if [ $dev_num -le 0 ]; then
 		tst_brk TBROK "dev_num must be > 0"
@@ -129,6 +131,7 @@ zram_set_disksizes()
 
 		i=$(($i + 1))
 		tst_res TINFO "$sys_path = '$ds' ($i/$dev_num)"
+		[ $i -eq $dev_num ] && break
 	done
 
 	tst_res TPASS "test succeeded"
@@ -155,6 +158,7 @@ zram_set_memlimit()
 
 		i=$(($i + 1))
 		tst_res TINFO "$sys_path = '$ds' ($i/$dev_num)"
+		[ $i -eq $dev_num ] && break
 	done
 
 	tst_res TPASS "test succeeded"
@@ -191,13 +195,10 @@ zram_swapoff()
 
 zram_makefs()
 {
-	tst_require_cmds mkfs
 	local i=0
+	local fs
 
 	for fs in $zram_filesystems; do
-		# if requested fs not supported default it to ext2
-		tst_supported_fs $fs 2> /dev/null || fs=ext2
-
 		tst_res TINFO "make $fs filesystem on /dev/zram$i"
 		mkfs.$fs /dev/zram$i > err.log 2>&1
 		if [ $? -ne 0 ]; then
@@ -206,6 +207,7 @@ zram_makefs()
 		fi
 
 		i=$(($i + 1))
+		[ $i -eq $dev_num ] && break
 	done
 
 	tst_res TPASS "zram_makefs succeeded"
-- 
2.30.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
