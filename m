Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F1F34B640
	for <lists+linux-ltp@lfdr.de>; Sat, 27 Mar 2021 11:34:01 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 70E633C8DEE
	for <lists+linux-ltp@lfdr.de>; Sat, 27 Mar 2021 11:34:01 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 0A8423C8DEE
 for <ltp@lists.linux.it>; Sat, 27 Mar 2021 11:33:13 +0100 (CET)
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 7C78D100054C
 for <ltp@lists.linux.it>; Sat, 27 Mar 2021 11:33:12 +0100 (CET)
Received: by mail-pj1-x102c.google.com with SMTP id
 k23-20020a17090a5917b02901043e35ad4aso5439602pji.3
 for <ltp@lists.linux.it>; Sat, 27 Mar 2021 03:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TmF42VbqTVOsjv2g+AF+miqbwTHmUFXPv9UOSdWzOlM=;
 b=SoL/YPQXgjj1Hylwr7OPGjY1CmLB87yTh6Vd1yeyiZKfYmwAMINsSU/vpAz2WggV57
 nk/PDEzCT+3Uv1NE6MNaYzkiEUTDBJcweQo/JeWjNnwdnDxrA3lCjNAS0k70VYvh3uIW
 xRRIlTa12u8MPVJoG9FmPFeJwOZVo1RfqMlVaHdhXffsSIWIX9Oe7d22IeKqCtaYHUO3
 SA7jTfVBw2oAP+kg07ecCMGt6OTfle1AD3JOb2+j4GBWRLTjAPjMwAHUUDxpwnoesfv9
 ZvZeOcKKd5oiJDQi0iAmC0A0V9nOLpeK4lUaMHFGmlOdnD+Zi8xaLgYGDUJWkAC2PPEB
 U2Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TmF42VbqTVOsjv2g+AF+miqbwTHmUFXPv9UOSdWzOlM=;
 b=t5iNhMDVEgrA/nWrA4TTIVPgwTg39nAW757zLOfP/RPLiqxBuMxTEWBNOXDh98LOLS
 x5PIleRfLtXuPn+KJQZ2FshPwKoME2zBNUOiQz5wIrlJqfSz6yxrBgvMld6RWoJp9VWx
 5B/lAeJn55Whw8h9SGRFg7Zq/Gev7joX8ICSds6qyb0qoLshXwJhuU7969FQdfP9zHFh
 W56H4OvQcMsOD4MH6ZPPr9BkXzYiVBPDk07cgD98ph5+wpHWsy4M/POlIGACev548gqb
 brCkntYRtiWq4iyIzXK7WqYCH489arcDs/kbOuo206U3u08uIpf+kOuRoCk7DfOHcClb
 bG2w==
X-Gm-Message-State: AOAM531bzqNPC101iXlnDxye8qaJzDXmfwDbRNRd/9icxv+EhK7G38jW
 myqK0T9WEFBazBlnFw5E6HCmXnJeQUPJnw==
X-Google-Smtp-Source: ABdhPJwlIZdjJFdKP0MFEzkxeednlZ+JRPr3oWJPX8dGFNMqP0XyzQWNfr9vk6Z8ldesta/+Z0tzlw==
X-Received: by 2002:a17:902:74cb:b029:e4:7a16:9925 with SMTP id
 f11-20020a17090274cbb02900e47a169925mr20440973plt.39.1616841190638; 
 Sat, 27 Mar 2021 03:33:10 -0700 (PDT)
Received: from localhost.localdomain (softbank060103061185.bbtec.net.
 [60.103.61.185])
 by smtp.gmail.com with ESMTPSA id q184sm11890097pfc.78.2021.03.27.03.33.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Mar 2021 03:33:10 -0700 (PDT)
From: QI Fuli <fukuri.sai@gmail.com>
X-Google-Original-From: QI Fuli <qi.fuli@fujitsu.com>
To: ltp@lists.linux.it
Date: Sat, 27 Mar 2021 19:32:26 +0900
Message-Id: <20210327103226.99073-7-qi.fuli@fujitsu.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210327103226.99073-1-qi.fuli@fujitsu.com>
References: <20210327103226.99073-1-qi.fuli@fujitsu.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 6/6] syscalls/swapoff/swapoff02: Convert swapoff02 to
 the new API
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
Cc: QI Fuli <qi.fuli@fujitsu.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

