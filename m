Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4F223EC5E
	for <lists+linux-ltp@lfdr.de>; Fri,  7 Aug 2020 13:24:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5D5693C3205
	for <lists+linux-ltp@lfdr.de>; Fri,  7 Aug 2020 13:24:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id D9CAD3C31F2
 for <ltp@lists.linux.it>; Fri,  7 Aug 2020 13:24:42 +0200 (CEST)
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id E53721401222
 for <ltp@lists.linux.it>; Fri,  7 Aug 2020 13:24:41 +0200 (CEST)
Received: by mail-pg1-x542.google.com with SMTP id p3so763210pgh.3
 for <ltp@lists.linux.it>; Fri, 07 Aug 2020 04:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :in-reply-to:references;
 bh=278qixRjKrvydkE6joc4ftOb98L+dRPkrloGAhXX3x0=;
 b=Z7gUZe3wa61F3rfKC1wlKS+bJaLZmYZ6DxK6VQC5nd/DKsW5/ycMLWaRutO3ehxkgv
 m2Ri1N0Os4UI5pBXR2IDgm/nU5oP/Tom+k3kwpspb9XHxpi+J3gcE/CMIbPY9HQEaLvu
 BLPLbcLeip+RjwzMxthykDGdyEGOXjcxh9dvZ1d7l4F0mLdcm8N+fQtDBhektscMgaso
 SHlOnVZmKAUSOZe59sL+WYpJ/gO84awlCSpPWWpsEs67qsoWiuGoG4NZMPQb/V9yosuh
 d7xECfMNqrssQkJpxNudqi8EREm+KAuGzXwaR5ihYtBtfAVFZjZ5C0f4wDOEpmBpi8mT
 L4eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:in-reply-to:references;
 bh=278qixRjKrvydkE6joc4ftOb98L+dRPkrloGAhXX3x0=;
 b=rDlzYpWK5VF8XrkR1XAGfoogTcjG01bd0K5ZT+I2iZanRijxNBXvenWRFUhW4I0DzR
 4zi5WqfM+J24PYxmX+/ioTt6+iW2FFxqTtUJEmXjs1Pv39pjrBVrYadChrXyMj8DeV2U
 XRmHrjiUqeFYdy61BmmOloLNIADROKb9/qUQbj8EgEjKP7S4hSDNCC9uOvlOUCqkQPKA
 pTNHvRn0C7ZPav8gO7XSh5qQTpp6hm8KFyz31e6VWwPu9vKulDwlW1KxcFDFOrvelhE4
 y7CXAHY21LgFwJBCpeHnZDUfo6Z3Pny7gmUa/LF8HZakd3nHbferd5OM9+jKVqeC7HFe
 AoRQ==
X-Gm-Message-State: AOAM5324emflLMQHZq1RtYsNJggnd3v3rJxHz0Vkt5ulfjjt4FIdfCFb
 mOkKVl4LU5akNrnLtn9O2TzZvuiAR0A=
X-Google-Smtp-Source: ABdhPJzlceLPboafIzvtnPJwWBomCiePiSXSXRpW1LmhDMGuHpyQjR4nRoe3E4YzNu7H4Cwo5enRWw==
X-Received: by 2002:a63:5a1e:: with SMTP id o30mr338096pgb.62.1596799479844;
 Fri, 07 Aug 2020 04:24:39 -0700 (PDT)
Received: from localhost ([106.198.244.73])
 by smtp.gmail.com with ESMTPSA id w12sm10720169pjb.18.2020.08.07.04.24.38
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 07 Aug 2020 04:24:39 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Fri,  7 Aug 2020 16:54:29 +0530
Message-Id: <fdd9bf7a6f362ffd665064a243495e6a73f87c96.1596799223.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <af2744945213682a2e378a275bd73ad174e2896a.1596799223.git.viresh.kumar@linaro.org>
References: <af2744945213682a2e378a275bd73ad174e2896a.1596799223.git.viresh.kumar@linaro.org>
In-Reply-To: <af2744945213682a2e378a275bd73ad174e2896a.1596799223.git.viresh.kumar@linaro.org>
References: <af2744945213682a2e378a275bd73ad174e2896a.1596799223.git.viresh.kumar@linaro.org>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH V9 2/2] syscalls/utimensat: Add support for time64
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
 testcases/kernel/syscalls/utimensat/utimensat01.c | 74 +++++++++++++++++++----
 1 file changed, 63 insertions(+), 11 deletions(-)

diff --git a/testcases/kernel/syscalls/utimensat/utimensat01.c b/testcases/kernel/syscalls/utimensat/utimensat01.c
index 617565e52676..d5b9954505a2 100644
--- a/testcases/kernel/syscalls/utimensat/utimensat01.c
+++ b/testcases/kernel/syscalls/utimensat/utimensat01.c
@@ -99,13 +99,67 @@ struct test_case {
 };
 
 static inline int sys_utimensat(int dirfd, const char *pathname,
-			const struct __kernel_old_timespec times[2], int flags)
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
@@ -146,11 +200,11 @@ static void change_attr(struct test_case *tc, int fd, int set)
 
 static void reset_time(char *pathname, int dfd, int flags, int i)
 {
-	struct __kernel_old_timespec ts[2];
+	struct test_variants *tv = &variants[tst_variant];
 	struct stat sb;
 
-	memset(ts, 0, sizeof(ts));
-	sys_utimensat(dfd, pathname, ts, flags);
+	memset(&ts, 0, sizeof(ts));
+	tv->utimensat(dfd, pathname, &ts, flags);
 
 	TEST(stat(pathname, &sb));
 	if (TST_RET) {
@@ -163,8 +217,8 @@ static void reset_time(char *pathname, int dfd, int flags, int i)
 
 static void run(unsigned int i)
 {
+	struct test_variants *tv = &variants[tst_variant];
 	struct test_case *tc = &tcase[i];
-	struct __kernel_old_timespec ts[2];
 	int dfd = AT_FDCWD, fd = 0, atime_change, mtime_change;
 	struct mytime *mytime = tc->mytime;
 	char *pathname = NULL;
@@ -187,16 +241,13 @@ static void run(unsigned int i)
 	}
 
 	if (mytime) {
-		ts[0].tv_sec = mytime->access_tv_sec;
-		ts[0].tv_nsec = mytime->access_tv_nsec;
-		ts[1].tv_sec = mytime->mod_tv_sec;
-		ts[1].tv_nsec = mytime->mod_tv_nsec;
-		tsp = ts;
+		tst_multi_set_time(tv->type, mytime);
+		tsp = &ts;
 	} else if (tc->exp_err == EFAULT) {
 		tsp = bad_addr;
 	}
 
-	TEST(sys_utimensat(dfd, pathname, tsp, tc->flags));
+	TEST(tv->utimensat(dfd, pathname, tsp, tc->flags));
 	if (tc->pathname)
 		change_attr(tc, fd, 0);
 
@@ -245,6 +296,7 @@ static void run(unsigned int i)
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
