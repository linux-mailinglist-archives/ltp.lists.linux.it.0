Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B1E3525AA
	for <lists+linux-ltp@lfdr.de>; Fri,  2 Apr 2021 05:23:04 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 86B463C87CF
	for <lists+linux-ltp@lfdr.de>; Fri,  2 Apr 2021 05:23:03 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BC4493C229A
 for <ltp@lists.linux.it>; Fri,  2 Apr 2021 05:22:58 +0200 (CEST)
Received: from lucky1.263xmail.com (lucky1.263xmail.com [211.157.147.131])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 7E5F21A0049D
 for <ltp@lists.linux.it>; Fri,  2 Apr 2021 05:22:54 +0200 (CEST)
Received: from localhost (unknown [192.168.167.235])
 by lucky1.263xmail.com (Postfix) with ESMTP id B0800B9E22
 for <ltp@lists.linux.it>; Fri,  2 Apr 2021 11:22:51 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [58.240.82.166])
 by smtp.263.net (postfix) whith ESMTP id
 P26788T139903472449280S1617333766613121_; 
 Fri, 02 Apr 2021 11:22:51 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <eba0b244ddf89fe837d752a009b2236a>
X-RL-SENDER: zhanglianjie@uniontech.com
X-SENDER: zhanglianjie@uniontech.com
X-LOGIN-NAME: zhanglianjie@uniontech.com
X-FST-TO: pvorel@suse.cz
X-SENDER-IP: 58.240.82.166
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
From: zhanglianjie <zhanglianjie@uniontech.com>
To: pvorel@suse.cz
Date: Fri,  2 Apr 2021 11:19:34 +0800
Message-Id: <20210402031934.14615-1-zhanglianjie@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] fs/iso9660: bugfix for iso9660/isofs.sh
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
>Hi,
>
>> Debian uses genisoimage to replace mkisofs, the prompt of genisoimage
>> is the same as that of mkisofs.
>
>...
>> +++ b/testcases/kernel/fs/iso9660/isofs.sh
>> @@ -12,6 +12,12 @@
>> TST_NEEDS_CMDS="mkisofs"
>> TST_NEEDS_TMPDIR=1
>> TST_TESTFUNC=do_test
>> +which mkisofs >/dev/null 2>&1
>> +if [ $? -ne 0 ]; then
>> + TST_NEEDS_CMDS="genisoimage"
>> +fi
>
>You can omit whole $? check:
>
>if ! which mkisofs >/dev/null 2>&1; then
>TST_NEEDS_CMDS="genisoimage"
>fi
>
>Also IMHO mkisofs is not dead [1], it just moved to schilytools [2] and some
>distros use it (at least openSUSE [3]).
>Thus asking for genisoimage (from cdrkit) can be a bit misleading.
>
>But, is it really needed? Both Debian [4] and Fedora [5] creates
>mkisofs symlink to genisoimage, Debian installs automatically genisoimage when
>installing mkisofs.
>
>Kind regards,
>Petr
>
>[1] https://wiki.osdev.org/Mkisofs
>[2] http://sf.net/projects/schilytools/files/
>[3] https://build.opensuse.org/package/show/utilities/schily
>[4] https://tracker.debian.org/media/packages/c/cdrkit/changelog-91.1.11-3.2
>[5] https://src.fedoraproject.org/rpms/cdrkit/blob/rawhide/f/cdrkit.spec
>
>> +MKISOFS_CMD=$TST_NEEDS_CMDS


Currently in Debian, only the package genisoimage in sid and bullseye contains mkisofs,
and there is no deb package of mkisofs in architectures such as mips. In addition, 
this patch increases compatibility and is better than the previous one. 
It is necessary to modify it.
Reference: https://packages.debian.org/search?suite=sid&searchon=contents&keywords=mkisofs 

According to your suggestion, the revised patch:
---
 testcases/kernel/fs/iso9660/isofs.sh | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/testcases/kernel/fs/iso9660/isofs.sh b/testcases/kernel/fs/iso9660/isofs.sh
index 9de3f7cdc..1da3a398f 100755
--- a/testcases/kernel/fs/iso9660/isofs.sh
+++ b/testcases/kernel/fs/iso9660/isofs.sh
@@ -12,6 +12,11 @@
 TST_NEEDS_CMDS="mkisofs"
 TST_NEEDS_TMPDIR=1
 TST_TESTFUNC=do_test
+if ! which mkisofs >/dev/null 2>&1; then
+       TST_NEEDS_CMDS="genisoimage"
+fi
+MKISOFS_CMD=$TST_NEEDS_CMDS
+
 . tst_test.sh

 MAX_DEPTH=3
@@ -56,7 +61,7 @@ do_test() {
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
