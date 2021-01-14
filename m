Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7122F6997
	for <lists+linux-ltp@lfdr.de>; Thu, 14 Jan 2021 19:32:34 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4F8643C6A5C
	for <lists+linux-ltp@lfdr.de>; Thu, 14 Jan 2021 19:32:34 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 3D9E13C2649
 for <ltp@lists.linux.it>; Thu, 14 Jan 2021 19:32:33 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id ADFB260071D
 for <ltp@lists.linux.it>; Thu, 14 Jan 2021 19:32:32 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E3195B1C4;
 Thu, 14 Jan 2021 18:32:31 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 14 Jan 2021 19:32:26 +0100
Message-Id: <20210114183226.794-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] zram: Check properly command dependencies
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

Instead of relying that there is mkfs.ext2 as a backup,
search for supported default.

Always check ext2 (in case there is enough space for btrfs but
no mkfs.btrfs).

This fixes error when even the default ext2 is not supported:

zram01 5 TINFO: make ext2 filesystem on /dev/zram0
/opt/ltp/testcases/bin/zram01.sh: line 188: mkfs.ext2: not found
zram01 5 TFAIL: failed to make ext2 on /dev/zram0

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Hi,

fix to be merged before release.

NOTE: Bug affecting BusyBox needs to be discussed:
http://lists.linux.it/pipermail/ltp/2021-January/020568.html

Kind regards,
Petr

 .../kernel/device-drivers/zram/zram_lib.sh    | 21 +++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/testcases/kernel/device-drivers/zram/zram_lib.sh b/testcases/kernel/device-drivers/zram/zram_lib.sh
index 3f4d1d55f..1a611b974 100755
--- a/testcases/kernel/device-drivers/zram/zram_lib.sh
+++ b/testcases/kernel/device-drivers/zram/zram_lib.sh
@@ -178,13 +178,30 @@ zram_swapoff()
 zram_makefs()
 {
 	tst_require_cmds mkfs
+
+	local default_fs fs
 	local i=0
 
+	for fs in $zram_filesystems ext2; do
+		if tst_supported_fs $fs 2> /dev/null; then
+			default_fs="$fs"
+			break
+		fi
+	done
+
+	if [ -z "$default_fs" ]; then
+		tst_res TINFO "supported filesystems"
+		tst_supported_fs > /dev/null
+		tst_brk TCONF "missing kernel support or mkfs for all of these filesystems: $zram_filesystems"
+	fi
+
 	for fs in $zram_filesystems; do
-		# if requested fs not supported default it to ext2
-		tst_supported_fs $fs 2> /dev/null || fs=ext2
+		# use default if requested fs not supported or missing mkfs
+		tst_supported_fs $fs 2> /dev/null && tst_cmd_available mkfs.$fs \
+			|| fs=$default_fs
 
 		tst_res TINFO "make $fs filesystem on /dev/zram$i"
+
 		mkfs.$fs /dev/zram$i > err.log 2>&1
 		if [ $? -ne 0 ]; then
 			cat err.log
-- 
2.29.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
