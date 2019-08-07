Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B1AA2848B7
	for <lists+linux-ltp@lfdr.de>; Wed,  7 Aug 2019 11:41:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 133243C1D47
	for <lists+linux-ltp@lfdr.de>; Wed,  7 Aug 2019 11:41:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id DACC63C1860
 for <ltp@lists.linux.it>; Wed,  7 Aug 2019 11:41:27 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 437F91401658
 for <ltp@lists.linux.it>; Wed,  7 Aug 2019 11:41:25 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5BEEBB0B6;
 Wed,  7 Aug 2019 09:41:25 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Wed,  7 Aug 2019 11:41:19 +0200
Message-Id: <20190807094119.10834-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/copy_file_range02: Fix #12 when TMPDIR is on
 tmpfs or ext[234]
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
Cc: "Darrick J . Wong" <darrick.wong@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Recent fix 96e6e8f4a68d ("vfs: add missing checks to copy_file_range")
in kernel v5.3-rc1 changed errno for ext[234] and tmpfs to EINVAL.

+ fix typo from 0242a9a29

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Hi all,

Amir, Darrick, am I right that it's not a problem that errno changed
recently, is it? There have been more errno changes due several fixes in
copy_file_range() in the past. I've seen this approach several times in
other subsystems (e.g. network). Hope userspace not often check for
particular error.

Cyril, Jan, Li, still not sure what the policy about errno is (see
Cyril's statements in recent discussion about it in Jinhui's patch [1]
[2]). With these frequent changes we should IMHO check for all possible
variants (EXDEV, EFBIG, EINVAL).

Or should we investigate all fixes and keep errors which highlight
important fix was not backported (to both stable and LTS/enterprise
distros kernels?). That'd be weird but approach practical :).

Anyway, we should define and write down LTP policy / rules about it.

Kind regards,
Petr

[1] https://patchwork.ozlabs.org/patch/1108229/#2182801
[2] https://patchwork.ozlabs.org/patch/1108229/#2182837

 .../copy_file_range/copy_file_range02.c       | 20 +++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c b/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c
index 9004c4a40..b113e44b5 100644
--- a/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c
+++ b/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c
@@ -49,6 +49,7 @@ static int fd_blkdev;
 static int fd_chrdev;
 static int fd_fifo;
 static int fd_copy;
+static int fd_copy2;
 
 static int chattr_i_nsup;
 static int swap_nsup;
@@ -73,8 +74,8 @@ static struct tcase {
 	{&fd_blkdev,    0,   EINVAL,     0,     CONTSIZE, "block device"},
 	{&fd_chrdev,    0,   EINVAL,     0,     CONTSIZE, "char device"},
 	{&fd_fifo,      0,   EINVAL,     0,     CONTSIZE, "fifo"},
-	{&fd_copy,      0,   EOVERFLOW,  MAX_OFF, ULLONG_MAX, "max length lenght"},
-	{&fd_copy,      0,   EFBIG,      MAX_OFF, MIN_OFF, "max file size"},
+	{&fd_copy,      0,   EOVERFLOW,  MAX_OFF, ULLONG_MAX, "max length"},
+	{&fd_copy2,     0,   EFBIG,      MAX_OFF, MIN_OFF, "max file size"},
 };
 
 static int run_command(char *command, char *option, char *file)
@@ -100,6 +101,7 @@ static void verify_copy_file_range(unsigned int n)
 	struct tcase *tc = &tcases[n];
 	tst_res(TINFO, "Test #%d: %s", n, tc->tname);
 
+
 	if (tc->copy_to_fd == &fd_immutable && chattr_i_nsup) {
 		tst_res(TCONF, "filesystem doesn't support chattr +i, skip it");
 		return;
@@ -112,6 +114,20 @@ static void verify_copy_file_range(unsigned int n)
 		tst_res(TCONF, "filesystem doesn't have free loopdev, skip it");
 		return;
 	}
+
+	if (tc->copy_to_fd == &fd_copy2) {
+		long fs_type = tst_fs_type(".");
+		switch (fs_type) {
+		case TST_TMPFS_MAGIC:
+		case TST_EXT234_MAGIC:
+		default:
+			tc->exp_err = EINVAL;
+			tst_res(TINFO, "%s filesystem, changing expecting errno to %d",
+					tst_fs_type_name(fs_type), tc->exp_err);
+			break;
+		}
+	}
+
 	TEST(sys_copy_file_range(fd_src, 0, *tc->copy_to_fd,
 				&tc->dst, tc->len, tc->flags));
 
-- 
2.22.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
