Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4227723CB82
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Aug 2020 16:32:29 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DAD813C3284
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Aug 2020 16:32:28 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id B69E13C25C5
 for <ltp@lists.linux.it>; Wed,  5 Aug 2020 16:32:27 +0200 (CEST)
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 57D4560195D
 for <ltp@lists.linux.it>; Wed,  5 Aug 2020 16:32:26 +0200 (CEST)
Received: by mail-pl1-x642.google.com with SMTP id t10so20016415plz.10
 for <ltp@lists.linux.it>; Wed, 05 Aug 2020 07:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :in-reply-to:references;
 bh=vrhiy6NmvpECS4kpliPEzMzOd34df3jNv0N51+kZm/8=;
 b=CbRxcsc9BKG5QRCNFihQL2Nc1bYXtdobGmI+vS1NZmwNl2uynDMN2EWGjrddvMXJgH
 in2eMTBHstVx+B2NO0YNIVjTB1cWBAIXB4qIp7aAR9fRnQdE2z4LfiwWU09+2c0H6SJu
 tz5vSaEpDZ22nRHwwAtmDt7Pc8mCQKYg2XyQuenp5/+VA8Pxzzk3ssYCpqH09BTmOybj
 y1xsjdyfDDb6u6h2QVNKGP857qQ8aXRYNzLEbjqPuTQrc6PKISLlSLKZnBarfa69xf3W
 0sIbEzgCw2XK17XIOitOd7J4ud1RJnFZNfAZ0SwjBOchFEeM8boGNTpgCdGhEeCmbUc1
 ODDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:in-reply-to:references;
 bh=vrhiy6NmvpECS4kpliPEzMzOd34df3jNv0N51+kZm/8=;
 b=XS/ldNzz4Gj5ZiA1OmSpmKC/LuPzTRCfqrv9NjrkzFVkUyBQeuHTJd5d4DSQMpYR5b
 LiRocnOPALBJ41qXvkBiypX/vkuamZd4U3nE+5OVX26GpyDJ43JaDStfiQk+GqU1ERZU
 IgoKIY1s2S3fkuTpNhIGpp17589zG1S36nLA6bQaZTMcV3S+7+oEQrJ98Of2Hp6GoZhK
 lZCd36xtcKS92n7L4puY6HXHmHYvhe3K4pwcsJyUVAOxFIIxTjpvF8L5HJpPsvUOjZqX
 iFpucPwik7DL9Vdq1UVezQqIpeuChvJZskg/iCfvPORtQ5p8Mbr5iVgxUNoJGvmi1fe6
 pk4A==
X-Gm-Message-State: AOAM533HVO5gBhuOEOoAZ9NceCFjmDhmnoB8uiXVlHBgoHKvFiB4JbmH
 PKT/mpqqSpPYGKjE5eGxhD+0hOcoqgg=
X-Google-Smtp-Source: ABdhPJyx9tjHEB/XECtKFusfpycCai5H3Qp5bH2HYfxrF6jl2jiBY1tCcMkkm0+rMuBy8kfzZSTD0g==
X-Received: by 2002:a17:90a:f481:: with SMTP id
 bx1mr3593976pjb.172.1596637929530; 
 Wed, 05 Aug 2020 07:32:09 -0700 (PDT)
Received: from localhost ([223.190.59.99])
 by smtp.gmail.com with ESMTPSA id s2sm3458760pjb.33.2020.08.05.07.32.08
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 05 Aug 2020 07:32:08 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Wed,  5 Aug 2020 20:01:53 +0530
Message-Id: <eed1e927d5502e99cb702f66e63649decfbad903.1596637728.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <ebc888947b095fd6a359ad749e50217d0b38954e.1596637728.git.viresh.kumar@linaro.org>
References: <ebc888947b095fd6a359ad749e50217d0b38954e.1596637728.git.viresh.kumar@linaro.org>
In-Reply-To: <ebc888947b095fd6a359ad749e50217d0b38954e.1596637728.git.viresh.kumar@linaro.org>
References: <ebc888947b095fd6a359ad749e50217d0b38954e.1596637728.git.viresh.kumar@linaro.org>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH V8 2/2] syscalls/utimensat: Add support for time64
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