From: QI Fuli <qi.fuli@fujitsu.com>

convert swapoff02 to the new API and remove libs/libltpswapon

Signed-off-by: QI Fuli <qi.fuli@fujitsu.com>
---
 include/libswapon.h                           |  39 -----
 libs/libltpswapon/Makefile                    |  12 --
 libs/libltpswapon/libswapon.c                 |  90 -----------
 testcases/kernel/syscalls/swapoff/swapoff02.c | 142 ++++++------------
 4 files changed, 43 insertions(+), 240 deletions(-)
 delete mode 100644 include/libswapon.h
 delete mode 100644 libs/libltpswapon/Makefile
 delete mode 100644 libs/libltpswapon/libswapon.c

diff --git a/include/libswapon.h b/include/libswapon.h
deleted file mode 100644
index a51833ec1..000000000
--- a/include/libswapon.h
+++ /dev/null
@@ -1,39 +0,0 @@
-/*
- * Copyright (c) 2013 Oracle and/or its affiliates. All Rights Reserved.
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License as
- * published by the Free Software Foundation; either version 2 of
- * the License, or (at your option) any later version.
- *
- * This program is distributed in the hope that it would be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, write the Free Software Foundation,
- * Inc.,  51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
- *
- * Author: Stanislav Kholmanskikh <stanislav.kholmanskikh@oracle.com>
- *
- */
-
-/*
- * Contains common content for all swapon tests
- */
-
-#ifndef __LIBSWAPON_H__
-#define __LIBSWAPON_H__
-
-/*
- * Make a swap file
- */
-int make_swapfile(void (cleanup)(void), const char *swapfile, int safe);
-
-/*
- * Check swapon/swapoff support status of filesystems or files
- * we are testing on.
- */
-void is_swap_supported(void (cleanup)(void), const char *filename);
-#endif /* __LIBSWAPON_H__ */
diff --git a/libs/libltpswapon/Makefile b/libs/libltpswapon/Makefile
deleted file mode 100644
index 8f738338b..000000000
--- a/libs/libltpswapon/Makefile
+++ /dev/null
@@ -1,12 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-or-later
-#
-# Copyright (C) Richard Purdie <richard.purdie@linuxfoundation.org>
-
-top_srcdir		?= ../..
-
-include $(top_srcdir)/include/mk/env_pre.mk
-
-INTERNAL_LIB		:= libltpswapon.a
-
-include $(top_srcdir)/include/mk/lib.mk
-include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/libs/libltpswapon/libswapon.c b/libs/libltpswapon/libswapon.c
deleted file mode 100644
index a4f0bef28..000000000
--- a/libs/libltpswapon/libswapon.c
+++ /dev/null
@@ -1,90 +0,0 @@
-/*
- * Copyright (c) 2013 Oracle and/or its affiliates. All Rights Reserved.
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License as
- * published by the Free Software Foundation; either version 2 of
- * the License, or (at your option) any later version.
- *
- * This program is distributed in the hope that it would be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, write the Free Software Foundation,
- * Inc.,  51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
- *
- * Author: Stanislav Kholmanskikh <stanislav.kholmanskikh@oracle.com>
- *
- */
-
-#include <errno.h>
-#include "lapi/syscalls.h"
-#include "test.h"
-#include "libswapon.h"
-
-/*
- * Make a swap file
- */
-int make_swapfile(void (cleanup)(void), const char *swapfile, int safe)
-{
-	if (!tst_fs_has_free(NULL, ".", sysconf(_SC_PAGESIZE) * 10,
-	    TST_BYTES)) {
-		tst_brkm(TBROK, cleanup,
-			"Insufficient disk space to create swap file");
-	}
-
-	/* create file */
-	if (tst_fill_file(swapfile, 0,
-			sysconf(_SC_PAGESIZE), 10) != 0) {
-		tst_brkm(TBROK, cleanup, "Failed to create swapfile");
-	}
-
-	/* make the file swapfile */
-	const char *argv[2 + 1];
-	argv[0] = "mkswap";
-	argv[1] = swapfile;
-	argv[2] = NULL;
-
-	return tst_cmd(cleanup, argv, "/dev/null", "/dev/null", safe);
-}
-
-/*
- * Check swapon/swapoff support status of filesystems or files
- * we are testing on.
- */
-void is_swap_supported(void (cleanup)(void), const char *filename)
-{
-	int fibmap = tst_fibmap(filename);
-	long fs_type = tst_fs_type(cleanup, filename);
-	const char *fstype = tst_fs_type_name(fs_type);
-
-	int ret = make_swapfile(NULL, filename, 1);
-	if (ret != 0) {
-		if (fibmap == 1) {
-			tst_brkm(TCONF, cleanup,
-				"mkswap on %s not supported", fstype);
-		} else {
-			tst_brkm(TFAIL, cleanup,
-				"mkswap on %s failed", fstype);
-		}
-	}
-
-	TEST(ltp_syscall(__NR_swapon, filename, 0));
-	if (TEST_RETURN == -1) {
-		if (fibmap == 1 && errno == EINVAL) {
-			tst_brkm(TCONF, cleanup,
-				"Swapfile on %s not implemented", fstype);
-		} else {
-			tst_brkm(TFAIL | TERRNO, cleanup,
-				 "swapon on %s failed", fstype);
-		}
-	}
-
-	TEST(ltp_syscall(__NR_swapoff, filename, 0));
-	if (TEST_RETURN == -1) {
-		tst_brkm(TFAIL | TTERRNO, cleanup,
-			"swapoff on %s failed", fstype);
-	}
-}
diff --git a/testcases/kernel/syscalls/swapoff/swapoff02.c b/testcases/kernel/syscalls/swapoff/swapoff02.c
index 60cd66c26..09f8f64ac 100644
--- a/testcases/kernel/syscalls/swapoff/swapoff02.c
+++ b/testcases/kernel/syscalls/swapoff/swapoff02.c
@@ -1,18 +1,7 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
 /*
  * Copyright (c) Wipro Technologies Ltd, 2002.  All Rights Reserved.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of version 2 of the GNU General Public License as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it would be useful, but
- * WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
- *
- * You should have received a copy of the GNU General Public License along
- * with this program; if not, write the Free Software Foundation, Inc.,
- * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
- *
  */
 
 /*
@@ -22,134 +11,89 @@
  *  3. EPERM when user is not a superuser
  */
 
