Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7784C18C668
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Mar 2020 05:24:33 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 482BF3C5487
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Mar 2020 05:24:33 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 87BD13C5458
 for <ltp@lists.linux.it>; Fri, 20 Mar 2020 05:24:16 +0100 (CET)
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 541101400E1A
 for <ltp@lists.linux.it>; Fri, 20 Mar 2020 05:24:15 +0100 (CET)
Received: by mail-pf1-x443.google.com with SMTP id 23so2594263pfj.1
 for <ltp@lists.linux.it>; Thu, 19 Mar 2020 21:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fpauLrkdYy54ix8H8KfrFatGgRJQfp1Zohjl2qUcJh0=;
 b=zIZYZaHz6diBVgQuBU+jqOe2/A1SPHtLCGBtqYfM7O2Xvkb5+R+whvX3J7vsOYAadj
 VeBjhJtZbvWFePxLHgI69cejRgDaIe4vCBVyeCjz3wuC1a4xDjHgr3NlSjgzo/JhYIRS
 orAFKC0AfWpGi4BelEwIgkFsAC0Gl7DKsRXmt3XjaCQ93QpeVs36LyAvbSia/RotonfT
 5f6ndSFH2oXTB0qiwebshJ4gPtEWbtB1AjuOnM+wZqpSpxTUn3Ej5XU4WRjze3jAA7Z6
 HutEE3jN009eqGRjo7PnkH6yZVJRfGptq7uJmcbKVTwJMZcEkh735im6hyjNrAqcTCmH
 SM2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fpauLrkdYy54ix8H8KfrFatGgRJQfp1Zohjl2qUcJh0=;
 b=esjbEmkLKk3ZeUlFQyVzEmgN4aHap8khePuS434Nhi517Psqq71IO0Tvet/AJVgfwx
 YW+OFIwKWw9vsSxxiXiUCXCYjU5NsOF5WwgNAjvZoB8KYeOVpo0gvk5ZvfdZrAcrJLIL
 7BixaXB1K4V1UPvmH3DmMkC7DbR8u7ZBNEVKwIKv4qOs1bHKeBuEpze1soFDhH7Bg4Yz
 ayPP41C0XfA1eb2b3ela+8fUd+cIqxUW6ciZoP5KbFkbn7QgZhd1soMSGUMIwndUAGlv
 0LE8jSgMRVeYSXQ/OylrTCe41dcdcR6lpKb7gPdlDff8zSIHskFrsI8HAqJwxW9ex1UY
 2oxQ==
X-Gm-Message-State: ANhLgQ0sOT3wDGQ/5T4HSysVUl7A+22UVX3t4/f+LR3O2s8CeNTc0G+x
 jyETeAqcukS56w3Aiu676cklhiyoT4E=
X-Google-Smtp-Source: ADFU+vtMCn9UHQGUdG30QVGLgjfR9IQPtnjfE5vmZ9RVkVcuH2ut9Y6EzkcSy/9FTlHoS6KOVt5IoQ==
X-Received: by 2002:a63:e50b:: with SMTP id r11mr6729788pgh.178.1584678253484; 
 Thu, 19 Mar 2020 21:24:13 -0700 (PDT)
Received: from localhost ([122.171.118.46])
 by smtp.gmail.com with ESMTPSA id 64sm3956195pfd.48.2020.03.19.21.24.12
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 19 Mar 2020 21:24:12 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Fri, 20 Mar 2020 09:54:01 +0530
Message-Id: <850a05d5fca922cbc09b06eb99c9724bdbbe0bc4.1584677993.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.21.0.rc0.269.g1a574e7a288b
In-Reply-To: <cover.1584677993.git.viresh.kumar@linaro.org>
References: <cover.1584677993.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH V3 1/2] syscalls/pidfd_send_signal: Move
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

While at it, also rename check_syscall_support() to
pidfd_send_signal_supported().

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 .../pidfd_send_signal => include/lapi}/pidfd_send_signal.h    | 3 +--
 .../kernel/syscalls/pidfd_send_signal/pidfd_send_signal01.c   | 4 ++--
 .../kernel/syscalls/pidfd_send_signal/pidfd_send_signal02.c   | 4 ++--
 .../kernel/syscalls/pidfd_send_signal/pidfd_send_signal03.c   | 4 ++--
 4 files changed, 7 insertions(+), 8 deletions(-)
 rename {testcases/kernel/syscalls/pidfd_send_signal => include/lapi}/pidfd_send_signal.h (85%)

diff --git a/testcases/kernel/syscalls/pidfd_send_signal/pidfd_send_signal.h b/include/lapi/pidfd_send_signal.h
similarity index 85%
rename from testcases/kernel/syscalls/pidfd_send_signal/pidfd_send_signal.h
rename to include/lapi/pidfd_send_signal.h
index dc17fe058672..8352d2adf787 100644
--- a/testcases/kernel/syscalls/pidfd_send_signal/pidfd_send_signal.h
+++ b/include/lapi/pidfd_send_signal.h
@@ -10,7 +10,7 @@
 #include "tst_test.h"
 #include "lapi/syscalls.h"
 
-static void check_syscall_support(void)
+static inline void pidfd_send_signal_supported(void)
 {
 	/* allow the tests to fail early */
 	tst_syscall(__NR_pidfd_send_signal);
@@ -20,7 +20,6 @@ static void check_syscall_support(void)
 static int pidfd_send_signal(int pidfd, int sig, siginfo_t *info,
 				 unsigned int flags)
 {
-	tst_res(TINFO, "Testing syscall(__NR_pidfd_send_signal)");
 	return tst_syscall(__NR_pidfd_send_signal, pidfd, sig, info, flags);
 }
 #endif /* HAVE_PIDFD_SEND_SIGNAL */
diff --git a/testcases/kernel/syscalls/pidfd_send_signal/pidfd_send_signal01.c b/testcases/kernel/syscalls/pidfd_send_signal/pidfd_send_signal01.c
index 03a4ae9bea41..4cb5df94c425 100644
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
@@ -69,7 +69,7 @@ static void verify_pidfd_send_signal(void)
 
 static void setup(void)
 {
-	check_syscall_support();
+	pidfd_send_signal_supported();
 
 	pidfd = SAFE_OPEN("/proc/self", O_DIRECTORY | O_CLOEXEC);
 
diff --git a/testcases/kernel/syscalls/pidfd_send_signal/pidfd_send_signal02.c b/testcases/kernel/syscalls/pidfd_send_signal/pidfd_send_signal02.c
index 74914523f0b8..1e62b417f29f 100644
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
@@ -68,7 +68,7 @@ static void setup(void)
 {
 	struct passwd *pw;
 
-	check_syscall_support();
+	pidfd_send_signal_supported();
 
 	pidfd = SAFE_OPEN("/proc/self", O_DIRECTORY | O_CLOEXEC);
 	init_pidfd = SAFE_OPEN("/proc/1", O_DIRECTORY | O_CLOEXEC);
diff --git a/testcases/kernel/syscalls/pidfd_send_signal/pidfd_send_signal03.c b/testcases/kernel/syscalls/pidfd_send_signal/pidfd_send_signal03.c
index 3420afbb9526..0903d67076aa 100644
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
@@ -111,7 +111,7 @@ static void verify_pidfd_send_signal(void)
 
 static void setup(void)
 {
-	check_syscall_support();
+	pidfd_send_signal_supported();
 
 	last_pid_file = "/proc/sys/kernel/ns_last_pid";
 	if (access(last_pid_file, F_OK) == -1) {
-- 
2.21.0.rc0.269.g1a574e7a288b


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
