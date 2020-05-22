Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B78F91DE4EA
	for <lists+linux-ltp@lfdr.de>; Fri, 22 May 2020 12:55:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 51FC13C4C16
	for <lists+linux-ltp@lfdr.de>; Fri, 22 May 2020 12:55:30 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id B9C403C4CC5
 for <ltp@lists.linux.it>; Fri, 22 May 2020 12:52:34 +0200 (CEST)
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 5CE841400B84
 for <ltp@lists.linux.it>; Fri, 22 May 2020 12:52:33 +0200 (CEST)
Received: by mail-pg1-x544.google.com with SMTP id f21so1837060pgg.12
 for <ltp@lists.linux.it>; Fri, 22 May 2020 03:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Muf7CuAcsvL1Wa0EAonZGxnv56OdkWBqb3CBobThhNI=;
 b=WYfyNR8boxQscfiT4i7524eEc+kd+1ikx45hNr1x2eJmM9mjnxBImgOP8XVQjIiU6j
 C4eR3XwQYNrhC/HFA0CbWfgm2O12d5mYbJJBnidOaVbuhfmMi5KwXpYj77QZdLJniFle
 rjrLWk4axok8222sgVLrWeh1wTmFcW2Lh4fW7FdFJFg0qNKo9m+1t61/A5UZkUh5HbYu
 jGIBwqnnj5utRMx6m0wK+xy5/iMNbLP6V9wNhT7IiSMpvFLb9Ums+ATbQ3yXu+/Gjenc
 j8gtTniLCoY/rtBdD55j/NEhoVlC9ahAfnavDE0Jodseh4ESKT60yYJAQoBfDLrU1d6m
 2f+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Muf7CuAcsvL1Wa0EAonZGxnv56OdkWBqb3CBobThhNI=;
 b=kELmI9P+fJyakwFryTvmKqC02PGTdr0CpA09/mm5pMtY11KeWTJszQnPYhGkxntCNM
 6u2QvGDZVwqsl+cNTuX1z2XB0Aun0G87NKjopEWWLjX6dc80B+PPWPL3TiO6uEv2A8nE
 Hteo16fZhTn73+NyDdoEgkwmWsgieVJyky8lDgUKB4qGWcktiGfw08adRN6jvnaR7ays
 shtN4tH+nAqhHJsG/2DBXE37fgl3jLUsDchFGSfbOpgZmhdf7lJ2COwOMc0eB3GXSO18
 0eCBMinMgY0p/Q4QMYK+pxp881eTw+Lz+rMp4ecIlwc/I4PzOXdVmuUgKSr7HiJvHUHl
 2ojQ==
X-Gm-Message-State: AOAM531lI2sSjaPZBPdmitxsNEHzl1GvKKkiuffFvjqGCWemvbthCKwo
 WESYXGLnv8R33ZUa3zK6xZMARQB/+14=
X-Google-Smtp-Source: ABdhPJyvl3Qua5rdxVJc6/qCzgtoSkAr6QbbzA7k+IjKxDftomkNNSFHK9iVARY+V2BI5FbDUcU5cQ==
X-Received: by 2002:a63:5020:: with SMTP id e32mr13030349pgb.176.1590144751545; 
 Fri, 22 May 2020 03:52:31 -0700 (PDT)
Received: from localhost ([122.167.130.103])
 by smtp.gmail.com with ESMTPSA id d184sm6334695pfc.130.2020.05.22.03.52.30
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 22 May 2020 03:52:30 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Fri, 22 May 2020 16:21:37 +0530
Message-Id: <39f66e596f390f0019225c4cac77c3d4996b7c5d.1590144577.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1590144577.git.viresh.kumar@linaro.org>
References: <cover.1590144577.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH V4 17/17] syscalls/utimensat: Add support for time64
 tests
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, arnd@arndb.de,
 Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

This adds support for time64 tests to the existing utimensat() syscall
tests.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 runtest/syscalls                              |  2 +-
 testcases/kernel/syscalls/utimensat/Makefile  |  4 -
 .../kernel/syscalls/utimensat/utimensat01.c   | 74 ++++++++++++++++---
 3 files changed, 65 insertions(+), 15 deletions(-)

diff --git a/runtest/syscalls b/runtest/syscalls
index 4a19075cd131..e1271f9e34aa 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -1600,7 +1600,7 @@ utime06 utime06
 utimes01 utimes01
 
 # Introduced from Kernel 2.6.22 onwards
-utimensat01 utimensat_tests.sh
+utimensat01 utimensat01
 
 vfork01 vfork01
 vfork02 vfork02
diff --git a/testcases/kernel/syscalls/utimensat/Makefile b/testcases/kernel/syscalls/utimensat/Makefile
index 69cab8dbc057..044619fb8724 100644
--- a/testcases/kernel/syscalls/utimensat/Makefile
+++ b/testcases/kernel/syscalls/utimensat/Makefile
@@ -5,8 +5,4 @@ top_srcdir		?= ../../../..
 
 include $(top_srcdir)/include/mk/testcases.mk
 
-vpath %.c $(srcdir):$(top_srcdir)/lib
-
-INSTALL_TARGETS		:= utimensat_tests.sh
-
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/utimensat/utimensat01.c b/testcases/kernel/syscalls/utimensat/utimensat01.c
index 97a43713454f..0139d6ddfedf 100644
--- a/testcases/kernel/syscalls/utimensat/utimensat01.c
+++ b/testcases/kernel/syscalls/utimensat/utimensat01.c
@@ -16,8 +16,7 @@
 #include <string.h>
 #include <sys/stat.h>
 #include "lapi/fs.h"
