Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B264C35616A
	for <lists+linux-ltp@lfdr.de>; Wed,  7 Apr 2021 04:31:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E54223C813D
	for <lists+linux-ltp@lfdr.de>; Wed,  7 Apr 2021 04:31:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 9C1AA3C20AD
 for <ltp@lists.linux.it>; Wed,  7 Apr 2021 04:31:46 +0200 (CEST)
Received: from vipregular1.263.net (vipregular1.263.net [211.150.80.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 3E42F100197D
 for <ltp@lists.linux.it>; Wed,  7 Apr 2021 04:31:41 +0200 (CEST)
Received: from localhost (unknown [192.168.167.139])
 by vipregular1.263.net (Postfix) with ESMTP id AEE5D31A;
 Wed,  7 Apr 2021 10:31:35 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [58.240.82.166])
 by smtp.263.net (postfix) whith ESMTP id
 P6248T139731565750016S1617762691395721_; 
 Wed, 07 Apr 2021 10:31:35 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <9f85b1337be8b674c4efcdfaf10f5fde>
X-RL-SENDER: zhanglianjie@uniontech.com
X-SENDER: zhanglianjie@uniontech.com
X-LOGIN-NAME: zhanglianjie@uniontech.com
X-FST-TO: pvorel@suse.cz
X-SENDER-IP: 58.240.82.166
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
From: zhanglianjie <zhanglianjie@uniontech.com>
To: pvorel@suse.cz
Date: Wed,  7 Apr 2021 10:31:29 +0800
Message-Id: <20210407023129.13248-1-zhanglianjie@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] bugfix for iso9660/isofs.sh
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,
...
<Well, bullseye is stable. But ok, some people might care about oldstable (we
<test it built LTP in Travis) and even oldoldstable.
<
<Actually, this depends on which (take look on tst_cmd_available(), it also uses
<command and trying to use which only if missing). And also it's misleading to
<suggest to use only genisoimage.
<
<Although for our documentation ("docparse"), it'd be better to use
<TST_NEEDS_CMDS, until (if ever) shell API supports logical OR (e.g.
<TST_NEEDS_CMDS="mkisofs|genisoimage") it'd be better to avoid TST_NEEDS_CMDS and
<decide in the setup. Thus if you don't mind I'll merge this fix with you as an author:
<
<setup()
<{
<if ! tst_cmd_available mkisofs && ! tst_cmd_available genisoimage; then
<tst_brk TCONF "please install mkisofs or genisoimage"
<fi
<}

Thank you very much for your guidance, but I want to submit it myself. 
Because this is the first time I submit a patch in the community.

---
 testcases/kernel/fs/iso9660/isofs.sh | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/testcases/kernel/fs/iso9660/isofs.sh b/testcases/kernel/fs/iso9660/isofs.sh
index 9de3f7cdc..c0e2d1ff8 100755
--- a/testcases/kernel/fs/iso9660/isofs.sh
+++ b/testcases/kernel/fs/iso9660/isofs.sh
@@ -9,14 +9,26 @@
 # It makes ISO9660 file system with different options and also
 # mounts ISO9660 file system with different mount options.

-TST_NEEDS_CMDS="mkisofs"
 TST_NEEDS_TMPDIR=1
 TST_TESTFUNC=do_test
+TST_SETUP=setup
+
 . tst_test.sh

 MAX_DEPTH=3
 MAX_DIRS=4

+setup()
+{
+	if tst_cmd_available mkisofs; then
+		MKISOFS_CMD="mkisofs"
+	elif tst_cmd_available genisoimage; then
+		MKISOFS_CMD="genisoimage"
+	else
+		tst_brk TCONF "please install mkisofs or genisoimage"
+	fi
+}
+
 gen_fs_tree()
 {
 	local cur_path="$1"
@@ -56,7 +68,7 @@ do_test() {
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
