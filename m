Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 49979886557
	for <lists+linux-ltp@lfdr.de>; Fri, 22 Mar 2024 04:02:25 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0FA1A3CFBC6
	for <lists+linux-ltp@lfdr.de>; Fri, 22 Mar 2024 04:02:25 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6708C3CAB5B
 for <ltp@lists.linux.it>; Fri, 22 Mar 2024 04:02:18 +0100 (CET)
Authentication-Results: in-2.smtp.seeweb.it; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.129.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=liwang@redhat.com;
 receiver=lists.linux.it)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 842A0600077
 for <ltp@lists.linux.it>; Fri, 22 Mar 2024 04:02:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1711076535;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vMVWKHwziYODlmyLxg5M61Shsl+6UXl01wDosVYumBI=;
 b=JhSz5PvZ9sAZr+4XnLofJoLLelPGNEyMp1/rq+kOcAPvjkyeGVjWCGGlAeJejfELWxIMPd
 bQdp4DCHjG7Kr3SVxzH4Um5AXaHUfc5bJXLzzswzJ2YiYwbeIhtT13McdqceinjWQszvNm
 0o4O+39r6G/l+UPzh6+9TWxFyMw+DNw=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-113-cNc0wrRxOpyCcuKPqJX5jA-1; Thu,
 21 Mar 2024 23:02:14 -0400
X-MC-Unique: cNc0wrRxOpyCcuKPqJX5jA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B1AA61C07271;
 Fri, 22 Mar 2024 03:02:13 +0000 (UTC)
Received: from liwang-workstation.lab.eng.nay.redhat.com (unknown
 [10.66.145.229])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2DFEFC1576F;
 Fri, 22 Mar 2024 03:02:11 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it
Date: Fri, 22 Mar 2024 11:02:07 +0800
Message-Id: <20240322030208.3278120-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,DMARC_PASS,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v3 1/2] libswap: add two methods to create swapfile
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

This introduces enhanced functionality within the libswap library,
adding two versatile methods for creating a swapfile: by size in
megabytes (MB) and by the number of file system blocks.

The make_swapfile function now accepts an enum swapfile_method
parameter, enabling the selection of the creation method. To
facilitate ease of use, two macros are provided for each method:

  MAKE_SWAPFILE_SIZE for creating swapfiles by size.
  MAKE_SWAPFILE_BLKS for creating swapfiles by block count.

Each method also includes a 'safe' macro variant that incorporates
additional error handling:

  SAFE_MAKE_SWAPFILE_SIZE for safely creating swapfiles by size.
  SAFE_MAKE_SWAPFILE_BLKS for safely creating swapfiles by block count.

The make_swapfile_ helper function has been updated to incorporate
file and line number arguments, which aids in improved error reporting
and debugging. This function is now used internally by the macros to
streamline the swapfile creation process.

The update to the make_swapfile function and the introduction of
these new macros are designed to offer a more user-friendly and
error-resistant approach to swapfile creation, catering to a variety
of system configurations and user needs.

Signed-off-by: Li Wang <liwang@redhat.com>
Signed-off-by: Wei Gao <wegao@suse.com>
---
 include/libswap.h                             | 43 ++++++++++++++-
 libs/libltpswap/libswap.c                     | 55 +++++++++++--------
 testcases/kernel/syscalls/swapoff/swapoff01.c |  2 +-
 testcases/kernel/syscalls/swapoff/swapoff02.c |  2 +-
 testcases/kernel/syscalls/swapon/swapon01.c   |  2 +-
 testcases/kernel/syscalls/swapon/swapon02.c   |  4 +-
 testcases/kernel/syscalls/swapon/swapon03.c   |  4 +-
 7 files changed, 81 insertions(+), 31 deletions(-)

diff --git a/include/libswap.h b/include/libswap.h
index 8c75e20ae..96e718542 100644
--- a/include/libswap.h
+++ b/include/libswap.h
@@ -11,10 +11,49 @@
 #ifndef __LIBSWAP_H__
 #define __LIBSWAP_H__
 
+enum swapfile_method {
+    SWAPFILE_BY_SIZE,
+    SWAPFILE_BY_BLKS
+};
+
 /*
- * Make a swap file
+ * Create a swapfile of a specified size or number of blocks.
+ */
+int make_swapfile_(const char *file, const int lineno,
+			const char *swapfile, unsigned int num,
+			int safe, enum swapfile_method method);
+
+static inline int make_swapfile(const char *swapfile, unsigned int num,
+			int safe, enum swapfile_method method)
+{
+	return make_swapfile_(__FILE__, __LINE__, swapfile, num, safe, method);
+}
+
+/**
+ * Macro to create swapfile size in megabytes (MB).
+ */
+#define MAKE_SWAPFILE_SIZE(swapfile, size) \
+    make_swapfile(swapfile, size, 0, SWAPFILE_BY_SIZE)
+
+/**
+ * Macro to create swapfile size in block numbers.
+ */
+#define MAKE_SWAPFILE_BLKS(swapfile, blocks) \
+    make_swapfile(swapfile, blocks, 0, SWAPFILE_BY_BLKS)
+
+/**
+ * Macro to safely create swapfile size in megabytes (MB).
+ * Includes safety checks to handle potential errors.
+ */
+#define SAFE_MAKE_SWAPFILE_SIZE(swapfile, size) \
+    make_swapfile(swapfile, size, 1, SWAPFILE_BY_SIZE)
+
+/**
+ * Macro to safely create swapfile size in block numbers.
+ * Includes safety checks to handle potential errors.
  */
