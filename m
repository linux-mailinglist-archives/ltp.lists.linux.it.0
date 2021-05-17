Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 027E43839F1
	for <lists+linux-ltp@lfdr.de>; Mon, 17 May 2021 18:31:26 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 922A93C3144
	for <lists+linux-ltp@lfdr.de>; Mon, 17 May 2021 18:31:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 032103C3103
 for <ltp@lists.linux.it>; Mon, 17 May 2021 18:30:41 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id DB858140013B
 for <ltp@lists.linux.it>; Mon, 17 May 2021 18:30:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1621269039; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wTX5oIHfReJTOX4u5lgpTMwYwVFDeQ3Yrv7j6awU0LM=;
 b=h6mSKBjTurznw7e0YguKNd7BuxicYu0QYMFbH0YfCgN9G8e3FpUHlr4BgRJi2gbjKXVtcX
 45Glzo7DQ3x1Uld66SPXy6VaLHvGtPKU7t7mlkT/Cp5fmVBrmZ+HQWZMlwynrUCVXUcWfy
 so7+KiiZY6d+fERNX5YZquu0Sw6Cakg=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7E580B26D;
 Mon, 17 May 2021 16:30:39 +0000 (UTC)
To: ltp@lists.linux.it
Date: Mon, 17 May 2021 17:30:26 +0100
Message-Id: <20210517163029.22974-4-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210517163029.22974-1-rpalethorpe@suse.com>
References: <20210517163029.22974-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [RFC PATCH 3/6] API: Add tst_ to file_* functions
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

Usually LTP library functions are prepended with tst_ if not with
safe_.

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
---
 doc/test-writing-guidelines.txt               |  2 +-
 include/old/old_safe_file_ops.h               | 14 ++++++------
 include/safe_file_ops_fn.h                    | 22 +++++++++----------
 include/tst_safe_file_ops.h                   | 20 ++++++++---------
 lib/newlib_tests/tst_safe_fileops.c           |  4 ++--
 lib/safe_file_ops.c                           | 10 ++++-----
 lib/tst_assert.c                              |  4 ++--
 lib/tst_sys_conf.c                            |  2 +-
 testcases/cve/meltdown.c                      |  2 +-
 .../device-drivers/cpufreq/cpufreq_boost.c    |  4 ++--
 .../mem/hugetlb/hugeshmget/hugeshmget03.c     |  2 +-
 testcases/kernel/mem/ksm/ksm01.c              |  4 ++--
 testcases/kernel/mem/ksm/ksm02.c              |  4 ++--
 testcases/kernel/mem/ksm/ksm03.c              |  4 ++--
 testcases/kernel/mem/ksm/ksm04.c              |  4 ++--
 testcases/kernel/mem/ksm/ksm05.c              |  2 +-
 testcases/kernel/mem/ksm/ksm06.c              |  8 +++----
 testcases/kernel/mem/swapping/swapping01.c    |  2 +-
 testcases/kernel/syscalls/fcntl/fcntl33.c     |  2 +-
 testcases/kernel/syscalls/fork/fork13.c       |  2 +-
 .../syscalls/migrate_pages/migrate_pages02.c  |  2 +-
 testcases/kernel/syscalls/prctl/prctl06.c     |  2 +-
 .../kernel/syscalls/readahead/readahead02.c   |  2 +-
 testcases/kernel/tracing/pt_test/pt_test.c    |  4 ++--
 .../network/can/filter-tests/can_common.h     |  2 +-
 testcases/network/packet/fanout01.c           |  6 ++---
 26 files changed, 68 insertions(+), 68 deletions(-)

