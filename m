Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E232CEB83
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Dec 2020 10:59:48 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A6C133C2B71
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Dec 2020 10:59:48 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id D24C53C2B71
 for <ltp@lists.linux.it>; Fri,  4 Dec 2020 10:59:35 +0100 (CET)
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 611AC14013AF
 for <ltp@lists.linux.it>; Fri,  4 Dec 2020 10:59:35 +0100 (CET)
Received: by mail-ej1-x641.google.com with SMTP id x16so7807407ejj.7
 for <ltp@lists.linux.it>; Fri, 04 Dec 2020 01:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QXZHyPaSlC+12ckoS2mFp61ukEvnW8eXh9ddEyd63lQ=;
 b=ufqteL/VgAFkGHPX+TU2iuDuyHuaVEVrC4WmrcO2B5MdEu9sLvBnTxNma6NMtliHdy
 4GTMkD0l4Xr0n+O9NH2F1tqh+Dec/iWVtZpWy2XKUp0eGNXNCAsDjFUJ6kHDUz/vNeTe
 //mMOmIF/PFcuz48ndO/CdlFj6qS/WEXk/6uEOFVlbC8wCBs1737rWQlyakl9l2s8HN0
 B2dHQIXCL0xZjYExvcZXUJH8uqgg9cjz4jaryFQSdE7ZW3O77gbNIQP0S8hd5o0FNTrw
 eDVdu9KyOvHMGTtHtUWuY/VEcJDTObDvxVJa17YHGz7oTBt05zORz8ia3ULBISo8/P9I
 wUMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QXZHyPaSlC+12ckoS2mFp61ukEvnW8eXh9ddEyd63lQ=;
 b=rRCSrso1ZaXobd7XnzaUGZXLH1JO2RgEHUYdEw1GGIUB9uuTGLkA1bxGIyhX9Gk0/F
 YZdxMYL6tZ1Yq/L9nlZXbUn+Rplre76H9rLoQa7EVyf6HQpNt/wokpiUEyayCMCARegU
 pnA3z6/GhiWqg0uaxPwP2i18yZFAE9VfECL0CLIjIpiNpnZZuZIQZzexbmcJ0ZEBlwjr
 +sfIY0oerPMimQir0Z5FdeI4fsy4JgTRVT9dzO7Wwn32TiWbbbUZZiqg9qvAsTYg5BYb
 +zglvQhrW0VoUsZuy6BKPr3zmBxoL4gvt1iC3b08MBzGIDrCddZvDNsaL2orBEa64IfW
 4cTw==
X-Gm-Message-State: AOAM531R3oFNEPHcYr1h/cwypqWtFJVw3Thn/E0OtrfoI1Qe3yHFQr18
 T24xSlCYjfTckVdM/7PVjhJZTK5LqAQ=
X-Google-Smtp-Source: ABdhPJwTzJAUUglhquFX7I8+a/hVIx8uS6FqpK/CzNgE1HgbJfh/kWSHx+Zzk8PPgBgxwNckC2plgA==
X-Received: by 2002:a17:906:3187:: with SMTP id
 7mr6368281ejy.225.1607075974987; 
 Fri, 04 Dec 2020 01:59:34 -0800 (PST)
Received: from localhost.localdomain ([31.210.181.203])
 by smtp.gmail.com with ESMTPSA id qp16sm2701811ejb.74.2020.12.04.01.59.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Dec 2020 01:59:34 -0800 (PST)
From: Amir Goldstein <amir73il@gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Date: Fri,  4 Dec 2020 11:59:26 +0200
Message-Id: <20201204095930.866421-2-amir73il@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201204095930.866421-1-amir73il@gmail.com>
References: <20201204095930.866421-1-amir73il@gmail.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 1/5] syscalls/fanotify: Generalize check for
 FAN_REPORT_FID support
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
Cc: Jan Kara <jack@suse.cz>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Generalize the helpers to be able to check any fanotify_init() flags
and pass FAN_REPORT_FID as argument in call sites.

Add helper fanotify_init_flags_supported_by_kernel() to check for
kernel support for fanotify_init flags without checking fs support
for those flags.

Signed-off-by: Amir Goldstein <amir73il@gmail.com>
---
 testcases/kernel/syscalls/fanotify/fanotify.h | 46 ++++++++++++-------
 .../kernel/syscalls/fanotify/fanotify01.c     |  4 +-
 .../kernel/syscalls/fanotify/fanotify13.c     |  2 +-
 .../kernel/syscalls/fanotify/fanotify15.c     |  2 +-
 .../kernel/syscalls/fanotify/fanotify16.c     |  2 +-
 5 files changed, 34 insertions(+), 22 deletions(-)

