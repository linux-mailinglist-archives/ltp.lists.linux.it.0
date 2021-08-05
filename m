Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CB66D3E146D
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Aug 2021 14:06:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 88BFB3C7DB2
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Aug 2021 14:06:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 630F13C7D85
 for <ltp@lists.linux.it>; Thu,  5 Aug 2021 14:06:30 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 5EE131A01227
 for <ltp@lists.linux.it>; Thu,  5 Aug 2021 14:06:29 +0200 (CEST)
Received: from ubuntu.localdomain (unknown [188.192.255.100])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 9DF9F9F69E;
 Thu,  5 Aug 2021 12:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1628165187; bh=neYxy817sEf46HkLATzGiVqMYZvNxOcXaOj9uYjsk7k=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=Ddecyhc1SrH47p0rzMiYMAcMI90pxi27hBZi6WVtgYDi1zAtF9YWvlic8cZ3Nfe6k
 IK8e3iyVpsf4WJpSWefl+9JXXWp8yyzsSA2UCuIZbDQIxUASuq1yGGeL0ZNENNfONl
 GmXy2OlHMsmYLIhxhN0t4vRKtM5myxI9YQROH8sc=
From: Joerg Vehlow <lkml@jv-coder.de>
To: ltp@lists.linux.it,
	chrubis@suse.cz
Date: Thu,  5 Aug 2021 14:06:22 +0200
Message-Id: <20210805120622.81918-1-lkml@jv-coder.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH] Replace uppercase description tags
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

From: Joerg Vehlow <joerg.vehlow@aox-tech.de>

This lead to confusion at least twice now, let's just fix it

Signed-off-by: Joerg Vehlow <joerg.vehlow@aox-tech.de>
---
 include/tst_cgroup.h                               | 2 +-
 lib/newlib_tests/tst_fuzzy_sync01.c                | 2 +-
 lib/newlib_tests/tst_fuzzy_sync02.c                | 2 +-
 testcases/kernel/containers/netns/netns_netlink.c  | 2 +-
 testcases/kernel/syscalls/mallinfo2/mallinfo2_01.c | 2 +-
 testcases/kernel/syscalls/memcmp/memcmp01.c        | 2 +-
 testcases/kernel/syscalls/memcpy/memcpy01.c        | 2 +-
 testcases/kernel/syscalls/memset/memset01.c        | 2 +-
 testcases/kernel/syscalls/read/read03.c            | 2 +-
 testcases/kernel/syscalls/read/read04.c            | 2 +-
 testcases/kernel/syscalls/splice/splice02.c        | 2 +-
 11 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/include/tst_cgroup.h b/include/tst_cgroup.h
index de72645bc..9e34321e4 100644
--- a/include/tst_cgroup.h
+++ b/include/tst_cgroup.h
@@ -5,7 +5,7 @@
  * Copyright (c) 2020-2021 SUSE LLC <rpalethorpe@suse.com>
  */
 /*\
- * [DESCRIPTION]
+ * [Description]
  *
  * The LTP CGroups API tries to present a consistent interface to the
  * many possible CGroup configurations a system could have.
diff --git a/lib/newlib_tests/tst_fuzzy_sync01.c b/lib/newlib_tests/tst_fuzzy_sync01.c
index 9b0d55a24..ae3ea4e09 100644
--- a/lib/newlib_tests/tst_fuzzy_sync01.c
+++ b/lib/newlib_tests/tst_fuzzy_sync01.c
@@ -3,7 +3,7 @@
  * Copyright (c) 2021 Richard Palethorpe <rpalethorpe@suse.com>
  */
 /*\
- * [DESCRIPTION]
+ * [Description]
  *
  * This verifies Fuzzy Sync's basic ability to reproduce a particular
  * outcome to a data race when the critical sections are not aligned.
diff --git a/lib/newlib_tests/tst_fuzzy_sync02.c b/lib/newlib_tests/tst_fuzzy_sync02.c
index e6bd03392..51075f3c3 100644
--- a/lib/newlib_tests/tst_fuzzy_sync02.c
+++ b/lib/newlib_tests/tst_fuzzy_sync02.c
@@ -3,7 +3,7 @@
  * Copyright (c) 2021 Richard Palethorpe <rpalethorpe@suse.com>
  */
 /*\
- * [DESCRIPTION]
+ * [Description]
  *
  * This verifies Fuzzy Sync's ability to reproduce a particular
  * outcome to a data race when multiple races are present.
diff --git a/testcases/kernel/containers/netns/netns_netlink.c b/testcases/kernel/containers/netns/netns_netlink.c
index 1e8e78fc5..50cfe2994 100644
--- a/testcases/kernel/containers/netns/netns_netlink.c
+++ b/testcases/kernel/containers/netns/netns_netlink.c
@@ -5,7 +5,7 @@
  */
 
 /*\
- * [DESCRIPTION]
+ * [Description]
  *
  * Tests a netlink interface inside a new network namespace.
  *
diff --git a/testcases/kernel/syscalls/mallinfo2/mallinfo2_01.c b/testcases/kernel/syscalls/mallinfo2/mallinfo2_01.c
index adaa34a5e..90cf4fcb3 100644
--- a/testcases/kernel/syscalls/mallinfo2/mallinfo2_01.c
+++ b/testcases/kernel/syscalls/mallinfo2/mallinfo2_01.c
@@ -5,7 +5,7 @@
  */
 
 /*\
- * [DESCRIPTION]
+ * [Description]
  *
  * Basic mallinfo2() test.
  *
diff --git a/testcases/kernel/syscalls/memcmp/memcmp01.c b/testcases/kernel/syscalls/memcmp/memcmp01.c
index 0acf1522f..836cf4043 100644
--- a/testcases/kernel/syscalls/memcmp/memcmp01.c
+++ b/testcases/kernel/syscalls/memcmp/memcmp01.c
@@ -7,7 +7,7 @@
  */
 
 /*\
- * [DESCRIPTION]
+ * [Description]
  *
  * The testcase for buffer comparison by check boundary conditions.
  */
