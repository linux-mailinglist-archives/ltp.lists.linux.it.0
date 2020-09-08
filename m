Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D71A260AD7
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Sep 2020 08:22:08 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4918A3C53E0
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Sep 2020 08:22:08 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 4CF083C53D9
 for <ltp@lists.linux.it>; Tue,  8 Sep 2020 08:20:30 +0200 (CEST)
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id B7FA11000C2C
 for <ltp@lists.linux.it>; Tue,  8 Sep 2020 08:20:30 +0200 (CEST)
Received: by mail-pj1-x1043.google.com with SMTP id np15so8277707pjb.0
 for <ltp@lists.linux.it>; Mon, 07 Sep 2020 23:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+WXxt2+K3zz1iUJ6bKAxx+vlZShet13/HWRGozJuV4w=;
 b=uSjq/fdMsmCDX85MJagmrr1FFgtIWfSeFa6PTDikO13S0JN7IJAeRxVhmRI6irYeqN
 0NR0SxusmJXvcKxRJMKXeXzOe+Lwgrt4jem7lzVt2MxmuAVK0mpVJm43wb1EBz1ZVyB8
 cEwo+AsOiF13HXcboqmtS1OSBV+NAas6LBImC59V5R4KaTNElO775BNeux8BqIQ5mthH
 aa/UYu+BxrKGf40F3XwxUEoMZ2FW/hv+52QlAA3ThcyRXJpQmYxt8Ogcl3wDd0ab5QK2
 I/bhY12OoWFENCLvKEtmnnXzU5buAIHYmRaC/+wjwxwklltGf8hELega+IxvlK6viMem
 qALg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+WXxt2+K3zz1iUJ6bKAxx+vlZShet13/HWRGozJuV4w=;
 b=WLe6OE4KQWv2B0COM9UNkyw+/WyHh5811ApLu4jFU9QLQj2hdrK7mG6oC90DIr0D6+
 rDUeboNNpj+oc40EQoTuRcSeU2gAIuHOICBRFnZAGg/UyWz5Dkvq6RC5I8X4wowKhTtN
 Zrm/Gf1p+UF1wt/gT/8R5IOqQC1tA/KWeVnPwAlKglIKkn6pt5+c8lUCHgZrp1SVSVwl
 Z+H4Sd1Su0Z234NHaVo5yYpfL0fBokEUfnhFFxRAPNr4v3MBNb2O8r6CQT4hwDKkLHwR
 HaWZVsEIqzvg0bE0F9m9U0zI2GgEYtHtTy4eAo4mw/XyMw15+0WEA6Ap6veg677Sepjk
 hF+g==
X-Gm-Message-State: AOAM533s3dT+P232s5fOGWXOwBev0oRxk+AAAnCi456OW1EJg9KFcl96
 Y0ciDigPmDM5Fxf/mh6sAY+TbJ+jKJPovA==
X-Google-Smtp-Source: ABdhPJzJcCEzHzA/Wdiq53o5fkYFFrebrlCeBlqEYHT9mo7kBX8RaXZmHt8+H4wGNcMNBaz0oEvrUg==
X-Received: by 2002:a17:90a:481:: with SMTP id
 g1mr2510288pjg.157.1599546028837; 
 Mon, 07 Sep 2020 23:20:28 -0700 (PDT)
Received: from localhost ([122.181.54.133])
 by smtp.gmail.com with ESMTPSA id x19sm9490119pge.22.2020.09.07.23.20.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 07 Sep 2020 23:20:28 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Tue,  8 Sep 2020 11:49:28 +0530
Message-Id: <9ed6ce7ed42f38432c318c8b95fe7170f709d896.1599545766.git.viresh.kumar@linaro.org>
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
Subject: [LTP] [PATCH 15/16] syscalls: utimensat: Reuse struct
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