-int make_swapfile(const char *swapfile, int blocks, int safe);
+#define SAFE_MAKE_SWAPFILE_BLKS(swapfile, blocks) \
+    make_swapfile(swapfile, blocks, 1, SWAPFILE_BY_BLKS)
 
 /*
  * Check swapon/swapoff support status of filesystems or files
diff --git a/libs/libltpswap/libswap.c b/libs/libltpswap/libswap.c
index a26ea25e4..a3c47e9e2 100644
--- a/libs/libltpswap/libswap.c
+++ b/libs/libltpswap/libswap.c
@@ -133,55 +133,66 @@ out:
 	return contiguous;
 }
 
-int make_swapfile(const char *swapfile, int blocks, int safe)
+int make_swapfile_(const char *file, const int lineno,
+			const char *swapfile, unsigned int num,
+			int safe, enum swapfile_method method)
 {
 	struct statvfs fs_info;
-	unsigned long blk_size, bs;
+	unsigned long blk_size;
+	unsigned int blocks = 0;
 	size_t pg_size = sysconf(_SC_PAGESIZE);
-	char mnt_path[100];
+	char mnt_path[128];
 
 	if (statvfs(".", &fs_info) == -1)
-		return -1;
+		tst_brk_(file, lineno, TBROK, "statvfs failed");
 
 	blk_size = fs_info.f_bsize;
 
+	if (method == SWAPFILE_BY_SIZE) {
+		tst_res(TINFO, "create a swapfile size of %u megabytes (MB)", num);
+		blocks = num * 1024 * 1024 / blk_size;
+	} else if (method == SWAPFILE_BY_BLKS) {
+		blocks = num;
+		tst_res(TINFO, "create a swapfile with %u block numbers", blocks);
+	} else {
+		tst_brk_(file, lineno, TBROK, "Invalid method, please see include/libswap.h");
+	}
+
 	/* To guarantee at least one page can be swapped out */
-	if (blk_size * blocks < pg_size)
-		bs = pg_size;
-	else
-		bs = blk_size;
+	if (blk_size * blocks < pg_size) {
+		tst_res(TWARN, "Swapfile size is less than the system page size. \
+			Using page size (%lu bytes) instead of block size (%lu bytes).",
+			(unsigned long)pg_size, blk_size);
+		blk_size = pg_size;
+	}
 
 	if (sscanf(swapfile, "%[^/]", mnt_path) != 1)
-		tst_brk(TBROK, "sscanf failed");
+		tst_brk_(file, lineno, TBROK, "sscanf failed");
 
-	if (!tst_fs_has_free(mnt_path, bs * blocks, TST_BYTES))
-		tst_brk(TCONF, "Insufficient disk space to create swap file");
+	if (!tst_fs_has_free(mnt_path, blk_size * blocks, TST_BYTES))
+		tst_brk_(file, lineno, TCONF, "Insufficient disk space to create swap file");
 
 	/* create file */
-	if (prealloc_contiguous_file(swapfile, bs, blocks) != 0)
-		tst_brk(TBROK, "Failed to create swapfile");
+	if (prealloc_contiguous_file(swapfile, blk_size, blocks) != 0)
+		tst_brk_(file, lineno, TBROK, "Failed to create swapfile");
 
 	/* Fill the file if needed (specific to old xfs filesystems) */
 	if (tst_fs_type(swapfile) == TST_XFS_MAGIC) {
-		if (tst_fill_file(swapfile, 0, bs, blocks) != 0)
-			tst_brk(TBROK, "Failed to fill swapfile");
+		if (tst_fill_file(swapfile, 0, blk_size, blocks) != 0)
+			tst_brk_(file, lineno, TBROK, "Failed to fill swapfile");
 	}
 
 	/* make the file swapfile */
