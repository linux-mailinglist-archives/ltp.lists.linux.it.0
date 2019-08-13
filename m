Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 941508BCA8
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Aug 2019 17:10:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 18E4F3C1D2B
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Aug 2019 17:10:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 89ABF3C1D01
 for <ltp@lists.linux.it>; Tue, 13 Aug 2019 17:10:05 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 41FE820102A
 for <ltp@lists.linux.it>; Tue, 13 Aug 2019 17:10:03 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 690C5AF70;
 Tue, 13 Aug 2019 15:10:03 +0000 (UTC)
Date: Tue, 13 Aug 2019 17:10:01 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Jinhui huang <huangjh.jy@cn.fujitsu.com>
Message-ID: <20190813151001.GC23369@rei.lan>
References: <1564395109-7165-3-git-send-email-huangjh.jy@cn.fujitsu.com>
 <1564645349-10859-1-git-send-email-huangjh.jy@cn.fujitsu.com>
 <1564645349-10859-3-git-send-email-huangjh.jy@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1564645349-10859-3-git-send-email-huangjh.jy@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 3/3] syscalls/ftruncate: Rewrite ftruncate04
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

Hi!
Pushed with a few changes, thanks.

diff --git a/testcases/kernel/syscalls/ftruncate/ftruncate04.c b/testcases/kernel/syscalls/ftruncate/ftruncate04.c
index 097c283f4..53d395d1f 100644
--- a/testcases/kernel/syscalls/ftruncate/ftruncate04.c
+++ b/testcases/kernel/syscalls/ftruncate/ftruncate04.c
@@ -38,7 +38,7 @@
 #define MNTPOINT	"mntpoint"
 #define TESTFILE	MNTPOINT"/testfile"
 
-static int len = 1024;
+static int len = 8 * 1024;
                  ^
		  This was needlessly modified so I just returned it to
		  previous value.

 static int recstart, reclen;
 
 static void ftruncate_expect_fail(int fd, off_t offset, const char *msg)
@@ -151,14 +151,11 @@ static void verify_ftruncate(void)
 
 static void setup(void)
 {
-	struct statvfs fs;
-
-	if (statvfs(".", &fs) == -1)
-		tst_brk(TFAIL | TERRNO, "statvfs failed");
-
-	if ((fs.f_flag & MS_MANDLOCK))
-		return;
-

When the test was mounting the device in the setup this code was here to
skip the mkfs and mount in a case that the tmp was mounted with
mandatory locking, but after the change to .mount_device it became
meaningless. Moreover it would break the test in a case that the TMPDIR
was in fact mounted with mandatory locking.

+	 /*
+	  * Kernel returns EPERM when CONFIG_MANDATORY_FILE_LOCKING is not
+	  * supported - to avoid false negatives, mount the fs first without
+	  * flags and then remount it as MS_MANDLOCK
+	  */

And I've restored this comment as this is one of the places where it
makes sense to explain why we are not mounting the fs with MS_MANDLOCK
in the first place.

 	if (mount(NULL, MNTPOINT, NULL, MS_REMOUNT|MS_MANDLOCK, NULL) == -1) {
 		if (errno == EPERM) {
 			tst_brk(TCONF,
@@ -177,5 +174,6 @@ static struct tst_test test = {
 	.needs_tmpdir = 1,
 	.forks_child = 1,
 	.mount_device = 1,
+	.needs_root = 1,
 	.mntpoint = MNTPOINT,
 };

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
