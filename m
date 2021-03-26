Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8788234E369
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Mar 2021 10:43:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 547F73C2576
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Mar 2021 10:43:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id AF84D3C78A2
 for <ltp@lists.linux.it>; Fri, 26 Mar 2021 02:43:48 +0100 (CET)
Received: from lucky1.263xmail.com (lucky1.263xmail.com [211.157.147.135])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id D9F2B14004E7
 for <ltp@lists.linux.it>; Fri, 26 Mar 2021 02:43:44 +0100 (CET)
Received: from localhost (unknown [192.168.167.70])
 by lucky1.263xmail.com (Postfix) with ESMTP id DD61FA85F3
 for <ltp@lists.linux.it>; Fri, 26 Mar 2021 09:43:39 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED: 0
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [58.240.82.166])
 by smtp.263.net (postfix) whith ESMTP id
 P13407T140450298054400S1616723015905840_; 
 Fri, 26 Mar 2021 09:43:39 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <013eebecd7ced767ad4790b8cfa916e1>
X-RL-SENDER: zhanglianjie@uniontech.com
X-SENDER: zhanglianjie@uniontech.com
X-LOGIN-NAME: zhanglianjie@uniontech.com
X-FST-TO: ltp@lists.linux.it
X-SENDER-IP: 58.240.82.166
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
From: zhanglianjie <zhanglianjie@uniontech.com>
To: ltp@lists.linux.it
Date: Fri, 26 Mar 2021 09:41:37 +0800
Message-Id: <20210326014137.15718-1-zhanglianjie@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
X-Mailman-Approved-At: Tue, 30 Mar 2021 10:43:54 +0200
Subject: [LTP] [PATCH] fs/iso9660: bugfix for iso9660/isofs.sh
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

Debian uses genisoimage to replace mkisofs, the prompt of genisoimage
is the same as that of mkisofs.

Signed-off-by: zhanglianjie <zhanglianjie@uniontech.com>
---
 testcases/kernel/fs/iso9660/isofs.sh | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/testcases/kernel/fs/iso9660/isofs.sh b/testcases/kernel/fs/iso9660/isofs.sh
index 9de3f7cdc..69ab6e357 100755
--- a/testcases/kernel/fs/iso9660/isofs.sh
+++ b/testcases/kernel/fs/iso9660/isofs.sh
@@ -12,6 +12,12 @@
 TST_NEEDS_CMDS="mkisofs"
 TST_NEEDS_TMPDIR=1
 TST_TESTFUNC=do_test
+which mkisofs >/dev/null 2>&1
+if [ $? -ne 0 ]; then
+       TST_NEEDS_CMDS="genisoimage"
+fi
+MKISOFS_CMD=$TST_NEEDS_CMDS
+
 . tst_test.sh

 MAX_DEPTH=3
@@ -56,7 +62,7 @@ do_test() {
 		"-allow-lowercase -allow-multidot -iso-level 3 -f -l -D -J -allow-leading-dots -R"
 	do
 		rm -f isofs.iso
-		EXPECT_PASS mkisofs -o isofs.iso -quiet $mkisofs_opt $make_file_sys_dir 2\> /dev/null \
+		EXPECT_PASS $MKISOFS_CMD -o isofs.iso -quiet $mkisofs_opt $make_file_sys_dir 2\> /dev/null \
 			|| continue

 		for mount_opt in \
--
2.20.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
