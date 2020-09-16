Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E89226C1CF
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Sep 2020 12:40:43 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D9B7F3C60C4
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Sep 2020 12:40:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 0A8CD3C4E9E
 for <ltp@lists.linux.it>; Wed, 16 Sep 2020 12:39:23 +0200 (CEST)
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 9EF0F1A008B2
 for <ltp@lists.linux.it>; Wed, 16 Sep 2020 12:39:22 +0200 (CEST)
Received: by mail-pj1-x1043.google.com with SMTP id md22so1306179pjb.0
 for <ltp@lists.linux.it>; Wed, 16 Sep 2020 03:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+WXxt2+K3zz1iUJ6bKAxx+vlZShet13/HWRGozJuV4w=;
 b=iF5+XirWbfCCECxhIPn7WYQMxxKPnuH4K9SNOBnHEuiRPzZKlFNtDxiwRqNxS+fNEh
 dB1qQLvjSclcHTWRgDa2otcZFu0iCxUr5IYcFWZDK9b7Ay3bC1aIkxBLLcmsKwofQFdR
 hH9/MegQpwfPOI9ums8EAwIG4oIdfE3N1Zd97J1PgcjiHql2BDEvYlUu70b7+UD4Cv8N
 vQ1G/s7NlpWzVYJkzcOMra8vlNYPKJyhMxAl0bAieZgdnAz/4Ym7MDRccDYH4P646JMx
 WlILIM0t7yNxKQTBcTeWv88X+joTa7N+th/3jgIEGc20wCyMxtdoKfHU2Y1Mjo2t43VP
 M93A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+WXxt2+K3zz1iUJ6bKAxx+vlZShet13/HWRGozJuV4w=;
 b=dOpu8O+nTgmwSfFe3FbwxE2WbH/rTd+kBEdb6uiXJufjt9Rv9hUTsCG52ag1eW0117
 Cga63nwGK9t4fEpi6Kj3IGKoCSG0QL9e2iH92FfojB+q2dLfZU9sgFzQBOv2lUin0jvK
 EXgMZQkb7EarW+d3dKtvw0oHnd9ZIS0dhhg6lZzRvnzcX//d+7f/3sR9wErlv+mJY8pw
 RuuxRDugrnJpcDtmlADgj87VnMzz77dbAkJGcC5omfrEJjZ5/ba74yozCLL+fLN7Iv5T
 ebLRVru8SlAoN0ZLMNA3QSR2+jaDlyFdF4ZpA43etuBPiiLRTw4DCt0f8QzBUyVMZprz
 yD9A==
X-Gm-Message-State: AOAM533yaBOD6CtYC/w7wJ5jUWGX+6llS+xytbiHAgMVjqW9a0mqpWEg
 bIec4Z40eXlCPYCFXoKR13PsbiS3hSh2IA==
X-Google-Smtp-Source: ABdhPJyLyBlQCTkYjpepXZEyRTPJweK+jl93gvIPAabgeV6k3SDi1fL6zk0z+emnBKgg4AgkgL3+Kw==
X-Received: by 2002:a17:90a:e287:: with SMTP id
 d7mr3582496pjz.170.1600252760897; 
 Wed, 16 Sep 2020 03:39:20 -0700 (PDT)
Received: from localhost ([122.181.54.133])
 by smtp.gmail.com with ESMTPSA id 83sm14077738pgg.1.2020.09.16.03.39.19
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 16 Sep 2020 03:39:20 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Wed, 16 Sep 2020 16:08:01 +0530
Message-Id: <a6291552ca99cc5014e98f685e82291bd9a1ecb5.1600252542.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1600252542.git.viresh.kumar@linaro.org>
References: <cover.1600252542.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH V2 16/17] syscalls: utimensat: Reuse struct
 time64_variants
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
 .../kernel/syscalls/utimensat/utimensat01.c    | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/testcases/kernel/syscalls/utimensat/utimensat01.c b/testcases/kernel/syscalls/utimensat/utimensat01.c
index e2d4fee3e433..fe490f4415e6 100644
--- a/testcases/kernel/syscalls/utimensat/utimensat01.c
+++ b/testcases/kernel/syscalls/utimensat/utimensat01.c
@@ -18,6 +18,7 @@
 #include <sys/stat.h>
 #include "lapi/fs.h"
 #include "lapi/utime.h"
+#include "time64_variants.h"
 #include "tst_timer.h"
 
 #define TEST_FILE	"test_file"
@@ -109,18 +110,13 @@ static inline int sys_utimensat_time64(int dirfd, const char *pathname,
 	return tst_syscall(__NR_utimensat_time64, dirfd, pathname, times, flags);
 }
 
-static struct test_variants {
-	int (*utimensat)(int dirfd, const char *pathname, void *times,
-			 int flags);
-	enum tst_ts_type type;
-	char *desc;
-} variants[] = {
+static struct time64_variants variants[] = {
 #if (__NR_utimensat != __LTP__NR_INVALID_SYSCALL)
-	{ .utimensat = sys_utimensat, .type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with old kernel spec"},
+	{ .utimensat = sys_utimensat, .ts_type = TST_KERN_OLD_TIMESPEC, .desc = "syscall with old kernel spec"},
 #endif
 
 #if (__NR_utimensat_time64 != __LTP__NR_INVALID_SYSCALL)
-	{ .utimensat = sys_utimensat_time64, .type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec"},
+	{ .utimensat = sys_utimensat_time64, .ts_type = TST_KERN_TIMESPEC, .desc = "syscall time64 with kernel spec"},
 #endif
 };
 
@@ -198,7 +194,7 @@ static void change_attr(struct test_case *tc, int fd, int set)
 
 static void reset_time(char *pathname, int dfd, int flags, int i)
 {
-	struct test_variants *tv = &variants[tst_variant];
+	struct time64_variants *tv = &variants[tst_variant];
 	struct stat sb;
 
 	memset(&ts, 0, sizeof(ts));
@@ -215,7 +211,7 @@ static void reset_time(char *pathname, int dfd, int flags, int i)
 
 static void run(unsigned int i)
 {
-	struct test_variants *tv = &variants[tst_variant];
+	struct time64_variants *tv = &variants[tst_variant];
 	struct test_case *tc = &tcase[i];
 	int dfd = AT_FDCWD, fd = 0, atime_change, mtime_change;
 	struct mytime *mytime = tc->mytime;
@@ -237,7 +233,7 @@ static void run(unsigned int i)
 	}
 
 	if (mytime) {
-		tst_multi_set_time(tv->type, mytime);
+		tst_multi_set_time(tv->ts_type, mytime);
 		tsp = &ts;
 	} else if (tc->exp_err == EFAULT) {
 		tsp = bad_addr;
-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