-#include "tst_test.h"
-#include "lapi/syscalls.h"
+#include "tst_timer.h"
 
 #define UTIME_NOW	((1l << 30) - 1l)
 #define UTIME_OMIT	((1l << 30) - 2l)
@@ -98,13 +97,68 @@ struct test_case {
 };
 
 static inline int sys_utimensat(int dirfd, const char *pathname,
-				const struct timespec times[2], int flags)
+				void *times, int flags)
 {
 	return tst_syscall(__NR_utimensat, dirfd, pathname, times, flags);
 }
 
+static inline int sys_utimensat_time64(int dirfd, const char *pathname,
+				       void *times, int flags)
+{
+	return tst_syscall(__NR_utimensat_time64, dirfd, pathname, times, flags);
+}
+
+static struct test_variants {
+	int (*utimensat)(int dirfd, const char *pathname, void *times,
+			 int flags);
+	enum tst_ts_type type;
+	char *desc;
+} variants[] = {
+#if (__NR_utimensat != __LTP__NR_INVALID_SYSCALL)
+	{ .utimensat = sys_utimensat, .type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with old kernel spec"},
+#endif
+
+#if (__NR_utimensat_time64 != __LTP__NR_INVALID_SYSCALL)
+	{ .utimensat = sys_utimensat_time64, .type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec"},
+#endif
+};
+
+union tst_multi {
+	struct timespec libc_ts[2];
+	struct __kernel_old_timespec kern_old_ts[2];
+	struct __kernel_timespec kern_ts[2];
+} ts;
+
+static void tst_multi_set_time(enum tst_ts_type type, long access_tv_sec,
+			long access_tv_nsec, long mod_tv_sec, long mod_tv_nsec)
+{
+	switch (type) {
+	case TST_LIBC_TIMESPEC:
+		ts.libc_ts[0].tv_sec = access_tv_sec;
+		ts.libc_ts[0].tv_nsec = access_tv_nsec;
+		ts.libc_ts[1].tv_sec = mod_tv_sec;
+		ts.libc_ts[1].tv_nsec = mod_tv_nsec;
+		break;
+	case TST_KERN_OLD_TIMESPEC:
+		ts.kern_old_ts[0].tv_sec = access_tv_sec;
+		ts.kern_old_ts[0].tv_nsec = access_tv_nsec;
+		ts.kern_old_ts[1].tv_sec = mod_tv_sec;
+		ts.kern_old_ts[1].tv_nsec = mod_tv_nsec;
+		break;
+	case TST_KERN_TIMESPEC:
+		ts.kern_ts[0].tv_sec = access_tv_sec;
+		ts.kern_ts[0].tv_nsec = access_tv_nsec;
+		ts.kern_ts[1].tv_sec = mod_tv_sec;
+		ts.kern_ts[1].tv_nsec = mod_tv_nsec;
+		break;
+	default:
+		tst_brk(TBROK, "Invalid type: %d", type);
+	}
+}
+
 static void setup(void)
 {
+	tst_res(TINFO, "Testing variant: %s", variants[tst_variant].desc);
 	bad_addr = tst_get_bad_addr(NULL);
 }
 
@@ -144,8 +198,8 @@ static void change_attr(struct test_case *tc, int fd, int set)
 
 static void run(unsigned int i)
 {
+	struct test_variants *tv = &variants[tst_variant];
 	struct test_case *tc = &tcase[i];
-	struct timespec ts[2];
 	void *tsp = NULL;
 	char *pathname = NULL;
 	int dfd = AT_FDCWD, fd = 0;
@@ -160,11 +214,10 @@ static void run(unsigned int i)
 	if (tc->mytime) {
 		struct mytime *mytime = *tc->mytime;
 
-		ts[0].tv_sec = mytime->access_tv_sec;
-		ts[0].tv_nsec = mytime->access_tv_nsec;
-		ts[1].tv_sec = mytime->mod_tv_sec;
-		ts[1].tv_nsec = mytime->mod_tv_nsec;
-		tsp = ts;
+		tst_multi_set_time(tv->type, mytime->access_tv_sec,
+				   mytime->access_tv_nsec, mytime->mod_tv_sec,
+				   mytime->mod_tv_nsec);
+		tsp = &ts.libc_ts;
 	} else if (tc->exp_err == EFAULT) {
 		tsp = bad_addr;
 	}
@@ -178,7 +231,7 @@ static void run(unsigned int i)
 		pathname = bad_addr;
 	}
 
-	TEST(sys_utimensat(dfd, pathname, tsp, tc->flags));
+	TEST(tv->utimensat(dfd, pathname, tsp, tc->flags));
 	if (tc->pathname)
 		change_attr(tc, fd, 0);
 
@@ -210,6 +263,7 @@ static void run(unsigned int i)
 static struct tst_test test = {
 	.test = run,
 	.tcnt = ARRAY_SIZE(tcase),
+	.test_variants = ARRAY_SIZE(variants),
 	.setup = setup,
 	.needs_root = 1,
 	.needs_tmpdir = 1,
-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
