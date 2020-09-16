Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 85CCC26C1BF
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Sep 2020 12:38:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 34D673C4EA8
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Sep 2020 12:38:30 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 267D93C2F32
 for <ltp@lists.linux.it>; Wed, 16 Sep 2020 12:38:21 +0200 (CEST)
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id BE1AE1400E48
 for <ltp@lists.linux.it>; Wed, 16 Sep 2020 12:38:20 +0200 (CEST)
Received: by mail-pl1-x643.google.com with SMTP id c3so2965769plz.5
 for <ltp@lists.linux.it>; Wed, 16 Sep 2020 03:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MJPLEXxKtkVxwnnHDwP4kUV/iQ3FxP9uhDz+UHSyYG8=;
 b=tlYSlxY6ZRaHgtCuDuUpTpA8B+m3Bv8qd7+1oMO1NCjZ6gb/laTT8JMFeKBAzd753E
 Pex4SnCYKExZGADDomJHQNghNcsczXsb9Y8ElilsevbuEiYRMP1CrWAgLeUjyYRVbTWu
 er9sBrDb6KRpa+myojEU9Gp0ojzuYe1Tv1szBBEju5ew0JplVok2NAs3z3wv1fnGjyYR
 VnFXAxevSWi4fm+fp+JpROXNZvr7+38c3jsPoME3ffqLt33tZp1J2hX6gX5rTpdLVKV0
 dC5013V8LxE5Cg7RHSfpAfKaJGiod3gVRUaxBL4ME4L/yLUlApOmUjmKC/DPcM2If4n0
 SdPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MJPLEXxKtkVxwnnHDwP4kUV/iQ3FxP9uhDz+UHSyYG8=;
 b=ckuxmmmJQetz3EZElK5RpDsr6ZM+F+nv1la9yHj6ob5q/bkk+u9bc/d9dESgBH+Gu/
 b/KITrSubdQa+tLM1ZnQkFwNRVtQEjPJbFsLn7bhioerRgaeml+ArNTCAFWJ1S2vN2HC
 pOL+1i3FVTywpAgU0D6wbow77KwI6AqViDtijnQryRKZ3+QAznOkS2G0mIp4uwNrNsFR
 iLjYe2TS3Bf2t/Tb8ppUg3iw2WBv6yP7AME6MY7n64k8jfG+njjugpbss2G8p+aAPkyg
 xUcGESn/1MPK9t6+9uo4QxNITCvr6QnJC5tJ8xeeL3a8qs9yuE2sXterJegQUO0XIqfU
 Ergw==
X-Gm-Message-State: AOAM5332v5uolye88Y5xw8lL9u+HJWOBBQsfXaxxRlrFo38XcxedvhEM
 HzT1LyXs0cUuxLQF6BMyETrY4ZbvYgx99A==
X-Google-Smtp-Source: ABdhPJzS08Ow+VDazn0SbFj4y0M4yyD9bl2xVEhPmoBEO0yIGKvNU8HVnD6hzwnRpV/lZE/kg2RLRw==
X-Received: by 2002:a17:90a:ed8e:: with SMTP id
 k14mr3480387pjy.178.1600252698895; 
 Wed, 16 Sep 2020 03:38:18 -0700 (PDT)
Received: from localhost ([122.181.54.133])
 by smtp.gmail.com with ESMTPSA id t15sm3299286pjq.3.2020.09.16.03.38.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 16 Sep 2020 03:38:18 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Wed, 16 Sep 2020 16:07:47 +0530
Message-Id: <e1291939d012be2f67b34c5bbb8e6f504d8c2fac.1600252542.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1600252542.git.viresh.kumar@linaro.org>
References: <cover.1600252542.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH V2 02/17] syscalls: Add common time64 variants
 structure
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

This adds a common variants structure which all other syscall tests can
use.

Suggested-by: Cyril Hrubis <chrubis@suse.cz>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 include/time64_variants.h | 65 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 include/time64_variants.h

diff --git a/include/time64_variants.h b/include/time64_variants.h
new file mode 100644
index 000000000000..fc52623c868a
--- /dev/null
+++ b/include/time64_variants.h
@@ -0,0 +1,65 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 Linaro Limited. All rights reserved.
+ * Author: Viresh Kumar <viresh.kumar@linaro.org>
+ */
+
+#ifndef TIME64_VARIANTS_H
+#define TIME64_VARIANTS_H
+
+#include "config.h"
+
+#ifdef HAVE_LIBAIO
+#include <libaio.h>
+#endif
+
+#include <signal.h>
+#include <stdio.h>
+#include <poll.h>
+#include <time.h>
+#include "tst_timer.h"
+
+struct tst_ts;
+struct pollfd;
+struct io_event;
+struct sembuf;
+struct mmsghdr;
+
+struct time64_variants {
+	char *desc;
+
+	enum tst_ts_type ts_type;
+	int (*clock_gettime)(clockid_t clk_id, void *ts);
+	int (*clock_settime)(clockid_t clk_id, void *ts);
+	int (*clock_nanosleep)(clockid_t clock_id, int flags, void *request, void *remain);
+
+	int (*timer_gettime)(kernel_timer_t timer, void *its);
+	int (*timer_settime)(kernel_timer_t timerid, int flags, void *its, void *old_its);
+	int (*tfd_gettime)(int fd, void *its);
+	int (*tfd_settime)(int fd, int flags, void *new_value, void *old_value);
+
+#ifdef HAVE_LIBAIO
+	int (*io_pgetevents)(io_context_t ctx, long min_nr, long max_nr,
+			struct io_event *events, void *timeout, sigset_t *sigmask);
+#endif
+
+	int (*mqt_send)(mqd_t mqdes, const char *msg_ptr, size_t msg_len,
+			unsigned int msg_prio, void *abs_timeout);
+	ssize_t (*mqt_receive)(mqd_t mqdes, char *msg_ptr, size_t msg_len,
+			       unsigned int *msg_prio, void *abs_timeout);
+	int (*ppoll)(struct pollfd *fds, nfds_t nfds, void *tmo_p,
+		     const sigset_t *sigmask, size_t sigsetsize);
+	int (*sched_rr_get_interval)(pid_t pid, void *ts);
+	int (*semop)(int semid, struct sembuf *sops, size_t nsops);
+	int (*semtimedop)(int semid, struct sembuf *sops, size_t nsops, void *timeout);
+	int (*sigwait) (const sigset_t * set, siginfo_t * info,
+			 void * timeout);
+	int (*recvmmsg)(int sockfd, struct mmsghdr *msgvec, unsigned int vlen,
+		       unsigned int flags, void *timeout);
+	int (*sendmmsg)(int sockfd, struct mmsghdr *msgvec, unsigned int vlen,
+		    unsigned int flags);
+	int (*utimensat)(int dirfd, const char *pathname, void *times,
+			 int flags);
+};
+
+#endif /* TIME64_VARIANTS_H */
-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