-#include <unistd.h>
 #include <errno.h>
-#include <sys/types.h>
-#include <sys/stat.h>
-#include <fcntl.h>
 #include <pwd.h>
-#include <string.h>
-#include <stdlib.h>
-#include "test.h"
+#include "tst_test.h"
 #include "lapi/syscalls.h"
-#include "safe_macros.h"
-#include "libswapon.h"
+#include "libswap.h"
 
-static void setup(void);
-static void cleanup(void);
 static int setup01(void);
 static void cleanup01(void);
 
-char *TCID = "swapoff02";
-int TST_TOTAL = 3;
-
 static uid_t nobody_uid;
 
-static struct test_case_t {
+static struct tcase {
 	char *err_desc;
 	int exp_errno;
 	char *exp_errval;
 	char *path;
 	int (*setup)(void);
 	void (*cleanup)(void);
-} testcase[] = {
+} tcases[] = {
 	{"path does not exist", ENOENT, "ENOENT", "./doesnotexist", NULL, NULL},
 	{"Invalid file", EINVAL, "EINVAL", "./swapfile01", NULL, NULL},
 	{"Permission denied", EPERM, "EPERM", "./swapfile01", setup01, cleanup01}
 };
 
-int main(int ac, char **av)
+static void verify_swapoff(unsigned int i)
 {
-	int lc, i;
-
-	tst_parse_opts(ac, av, NULL, NULL);
-
-	setup();
-
-	for (lc = 0; TEST_LOOPING(lc); lc++) {
-
-		tst_count = 0;
-
-		for (i = 0; i < TST_TOTAL; i++) {
-
-			if (testcase[i].setup)
-				testcase[i].setup();
-
-			TEST(ltp_syscall(__NR_swapoff, testcase[i].path));
-
-			if (testcase[i].cleanup)
-				testcase[i].cleanup();
-
-			if (TEST_RETURN == -1
-			    && (TEST_ERRNO == testcase[i].exp_errno)) {
-				tst_resm(TPASS,
-					 "swapoff(2) expected failure;"
-					 " Got errno - %s : %s",
-					 testcase[i].exp_errval,
-					 testcase[i].err_desc);
-
-			} else {
-				tst_resm(TFAIL, "swapoff(2) failed to produce"
-					 " expected error; %d, errno"
-					 ": %s and got %d",
-					 testcase[i].exp_errno,
-					 testcase[i].exp_errval, TEST_ERRNO);
-
-				if ((TEST_RETURN == 0) && (i == 2)) {
-					if (ltp_syscall
-					    (__NR_swapon, "./swapfile01",
-					     0) != 0) {
-						tst_brkm(TBROK, cleanup,
-							 " Failed to turn on"
-							 " swap file");
-					}
-				}
-			}
+	struct tcase *tc = tcases + i;
+	if (tc->setup)
+		tc->setup();
+
+	TEST(tst_syscall(__NR_swapoff, tc->path));
+
+	if (tc->cleanup)
+		tc->cleanup();
+
+	if (TST_RET == -1 && (TST_ERR == tc->exp_errno)) {
+		tst_res(TPASS, "swapoff(2) expected failure;"
+			" Got errno - %s : %s",
+			tc->exp_errval, tc->err_desc);
+	} else {
+		tst_res(TFAIL, "swapoff(2) failed to produce"
+			" expected error; %d, errno"
+			": %s and got %d",
+			tc->exp_errno, tc->exp_errval, TST_ERR);
+
+		if ((TST_RET == 0) && (i == 2)) {
+			if (tst_syscall(__NR_swapon, "./swapfile01", 0) != 0)
+				tst_brk(TBROK, " Failed to turn on swap file");
 		}
 	}
-
-	cleanup();
-	tst_exit();
 }
 
 static int setup01(void)
 {
-	SAFE_SETEUID(cleanup, nobody_uid);
+	SAFE_SETEUID(nobody_uid);
 	return 0;
 }
 
 static void cleanup01(void)
 {
-	SAFE_SETEUID(cleanup, 0);
+	SAFE_SETEUID(0);
 }
 
 static void setup(void)
 {
 	struct passwd *nobody;
 
-	tst_sig(FORK, DEF_HANDLER, cleanup);
-
-	tst_require_root();
-
-	nobody = SAFE_GETPWNAM(NULL, "nobody");
+	nobody = SAFE_GETPWNAM("nobody");
 	nobody_uid = nobody->pw_uid;
 
-	TEST_PAUSE;
-
-	tst_tmpdir();
+	is_swap_supported("./tstswap");
 
-	is_swap_supported(cleanup, "./tstswap");
-
-	if (!tst_fs_has_free(NULL, ".", 1, TST_KB)) {
-		tst_brkm(TBROK, cleanup,
-			 "Insufficient disk space to create swap file");
-	}
+	if (!tst_fs_has_free(".", 1, TST_KB))
+		tst_brk(TBROK, "Insufficient disk space to create swap file");
 
 	if (tst_fill_file("./swapfile01", 0x00, 1024, 1))
-		tst_brkm(TBROK, cleanup, "Failed to create swapfile");
+		tst_brk(TBROK, "Failed to create swapfile");
 }
 
-static void cleanup(void)
-{
-	tst_rmdir();
-}
+static struct tst_test test = {
+	.needs_root = 1,
+	.needs_tmpdir = 1,
+	.test = verify_swapoff,
+	.tcnt = ARRAY_SIZE(tcases),
+	.setup = setup
+};
-- 
2.30.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
