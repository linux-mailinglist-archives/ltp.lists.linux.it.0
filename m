Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTP id 1E92E163F11
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Feb 2020 09:30:36 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0180B3C2530
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Feb 2020 09:30:36 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id A0D453C104E
 for <ltp@lists.linux.it>; Wed, 19 Feb 2020 09:30:32 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 1D4BC601A67
 for <ltp@lists.linux.it>; Wed, 19 Feb 2020 09:30:31 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5F7DAAEAC;
 Wed, 19 Feb 2020 08:30:31 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 19 Feb 2020 09:30:19 +0100
Message-Id: <20200219083019.22799-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] fsmount01: Avoid leaving file descriptor open
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Hi,

this is probably not needed, as fd will be closed at program exit
anyway.

Kind regards,
Petr

 testcases/kernel/syscalls/fsmount/fsmount01.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/testcases/kernel/syscalls/fsmount/fsmount01.c b/testcases/kernel/syscalls/fsmount/fsmount01.c
index 83185b48a..aea050506 100644
--- a/testcases/kernel/syscalls/fsmount/fsmount01.c
+++ b/testcases/kernel/syscalls/fsmount/fsmount01.c
@@ -16,6 +16,7 @@
 
 #define LINELENGTH 256
 #define MNTPOINT "newmount_point"
+
 static int sfd, mfd, is_mounted;
 
 static int ismount(char *mntpoint)
@@ -38,6 +39,9 @@ static int ismount(char *mntpoint)
 
 static void cleanup(void)
 {
+	if (sfd > 0)
+		SAFE_CLOSE(sfd);
+
 	if (is_mounted)
 		SAFE_UMOUNT(MNTPOINT);
 }
@@ -67,7 +71,6 @@ static void test_fsmount(void)
 		tst_brk(TBROK | TTERRNO, "fsmount() failed to create a mount object");
 	mfd = TST_RET;
 	tst_res(TPASS, "fsmount() created a mount object");
-	SAFE_CLOSE(sfd);
 
 	TEST(move_mount(mfd, "", AT_FDCWD, MNTPOINT, MOVE_MOUNT_F_EMPTY_PATH));
 	if (TST_RET < 0)
-- 
2.25.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
