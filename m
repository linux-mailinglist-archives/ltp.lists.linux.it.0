Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6073109B7
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Feb 2021 12:00:30 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BD8DC3C70F8
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Feb 2021 12:00:29 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id E3CA93C70DA
 for <ltp@lists.linux.it>; Fri,  5 Feb 2021 12:00:26 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 53D52601E1D
 for <ltp@lists.linux.it>; Fri,  5 Feb 2021 12:00:26 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 98492AD2E;
 Fri,  5 Feb 2021 11:00:25 +0000 (UTC)
Date: Fri, 5 Feb 2021 12:00:24 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>, Jan Stancek <jstancek@redhat.com>,
 thomas.petazzoni@bootlin.com, ltp@lists.linux.it
Message-ID: <YB0lSFi5LVAo6TPb@pevik>
References: <20210128171052.6025-1-kory.maincent@bootlin.com>
 <YBQdn3S9sPJT/wea@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YBQdn3S9sPJT/wea@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] quota_remount_test01: update to new API
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi all,

FYI patch merged with additional cleanup.
Kory, thanks for your work!

Kind regards,
Petr

diff --git testcases/kernel/fs/quota_remount/quota_remount_test01.sh testca=
ses/kernel/fs/quota_remount/quota_remount_test01.sh
index adcbbe846..a67e13903 100755
--- testcases/kernel/fs/quota_remount/quota_remount_test01.sh
+++ testcases/kernel/fs/quota_remount/quota_remount_test01.sh
@@ -2,79 +2,79 @@
 # SPDX-License-Identifier: GPL-2.0-or-later
 # Copyright (c) Jan Kara <jack@suse.cz>, 2008
 # Copyright (c) International Business Machines  Corp., 2009
-# Copyright (c) K=F6ry Maincent <kory.maincent@bootlin.com> 2020
+# Copyright (c) K=F6ry Maincent <kory.maincent@bootlin.com> 2021
+# Copyright (c) 2021 Petr Vorel <pvorel@suse.cz>
 =

-TST_NEEDS_CMDS=3D"quotacheck quotaon mkfs.ext3"
+TST_NEEDS_CMDS=3D"dd mkfs.ext3 mount quota quotacheck quotaon sed tail"
 TST_NEEDS_DRIVERS=3D"quota_v2"
+TST_NEEDS_ROOT=3D1
 TST_NEEDS_TMPDIR=3D1
 TST_SETUP=3Ddo_setup
 TST_CLEANUP=3Ddo_clean
 TST_TESTFUNC=3Ddo_test
+TST_MIN_KVER=3D"2.6.26"
 =

 . tst_test.sh
 =

 do_setup()
 {
-	if tst_kvcmp -lt "2.6.25"; then
-	        tst_res TCONF "Remounting with quotas enabled is not supported!"
-	        tst_brk TCONF "You should have kernel 2.6.26 and above running...=
.."
-	fi
-
 	if [ ! -d /proc/sys/fs/quota ]; then
-	        tst_brk TCONF "Quota not supported in kernel!"
-	        exit 0
+		tst_brk TCONF "quota not supported in kernel"
 	fi
-	MNTDIR=3D$TMPDIR/mnt
-	IMAGE=3Dltp-$$-fs-image
-	dd if=3D/dev/zero of=3D$IMAGE bs=3D4096 count=3D8000 2>/dev/null
-	mkfs.ext3 -q -F -b 4096 $IMAGE
+
+	MNTDIR=3D"mnt.$$"
+	IMAGE=3D"ltp-$$-fs-image"
+	ROD dd if=3D/dev/zero of=3D$IMAGE bs=3D4096 count=3D8000 2>/dev/null
+	ROD mkfs.ext3 -q -F -b 4096 $IMAGE
 	mkdir $MNTDIR
 }
 =

 do_clean()
 {
-	umount 2>/dev/null $MNTDIR
-	rm 2>/dev/null $IMAGE
+	[ "$mounted" ] || return
+	tst_umount $MNTDIR
+	mounted=3D
+}
+
+get_blocks()
+{
+	quota -f $MNTDIR -v -w | tail -n 1 | sed -e 's/ *[^ ]* *\([0-9]*\) .*/\1/'
 }
 =

 do_test()
 {
-	EXPECT_PASS mount -t ext3 -o loop,usrquota,grpquota $IMAGE $MNTDIR
-	tst_res TINFO "Successfully mounted the File System"
+	tst_res TINFO "testing quota on remount"
+
+	local blocks newblocks
+
+	ROD mount -t ext3 -o loop,usrquota,grpquota $IMAGE $MNTDIR
+	mounted=3D1
 =

 	# some distros (CentOS 6.x, for example) doesn't permit creating
 	# of quota files in a directory with SELinux file_t type
-	if [ -x /usr/sbin/selinuxenabled ] && /usr/sbin/selinuxenabled; then
-		chcon -t tmp_t $MNTDIR || tst_brk TFAIL "Could not change SELinux file t=
ype"
-		tst_res TINFO "Successfully changed SELinux file type"
+	if tst_selinux_enabled &&
+		tst_cmd_available chcon && ! chcon -t tmp_t $MNTDIR; then
+			tst_brk TCONF "could not change SELinux file type"
 	fi
 =

-	EXPECT_PASS quotacheck -cug $MNTDIR
-	tst_res TINFO "Successfully Created Quota Files"
+	ROD quotacheck -cug $MNTDIR
+	ROD quotaon -ug $MNTDIR
+	ROD echo "blah" />$MNTDIR/file
 =

-	EXPECT_PASS quotaon -ug $MNTDIR
-	tst_res TINFO "Successfully Turned on Quota"
+	blocks=3D$(get_blocks)
+	ROD mount -o remount,ro $MNTDIR
+	ROD mount -o remount,rw $MNTDIR
 =

-	EXPECT_PASS echo "blah" />$MNTDIR/file
-	tst_res TINFO "Successfully wrote to the filesystem"
+	ROD rm $MNTDIR/file
+	newblocks=3D$(get_blocks)
 =

-	# Get current quota usage
-	BLOCKS=3D`quota  -f $MNTDIR -v -w | tail -n 1 | sed -e 's/ *[^ ]* *\([0-9=
]*\) .*/\1/'`
-	EXPECT_PASS mount -o remount,ro $MNTDIR
-	tst_res TINFO "Successfully Remounted Read-Only FS"
+	if [ $blocks -eq $newblocks ]; then
+	   tst_brk TFAIL "usage did not change after remount"
+	fi
 =

-	EXPECT_PASS mount -o remount,rw $MNTDIR
-	tst_res TINFO "Successfully Remounted Read-Write FS"
+	tst_res TPASS "quota on remount passed"
 =

-	rm $MNTDIR/file
-	# Get quota usage after removing the file
-	NEWBLOCKS=3D`quota  -f $MNTDIR -v -w | tail -n 1 | sed -e 's/ *[^ ]* *\([=
0-9]*\) .*/\1/'`
-	# Has quota usage changed properly?
-	if [ $BLOCKS -eq $NEWBLOCKS ]; then
-	   tst_brk TWARN "Usage did not change after remount"
-	fi
-	tst_res TINFO "Usage successfully Changed after Remount"
-	tst_res TPASS "Quota on Remount Successfull"
+	do_clean
 }
 =

 tst_run

-- =

Mailing list info: https://lists.linux.it/listinfo/ltp
