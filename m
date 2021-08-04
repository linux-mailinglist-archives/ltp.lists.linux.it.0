Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 89FAF3DF976
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Aug 2021 03:56:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4B3BF3C87E7
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Aug 2021 03:56:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5F0F63C2116
 for <ltp@lists.linux.it>; Wed,  4 Aug 2021 03:56:11 +0200 (CEST)
Received: from ATCSQR.andestech.com (atcsqr.andestech.com [60.248.187.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 815FA1400331
 for <ltp@lists.linux.it>; Wed,  4 Aug 2021 03:56:10 +0200 (CEST)
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id 1741tmHh035987;
 Wed, 4 Aug 2021 09:55:48 +0800 (GMT-8)
 (envelope-from ycliang@andestech.com)
Received: from andestech.com (10.0.15.65) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0; Wed, 4 Aug 2021
 09:55:45 +0800
Date: Wed, 4 Aug 2021 09:55:43 +0800
From: Leo Liang <ycliang@andestech.com>
To: <ltp@lists.linux.it>
Message-ID: <20210804015539.GA22997@andestech.com>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.0.15.65]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com 1741tmHh035987
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v6, 4/4] Make argument to tst_umount an absolute path
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
Cc: richiejp@f-m.fm, ycliang@cs.nctu.edu.tw, alankao@andestech.com,
 metan@ucw.cz
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

tst_umount only takes mount point as an argument,
so modify the argument to an absolute path for tst_umount.

Signed-off-by: Leo Yu-Chi Liang <ycliang@andestech.com>
---
 testcases/kernel/fs/quota_remount/quota_remount_test01.sh    | 2 +-
 testcases/kernel/security/integrity/ima/tests/evm_overlay.sh | 2 +-
 testcases/kernel/tracing/dynamic_debug/dynamic_debug01.sh    | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/testcases/kernel/fs/quota_remount/quota_remount_test01.sh b/testcases/kernel/fs/quota_remount/quota_remount_test01.sh
index e84716c03..1b4bdbb99 100755
--- a/testcases/kernel/fs/quota_remount/quota_remount_test01.sh
+++ b/testcases/kernel/fs/quota_remount/quota_remount_test01.sh
@@ -32,7 +32,7 @@ do_setup()
 do_clean()
 {
 	[ "$mounted" ] || return
-	tst_umount $MNTDIR
+	tst_umount $PWD/$MNTDIR
 	mounted=
 }
 
diff --git a/testcases/kernel/security/integrity/ima/tests/evm_overlay.sh b/testcases/kernel/security/integrity/ima/tests/evm_overlay.sh
index 9d86778b6..23a5ec556 100755
--- a/testcases/kernel/security/integrity/ima/tests/evm_overlay.sh
+++ b/testcases/kernel/security/integrity/ima/tests/evm_overlay.sh
@@ -83,7 +83,7 @@ cleanup()
 {
 	[ -n "$mounted" ] || return 0
 
-	tst_umount $TST_DEVICE
+	tst_umount $TST_MNTPOINT
 
 	TST_DEVICE="$device_backup"
 	TST_FS_TYPE="$fs_type_backup"
diff --git a/testcases/kernel/tracing/dynamic_debug/dynamic_debug01.sh b/testcases/kernel/tracing/dynamic_debug/dynamic_debug01.sh
index 7f06c2488..fd5ee06c8 100755
--- a/testcases/kernel/tracing/dynamic_debug/dynamic_debug01.sh
+++ b/testcases/kernel/tracing/dynamic_debug/dynamic_debug01.sh
@@ -38,7 +38,7 @@ mount_debugfs()
 		if ! grep -q debugfs /proc/filesystems ; then
 			tst_res TCONF "debugfs not supported"
 		fi
-		DEBUGFS_PATH="./tst_debug"
+		DEBUGFS_PATH="$PWD/tst_debug"
 		mkdir "$DEBUGFS_PATH"
 		if mount -t debugfs xxx "$DEBUGFS_PATH" ; then
 			tst_res TINFO "debugfs mounted at $DEBUGFS_PATH"
-- 
2.17.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
