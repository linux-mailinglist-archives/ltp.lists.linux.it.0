Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FAF95E816
	for <lists+linux-ltp@lfdr.de>; Wed,  3 Jul 2019 17:47:24 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8B8923C1DBE
	for <lists+linux-ltp@lfdr.de>; Wed,  3 Jul 2019 17:47:23 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 672523C1D67
 for <ltp@lists.linux.it>; Wed,  3 Jul 2019 17:47:20 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id C79D3600B44
 for <ltp@lists.linux.it>; Wed,  3 Jul 2019 17:47:21 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 444B6AE56;
 Wed,  3 Jul 2019 15:47:18 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Wed,  3 Jul 2019 17:47:09 +0200
Message-Id: <20190703154709.20863-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] syscalls/ioctl08: Require btrfs
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

Test requires btrfs otherwise it fails:
WARNING: failed to open /dev/btrfs-control, skipping device
registration: No such file or directory
safe_macros.c:757: BROK: tst_test.c:752: mount(/dev/loop0, mnt_point,
btrfs, 0, (nil)) failed: ENODEV

Cc: Christian Amann <camann@suse.com>
Reported-by: Amir Goldstein <amir73il@gmail.com>
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Hi Amir,

thanks a lot for a report and sorry for longer time to reply (vacation).
Could you please test it? (I don't have any VM with kernel >= 4.5 && !btrfs).

Kind regards,
Petr

 testcases/kernel/syscalls/ioctl/ioctl08.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/testcases/kernel/syscalls/ioctl/ioctl08.c b/testcases/kernel/syscalls/ioctl/ioctl08.c
index 8de80048c..dca898a65 100644
--- a/testcases/kernel/syscalls/ioctl/ioctl08.c
+++ b/testcases/kernel/syscalls/ioctl/ioctl08.c
@@ -112,6 +112,11 @@ static void setup(void)
 			sizeof(struct file_dedupe_range_info));
 }
 
+static const char *const needed_drivers[] = {
+	"btrfs",
+	NULL,
+};
+
 static struct tst_test test = {
 	.test = verify_ioctl,
 	.tcnt = ARRAY_SIZE(tcases),
@@ -122,6 +127,7 @@ static struct tst_test test = {
 	.mount_device = 1,
 	.mntpoint = MNTPOINT,
 	.dev_fs_type = "btrfs",
+	.needs_drivers = needed_drivers,
 };
 #else
 	TST_TEST_TCONF(
-- 
2.21.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
