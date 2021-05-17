Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3364E3839E7
	for <lists+linux-ltp@lfdr.de>; Mon, 17 May 2021 18:30:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A90883C4C15
	for <lists+linux-ltp@lfdr.de>; Mon, 17 May 2021 18:30:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2593E3C19F0
 for <ltp@lists.linux.it>; Mon, 17 May 2021 18:30:40 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 81208600A22
 for <ltp@lists.linux.it>; Mon, 17 May 2021 18:30:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1621269039; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7ChofzqDrJb6Bv8OAqKbN6/HlDwpm+Ehd3nGXXXtXMs=;
 b=B8Y/U1j+zYir6W869ho/u2M7an36ujaUlFfaq/ha9pg9k+MgL6NXHMPF4Mz3oYUZ9N1ZJX
 PdyaDmAJ/6p9w/FgGGZ8RDYZAJParq6cyjXsPE0rIXnS9fDX6lu1q1CYJx/fCHlICYcpiL
 Na/7CWTIGD3+92TlcIpmdNp5ZN3QL9A=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EA49FB26F;
 Mon, 17 May 2021 16:30:38 +0000 (UTC)
To: ltp@lists.linux.it
Date: Mon, 17 May 2021 17:30:24 +0100
Message-Id: <20210517163029.22974-2-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210517163029.22974-1-rpalethorpe@suse.com>
References: <20210517163029.22974-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [RFC PATCH 1/6] API: Make some internal symbols static
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
From: Richard Palethorpe via ltp <ltp@lists.linux.it>
Reply-To: Richard Palethorpe <rpalethorpe@suse.com>
Cc: Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

These do not appear to be referenced anywhere outside the library.

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
---
 include/old/test.h      | 1 -
 lib/tst_clocks.c        | 2 +-
 lib/tst_device.c        | 2 +-
 lib/tst_fs_link_count.c | 2 +-
 lib/tst_fs_setup.c      | 2 +-
 lib/tst_res.c           | 2 +-
 lib/tst_status.c        | 6 +++---
 lib/tst_test.c          | 2 +-
 lib/tst_timer_test.c    | 2 +-
 9 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/include/old/test.h b/include/old/test.h
index 2ae7dba71..a8994c08e 100644
--- a/include/old/test.h
+++ b/include/old/test.h
@@ -113,7 +113,6 @@ void tst_parse_opts(int argc, char *argv[], const option_t *user_optarg,
                     void (*user_help)(void));
 
 /* lib/tst_res.c */
-const char *strttype(int ttype);
 
 void tst_resm_(const char *file, const int lineno, int ttype,
 	const char *arg_fmt, ...)
diff --git a/lib/tst_clocks.c b/lib/tst_clocks.c
index cdcb9fc4f..9af4d2993 100644
--- a/lib/tst_clocks.c
+++ b/lib/tst_clocks.c
@@ -14,7 +14,7 @@
 
 typedef int (*mysyscall)(clockid_t clk_id, void *ts);
 
-int syscall_supported_by_kernel(long sysnr)
+static int syscall_supported_by_kernel(long sysnr)
 {
 	int ret;
 
diff --git a/lib/tst_device.c b/lib/tst_device.c
index c096b418b..079173b87 100644
--- a/lib/tst_device.c
+++ b/lib/tst_device.c
@@ -446,7 +446,7 @@ int tst_is_mounted_at_tmpdir(const char *path)
 	return tst_is_mounted(mpath);
 }
 
-int find_stat_file(const char *dev, char *path, size_t path_len)
+static int find_stat_file(const char *dev, char *path, size_t path_len)
 {
 	const char *devname = strrchr(dev, '/') + 1;
 
diff --git a/lib/tst_fs_link_count.c b/lib/tst_fs_link_count.c
index 860510d75..c4e20bebf 100644
--- a/lib/tst_fs_link_count.c
+++ b/lib/tst_fs_link_count.c
@@ -32,7 +32,7 @@
  * XXX: we cannot filter ext4 out, because ext2/ext3/ext4 have the
  * same magic number
  */
-const long subdir_limit_whitelist[] = {
+static const long subdir_limit_whitelist[] = {
 	TST_EXT2_OLD_MAGIC, TST_EXT234_MAGIC, TST_MINIX_MAGIC,
 	TST_MINIX_MAGIC2,   TST_MINIX2_MAGIC, TST_MINIX2_MAGIC2,
 	TST_MINIX3_MAGIC,   TST_UDF_MAGIC,    TST_SYSV2_MAGIC,
diff --git a/lib/tst_fs_setup.c b/lib/tst_fs_setup.c
index 6b93483de..b20fd06f2 100644
--- a/lib/tst_fs_setup.c
+++ b/lib/tst_fs_setup.c
@@ -11,7 +11,7 @@
 #define TST_FS_SETUP_OVERLAYFS_MSG "overlayfs is not configured in this kernel"
 #define TST_FS_SETUP_OVERLAYFS_CONFIG "lowerdir="OVL_LOWER",upperdir="OVL_UPPER",workdir="OVL_WORK
 
-void create_overlay_dirs(void)
+static void create_overlay_dirs(void)
 {
 	DIR *dir = opendir(OVL_LOWER);
 	if (dir == NULL) {
diff --git a/lib/tst_res.c b/lib/tst_res.c
index 8d86b48a4..c82e78a9a 100644
--- a/lib/tst_res.c
+++ b/lib/tst_res.c
@@ -139,7 +139,7 @@ struct pair {
 	return pair_arr[idx].name;                            \
 } while (0)
 
-const char *strttype(int ttype)
+static const char *strttype(int ttype)
 {
 	static const struct pair ttype_pairs[] = {
 		PAIR(TPASS)
diff --git a/lib/tst_status.c b/lib/tst_status.c
index 9124faaa3..12dee103f 100644
--- a/lib/tst_status.c
+++ b/lib/tst_status.c
@@ -11,14 +11,14 @@
 
 static char buf[32];
 
-const char *exited(int status)
+static const char *exited(int status)
 {
 	snprintf(buf, sizeof(buf), "exited with %i", WEXITSTATUS(status));
 
 	return buf;
 }
 
-const char *signaled(int status)
+static const char *signaled(int status)
 {
 	snprintf(buf, sizeof(buf), "killed by %s",
 		tst_strsig(WTERMSIG(status)));
@@ -26,7 +26,7 @@ const char *signaled(int status)
 	return buf;
 }
 
-const char *invalid(int status)
+static const char *invalid(int status)
 {
 	snprintf(buf, sizeof(buf), "invalid status 0x%x", status);
 
diff --git a/lib/tst_test.c b/lib/tst_test.c
index 36a4809c7..4899ea70b 100644
--- a/lib/tst_test.c
+++ b/lib/tst_test.c
@@ -747,7 +747,7 @@ static void do_exit(int ret)
 	exit(ret);
 }
 
-void check_kver(void)
+static void check_kver(void)
 {
 	int v1, v2, v3;
 
diff --git a/lib/tst_timer_test.c b/lib/tst_timer_test.c
index 3cd52fc9d..e77b911dd 100644
--- a/lib/tst_timer_test.c
+++ b/lib/tst_timer_test.c
@@ -251,7 +251,7 @@ static void write_to_file(void)
  *   - then we compute truncated mean and compare that with the requested sleep
  *     time increased by a threshold
  */
-void do_timer_test(long long usec, unsigned int nsamples)
+static void do_timer_test(long long usec, unsigned int nsamples)
 {
 	long long trunc_mean, median;
 	unsigned int discard = compute_discard(nsamples);
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