This adds support for time64 tests to the existing utimensat() syscall
tests.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
V8: Resolved rebase conflicts

 testcases/kernel/syscalls/utimensat/utimensat01.c | 71 +++++++++++++++++++----
 1 file changed, 61 insertions(+), 10 deletions(-)

diff --git a/testcases/kernel/syscalls/utimensat/utimensat01.c b/testcases/kernel/syscalls/utimensat/utimensat01.c
index 6e14e1f150db..fbdc6a1ce1ed 100644
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
@@ -100,13 +99,67 @@ struct test_case {
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
+static void tst_multi_set_time(enum tst_ts_type type, struct mytime *mytime)
+{
+	switch (type) {
+	case TST_LIBC_TIMESPEC:
+		ts.libc_ts[0].tv_sec = mytime->access_tv_sec;
+		ts.libc_ts[0].tv_nsec = mytime->access_tv_nsec;
+		ts.libc_ts[1].tv_sec = mytime->mod_tv_sec;
+		ts.libc_ts[1].tv_nsec = mytime->mod_tv_nsec;
+		break;
+	case TST_KERN_OLD_TIMESPEC:
+		ts.kern_old_ts[0].tv_sec = mytime->access_tv_sec;
+		ts.kern_old_ts[0].tv_nsec = mytime->access_tv_nsec;
+		ts.kern_old_ts[1].tv_sec = mytime->mod_tv_sec;
+		ts.kern_old_ts[1].tv_nsec = mytime->mod_tv_nsec;
+		break;
+	case TST_KERN_TIMESPEC:
+		ts.kern_ts[0].tv_sec = mytime->access_tv_sec;
+		ts.kern_ts[0].tv_nsec = mytime->access_tv_nsec;
+		ts.kern_ts[1].tv_sec = mytime->mod_tv_sec;
+		ts.kern_ts[1].tv_nsec = mytime->mod_tv_nsec;
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
 	SAFE_MKDIR(TEST_DIR, 0700);
 }
@@ -165,8 +218,8 @@ static void reset_time(char *pathname, int dfd, int flags)
 
 static void run(unsigned int i)
 {
+	struct test_variants *tv = &variants[tst_variant];
 	struct test_case *tc = &tcase[i];
-	struct timespec ts[2];
 	void *tsp = NULL;
 	char *pathname = NULL;
 	int dfd = AT_FDCWD, fd = 0, atime_change, mtime_change;
@@ -179,11 +232,8 @@ static void run(unsigned int i)
 		dfd = SAFE_OPEN(TEST_DIR, tc->oflags);
 
 	if (mytime) {
-		ts[0].tv_sec = mytime->access_tv_sec;
-		ts[0].tv_nsec = mytime->access_tv_nsec;
-		ts[1].tv_sec = mytime->mod_tv_sec;
-		ts[1].tv_nsec = mytime->mod_tv_nsec;
-		tsp = ts;
+		tst_multi_set_time(tv->type, mytime);
+		tsp = &ts.libc_ts;
 	} else if (tc->exp_err == EFAULT) {
 		tsp = bad_addr;
 	}
@@ -198,7 +248,7 @@ static void run(unsigned int i)
 		pathname = bad_addr;
 	}
 
-	TEST(sys_utimensat(dfd, pathname, tsp, tc->flags));
+	TEST(tv->utimensat(dfd, pathname, tsp, tc->flags));
 	if (tc->pathname)
 		change_attr(tc, fd, 0);
 
@@ -241,6 +291,7 @@ static void run(unsigned int i)
 static struct tst_test test = {
 	.test = run,
 	.tcnt = ARRAY_SIZE(tcase),
+	.test_variants = ARRAY_SIZE(variants),
 	.setup = setup,
 	.needs_root = 1,
 	.needs_tmpdir = 1,
-- 
2.14.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
