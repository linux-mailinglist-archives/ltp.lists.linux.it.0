Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id ACEC626C1C7
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Sep 2020 12:39:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 711F13C2F3A
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Sep 2020 12:39:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 904A63C2CB0
 for <ltp@lists.linux.it>; Wed, 16 Sep 2020 12:38:51 +0200 (CEST)
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 382071A00695
 for <ltp@lists.linux.it>; Wed, 16 Sep 2020 12:38:51 +0200 (CEST)
Received: by mail-pl1-x644.google.com with SMTP id e4so2965618pln.10
 for <ltp@lists.linux.it>; Wed, 16 Sep 2020 03:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Zim4xMahnIj33rOUinGvnyI6K/1vf/vbsHNzFhnsJAc=;
 b=P9m0vGVOngIEh8o9Np3enH3XQy/gHToNqE5mdQr4Hdf61ZaeNqliYBlWCe80lzy+9B
 CjIRysdDgJZ6q/DY20A0Lt8dgJL+JkcBc5eiGTHxPAhAHLcyUURMywu8CoeUNQT2CLoK
 vU7JDQFMtJ0wpEga3G+p6xw2d2hzpD7BAhtX5e96T5LDUdx19J1JFgvIGL8wGbMIEgsi
 vybP7u9bu9fR7/wcqZHUi9sPpLQeOH3QE4NVA3Ac96Ici0UsMVabHW2cMI3SOKzAQf9V
 mkLoismZr9ZnWHQdg+VadYYiWXCI3yefpBoQqCfeZSz/rglV2wF6AtwQRdXvO30y2uTq
 A2CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Zim4xMahnIj33rOUinGvnyI6K/1vf/vbsHNzFhnsJAc=;
 b=gCukgqrgjaC28E7pgOMpouTKLJxGou3JoZ3qMuNgE9OXFWTSAYv2DA86NORU712r3N
 zYo2aluNE9JunYeTou7syWZZMaw33ckXHgFOsRxesnX+lGMBfHwhPke0hj9Fgo00JCDL
 GyWhl0lAdn3PlSkf4Lr/iPO50VFGH6cbSFjkadobnEi6oqQKU+23T1MVWC+8sLq2scjx
 xIh9xqOLWCl2ycgSWdr1UOjul4lNJtOb29KjSD24fwp2/fFCgjOAHqMUMG7z3UVW8ZKs
 Y8YQbxVDOnSTgb9ccQ6xLTkcmcV9EaPkI+NTy0Cxs8io0Xl0/vjT6Kwvkcpf47cZBxH+
 zxIg==
X-Gm-Message-State: AOAM533RCf8/p24ieAkT8Y0IL0fRfiPESiLdaFLN3f9azs+XXNi+Ib9Q
 aGbW/Txg5pbbmp59kuG/J1tj26IMl25dXg==
X-Google-Smtp-Source: ABdhPJwhVjyAIUEtjQODj+n7V2O0I44YVf+IwHgKoVTFw5rx5x3y/MsD7CSE26QzgKDMds69JUPDQw==
X-Received: by 2002:a17:902:7d8f:b029:d1:bafa:baf3 with SMTP id
 a15-20020a1709027d8fb02900d1bafabaf3mr19270697plm.17.1600252729432; 
 Wed, 16 Sep 2020 03:38:49 -0700 (PDT)
Received: from localhost ([122.181.54.133])
 by smtp.gmail.com with ESMTPSA id 72sm16108492pfx.79.2020.09.16.03.38.48
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 16 Sep 2020 03:38:48 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Wed, 16 Sep 2020 16:07:54 +0530
Message-Id: <82079c4c73a1bae3f48571d346f8dd7eaa24eff7.1600252542.git.viresh.kumar@linaro.org>
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
Subject: [LTP] [PATCH V2 09/17] syscalls: ppoll: Reuse struct time64_variants
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
