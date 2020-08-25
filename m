Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 35CA6251CEE
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Aug 2020 18:07:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E318F3C27EC
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Aug 2020 18:07:57 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id DB23A3C2497
 for <ltp@lists.linux.it>; Tue, 25 Aug 2020 18:07:37 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 406ED600770
 for <ltp@lists.linux.it>; Tue, 25 Aug 2020 18:07:37 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 45496B0A5
 for <ltp@lists.linux.it>; Tue, 25 Aug 2020 16:08:07 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 25 Aug 2020 18:07:33 +0200
Message-Id: <20200825160735.24602-3-mdoucha@suse.cz>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200825160735.24602-1-mdoucha@suse.cz>
References: <20200825160735.24602-1-mdoucha@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v2 2/4] Add tst_pollute_memory() helper function
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

tst_pollute_memory() fills available RAM up to specified limit with given fill
byte. Useful for testing data disclosure vulnerablities.

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---

Changes since v1: New patch

 include/tst_memutils.h | 22 +++++++++++++++
 lib/tst_memutils.c     | 62 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 84 insertions(+)
 create mode 100644 include/tst_memutils.h
 create mode 100644 lib/tst_memutils.c

diff --git a/include/tst_memutils.h b/include/tst_memutils.h
new file mode 100644
index 000000000..91dad07cd
--- /dev/null
+++ b/include/tst_memutils.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (c) 2020 SUSE LLC <mdoucha@suse.cz>
+ */
+
+#ifndef TST_MEMUTILS_H__
+#define TST_MEMUTILS_H__
+
+/*
+ * Fill up to maxsize physical memory with fillchar, then free it for reuse.
+ * If maxsize is zero, fill as much memory as possible. This function is
+ * intended for data disclosure vulnerability tests to reduce the probability
+ * that a vulnerable kernel will leak a block of memory that was full of
+ * zeroes by chance.
+ *
+ * The function keeps a safety margin to avoid invoking OOM killer and
+ * respects the limitations of available address space. (Less than 3GB can be
+ * polluted on a 32bit system regardless of available physical RAM.)
+ */
+void tst_pollute_memory(size_t maxsize, int fillchar);
+
+#endif /* TST_MEMUTILS_H__ */
diff --git a/lib/tst_memutils.c b/lib/tst_memutils.c
new file mode 100644
index 000000000..f134d90c9
--- /dev/null
+++ b/lib/tst_memutils.c
@@ -0,0 +1,62 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 SUSE LLC <mdoucha@suse.cz>
+ */
+
+#include <unistd.h>
+#include <limits.h>
+#include <sys/sysinfo.h>
+#include <stdlib.h>
+
+#define TST_NO_DEFAULT_MAIN
+#include "tst_test.h"
+
+#define BLOCKSIZE (16 * 1024 * 1024)
+
+void tst_pollute_memory(size_t maxsize, int fillchar)
+{
+	size_t i, map_count = 0, safety = 0, blocksize = BLOCKSIZE;
+	void **map_blocks;
+	struct sysinfo info;
+
+	SAFE_SYSINFO(&info);
+	safety = 4096 * SAFE_SYSCONF(_SC_PAGESIZE) / info.mem_unit;
+
+	if (info.freeswap > safety)
+		safety = 0;
+
+	/* Not enough free memory to avoid invoking OOM killer */
+	if (info.freeram <= safety)
+		return;
+
+	if (!maxsize)
+		maxsize = SIZE_MAX;
+
+	if (info.freeram - safety < maxsize / info.mem_unit)
+		maxsize = (info.freeram - safety) * info.mem_unit;
+
+	blocksize = MIN(maxsize, blocksize);
+	map_count = maxsize / blocksize;
+	map_blocks = SAFE_MALLOC(map_count * sizeof(void *));
+
+	/*
+	 * Keep allocating until the first failure. The address space may be
+	 * too fragmented or just smaller than maxsize.
+	 */
+	for (i = 0; i < map_count; i++) {
+		map_blocks[i] = mmap(NULL, blocksize, PROT_READ | PROT_WRITE,
+			MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+
+		if (map_blocks[i] == MAP_FAILED) {
+			map_count = i;
+			break;
+		}
+
+		memset(map_blocks[i], fillchar, blocksize);
+	}
+
+	for (i = 0; i < map_count; i++)
+		SAFE_MUNMAP(map_blocks[i], blocksize);
+
+	free(map_blocks);
+}
-- 
2.28.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
