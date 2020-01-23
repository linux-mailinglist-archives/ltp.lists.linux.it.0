Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 757C3146B5D
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Jan 2020 15:31:41 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2EB0A3C24ED
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Jan 2020 15:31:41 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 251B43C24B5
 for <ltp@lists.linux.it>; Thu, 23 Jan 2020 15:31:39 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 9DECB20114A
 for <ltp@lists.linux.it>; Thu, 23 Jan 2020 15:31:38 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id DD351AD3C;
 Thu, 23 Jan 2020 14:31:37 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 23 Jan 2020 15:31:37 +0100
Message-Id: <20200123143137.23214-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH] Fix prctl02
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

The prctl() system call takes 5 integer arguments but only 3 of them were
passed in the test. This means that the system call read random garbage
from stack in place of the two missing arguments and failed even on some
perfectly valid combinations of arguments on some platforms.

- Fixed arguments in test case 9 (second PR_SET_NO_NEW_PRIVS)
- Dropped test case 13 (PR_CAP_AMBIENT) because the args are valid
- Dropped test case 14 (PR_GET_SPECULATION_CTRL) because the args are valid
- Fixed test call of prctl() to have all 5 arguments

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
CC: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 testcases/kernel/syscalls/prctl/prctl02.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/testcases/kernel/syscalls/prctl/prctl02.c b/testcases/kernel/syscalls/prctl/prctl02.c
index 93f30b54a..7bf3684e5 100644
--- a/testcases/kernel/syscalls/prctl/prctl02.c
+++ b/testcases/kernel/syscalls/prctl/prctl02.c
@@ -23,13 +23,9 @@
  * arg4, arg5 is non-zero.
  * 12) prctl() fails with EINVAL when options is PR_GET_THP_DISABLE & arg2,
  * arg3, arg4, or arg5 is nonzero.
- * 13) prctl() fails with EINVAL when options is PR_CAP_AMBIENT & an unused
- * argument such as arg4 is nonzero.
- * 14) prctl() fails with EINVAL when option is PR_GET_SPECULATION_CTRL and
- * unused arguments is nonzero.
- * 15) prctl() fails with EPERM when option is PR_SET_SECUREBITS and the
+ * 13) prctl() fails with EPERM when option is PR_SET_SECUREBITS and the
  * caller does not have the CAP_SETPCAP capability.
- * 16) prctl() fails with EPERM when option is PR_CAPBSET_DROP and the caller
+ * 14) prctl() fails with EPERM when option is PR_CAPBSET_DROP and the caller
  * does not have the CAP_SETPCAP capability.
  */
 
@@ -87,12 +83,10 @@ static struct tcase {
 	{PR_SET_SECCOMP, &num_2, &strict_addr, EACCES, "PR_SET_SECCOMP"},
 	{PR_SET_TIMING, &num_1, &num_0, EINVAL, "PR_SET_TIMING"},
 	{PR_SET_NO_NEW_PRIVS, &num_0, &num_0, EINVAL, "PR_SET_NO_NEW_PRIVS"},
-	{PR_SET_NO_NEW_PRIVS, &num_1, &num_0, EINVAL, "PR_SET_NO_NEW_PRIVS"},
+	{PR_SET_NO_NEW_PRIVS, &num_1, &num_1, EINVAL, "PR_SET_NO_NEW_PRIVS"},
 	{PR_GET_NO_NEW_PRIVS, &num_1, &num_0, EINVAL, "PR_GET_NO_NEW_PRIVS"},
 	{PR_SET_THP_DISABLE, &num_0, &num_1, EINVAL, "PR_SET_THP_DISABLE"},
 	{PR_GET_THP_DISABLE, &num_1, &num_1, EINVAL, "PR_GET_THP_DISABLE"},
-	{PR_CAP_AMBIENT, &num_2, &num_1, EINVAL, "PR_CAP_AMBIENT"},
-	{PR_GET_SPECULATION_CTRL, &num_1, &num_0, EINVAL, "PR_GET_SPECULATION_CTRL"},
 	{PR_SET_SECUREBITS, &num_0, &num_0, EPERM, "PR_SET_SECUREBITS"},
 	{PR_CAPBSET_DROP, &num_1, &num_0, EPERM, "PR_CAPBSET_DROP"},
 };
@@ -140,7 +134,7 @@ static void verify_prctl(unsigned int n)
 	break;
 	}
 
-	TEST(prctl(tc->option, *tc->arg2, *tc->arg3));
+	TEST(prctl(tc->option, *tc->arg2, *tc->arg3, 0, 0));
 	if (TST_RET == 0) {
 		tst_res(TFAIL, "prctl() succeeded unexpectedly");
 		return;
-- 
2.24.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
