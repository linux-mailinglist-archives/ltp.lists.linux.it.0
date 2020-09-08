Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0AA260AC1
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Sep 2020 08:20:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1C9A93C53E9
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Sep 2020 08:20:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 067D23C53EA
 for <ltp@lists.linux.it>; Tue,  8 Sep 2020 08:19:45 +0200 (CEST)
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 4152560007C
 for <ltp@lists.linux.it>; Tue,  8 Sep 2020 08:19:45 +0200 (CEST)
Received: by mail-pg1-x541.google.com with SMTP id m5so9311161pgj.9
 for <ltp@lists.linux.it>; Mon, 07 Sep 2020 23:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uLc6Bp0/iO7+krBorjiBUE3a6bFRRYRWxSFsgiR/tAQ=;
 b=B+z8XV5UEVX46MpYGEKS5oLDudGT2+dBsbkiQseuuZDNXJ/NdVETtoXUSUfT7QFuUe
 PN2bnZY+xt851ftV1Wmbnn4WHkfkCDW+Adfxa/lWO5N+9dMuC186/7eh/2Bd/QTjrf08
 H11M7OPUMpgqH8dmigtvb1b8m2mCQHqD9qdeAFEkpV/60BnUVKkpP7X5SbyOsAzDydHG
 edOGZrIwSCO0WYxzh3KGANW4L/S4A+0VGsyqW8hIomKtyqLd6qQGtEt8xVpp2ZNR/8oD
 7KNO2Im5hdM155LrOCEJwWlJnvRiwwl4bouWUfuN0TKh5nGsHvOffRcE8yT3htEQfjh/
 m0VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uLc6Bp0/iO7+krBorjiBUE3a6bFRRYRWxSFsgiR/tAQ=;
 b=qT01YgFSyyV8Msphw2JSNsO7VV4oJHIKzXIfx4OAsv8PqXfS+T5osvWzANF1CLMiQu
 3LjmmUxvclX56oiWcipHo6NHdd5vR7hmcCCYmBeygR18PqK/WXFX7lSI31eI/LFAr5j2
 hTqMHSBUFhPzRptoga83knO7/RII0cLJj9VnLXeY6p2J6fBrxz01nUviVm1Hxxxe3BEq
 vBln93t914xI80C8s8NWruFuT5gC8lH7GGRjQ3PXEhvP0315W/utwoJk8+31eogK0Fgo
 JfuglLia7Fxe/gK1Hu8bfGOze0R1FKGxRYXNVSYUPOrTImFdHL5NoDT+KLd07blsenQc
 pf9Q==
X-Gm-Message-State: AOAM533Pq6t8ikW2LL0IeTfQT4FN1n16TpbX4dqNt2EVzdfIQeRW3AjO
 0ZF0We2VZAsLdDSoZp24N9z86y7hERCsIQ==
X-Google-Smtp-Source: ABdhPJxL1VJ7OleMItHZOW2sYCBQT4RVGsd5ceJn6Al9imGhPySdgh9HOMUUcjmtLpGqy0At2LvYmg==
X-Received: by 2002:a62:4e96:: with SMTP id c144mr22462571pfb.27.1599545983487; 
 Mon, 07 Sep 2020 23:19:43 -0700 (PDT)
Received: from localhost ([122.181.54.133])
 by smtp.gmail.com with ESMTPSA id z11sm7631745pfc.181.2020.09.07.23.19.42
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 07 Sep 2020 23:19:42 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Tue,  8 Sep 2020 11:49:14 +0530
Message-Id: <7bfadc417d4a40348a0aa742f3c44582a955913a.1599545766.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1599545766.git.viresh.kumar@linaro.org>
References: <cover.1599545766.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 01/16] syscalls: Add common time64 variants structure
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
 include/time64_variants.h | 56 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 include/time64_variants.h

diff --git a/include/time64_variants.h b/include/time64_variants.h
new file mode 100644
index 000000000000..934268b0328b
--- /dev/null
+++ b/include/time64_variants.h
@@ -0,0 +1,56 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 Linaro Limited. All rights reserved.
+ * Author: Viresh Kumar <viresh.kumar@linaro.org>
+ */
+
+#ifndef TIME64_VARIANTS_H
+#define TIME64_VARIANTS_H
+
+#include <libaio.h>
+#include <signal.h>
+#include <stdio.h>
+#include <sys/poll.h>
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
+	int (*io_pgetevents)(io_context_t ctx, long min_nr, long max_nr,
+			struct io_event *events, void *timeout, sigset_t *sigmask);
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
