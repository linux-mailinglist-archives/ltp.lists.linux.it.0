Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C662F23DB1A
	for <lists+linux-ltp@lfdr.de>; Thu,  6 Aug 2020 16:23:38 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 54F6B3C321C
	for <lists+linux-ltp@lfdr.de>; Thu,  6 Aug 2020 16:23:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 89F583C0EAD
 for <ltp@lists.linux.it>; Thu,  6 Aug 2020 16:23:36 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 9BBBC140005A
 for <ltp@lists.linux.it>; Thu,  6 Aug 2020 16:23:35 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 397A8B5B9
 for <ltp@lists.linux.it>; Thu,  6 Aug 2020 14:23:52 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Thu,  6 Aug 2020 16:23:34 +0200
Message-Id: <20200806142334.30494-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH] Add test for CVE-2019-8912
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

Fixes #504

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---
 runtest/crypto                     |   1 +
 runtest/cve                        |   1 +
 testcases/kernel/crypto/.gitignore |   1 +
 testcases/kernel/crypto/Makefile   |   4 +-
 testcases/kernel/crypto/af_alg07.c | 117 +++++++++++++++++++++++++++++
 5 files changed, 122 insertions(+), 2 deletions(-)
 create mode 100644 testcases/kernel/crypto/af_alg07.c

diff --git a/runtest/crypto b/runtest/crypto
index be8bc81d2..446559efc 100644
--- a/runtest/crypto
+++ b/runtest/crypto
@@ -4,6 +4,7 @@ af_alg03 af_alg03
 af_alg04 af_alg04
 af_alg05 af_alg05
 af_alg06 af_alg06
+af_alg07 af_alg07
 pcrypt_aead01 pcrypt_aead01
 crypto_user01 crypto_user01
 crypto_user02 crypto_user02
diff --git a/runtest/cve b/runtest/cve
index fdb455af1..dff08396f 100644
--- a/runtest/cve
+++ b/runtest/cve
@@ -53,5 +53,6 @@ cve-2018-1000199 ptrace08
 cve-2018-1000204 ioctl_sg01
 cve-2018-18559 bind06
 cve-2018-19854 crypto_user01
+cve-2019-8912 af_alg07
 cve-2020-11494 pty04
 cve-2020-14416 pty03
diff --git a/testcases/kernel/crypto/.gitignore b/testcases/kernel/crypto/.gitignore
index c5be01180..448f986a6 100644
--- a/testcases/kernel/crypto/.gitignore
+++ b/testcases/kernel/crypto/.gitignore
@@ -4,6 +4,7 @@ af_alg03
 af_alg04
 af_alg05
 af_alg06
+af_alg07
 pcrypt_aead01
 crypto_user01
 crypto_user02
diff --git a/testcases/kernel/crypto/Makefile b/testcases/kernel/crypto/Makefile
index 7cbdb72d1..8175a346a 100644
--- a/testcases/kernel/crypto/Makefile
+++ b/testcases/kernel/crypto/Makefile
@@ -21,6 +21,6 @@ CFLAGS			+= -D_GNU_SOURCE
 
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
 
-af_alg02: CFLAGS += -pthread
+af_alg02 af_alg07: CFLAGS += -pthread
 
-crypto_user02: LDLIBS += -lrt
+af_alg07 crypto_user02: LDLIBS += -lrt
diff --git a/testcases/kernel/crypto/af_alg07.c b/testcases/kernel/crypto/af_alg07.c
new file mode 100644
index 000000000..efcdd0016
--- /dev/null
+++ b/testcases/kernel/crypto/af_alg07.c
@@ -0,0 +1,117 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 SUSE LLC <mdoucha@suse.cz>
+ */
+
+/*
+ * CVE-2019-8912
+ *
+ * Check for possible use-after-free in sockfs_setattr() on AF_ALG socket
+ * closed by dup2() or dup3(). Unlike regular close(), dup*() syscalls don't
+ * set sock->sk = NULL after closing the socket. Racing fchownat() against
+ * dup2() may then result in sockfs_setattr() using the stale pointer and
+ * writing into a block of released memory that may have been reused in the
+ * mean time.
+ *
+ * The race window is small and it's hard to trigger a kernel crash but
+ * fchownat() will return ENOENT as it should only when the bug is not
+ * present. Race fixed in:
+ *
+ *  commit 9060cb719e61b685ec0102574e10337fa5f445ea
+ *  Author: Mao Wenan <maowenan@huawei.com>
+ *  Date:   Mon Feb 18 10:44:44 2019 +0800
+ *
+ *  net: crypto set sk to NULL when af_alg_release.
+ */
+
+#include <sys/types.h>
+#include <sys/stat.h>
+#include <unistd.h>
+#include <pwd.h>
+
+#include "tst_test.h"
+#include "tst_af_alg.h"
+#include "tst_fuzzy_sync.h"
+#include "tst_taint.h"
+
+static int fd = -1, sock = -1;
+static int uid, gid;
+static struct tst_fzsync_pair fzsync_pair;
+
+static void setup(void)
+{
+	uid = getuid();
+	gid = getgid();
+	tst_taint_init(TST_TAINT_W | TST_TAINT_D);
+
+	fd = SAFE_OPEN("tmpfile", O_RDWR | O_CREAT, 0644);
+
+	tst_fzsync_pair_init(&fzsync_pair);
+}
+
+static void *thread_run(void *arg)
+{
+	while (tst_fzsync_run_b(&fzsync_pair)) {
+		tst_fzsync_start_race_b(&fzsync_pair);
+		dup2(fd, sock);
+		tst_fzsync_end_race_b(&fzsync_pair);
+	}
+
+	return arg;
+}
+
+static void run(void)
+{
+	tst_fzsync_pair_reset(&fzsync_pair, thread_run);
+
+	while (tst_fzsync_run_a(&fzsync_pair)) {
+		sock = tst_alg_setup_reqfd("hash", "sha1", NULL, 0);
+		tst_fzsync_start_race_a(&fzsync_pair);
+		TEST(fchownat(sock, "", uid, gid, AT_EMPTY_PATH));
+		tst_fzsync_end_race_a(&fzsync_pair);
+		SAFE_CLOSE(sock);
+
+		if (tst_taint_check()) {
+			tst_res(TFAIL, "Kernel is vulnerable");
+			return;
+		}
+
+		if (TST_RET == -1 && TST_ERR == ENOENT) {
+			tst_res(TPASS | TTERRNO,
+				"fchownat() failed successfully");
+			return;
+		}
+
+		if (TST_RET == -1) {
+			tst_brk(TBROK | TTERRNO,
+				"fchownat() failed unexpectedly");
+		}
+
+		if (TST_RET) {
+			tst_brk(TBROK | TTERRNO,
+				"Invalid fchownat() return value");
+		}
+	}
+
+	tst_res(TFAIL, "fchownat() failed to fail, kernel may be vulnerable");
+}
+
+static void cleanup(void)
+{
+	tst_fzsync_pair_cleanup(&fzsync_pair);
+
+	if (fd >= 0)
+		SAFE_CLOSE(fd);
+}
+
+static struct tst_test test = {
+	.needs_tmpdir = 1,
+	.test_all = run,
+	.setup = setup,
+	.cleanup = cleanup,
+	.tags = (const struct tst_tag[]) {
+		{"linux-git", "9060cb719e61"},
+		{"CVE", "2019-8912"},
+		{}
+	}
+};
-- 
2.27.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