diff --git a/testcases/kernel/syscalls/memcpy/memcpy01.c b/testcases/kernel/syscalls/memcpy/memcpy01.c
index 7acd88192..0b64d70e6 100644
--- a/testcases/kernel/syscalls/memcpy/memcpy01.c
+++ b/testcases/kernel/syscalls/memcpy/memcpy01.c
@@ -7,7 +7,7 @@
  */
 
 /*\
- * [DESCRIPTION]
+ * [Description]
  *
  * The testcase for buffer copy by check boundary conditions.
  */
diff --git a/testcases/kernel/syscalls/memset/memset01.c b/testcases/kernel/syscalls/memset/memset01.c
index 4aa8a7607..17ae42c01 100644
--- a/testcases/kernel/syscalls/memset/memset01.c
+++ b/testcases/kernel/syscalls/memset/memset01.c
@@ -7,7 +7,7 @@
  */
 
 /*\
- * [DESCRIPTION]
+ * [Description]
  *
  * The testcase for test setting of buffer by check boundary conditions.
  */
diff --git a/testcases/kernel/syscalls/read/read03.c b/testcases/kernel/syscalls/read/read03.c
index b34b66151..ee92a329e 100644
--- a/testcases/kernel/syscalls/read/read03.c
+++ b/testcases/kernel/syscalls/read/read03.c
@@ -4,7 +4,7 @@
  */
 
 /*\
- * [DESCRIPTION]
+ * [Description]
  *
  * Testcase to check if read() successfully sets errno to EAGAIN when read from
  * a pipe (fifo, opened in O_NONBLOCK mode) without writing to it.
diff --git a/testcases/kernel/syscalls/read/read04.c b/testcases/kernel/syscalls/read/read04.c
index ad7ba16a5..47875c034 100644
--- a/testcases/kernel/syscalls/read/read04.c
+++ b/testcases/kernel/syscalls/read/read04.c
@@ -4,7 +4,7 @@
  */
 
 /*\
- * [DESCRIPTION]
+ * [Description]
  *
  * Testcase to check if read() returns the number of bytes read correctly.
  */
diff --git a/testcases/kernel/syscalls/splice/splice02.c b/testcases/kernel/syscalls/splice/splice02.c
index 5d91e26cd..0397360eb 100644
--- a/testcases/kernel/syscalls/splice/splice02.c
+++ b/testcases/kernel/syscalls/splice/splice02.c
@@ -5,7 +5,7 @@
  */
 
 /*\
- * [DESCRIPTION]
+ * [Description]
  * Original reproducer for kernel fix
  * bf40d3435caf NFS: add support for splice writes
  * from v2.6.31-rc1.
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