-	const char *argv[2 + 1];
-
-	argv[0] = "mkswap";
-	argv[1] = swapfile;
-	argv[2] = NULL;
+	const char *argv[] = {"mkswap", swapfile, NULL};
 
 	return tst_cmd(argv, "/dev/null", "/dev/null", safe ?
-				   TST_CMD_PASS_RETVAL | TST_CMD_TCONF_ON_MISSING : 0);
+			TST_CMD_PASS_RETVAL | TST_CMD_TCONF_ON_MISSING : 0);
 }
 
 bool is_swap_supported(const char *filename)
 {
 	int i, sw_support = 0;
-	int ret = make_swapfile(filename, 10, 1);
+	int ret = SAFE_MAKE_SWAPFILE_BLKS(filename, 10);
 	int fi_contiguous = file_is_contiguous(filename);
 	long fs_type = tst_fs_type(filename);
 	const char *fstype = tst_fs_type_name(fs_type);
diff --git a/testcases/kernel/syscalls/swapoff/swapoff01.c b/testcases/kernel/syscalls/swapoff/swapoff01.c
index 2a0b683c1..cf13907e7 100644
--- a/testcases/kernel/syscalls/swapoff/swapoff01.c
+++ b/testcases/kernel/syscalls/swapoff/swapoff01.c
@@ -44,7 +44,7 @@ static void setup(void)
 {
 	is_swap_supported(TEST_FILE);
 
-	if (make_swapfile(SWAP_FILE, 65536, 1))
+	if (SAFE_MAKE_SWAPFILE_BLKS(SWAP_FILE, 65536))
 		tst_brk(TBROK, "Failed to create file for swap");
 }
 
diff --git a/testcases/kernel/syscalls/swapoff/swapoff02.c b/testcases/kernel/syscalls/swapoff/swapoff02.c
index 52906848f..61536dda4 100644
--- a/testcases/kernel/syscalls/swapoff/swapoff02.c
+++ b/testcases/kernel/syscalls/swapoff/swapoff02.c
@@ -88,7 +88,7 @@ static void setup(void)
 
 	is_swap_supported(TEST_FILE);
 
-	if (make_swapfile(SWAP_FILE, 10, 1))
+	if (SAFE_MAKE_SWAPFILE_BLKS(SWAP_FILE, 10))
 		tst_brk(TBROK, "Failed to create file for swap");
 }
 
diff --git a/testcases/kernel/syscalls/swapon/swapon01.c b/testcases/kernel/syscalls/swapon/swapon01.c
index d406e4bd9..b986d97c4 100644
--- a/testcases/kernel/syscalls/swapon/swapon01.c
+++ b/testcases/kernel/syscalls/swapon/swapon01.c
@@ -38,7 +38,7 @@ static void verify_swapon(void)
 static void setup(void)
 {
 	is_swap_supported(SWAP_FILE);
-	make_swapfile(SWAP_FILE, 10, 0);
+	MAKE_SWAPFILE_BLKS(SWAP_FILE, 10);
 
 	SAFE_CG_PRINTF(tst_cg, "cgroup.procs", "%d", getpid());
 	SAFE_CG_PRINTF(tst_cg, "memory.max", "%lu", TESTMEM);
diff --git a/testcases/kernel/syscalls/swapon/swapon02.c b/testcases/kernel/syscalls/swapon/swapon02.c
index 7e876d26a..e5e29b8e7 100644
--- a/testcases/kernel/syscalls/swapon/swapon02.c
+++ b/testcases/kernel/syscalls/swapon/swapon02.c
@@ -50,8 +50,8 @@ static void setup(void)
 	is_swap_supported(TEST_FILE);
 
 	SAFE_TOUCH(NOTSWAP_FILE, 0777, NULL);
-	make_swapfile(SWAP_FILE, 10, 0);
-	make_swapfile(USED_FILE, 10, 0);
+	MAKE_SWAPFILE_BLKS(SWAP_FILE, 10);
+	MAKE_SWAPFILE_BLKS(USED_FILE, 10);
 
 	if (tst_syscall(__NR_swapon, USED_FILE, 0))
 		tst_res(TWARN | TERRNO, "swapon(alreadyused) failed");
diff --git a/testcases/kernel/syscalls/swapon/swapon03.c b/testcases/kernel/syscalls/swapon/swapon03.c
index 6f47fc01f..5295a6a73 100644
--- a/testcases/kernel/syscalls/swapon/swapon03.c
+++ b/testcases/kernel/syscalls/swapon/swapon03.c
@@ -49,7 +49,7 @@ static int setup_swap(void)
 
 			/* Create the swapfile */
 			snprintf(filename, sizeof(filename), "%s%02d", TEST_FILE, j + 2);
-			make_swapfile(filename, 10, 0);
+			MAKE_SWAPFILE_BLKS(filename, 10);
 
 			/* turn on the swap file */
 			TST_EXP_PASS_SILENT(swapon(filename, 0));
@@ -62,7 +62,7 @@ static int setup_swap(void)
 		tst_brk(TFAIL, "Failed to setup swap files");
 
 	tst_res(TINFO, "Successfully created %d swap files", swapfiles);
-	make_swapfile(TEST_FILE, 10, 0);
+	MAKE_SWAPFILE_BLKS(TEST_FILE, 10);
 
 	return 0;
 }
-- 
2.40.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
