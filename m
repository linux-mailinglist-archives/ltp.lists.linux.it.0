Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A02A18B2DB
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Mar 2020 12:59:03 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E83363C5470
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Mar 2020 12:59:02 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 33F183C5453
 for <ltp@lists.linux.it>; Thu, 19 Mar 2020 12:58:50 +0100 (CET)
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id BD52A201376
 for <ltp@lists.linux.it>; Thu, 19 Mar 2020 12:58:49 +0100 (CET)
Received: by mail-pj1-x1041.google.com with SMTP id m15so917598pje.3
 for <ltp@lists.linux.it>; Thu, 19 Mar 2020 04:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CjbjUKLj7xzwdBi8nxUYNpp3ujMxJoFhSjHJ/z2qpto=;
 b=WXtsULyONUVqH4mRK/mtnzoXS/UJiP+ZHTj5rvWxawTckFsPO8rfpOpKwyRxbfB5Jo
 m0MhcT+V6o+3v5LlXANP7nCmYEFdCwMj14nHTgkODLn02EzCn4NGnbDpmR/DDjl9qvH8
 FyPq2Tx+4di3SalpIxCdO29QEgTDMhh3cyGxMV8/aN8gmyD86tGzrUAXLd4FeVmL24Rh
 tmFrlfXfWymJb/Bw5/kP+WFrnbzvFRbJJXSnO4W3k1QYSLRTe9aULM3cPQ0JU+1BVtBC
 IC/meYGPfj8bEpI+Ig7uKl8PC6DaZqI1Xk5M06oTL1Fry3S3Mn3tz9YuWFGObZTB56FK
 kqlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CjbjUKLj7xzwdBi8nxUYNpp3ujMxJoFhSjHJ/z2qpto=;
 b=tZtbf7itlzOi7dq3/20F1dcbPr6MJc3FpSOrto+3zOXMUxqnYAUWXttNTwbgDaeTaZ
 VMx/+7aAdWAZ3n1T0yt0AUJfJuVw26s2pOt/yQ5adzgEd0SIhs1euzNVAI2wVTLw5BOl
 2PAWehW3VWrZl5cYqI2NdNIZGk3bpoTJFxrGk1coSdEk3B/0a7lTNE/hKS2T8wccxgIn
 QPd7NFkhH2Q/yZnhZFKCZHJmCfsS+CxP3CkKoWT8DbYNxR6IEW/j6U34+7uRvP1FsSkT
 zvbUrf5+2Aj4puJF9dwUQ6Dn+kLu/BHJMegtVV3f+jjcXwqghYR+4aLho68gqp1VebwU
 A2wg==
X-Gm-Message-State: ANhLgQ20UHFBePiD3ueOGZYRx6aRSkovdM07uSBhZVsYWjIr9eeBad60
 0XiU3ngjt6/Qq+j7TZrnxpEajXkGA18=
X-Google-Smtp-Source: ADFU+vtP7H9E7pGGPoCQbcytu9xZn0QvqoJak/j8iEX3uSXYBgL6NnpJibGr2AN4+amx+zwib4cvKA==
X-Received: by 2002:a17:90a:dd42:: with SMTP id
 u2mr3469937pjv.10.1584619127827; 
 Thu, 19 Mar 2020 04:58:47 -0700 (PDT)
Received: from localhost ([122.171.118.46])
 by smtp.gmail.com with ESMTPSA id q12sm2254922pgi.86.2020.03.19.04.58.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 19 Mar 2020 04:58:47 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Thu, 19 Mar 2020 17:28:38 +0530
Message-Id: <39538b9f5e6b271edfa202229b103b71626d17ab.1584618969.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.21.0.rc0.269.g1a574e7a288b
In-Reply-To: <cover.1584618969.git.viresh.kumar@linaro.org>
References: <cover.1584618969.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH V2 1/2] syscalls/pidfd_send_signal: Move
 pidfd_send_signal.h to include/lapi/
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

