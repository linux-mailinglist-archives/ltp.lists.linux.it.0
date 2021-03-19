Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD38341BB0
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Mar 2021 12:44:01 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 360F23C5FBE
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Mar 2021 12:44:01 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 78CA03C5FAA
 for <ltp@lists.linux.it>; Fri, 19 Mar 2021 12:43:59 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 3F82D60094C
 for <ltp@lists.linux.it>; Fri, 19 Mar 2021 12:43:50 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5475BAC17
 for <ltp@lists.linux.it>; Fri, 19 Mar 2021 11:43:50 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 19 Mar 2021 12:43:49 +0100
Message-Id: <20210319114349.22696-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v2] syscalls/semctl09: Skip libc test if SEM_STAT_ANY
 not defined
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

The libc test variant should run only if system headers define SEM_STAT_ANY.
Skip it if we're falling back to the LAPI definition.

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---

Changes since v2:
- move test_info() call before #if to make test output more clear

 configure.ac                                    | 1 +
 testcases/kernel/syscalls/ipc/semctl/semctl09.c | 7 ++++++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/configure.ac b/configure.ac
index 37bafb93d..136d82d09 100644
--- a/configure.ac
+++ b/configure.ac
@@ -38,6 +38,7 @@ AC_PREFIX_DEFAULT(/opt/ltp)
 AC_CHECK_DECLS([IFLA_NET_NS_PID],,,[#include <linux/if_link.h>])
 AC_CHECK_DECLS([MADV_MERGEABLE],,,[#include <sys/mman.h>])
 AC_CHECK_DECLS([PR_CAPBSET_DROP, PR_CAPBSET_READ],,,[#include <sys/prctl.h>])
+AC_CHECK_DECLS([SEM_STAT_ANY],,,[#include <sys/sem.h>])
 
 AC_CHECK_HEADERS_ONCE([ \
     asm/ldt.h \
diff --git a/testcases/kernel/syscalls/ipc/semctl/semctl09.c b/testcases/kernel/syscalls/ipc/semctl/semctl09.c
index a933cff0e..5a81f778c 100644
--- a/testcases/kernel/syscalls/ipc/semctl/semctl09.c
+++ b/testcases/kernel/syscalls/ipc/semctl/semctl09.c
@@ -185,9 +185,14 @@ static void setup(void)
 
 	nobody_uid = ltpuser->pw_uid;
 	root_uid = 0;
+	test_info();
+
+#if !HAVE_DECL_SEM_STAT_ANY
+	if (tst_variant == 1)
+		tst_brk(TCONF, "libc does not support semctl(SEM_STAT_ANY)");
+#endif
 
 	sem_id = SAFE_SEMGET(IPC_PRIVATE, 2, IPC_CREAT | 0600);
-	test_info();
 }
 
 static void cleanup(void)
-- 
2.30.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
