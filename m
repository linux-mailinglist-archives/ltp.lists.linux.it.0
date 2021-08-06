Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BE79E3E2E83
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Aug 2021 18:48:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4F2BF3CAA91
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Aug 2021 18:48:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 966ED3C5361
 for <ltp@lists.linux.it>; Fri,  6 Aug 2021 18:48:02 +0200 (CEST)
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 3381F10011D0
 for <ltp@lists.linux.it>; Fri,  6 Aug 2021 18:48:02 +0200 (CEST)
Received: by mail-lf1-x130.google.com with SMTP id x8so19161890lfe.3
 for <ltp@lists.linux.it>; Fri, 06 Aug 2021 09:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bell-sw-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aJYVrmX+LiJA+U2DTMhrp8gSyW0hcBj+tF1FWpyNWfc=;
 b=LfPIskTHHRNBsIlB2dObJAkw4Cd/iFRjsoXrc1vszXkzbrB2JTV8OXNrw2YmI0J/Ip
 YACL7o+d8h6R4ICqYMJ8lzSfJtu2ZMqNfObxbFMvPBVNd7dHLumGBoNsKrdBQ2tdJMUa
 okvTo73lY6KoVL61Hx7rvrqSgDff7DV8s9dxl0UZSKKVnxw0Oaa/nOz7txiFK5Acsboh
 yqrN0pTkAS41GpDqTaXvX+zcwcA2OeGmJe8buuOJdU2jXy3x3eZCXjP1BSqxq4MAsJ/+
 seph5eugpHIvZi9FXsuvIcjW+WQ+u0sdv/ZhvfofOpygyQbqBg8QKZK17baLbFZWsOh8
 VWhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aJYVrmX+LiJA+U2DTMhrp8gSyW0hcBj+tF1FWpyNWfc=;
 b=uKPdeNs/jAcdS9Cu+TEh07AFDz5mSFxjfiI8mEqcInO5WOPFc2CUJLJYAgf1SZvDLb
 SfGSsbS9qh/+6e1NDq9B2+78Nqop3Bn+oiqAT58kxba+g+e6l4JyAXXgu/VhyrYepoKK
 vNARcNNg6x9yKdQfora3r9vzATkDfas2NCoj9nhidi13yh2y269ibazjHLTm2DwjQSSc
 MTbe1pbLbAFOA19ow4ecTDIso10rr+il4sVC0BSDhgrlPB7S6aGDbb/8HvNrJUnQjfgJ
 gwXG1/Cfb52ugdB/mNVKDlJGRsn134mYGHyHDsOAIUxJVYR7QnRq6GuIamNKjA4Q0QYk
 u/gg==
X-Gm-Message-State: AOAM532SCAJBIp5IIKNcsoYyVVNdfDoRSuC2gVJIq8thLBK5neYkDlMa
 TivG5UOLjDMVxFIpnptXJoCXgFuJrCgS
X-Google-Smtp-Source: ABdhPJwN1d0iFreU7qU8SBL+CpcH1/MKCDLDoH3rb3c7QkZcdbwsWKkz6aBSs23inSMiHZNYyYGRHA==
X-Received: by 2002:ac2:4350:: with SMTP id o16mr8652652lfl.184.1628268481517; 
 Fri, 06 Aug 2021 09:48:01 -0700 (PDT)
Received: from localhost.localdomain ([91.247.148.2])
 by smtp.gmail.com with ESMTPSA id y10sm960297lfh.40.2021.08.06.09.48.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Aug 2021 09:48:01 -0700 (PDT)
From: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
To: ltp@lists.linux.it
Date: Fri,  6 Aug 2021 19:47:15 +0300
Message-Id: <20210806164730.51040-2-aleksei.kodanev@bell-sw.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210806164730.51040-1-aleksei.kodanev@bell-sw.com>
References: <20210806164730.51040-1-aleksei.kodanev@bell-sw.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v2 01/16] lib/tst_sched: add ltp sys/libc_sched_*()
 wrappers
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

The new wrappers allow to test libc and syscall variants. This is needed
because libc implementation can differ from calling syscall directly.
For example, musl libc implementation returns ENOSYS for some sched_*()
functions due to commit 1e21e78bf7a5 ("add support for thread scheduling
(POSIX TPS option)").

Signed-off-by: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
---
 include/tst_sched.h | 70 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 include/tst_sched.h

diff --git a/include/tst_sched.h b/include/tst_sched.h
new file mode 100644
index 000000000..a5dc767b3
--- /dev/null
+++ b/include/tst_sched.h
@@ -0,0 +1,70 @@
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
+#include "lapi/syscalls.h"
+
+struct sched_variants {
+	char *desc;
+
+	int (*sched_setparam)(pid_t pid, const struct sched_param *param);
+	int (*sched_getparam)(pid_t pid, struct sched_param *param);
+	int (*sched_setscheduler)(pid_t pid, int policy, const struct sched_param *param);
+	int (*sched_getscheduler)(pid_t pid);
+};
+
+#define _TST_LIBC_SCHED_SCALL(SCALL, ...)({ \
+	int tst_ret = SCALL(__VA_ARGS__); \
+	if (tst_ret == -1 && errno == ENOSYS) { \
+		tst_brk(TCONF, #SCALL " not supported"); \
+	} \
+	tst_ret; \
+})
+
+static inline int sys_sched_setparam(pid_t pid, const struct sched_param *param)
+{
+	return tst_syscall(__NR_sched_setparam, pid, param);
+}
+
+static inline int sys_sched_getparam(pid_t pid, struct sched_param *param)
+{
+	return tst_syscall(__NR_sched_getparam, pid, param);
+}
+
+static inline int sys_sched_setscheduler(pid_t pid, int policy, const struct sched_param *param)
+{
+	return tst_syscall(__NR_sched_setscheduler, pid, policy, param);
+}
+
+static inline int sys_sched_getscheduler(pid_t pid)
+{
+	return tst_syscall(__NR_sched_getscheduler, pid);
+}
+
+static inline int libc_sched_setparam(pid_t pid, const struct sched_param *param)
+{
+	return _TST_LIBC_SCHED_SCALL(sched_setparam, pid, param);
+}
+
+static inline int libc_sched_getparam(pid_t pid, struct sched_param *param)
+{
+	return _TST_LIBC_SCHED_SCALL(sched_getparam, pid, param);
+}
+
+static inline int libc_sched_setscheduler(pid_t pid, int policy, const struct sched_param *param)
+{
+	return _TST_LIBC_SCHED_SCALL(sched_setscheduler, pid, policy, param);
+}
+
+static inline int libc_sched_getscheduler(pid_t pid)
+{
+	return _TST_LIBC_SCHED_SCALL(sched_getscheduler, pid);
+}
+
+#endif /* TST_SCHED_H_ */
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