Move pidfd_send_signal.h to include/lapi/ to make it available for other
syscall tests.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 .../lapi}/pidfd_send_signal.h                             | 8 ++------
 .../syscalls/pidfd_send_signal/pidfd_send_signal01.c      | 2 +-
 .../syscalls/pidfd_send_signal/pidfd_send_signal02.c      | 2 +-
 .../syscalls/pidfd_send_signal/pidfd_send_signal03.c      | 2 +-
 4 files changed, 5 insertions(+), 9 deletions(-)
 rename {testcases/kernel/syscalls/pidfd_send_signal => include/lapi}/pidfd_send_signal.h (73%)

diff --git a/testcases/kernel/syscalls/pidfd_send_signal/pidfd_send_signal.h b/include/lapi/pidfd_send_signal.h
similarity index 73%
rename from testcases/kernel/syscalls/pidfd_send_signal/pidfd_send_signal.h
rename to include/lapi/pidfd_send_signal.h
index dc17fe058672..37de7ab401d0 100644
--- a/testcases/kernel/syscalls/pidfd_send_signal/pidfd_send_signal.h
+++ b/include/lapi/pidfd_send_signal.h
@@ -10,17 +10,13 @@
 #include "tst_test.h"
 #include "lapi/syscalls.h"
 
-static void check_syscall_support(void)
-{
-	/* allow the tests to fail early */
-	tst_syscall(__NR_pidfd_send_signal);
-}
+/* allow the tests to fail early */
+#define check_syscall_support()		tst_syscall(__NR_pidfd_send_signal)
 
 #ifndef HAVE_PIDFD_SEND_SIGNAL
 static int pidfd_send_signal(int pidfd, int sig, siginfo_t *info,
 				 unsigned int flags)
 {
-	tst_res(TINFO, "Testing syscall(__NR_pidfd_send_signal)");
 	return tst_syscall(__NR_pidfd_send_signal, pidfd, sig, info, flags);
 }
 #endif /* HAVE_PIDFD_SEND_SIGNAL */
diff --git a/testcases/kernel/syscalls/pidfd_send_signal/pidfd_send_signal01.c b/testcases/kernel/syscalls/pidfd_send_signal/pidfd_send_signal01.c
index 03a4ae9bea41..3137b6967371 100644
--- a/testcases/kernel/syscalls/pidfd_send_signal/pidfd_send_signal01.c
+++ b/testcases/kernel/syscalls/pidfd_send_signal/pidfd_send_signal01.c
@@ -12,8 +12,8 @@
 #define _GNU_SOURCE
 #include <signal.h>
 #include <stdlib.h>
+#include "lapi/pidfd_send_signal.h"
 #include "tst_safe_pthread.h"
-#include "pidfd_send_signal.h"
 
 #define SIGNAL  SIGUSR1
 #define DATA	777
diff --git a/testcases/kernel/syscalls/pidfd_send_signal/pidfd_send_signal02.c b/testcases/kernel/syscalls/pidfd_send_signal/pidfd_send_signal02.c
index 74914523f0b8..610c67120a7a 100644
--- a/testcases/kernel/syscalls/pidfd_send_signal/pidfd_send_signal02.c
+++ b/testcases/kernel/syscalls/pidfd_send_signal/pidfd_send_signal02.c
@@ -24,8 +24,8 @@
 #define _GNU_SOURCE
 #include <pwd.h>
 #include <signal.h>
+#include "lapi/pidfd_send_signal.h"
 #include "tst_safe_pthread.h"
-#include "pidfd_send_signal.h"
 
 #define CORRECT_SIGNAL		SIGUSR1
 #define DIFFERENT_SIGNAL	SIGUSR2
diff --git a/testcases/kernel/syscalls/pidfd_send_signal/pidfd_send_signal03.c b/testcases/kernel/syscalls/pidfd_send_signal/pidfd_send_signal03.c
index 3420afbb9526..7d65e6ddc543 100644
--- a/testcases/kernel/syscalls/pidfd_send_signal/pidfd_send_signal03.c
+++ b/testcases/kernel/syscalls/pidfd_send_signal/pidfd_send_signal03.c
@@ -19,7 +19,7 @@
 #include <signal.h>
 #include <stdio.h>
 #include <unistd.h>
-#include "pidfd_send_signal.h"
+#include "lapi/pidfd_send_signal.h"
 #include "tst_safe_pthread.h"
 
 #define PIDTRIES	3
-- 
2.21.0.rc0.269.g1a574e7a288b


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