diff --git a/doc/test-writing-guidelines.txt b/doc/test-writing-guidelines.txt
index c268b8804..74f168e06 100644
--- a/doc/test-writing-guidelines.txt
+++ b/doc/test-writing-guidelines.txt
@@ -1715,7 +1715,7 @@ static const char *save_restore[] = {
 
 static void setup(void)
 {
-	FILE_PRINTF("/proc/sys/kernel/core_pattern", "/mypath");
+	TST_FILE_PRINTF("/proc/sys/kernel/core_pattern", "/mypath");
 }
 
 static struct tst_test test = {
diff --git a/include/old/old_safe_file_ops.h b/include/old/old_safe_file_ops.h
index d6e2d29a9..d36079ab5 100644
--- a/include/old/old_safe_file_ops.h
+++ b/include/old/old_safe_file_ops.h
@@ -30,24 +30,24 @@
 
 #include "safe_file_ops_fn.h"
 
-#define FILE_SCANF(path, fmt, ...) \
-	file_scanf(__FILE__, __LINE__, \
-	           (path), (fmt), ## __VA_ARGS__)
+#define TST_FILE_SCANF(path, fmt, ...) \
+	tst_file_scanf(__FILE__, __LINE__, \
+		       (path), (fmt), ## __VA_ARGS__)
 
 #define SAFE_FILE_SCANF(cleanup_fn, path, fmt, ...) \
 	safe_file_scanf(__FILE__, __LINE__, (cleanup_fn), \
 	                (path), (fmt), ## __VA_ARGS__)
 
 #define FILE_LINES_SCANF(cleanup_fn, path, fmt, ...) \
-	file_lines_scanf(__FILE__, __LINE__, (cleanup_fn), 0, \
+	tst_file_lines_scanf(__FILE__, __LINE__, (cleanup_fn), 0, \
 			(path), (fmt), ## __VA_ARGS__)
 
 #define SAFE_FILE_LINES_SCANF(cleanup_fn, path, fmt, ...) \
-	file_lines_scanf(__FILE__, __LINE__, (cleanup_fn), 1, \
+	tst_file_lines_scanf(__FILE__, __LINE__, (cleanup_fn), 1, \
 			(path), (fmt), ## __VA_ARGS__)
 
-#define FILE_PRINTF(path, fmt, ...) \
-	file_printf(__FILE__, __LINE__, \
+#define TST_FILE_PRINTF(path, fmt, ...) \
+	tst_file_printf(__FILE__, __LINE__, \
 	            (path), (fmt), ## __VA_ARGS__)
 
 #define SAFE_FILE_PRINTF(cleanup_fn, path, fmt, ...) \
diff --git a/include/safe_file_ops_fn.h b/include/safe_file_ops_fn.h
index 6d680967b..620e12e9a 100644
--- a/include/safe_file_ops_fn.h
+++ b/include/safe_file_ops_fn.h
@@ -36,31 +36,31 @@ int tst_count_scanf_conversions(const char *fmt);
 /*
  * All-in-one function to scanf value(s) from a file.
  */
-int file_scanf(const char *file, const int lineno,
-		const char *path, const char *fmt, ...)
-		__attribute__ ((format (scanf, 4, 5)));
+int tst_file_scanf(const char *file, const int lineno,
+		   const char *path, const char *fmt, ...)
+		   __attribute__ ((format (scanf, 4, 5)));
 
 void safe_file_scanf(const char *file, const int lineno,
                      void (*cleanup_fn)(void),
 		     const char *path, const char *fmt, ...)
 		     __attribute__ ((format (scanf, 5, 6)));
 
-int file_lines_scanf(const char *file, const int lineno,
-		     void (*cleanup_fn)(void), int strict,
-		     const char *path, const char *fmt, ...)
-		     __attribute__ ((format (scanf, 6, 7)));
+int tst_file_lines_scanf(const char *file, const int lineno,
+			 void (*cleanup_fn)(void), int strict,
+			 const char *path, const char *fmt, ...)
+			 __attribute__ ((format (scanf, 6, 7)));
 
 /*
  * All-in-one function that lets you printf directly into a file.
  */
-int file_printf(const char *file, const int lineno,
-                      const char *path, const char *fmt, ...)
-                      __attribute__ ((format (printf, 4, 5)));
+int tst_file_printf(const char *file, const int lineno,
+		    const char *path, const char *fmt, ...)
+		    __attribute__ ((format (printf, 4, 5)));
 
 void safe_file_printf(const char *file, const int lineno,
                       void (*cleanup_fn)(void),
                       const char *path, const char *fmt, ...)
-                      __attribute__ ((format (printf, 5, 6)));
+		      __attribute__ ((format (printf, 5, 6)));
 
 /*
  * Safe function to copy files, no more system("cp ...") please.
diff --git a/include/tst_safe_file_ops.h b/include/tst_safe_file_ops.h
index 223eddd1f..7457edd61 100644
--- a/include/tst_safe_file_ops.h
+++ b/include/tst_safe_file_ops.h
@@ -7,20 +7,20 @@
 
 #include "safe_file_ops_fn.h"
 
-#define FILE_SCANF(path, fmt, ...) \
-	file_scanf(__FILE__, __LINE__, (path), (fmt), ## __VA_ARGS__)
+#define TST_FILE_SCANF(path, fmt, ...) \
+	tst_file_scanf(__FILE__, __LINE__, (path), (fmt), ## __VA_ARGS__)
 
 #define SAFE_FILE_SCANF(path, fmt, ...) \
 	safe_file_scanf(__FILE__, __LINE__, NULL, \
 	                (path), (fmt), ## __VA_ARGS__)
 
-#define FILE_LINES_SCANF(path, fmt, ...) \
-	file_lines_scanf(__FILE__, __LINE__, NULL, 0,\
-			(path), (fmt), ## __VA_ARGS__)
+#define TST_FILE_LINES_SCANF(path, fmt, ...) \
+	tst_file_lines_scanf(__FILE__, __LINE__, NULL, 0,\
+			     (path), (fmt), ## __VA_ARGS__)
 
 #define SAFE_FILE_LINES_SCANF(path, fmt, ...) \
-	file_lines_scanf(__FILE__, __LINE__, NULL, 1,\
-			(path), (fmt), ## __VA_ARGS__)
+	tst_file_lines_scanf(__FILE__, __LINE__, NULL, 1,\
+			     (path), (fmt), ## __VA_ARGS__)
 
 #define SAFE_READ_MEMINFO(item) \
        ({long tst_rval; \
@@ -36,9 +36,9 @@
                         &tst_rval_); \
         tst_rval_;})
 
-#define FILE_PRINTF(path, fmt, ...) \
-	file_printf(__FILE__, __LINE__, \
-		    (path), (fmt), ## __VA_ARGS__)
+#define TST_FILE_PRINTF(path, fmt, ...) \
+	tst_file_printf(__FILE__, __LINE__, \
+			(path), (fmt), ## __VA_ARGS__)
 
 #define SAFE_FILE_PRINTF(path, fmt, ...) \
 	safe_file_printf(__FILE__, __LINE__, NULL, \
diff --git a/lib/newlib_tests/tst_safe_fileops.c b/lib/newlib_tests/tst_safe_fileops.c
index e8419bd23..d6a7030f6 100644
--- a/lib/newlib_tests/tst_safe_fileops.c
+++ b/lib/newlib_tests/tst_safe_fileops.c
@@ -13,11 +13,11 @@ static void do_test(void)
 	long dummy;
 
 	SAFE_FILE_LINES_SCANF("/proc/meminfo", "MemFree: %ld", &free);
-	if (FILE_LINES_SCANF("/proc/stat", "processes %ld", &nproc))
+	if (TST_FILE_LINES_SCANF("/proc/stat", "processes %ld", &nproc))
 		tst_brk(TBROK, "Could not parse processes");
 	tst_res(TPASS, "Free: %ld, nproc: %ld", free, nproc);
 
-	if (FILE_LINES_SCANF("/proc/stat", "non-existent %ld", &dummy))
+	if (TST_FILE_LINES_SCANF("/proc/stat", "non-existent %ld", &dummy))
 		tst_res(TPASS, "non-existent not found");
 	SAFE_FILE_LINES_SCANF("/proc/stat", "non-existent %ld", &dummy);
 }
diff --git a/lib/safe_file_ops.c b/lib/safe_file_ops.c
index 249a512a1..132530345 100644
--- a/lib/safe_file_ops.c
+++ b/lib/safe_file_ops.c
@@ -66,7 +66,7 @@ int tst_count_scanf_conversions(const char *fmt)
 	return cnt;
 }
 
-int file_scanf(const char *file, const int lineno,
+int tst_file_scanf(const char *file, const int lineno,
 		     const char *path, const char *fmt, ...)
 {
 	va_list va;
@@ -165,9 +165,9 @@ void safe_file_scanf(const char *file, const int lineno,
  * to scanf format 'fmt'. If all fields could be parsed, stop and
  * return 0, otherwise continue or return 1 if EOF is reached.
  */
-int file_lines_scanf(const char *file, const int lineno,
-		     void (*cleanup_fn)(void), int strict,
-		     const char *path, const char *fmt, ...)
+int tst_file_lines_scanf(const char *file, const int lineno,
+			 void (*cleanup_fn)(void), int strict,
+			 const char *path, const char *fmt, ...)
 {
 	FILE *fp;
 	int ret = 0;
@@ -209,7 +209,7 @@ int file_lines_scanf(const char *file, const int lineno,
 	return !(ret == arg_count);
 }
 
-int file_printf(const char *file, const int lineno,
+int tst_file_printf(const char *file, const int lineno,
 		      const char *path, const char *fmt, ...)
 {
 	va_list va;
diff --git a/lib/tst_assert.c b/lib/tst_assert.c
index 9b8ebc167..8c7beb2fd 100644
--- a/lib/tst_assert.c
+++ b/lib/tst_assert.c
@@ -43,7 +43,7 @@ void tst_assert_file_int(const char *file, const int lineno, const char *path, c
 	char fmt[1024];
 
 	snprintf(fmt, sizeof(fmt), "%s%%d", prefix);
-	file_lines_scanf(file, lineno, NULL, 1, path, fmt, &sys_val);
+	tst_file_lines_scanf(file, lineno, NULL, 1, path, fmt, &sys_val);
 
 	if (val == sys_val) {
 		tst_res_(file, lineno, TPASS, "%s %s = %d", path, prefix, sys_val);
@@ -72,7 +72,7 @@ void tst_assert_file_str(const char *file, const int lineno, const char *path, c
 	char fmt[2048];
 
 	snprintf(fmt, sizeof(fmt), "%s: %%1024s", prefix);
-	file_lines_scanf(file, lineno, NULL, 1, path, fmt, sys_val);
+	tst_file_lines_scanf(file, lineno, NULL, 1, path, fmt, sys_val);
 
 	if (!strcmp(val, sys_val)) {
 		tst_res_(file, lineno, TPASS, "%s %s = '%s'", path, prefix, sys_val);
diff --git a/lib/tst_sys_conf.c b/lib/tst_sys_conf.c
index 4ad9f8b9b..f604966d2 100644
--- a/lib/tst_sys_conf.c
+++ b/lib/tst_sys_conf.c
@@ -99,7 +99,7 @@ void tst_sys_conf_restore(int verbose)
 			tst_res(TINFO, "Restoring conf.: %s -> %s\n",
 				i->path, i->value);
 		}
-		FILE_PRINTF(i->path, "%s", i->value);
+		TST_FILE_PRINTF(i->path, "%s", i->value);
 	}
 }
 
diff --git a/testcases/cve/meltdown.c b/testcases/cve/meltdown.c
index a387b3205..f854b9195 100644
--- a/testcases/cve/meltdown.c
+++ b/testcases/cve/meltdown.c
@@ -261,7 +261,7 @@ find_symbol_in_file(const char *filename, const char *symname)
 
 	sprintf(fmt, "%%lx %%c %s%%c", symname);
 
-	ret = FILE_LINES_SCANF(filename, fmt, &addr, &type, &read);
+	ret = TST_FILE_LINES_SCANF(filename, fmt, &addr, &type, &read);
 	if (ret)
 		return 0;
 
diff --git a/testcases/kernel/device-drivers/cpufreq/cpufreq_boost.c b/testcases/kernel/device-drivers/cpufreq/cpufreq_boost.c
index b9739db37..a5f3ce3f8 100644
--- a/testcases/kernel/device-drivers/cpufreq/cpufreq_boost.c
+++ b/testcases/kernel/device-drivers/cpufreq/cpufreq_boost.c
@@ -78,10 +78,10 @@ static void check_set_turbo(char *file, char *off)
 
 static void cleanup(void)
 {
-	FILE_PRINTF(cdrv[id].file, "%d", boost_value);
+	TST_FILE_PRINTF(cdrv[id].file, "%d", boost_value);
 
 	if (governor[0] != '\0')
-		FILE_PRINTF(governor, "%s", governor_name);
+		TST_FILE_PRINTF(governor, "%s", governor_name);
 }
 
 static void setup(void)
diff --git a/testcases/kernel/mem/hugetlb/hugeshmget/hugeshmget03.c b/testcases/kernel/mem/hugetlb/hugeshmget/hugeshmget03.c
index 2053d0a98..f18c1a124 100644
--- a/testcases/kernel/mem/hugetlb/hugeshmget/hugeshmget03.c
+++ b/testcases/kernel/mem/hugetlb/hugeshmget/hugeshmget03.c
@@ -84,7 +84,7 @@ static void cleanup(void)
 		rm_shm(shm_id_arr[i]);
 
 	if (orig_shmmni != -1)
-		FILE_PRINTF(PATH_SHMMNI, "%ld", orig_shmmni);
+		TST_FILE_PRINTF(PATH_SHMMNI, "%ld", orig_shmmni);
 }
 
 static struct tst_test test = {
diff --git a/testcases/kernel/mem/ksm/ksm01.c b/testcases/kernel/mem/ksm/ksm01.c
index cd2c5c6ee..2d63da20b 100644
--- a/testcases/kernel/mem/ksm/ksm01.c
+++ b/testcases/kernel/mem/ksm/ksm01.c
@@ -88,8 +88,8 @@ static void setup(void)
 static void cleanup(void)
 {
 	if (access(PATH_KSM "merge_across_nodes", F_OK) == 0)
-		FILE_PRINTF(PATH_KSM "merge_across_nodes",
-				 "%d", merge_across_nodes);
+		TST_FILE_PRINTF(PATH_KSM "merge_across_nodes",
+				"%d", merge_across_nodes);
 }
 
 static struct tst_test test = {
diff --git a/testcases/kernel/mem/ksm/ksm02.c b/testcases/kernel/mem/ksm/ksm02.c
index 80017df66..f4595db0f 100644
--- a/testcases/kernel/mem/ksm/ksm02.c
+++ b/testcases/kernel/mem/ksm/ksm02.c
@@ -88,8 +88,8 @@ static void verify_ksm(void)
 static void cleanup(void)
 {
 	if (access(PATH_KSM "merge_across_nodes", F_OK) == 0)
-		FILE_PRINTF(PATH_KSM "merge_across_nodes",
-				 "%d", merge_across_nodes);
+		TST_FILE_PRINTF(PATH_KSM "merge_across_nodes",
+				"%d", merge_across_nodes);
 
 	tst_cgroup_cleanup();
 }
diff --git a/testcases/kernel/mem/ksm/ksm03.c b/testcases/kernel/mem/ksm/ksm03.c
index 83b821c81..f7b29b9b5 100644
--- a/testcases/kernel/mem/ksm/ksm03.c
+++ b/testcases/kernel/mem/ksm/ksm03.c
@@ -88,8 +88,8 @@ static void setup(void)
 static void cleanup(void)
 {
 	if (access(PATH_KSM "merge_across_nodes", F_OK) == 0)
-		FILE_PRINTF(PATH_KSM "merge_across_nodes",
-				 "%d", merge_across_nodes);
+		TST_FILE_PRINTF(PATH_KSM "merge_across_nodes",
+				"%d", merge_across_nodes);
 	tst_cgroup_cleanup();
 }
 
diff --git a/testcases/kernel/mem/ksm/ksm04.c b/testcases/kernel/mem/ksm/ksm04.c
index 65f7e6510..4de06e13b 100644
--- a/testcases/kernel/mem/ksm/ksm04.c
+++ b/testcases/kernel/mem/ksm/ksm04.c
@@ -87,8 +87,8 @@ static void verify_ksm(void)
 static void cleanup(void)
 {
 	if (access(PATH_KSM "merge_across_nodes", F_OK) == 0)
-		FILE_PRINTF(PATH_KSM "merge_across_nodes",
-				 "%d", merge_across_nodes);
+		TST_FILE_PRINTF(PATH_KSM "merge_across_nodes",
+				"%d", merge_across_nodes);
 
 	tst_cgroup_cleanup();
 }
diff --git a/testcases/kernel/mem/ksm/ksm05.c b/testcases/kernel/mem/ksm/ksm05.c
index 380bb0202..bc4ac9e64 100644
--- a/testcases/kernel/mem/ksm/ksm05.c
+++ b/testcases/kernel/mem/ksm/ksm05.c
@@ -99,7 +99,7 @@ static void cleanup(void)
 {
 	/* restore /sys/kernel/mm/ksm/run value */
 	if (ksm_run_orig > 0)
-		FILE_PRINTF(PATH_KSM "run", "%d", ksm_run_orig);
+		TST_FILE_PRINTF(PATH_KSM "run", "%d", ksm_run_orig);
 }
 
 static struct tst_test test = {
diff --git a/testcases/kernel/mem/ksm/ksm06.c b/testcases/kernel/mem/ksm/ksm06.c
index 1c435586e..b0c374de0 100644
--- a/testcases/kernel/mem/ksm/ksm06.c
+++ b/testcases/kernel/mem/ksm/ksm06.c
@@ -75,15 +75,15 @@ static void setup(void)
 static void cleanup(void)
 {
 	if (merge_across_nodes != -1) {
-		FILE_PRINTF(PATH_KSM "merge_across_nodes",
-			    "%d", merge_across_nodes);
+		TST_FILE_PRINTF(PATH_KSM "merge_across_nodes",
+				"%d", merge_across_nodes);
 	}
 
 	if (sleep_millisecs != -1)
-		FILE_PRINTF(PATH_KSM "sleep_millisecs", "%d", sleep_millisecs);
+		TST_FILE_PRINTF(PATH_KSM "sleep_millisecs", "%d", sleep_millisecs);
 
 	if (run != -1)
-		FILE_PRINTF(PATH_KSM "run", "%d", run);
+		TST_FILE_PRINTF(PATH_KSM "run", "%d", run);
 }
 
 static struct tst_test test = {
diff --git a/testcases/kernel/mem/swapping/swapping01.c b/testcases/kernel/mem/swapping/swapping01.c
index 66fc65cbe..49399af3e 100644
--- a/testcases/kernel/mem/swapping/swapping01.c
+++ b/testcases/kernel/mem/swapping/swapping01.c
@@ -83,7 +83,7 @@ static void test_swapping(void)
 static void init_meminfo(void)
 {
 	swap_free_init = SAFE_READ_MEMINFO("SwapFree:");
-	if (FILE_LINES_SCANF("/proc/meminfo", "MemAvailable: %ld",
+	if (TST_FILE_LINES_SCANF("/proc/meminfo", "MemAvailable: %ld",
 		&mem_available_init)) {
 		mem_available_init = SAFE_READ_MEMINFO("MemFree:")
 			+ SAFE_READ_MEMINFO("Cached:");
diff --git a/testcases/kernel/syscalls/fcntl/fcntl33.c b/testcases/kernel/syscalls/fcntl/fcntl33.c
index 8d0d1a5a1..9a90b6888 100644
--- a/testcases/kernel/syscalls/fcntl/fcntl33.c
+++ b/testcases/kernel/syscalls/fcntl/fcntl33.c
@@ -209,7 +209,7 @@ static void cleanup(void)
 		SAFE_CLOSE(fd);
 
 	/* Restore the lease-break-time. */
-	FILE_PRINTF(PATH_LS_BRK_T, "%d", ls_brk_t);
+	TST_FILE_PRINTF(PATH_LS_BRK_T, "%d", ls_brk_t);
 }
 
 static struct tst_test test = {
diff --git a/testcases/kernel/syscalls/fork/fork13.c b/testcases/kernel/syscalls/fork/fork13.c
index 583c8bd4d..751166417 100644
--- a/testcases/kernel/syscalls/fork/fork13.c
+++ b/testcases/kernel/syscalls/fork/fork13.c
@@ -143,7 +143,7 @@ static void setup(void)
 static void cleanup(void)
 {
 	/* Restore pid_max value. */
-	FILE_PRINTF(PID_MAX_PATH, "%lu", pid_max);
+	TST_FILE_PRINTF(PID_MAX_PATH, "%lu", pid_max);
 }
 
 /* The distance mod PIDMAX between two pids, where the first pid is
diff --git a/testcases/kernel/syscalls/migrate_pages/migrate_pages02.c b/testcases/kernel/syscalls/migrate_pages/migrate_pages02.c
index 485a1c5aa..66795cf05 100644
--- a/testcases/kernel/syscalls/migrate_pages/migrate_pages02.c
+++ b/testcases/kernel/syscalls/migrate_pages/migrate_pages02.c
@@ -276,7 +276,7 @@ static void setup(void)
 	else if (tst_kvercmp(2, 6, 18) < 0)
 		tst_brk(TCONF, "2.6.18 or greater kernel required");
 
-	FILE_PRINTF("/proc/sys/kernel/numa_balancing", "0");
+	TST_FILE_PRINTF("/proc/sys/kernel/numa_balancing", "0");
 	/*
 	 * find 2 nodes, which can hold NODE_MIN_FREEMEM bytes
 	 * The reason is that:
diff --git a/testcases/kernel/syscalls/prctl/prctl06.c b/testcases/kernel/syscalls/prctl/prctl06.c
index 21d336c07..ad3afc49f 100644
--- a/testcases/kernel/syscalls/prctl/prctl06.c
+++ b/testcases/kernel/syscalls/prctl/prctl06.c
@@ -87,7 +87,7 @@ static void setup(void)
 	SAFE_CHOWN(BIN_PATH, 0, 0);
 	SAFE_CHMOD(BIN_PATH, SUID_MODE);
 
-	if (FILE_LINES_SCANF(PROC_STATUS, "NoNewPrivs:%d", &field)) {
+	if (TST_FILE_LINES_SCANF(PROC_STATUS, "NoNewPrivs:%d", &field)) {
 		tst_res(TCONF, "%s doesn't support NoNewPrivs field", PROC_STATUS);
 		proc_flag = 0;
 		proc_sup = "No";
diff --git a/testcases/kernel/syscalls/readahead/readahead02.c b/testcases/kernel/syscalls/readahead/readahead02.c
index 258c70e21..6e1d99871 100644
--- a/testcases/kernel/syscalls/readahead/readahead02.c
+++ b/testcases/kernel/syscalls/readahead/readahead02.c
@@ -351,7 +351,7 @@ static void setup_readahead_length(void)
 	/* raise bdi limit as much as kernel allows */
 	ra_new_limit = testfile_size / 1024;
 	while (ra_new_limit > pagesize / 1024) {
-		FILE_PRINTF(sys_bdi_ra_path, "%d", ra_new_limit);
+		TST_FILE_PRINTF(sys_bdi_ra_path, "%d", ra_new_limit);
 		SAFE_FILE_SCANF(sys_bdi_ra_path, "%d", &ra_limit);
 
 		if (ra_limit == ra_new_limit) {
diff --git a/testcases/kernel/tracing/pt_test/pt_test.c b/testcases/kernel/tracing/pt_test/pt_test.c
index 33db6d770..4ded80585 100644
--- a/testcases/kernel/tracing/pt_test/pt_test.c
+++ b/testcases/kernel/tracing/pt_test/pt_test.c
@@ -128,11 +128,11 @@ static int is_affected_by_erratum_BDM106(void)
 {
 	int family = -1, model = -1;
 
-	if (FILE_LINES_SCANF("/proc/cpuinfo", "cpu family%*s%d", &family)
+	if (TST_FILE_LINES_SCANF("/proc/cpuinfo", "cpu family%*s%d", &family)
 		|| family != 6)
 		return 0;
 
-	if (!FILE_LINES_SCANF("/proc/cpuinfo", "model%*s%d", &model)) {
+	if (!TST_FILE_LINES_SCANF("/proc/cpuinfo", "model%*s%d", &model)) {
 		tst_res(TINFO, "Intel FAM6 model %d", model);
 
 		switch (model) {
diff --git a/testcases/network/can/filter-tests/can_common.h b/testcases/network/can/filter-tests/can_common.h
index af0cf5f00..63421849e 100644
--- a/testcases/network/can/filter-tests/can_common.h
+++ b/testcases/network/can/filter-tests/can_common.h
@@ -53,7 +53,7 @@ static void can_setup_vcan(void)
 
 check_echo:
 	SAFE_ASPRINTF(&path, "/sys/class/net/%s/flags", can_dev_name);
-	if (FILE_SCANF(path, "%x", &flags) || !(flags & IFF_ECHO)) {
+	if (TST_FILE_SCANF(path, "%x", &flags) || !(flags & IFF_ECHO)) {
 		tst_res(TWARN,
 			"Could not determine if ECHO is set on %s. This may effect code coverage.",
 			can_dev_name);
diff --git a/testcases/network/packet/fanout01.c b/testcases/network/packet/fanout01.c
index 5067d83a8..8e6a38c03 100644
--- a/testcases/network/packet/fanout01.c
+++ b/testcases/network/packet/fanout01.c
@@ -41,9 +41,9 @@ void setup(void)
 	if (TST_RET)
 		tst_brk(TBROK | TTERRNO, "Can't create new net namespace");
 
-	FILE_PRINTF("/proc/self/setgroups", "deny");
-	FILE_PRINTF("/proc/self/uid_map", "0 %d 1\n", real_uid);
-	FILE_PRINTF("/proc/self/gid_map", "0 %d 1\n", real_gid);
+	TST_FILE_PRINTF("/proc/self/setgroups", "deny");
+	TST_FILE_PRINTF("/proc/self/uid_map", "0 %d 1\n", real_uid);
+	TST_FILE_PRINTF("/proc/self/gid_map", "0 %d 1\n", real_gid);
 
 	tst_fzsync_pair_init(&pair);
 }
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
