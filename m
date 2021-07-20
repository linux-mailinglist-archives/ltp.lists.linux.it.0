Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C73763CFA9E
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Jul 2021 15:34:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7C8703C6CBE
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Jul 2021 15:34:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E44223C2B48
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 15:34:07 +0200 (CEST)
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 968B36008F6
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 15:34:07 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id y42so35830275lfa.3
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 06:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bell-sw-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S5VWBTnBXqkir1Cy8ZaFZbstsLWfUTJ8pLwtKKnsfS8=;
 b=jfqdE8R9vsckjszNdF5oVNITjko9hC/utePivbcjYzZT3qNgK9T8mcGgC7pTYgaB1T
 StJBdIGrfeINvApo7YNwRqIJ99HjHiy4ztUvxWl6RwcqSKKpnNGqHF0YQyHBsLe60yOv
 BxrrtxSypM+mrosMQb0JUgU+8/S9OF499zKD686lqNDc8bLAe/OAD6udDrwsP7LkoxxQ
 jPx5zKP1QRmCJzoJx1/rbtE3G/YVjItSzibMtTX/O6xNxSMBgya2gJ+C0l/Jt9HQJOo7
 9G0IBIg4RIUSdIHrYqZZiEP+gKBNj9jj19vHijefg3QaLhiok/N0OfM7wPhqJuzukN3Q
 m5uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S5VWBTnBXqkir1Cy8ZaFZbstsLWfUTJ8pLwtKKnsfS8=;
 b=eyqdrdnMorZKdUBu39NT0MVi6nAvuzU5GEl99ZRDwQMR78R4IxgeJ6lvmiZmwEtaQK
 SV2CSIUFgzwJ/qr652qcvNyi5bnbxr+dGuzCEpTMlY5Z5pmgawfommyPYQRniZobcKO8
 0/Hhdocl3PsgbMLHVE+8/3X3K+T7RZbqflZ935KuqglH2lfpFLYWcMLOHnuWgYWG0nap
 Im5tgYqI+7v0BK3mtjIKf9p5frNsBLSkK0PLWswyBwvwFtWKS5G5DJL4D26UQknQy0T6
 XLRrbq3y7sVY36X5m3RAtgM+uBoeqFzdXVokamaeNVWeWcptXVm7j+wYT8H6mQp+25Ln
 TB7A==
X-Gm-Message-State: AOAM533SOgoVN2NBgUQV4BDJ6Rknyly7Gn4nJzQ2Br6glmuy6GLduDW9
 wNlyxSwNoTAipxCShHRmYfLMtLYMLSqz
X-Google-Smtp-Source: ABdhPJzLbpvLMfNn9J57utIJm2bpZ+Mac5ONAsriw77EOOl8Yi899OaXyJdm0uykWJPS8zmTAMYiAA==
X-Received: by 2002:ac2:5b03:: with SMTP id v3mr14926502lfn.188.1626788046796; 
 Tue, 20 Jul 2021 06:34:06 -0700 (PDT)
Received: from localhost.localdomain ([178.68.161.34])
 by smtp.gmail.com with ESMTPSA id x16sm1526828lfa.244.2021.07.20.06.34.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 06:34:06 -0700 (PDT)
From: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
To: ltp@lists.linux.it
Date: Tue, 20 Jul 2021 16:33:09 +0300
Message-Id: <20210720133324.21752-2-aleksei.kodanev@bell-sw.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210720133324.21752-1-aleksei.kodanev@bell-sw.com>
References: <20210720133324.21752-1-aleksei.kodanev@bell-sw.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 01/16] lib/tst_sched: add ltp tst_sched_*()
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

The new tst_sched_*() invoke libc variant first, and if ENOSYS errno
has been returned, tries to invoke syscall directly.

musl implementation returns ENOSYS for some sched_*() functions due
to commit 1e21e78bf7a5 ("add support for thread scheduling (POSIX
TPS option)").

Signed-off-by: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
---
 include/tst_sched.h | 16 ++++++++++++++++
 lib/tst_sched.c     | 36 ++++++++++++++++++++++++++++++++++++
 2 files changed, 52 insertions(+)
 create mode 100644 include/tst_sched.h
 create mode 100644 lib/tst_sched.c

diff --git a/include/tst_sched.h b/include/tst_sched.h
new file mode 100644
index 000000000..0e5d61344
--- /dev/null
+++ b/include/tst_sched.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (c) 2021, BELLSOFT. All rights reserved.
+ */
+
+#ifndef TST_SCHED_H_
+#define TST_SCHED_H_
+
+#include <sched.h>
+
+int tst_sched_setparam(pid_t pid, const struct sched_param *param);
+int tst_sched_getparam(pid_t pid, struct sched_param *param);
+int tst_sched_setscheduler(pid_t pid, int policy, const struct sched_param *param);
+int tst_sched_getscheduler(pid_t pid);
+
+#endif /* TST_SCHED_H_ */
diff --git a/lib/tst_sched.c b/lib/tst_sched.c
new file mode 100644
index 000000000..d53273d8e
--- /dev/null
+++ b/lib/tst_sched.c
@@ -0,0 +1,36 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2021, BELLSOFT. All rights reserved.
+ */
+
+#include <errno.h>
+#include <unistd.h>
+#include "tst_sched.h"
+#include "lapi/syscalls.h"
+
+#define TST_SCHED_COMMON(SCALL, ...) do {			\
+	int ret = SCALL(__VA_ARGS__);				\
+	if (ret == -1 && errno == ENOSYS)			\
+		return syscall(__NR_##SCALL, __VA_ARGS__);	\
+	return ret;						\
+} while (0)
+
+int tst_sched_setparam(pid_t pid, const struct sched_param *param)
+{
+	TST_SCHED_COMMON(sched_setparam, pid, param);
+}
+
+int tst_sched_getparam(pid_t pid, struct sched_param *param)
+{
+	TST_SCHED_COMMON(sched_getparam, pid, param);
+}
+
+int tst_sched_setscheduler(pid_t pid, int policy, const struct sched_param *param)
+{
+	TST_SCHED_COMMON(sched_setscheduler, pid, policy, param);
+}
+
+int tst_sched_getscheduler(pid_t pid)
+{
+	TST_SCHED_COMMON(sched_getscheduler, pid);
+}
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
