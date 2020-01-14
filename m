Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BD65813A9A4
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Jan 2020 13:49:06 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 66FBE3C2245
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Jan 2020 13:49:06 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 4BF683C0B93
 for <ltp@lists.linux.it>; Tue, 14 Jan 2020 13:49:02 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 90923600BCA
 for <ltp@lists.linux.it>; Tue, 14 Jan 2020 13:48:48 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B039CAD9F
 for <ltp@lists.linux.it>; Tue, 14 Jan 2020 12:49:00 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 14 Jan 2020 13:48:59 +0100
Message-Id: <20200114124900.22223-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/statx05: Fix failures on s390 & old libc
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

When encryption is not enabled in the kernel e4crypt fails with non-zero
exit value. The value is then stored to long via the TEST() macro. The
problem is that WEXITSTATUS() does not work with long on big endian s390
on older libc[1][2]. And while this is not our bug, it also does not
make sense to misuse the TEST() macro for catching return value from
tst_test().

[1] https://sourceware.org/bugzilla/show_bug.cgi?id=19613
[2] https://sourceware.org/git/gitweb.cgi?p=glibc.git;h=b49ab5f4503f36dcbf43f821f817da66b2931fe6

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 testcases/kernel/syscalls/statx/statx05.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/testcases/kernel/syscalls/statx/statx05.c b/testcases/kernel/syscalls/statx/statx05.c
index dd77e255c..42911fc17 100644
--- a/testcases/kernel/syscalls/statx/statx05.c
+++ b/testcases/kernel/syscalls/statx/statx05.c
@@ -88,6 +88,7 @@ static void setup(void)
 {
 	char opt_bsize[32];
 	const char *const extra_opts[] = {"-O encrypt", opt_bsize, NULL};
+	int ret;
 
 	snprintf(opt_bsize, sizeof(opt_bsize), "-b %i", getpagesize());
 
@@ -98,12 +99,12 @@ static void setup(void)
 	SAFE_MKDIR(TESTDIR_FLAGGED, 0777);
 	SAFE_MKDIR(TESTDIR_UNFLAGGED, 0777);
 
-	TEST(tst_system("echo qwery | e4crypt add_key "TESTDIR_FLAGGED));
+	ret = tst_system("echo qwery | e4crypt add_key "TESTDIR_FLAGGED);
 
-	if (WEXITSTATUS(TST_RET) == 127)
+	if (WEXITSTATUS(ret) == 127)
 		tst_brk(TCONF, "e4crypt not installed!");
 
-	if (WEXITSTATUS(TST_RET))
+	if (WEXITSTATUS(ret))
 		tst_brk(TCONF, "e4crypt failed (CONFIG_EXT4_ENCRYPTION not set?)");
 }
 
-- 
2.23.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
