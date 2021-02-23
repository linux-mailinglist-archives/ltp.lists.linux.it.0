Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 01AF9322BE2
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Feb 2021 15:04:28 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 89DA83C60CB
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Feb 2021 15:04:27 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 156B53C2BEF
 for <ltp@lists.linux.it>; Tue, 23 Feb 2021 15:04:23 +0100 (CET)
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 1521D60132B
 for <ltp@lists.linux.it>; Tue, 23 Feb 2021 15:04:21 +0100 (CET)
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DlLMs28X5zlNsm
 for <ltp@lists.linux.it>; Tue, 23 Feb 2021 22:02:17 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.63) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.498.0; Tue, 23 Feb 2021 22:04:07 +0800
From: Zhao Gongyi <zhaogongyi@huawei.com>
To: <ltp@lists.linux.it>
Date: Tue, 23 Feb 2021 22:03:23 +0800
Message-ID: <20210223140323.126555-1-zhaogongyi@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.63]
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH] unshare01.sh: Setup parent mount flag before unshare
 testing
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

We need setup parent mount flag to shared before unshare testing, or it will
fail for system which has no systemd service since the propagation flag is
changed by systemd. From man 7 mount_namespaces.

Signed-off-by: Zhao Gongyi <zhaogongyi@huawei.com>
---
 testcases/commands/unshare/unshare01.sh | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/testcases/commands/unshare/unshare01.sh b/testcases/commands/unshare/unshare01.sh
index bf163a7f4..e1fb15035 100755
--- a/testcases/commands/unshare/unshare01.sh
+++ b/testcases/commands/unshare/unshare01.sh
@@ -31,7 +31,6 @@ TST_SETUP=setup
 TST_CLEANUP=cleanup
 TST_TESTFUNC=do_test
 TST_NEEDS_ROOT=1
-TST_NEEDS_TMPDIR=1
 TST_NEEDS_CMDS="unshare id mount umount"
 . tst_test.sh

@@ -39,6 +38,7 @@ max_userns_path="/proc/sys/user/max_user_namespaces"
 max_mntns_path="/proc/sys/user/max_mnt_namespaces"
 default_max_userns=-1
 default_max_mntns=-1
+CURR=$(pwd)

 setup()
 {
@@ -55,6 +55,10 @@ setup()
 		echo 1024 > "${max_mntns_path}"
 	fi

+	mkdir $CURR/dir_C
+	mount -t tmpfs none dir_C
+	mount --make-shared dir_C
+	cd dir_C
 	mkdir -p dir_A dir_B
 	touch dir_A/A dir_B/B
 }
@@ -66,6 +70,9 @@ cleanup()
 		echo ${default_max_userns} > "${max_userns_path}"
 	[ ${default_max_mntns} -ne -1 ] && \
 		echo ${default_max_mntns} > "${max_mntns_path}"
+	cd $CURR
+	umount dir_C
+	rm -rf dir_C
 }

 check_id()
--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
