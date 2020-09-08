Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 65118260ACF
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Sep 2020 08:21:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1EFD43C53DA
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Sep 2020 08:21:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id DF43A3C53C0
 for <ltp@lists.linux.it>; Tue,  8 Sep 2020 08:20:08 +0200 (CEST)
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 902571000C1E
 for <ltp@lists.linux.it>; Tue,  8 Sep 2020 08:20:08 +0200 (CEST)
Received: by mail-pj1-x1042.google.com with SMTP id q4so1545621pjh.5
 for <ltp@lists.linux.it>; Mon, 07 Sep 2020 23:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Zim4xMahnIj33rOUinGvnyI6K/1vf/vbsHNzFhnsJAc=;
 b=Nt++L+PJocXbM5sHOdhky8KvonuiIQHZ9Gh/om4/wOryoBfNAsSeiiNb9jd+ujtUnp
 81MRQHMphG9ppzXpT6boxM6z9LLl97ncf0qUP4rORL8w3JU4iwNn7B5yS4C68isX3h9X
 j0AHyjQJ5ex28bShXY6BOJ0f1IBbaDRSKU8Fpm8M8lG0nSW66RIKEG5xfGZavsa0qeof
 Au0paE8dBoeDGsj2nVVNr3hen2F0hAWwcXCAWyRDymJNNhJeSTHqXMrI2faVfKK0QtKa
 FOhf9ZpNqs9QmWKbNnvVw54A5vaWI/lAM/yKHdSX8QtXwFRvm6jxxYxNDSOvaHwfBg18
 /ZqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Zim4xMahnIj33rOUinGvnyI6K/1vf/vbsHNzFhnsJAc=;
 b=PphbdTtqpzenQpmC4qphUcGb+eatloGk+9kUvWHgaxQyqvBJp7TFVSiHc0tG4jGvWp
 ODYeBU/w0ftUGAPKbCYoWYj29OCr9hAKm7ib+ZFqHrNfTKqz8EVMpie/lpxM/nlPJOpi
 YKzgBrpOu3pMXTzujY6x5o+kjk1F1l53EjVnjsmoNndeOntr6MJCR1M4OosoyBm0sf7S
 PN30tlu8mGsxp8qFiI5hjQlofMboyjVWlthw6g5FcHh8U2Ur2xsjoSPoYt7FYi0ZHEBH
 7QaAQtFDi30wp+qpUmwMF3nwQdTdRd02ZpahRXWlK46l6B491Jg49BZDNL8sl27zj+pr
 WblQ==
X-Gm-Message-State: AOAM530mOUgqImEjshuMU6L+uvfO48qBBXprxmk8md/UAzI6yfcHMYOr
 2FryLxqOgJx6ufIuEiugWaGE0c9l2ga8kg==
X-Google-Smtp-Source: ABdhPJwDIo+BZyUPwBp4DZBUeIaL17wnOR3Fk0R2NwhF8pM7UxwUc5Tpi0rys9t6Gd48i4axaqpabA==
X-Received: by 2002:a17:90b:889:: with SMTP id
 bj9mr2600284pjb.101.1599546006747; 
 Mon, 07 Sep 2020 23:20:06 -0700 (PDT)
Received: from localhost ([122.181.54.133])
 by smtp.gmail.com with ESMTPSA id x25sm13204888pgk.26.2020.09.07.23.20.05
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 07 Sep 2020 23:20:06 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Tue,  8 Sep 2020 11:49:21 +0530
Message-Id: <3d6e0cd2eca89015ccf0e9f582537f7c8b8fcb97.1599545766.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1599545766.git.viresh.kumar@linaro.org>
References: <cover.1599545766.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 08/16] syscalls: ppoll: Reuse struct time64_variants
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Lets reuse the common structure here.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 testcases/kernel/syscalls/ppoll/ppoll01.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/testcases/kernel/syscalls/ppoll/ppoll01.c b/testcases/kernel/syscalls/ppoll/ppoll01.c
index e9e57e5858e6..3d2f92f2ac1d 100644
--- a/testcases/kernel/syscalls/ppoll/ppoll01.c
+++ b/testcases/kernel/syscalls/ppoll/ppoll01.c
@@ -19,6 +19,7 @@
 #include <sys/wait.h>
 #include "lapi/syscalls.h"
 #include "ltp_signal.h"
+#include "time64_variants.h"
 #include "tst_sig_proc.h"
 #include "tst_test.h"
 #include "tst_timer.h"
@@ -174,21 +175,15 @@ static inline int sys_ppoll_time64(struct pollfd *fds, nfds_t nfds, void *tmo_p,
 			   sigsetsize);
 }
 
-static struct test_variants {
-	int (*ppoll)(struct pollfd *fds, nfds_t nfds, void *tmo_p,
-		     const sigset_t *sigmask, size_t sigsetsize);
-
-	enum tst_ts_type type;
-	char *desc;
-} variants[] = {
-	{ .ppoll = libc_ppoll, .type = TST_LIBC_TIMESPEC, .desc = "vDSO or syscall with libc spec"},
+static struct time64_variants variants[] = {
+	{ .ppoll = libc_ppoll, .ts_type = TST_LIBC_TIMESPEC, .desc = "vDSO or syscall with libc spec"},
 
 #if (__NR_ppoll != __LTP__NR_INVALID_SYSCALL)
-	{ .ppoll = sys_ppoll, .type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with old kernel spec"},
+	{ .ppoll = sys_ppoll, .ts_type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with old kernel spec"},
 #endif
 
 #if (__NR_ppoll_time64 != __LTP__NR_INVALID_SYSCALL)
-	{ .ppoll = sys_ppoll_time64, .type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec"},
+	{ .ppoll = sys_ppoll_time64, .ts_type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec"},
 #endif
 };
 
@@ -198,7 +193,7 @@ static void sighandler(int sig LTP_ATTRIBUTE_UNUSED)
 
 static void setup(void)
 {
-	struct test_variants *tv = &variants[tst_variant];
+	struct time64_variants *tv = &variants[tst_variant];
 	int fd2;
 
 	tst_res(TINFO, "Testing variant: %s", tv->desc);
@@ -222,7 +217,7 @@ static void setup(void)
 	fds_already_closed[0].revents = 0;
 	SAFE_CLOSE(fd2);
 
-	ts_short.type = ts_long.type = tv->type;
+	ts_short.type = ts_long.type = tv->ts_type;
 	tst_ts_set_sec(&ts_short, 0);
 	tst_ts_set_nsec(&ts_short, 20000000);
 	tst_ts_set_sec(&ts_long, 2);
@@ -237,7 +232,7 @@ static void cleanup(void)
 
 static void do_test(unsigned int i)
 {
-	struct test_variants *tv = &variants[tst_variant];
+	struct time64_variants *tv = &variants[tst_variant];
 	pid_t pid = 0;
 	int sys_ret, sys_errno = 0, dummy;
 	struct test_case *tc = &tcase[i];
-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