diff --git a/testcases/kernel/syscalls/fanotify/fanotify.h b/testcases/kernel/syscalls/fanotify/fanotify.h
index 82e03db26..8907db052 100644
--- a/testcases/kernel/syscalls/fanotify/fanotify.h
+++ b/testcases/kernel/syscalls/fanotify/fanotify.h
@@ -286,15 +286,15 @@ static inline int fanotify_events_supported_by_kernel(uint64_t mask)
 
 /*
  * @return  0: fanotify supported both in kernel and on tested filesystem
- * @return -1: FAN_REPORT_FID not supported in kernel
- * @return -2: FAN_REPORT_FID not supported on tested filesystem
+ * @return -1: @flags not supported in kernel
+ * @return -2: @flags not supported on tested filesystem (tested if @fname is not NULL)
  */
-static inline int fanotify_fan_report_fid_supported_on_fs(const char *fname)
+static inline int fanotify_init_flags_supported_on_fs(unsigned int flags, const char *fname)
 {
 	int fd;
 	int rval = 0;
 
-	fd = fanotify_init(FAN_CLASS_NOTIF | FAN_REPORT_FID, O_RDONLY);
+	fd = fanotify_init(flags, O_RDONLY);
 
 	if (fd < 0) {
 		if (errno == ENOSYS)
@@ -306,7 +306,7 @@ static inline int fanotify_fan_report_fid_supported_on_fs(const char *fname)
 		tst_brk(TBROK | TERRNO, "fanotify_init() failed");
 	}
 
-	if (fanotify_mark(fd, FAN_MARK_ADD, FAN_ACCESS, AT_FDCWD, fname) < 0) {
+	if (fname && fanotify_mark(fd, FAN_MARK_ADD, FAN_ACCESS, AT_FDCWD, fname) < 0) {
 		if (errno == ENODEV || errno == EOPNOTSUPP || errno == EXDEV) {
 			rval = -2;
 		} else {
@@ -321,20 +321,32 @@ static inline int fanotify_fan_report_fid_supported_on_fs(const char *fname)
 	return rval;
 }
 
-#define FANOTIFY_FAN_REPORT_FID_ERR_MSG_(res_func, fail) do { \
-	if (fail == -1) \
-		res_func(TCONF, "FAN_REPORT_FID not supported in kernel?"); \
-	if (fail == -2) \
-		res_func(TCONF, "FAN_REPORT_FID not supported on %s filesystem", \
-			tst_device->fs_type); \
-	} while (0)
+static inline int fanotify_init_flags_supported_by_kernel(unsigned int flags)
+{
+	return fanotify_init_flags_supported_on_fs(flags, NULL);
+}
+
+typedef void (*tst_res_func_t)(const char *file, const int lineno,
+			       int ttype, const char *fmt, ...);
+
+static inline void fanotify_init_flags_err_msg(const char *flags_str,
+	const char *file, const int lineno, tst_res_func_t res_func, int fail)
+{
+	if (fail == -1)
+		res_func(file, lineno, TCONF,
+			 "%s not supported in kernel?", flags_str);
+	if (fail == -2)
+		res_func(file, lineno, TCONF,
+			 "%s not supported on %s filesystem",
+			 flags_str, tst_device->fs_type);
+}
 
-#define FANOTIFY_FAN_REPORT_FID_ERR_MSG(fail) \
-	FANOTIFY_FAN_REPORT_FID_ERR_MSG_(tst_res, (fail))
+#define FANOTIFY_INIT_FLAGS_ERR_MSG(flags, fail) \
+	fanotify_init_flags_err_msg(#flags, __FILE__, __LINE__, tst_res_, (fail))
 
-#define REQUIRE_FANOTIFY_FAN_REPORT_FID_SUPPORTED_ON_FS(fname) do { \
-	FANOTIFY_FAN_REPORT_FID_ERR_MSG_(tst_brk, \
-		fanotify_fan_report_fid_supported_on_fs(fname)); \
+#define REQUIRE_FANOTIFY_INIT_FLAGS_SUPPORTED_ON_FS(flags, fname) do { \
+	fanotify_init_flags_err_msg(#flags, __FILE__, __LINE__, tst_brk_, \
+		fanotify_init_flags_supported_on_fs(flags, fname)); \
 	} while (0)
 
 static inline int fanotify_mark_supported_by_kernel(uint64_t flag)
diff --git a/testcases/kernel/syscalls/fanotify/fanotify01.c b/testcases/kernel/syscalls/fanotify/fanotify01.c
index d6d72dad9..cdb01730f 100644
--- a/testcases/kernel/syscalls/fanotify/fanotify01.c
+++ b/testcases/kernel/syscalls/fanotify/fanotify01.c
@@ -90,7 +90,7 @@ static void test_fanotify(unsigned int n)
 	tst_res(TINFO, "Test #%d: %s", n, tc->tname);
 
 	if (fan_report_fid_unsupported && (tc->init_flags & FAN_REPORT_FID)) {
-		FANOTIFY_FAN_REPORT_FID_ERR_MSG(fan_report_fid_unsupported);
+		FANOTIFY_INIT_FLAGS_ERR_MSG(FAN_REPORT_FID, fan_report_fid_unsupported);
 		return;
 	}
 
@@ -334,7 +334,7 @@ static void setup(void)
 	sprintf(fname, MOUNT_PATH"/tfile_%d", getpid());
 	SAFE_FILE_PRINTF(fname, "1");
 
-	fan_report_fid_unsupported = fanotify_fan_report_fid_supported_on_fs(fname);
+	fan_report_fid_unsupported = fanotify_init_flags_supported_on_fs(FAN_REPORT_FID, fname);
 	filesystem_mark_unsupported = fanotify_mark_supported_by_kernel(FAN_MARK_FILESYSTEM);
 }
 
diff --git a/testcases/kernel/syscalls/fanotify/fanotify13.c b/testcases/kernel/syscalls/fanotify/fanotify13.c
index a402cdb13..c9cf10555 100644
--- a/testcases/kernel/syscalls/fanotify/fanotify13.c
+++ b/testcases/kernel/syscalls/fanotify/fanotify13.c
@@ -256,7 +256,7 @@ out:
 
 static void do_setup(void)
 {
-	REQUIRE_FANOTIFY_FAN_REPORT_FID_SUPPORTED_ON_FS(MOUNT_PATH);
+	REQUIRE_FANOTIFY_INIT_FLAGS_SUPPORTED_ON_FS(FAN_REPORT_FID, MOUNT_PATH);
 
 	filesystem_mark_unsupported = fanotify_mark_supported_by_kernel(FAN_MARK_FILESYSTEM);
 
diff --git a/testcases/kernel/syscalls/fanotify/fanotify15.c b/testcases/kernel/syscalls/fanotify/fanotify15.c
index 9e3748bc2..ba8259c7c 100644
--- a/testcases/kernel/syscalls/fanotify/fanotify15.c
+++ b/testcases/kernel/syscalls/fanotify/fanotify15.c
@@ -270,7 +270,7 @@ static void do_test(unsigned int number)
 static void do_setup(void)
 {
 	SAFE_MKDIR(TEST_DIR, 0755);
-	REQUIRE_FANOTIFY_FAN_REPORT_FID_SUPPORTED_ON_FS(TEST_DIR);
+	REQUIRE_FANOTIFY_INIT_FLAGS_SUPPORTED_ON_FS(FAN_REPORT_FID, TEST_DIR);
 	fanotify_fd = SAFE_FANOTIFY_INIT(FAN_REPORT_FID, O_RDONLY);
 }
 
diff --git a/testcases/kernel/syscalls/fanotify/fanotify16.c b/testcases/kernel/syscalls/fanotify/fanotify16.c
index a554c7d39..a4409df14 100644
--- a/testcases/kernel/syscalls/fanotify/fanotify16.c
+++ b/testcases/kernel/syscalls/fanotify/fanotify16.c
@@ -551,7 +551,7 @@ check_match:
 
 static void setup(void)
 {
-	REQUIRE_FANOTIFY_FAN_REPORT_FID_SUPPORTED_ON_FS(MOUNT_PATH);
+	REQUIRE_FANOTIFY_INIT_FLAGS_SUPPORTED_ON_FS(FAN_REPORT_FID, MOUNT_PATH);
 
 	sprintf(dname1, "%s/%s", MOUNT_PATH, DIR_NAME1);
 	sprintf(dname2, "%s/%s", MOUNT_PATH, DIR_NAME2);
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
