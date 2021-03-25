Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9885A34995F
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Mar 2021 19:20:04 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6096E3C78D4
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Mar 2021 19:20:04 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 0CFC83C2F4B
 for <ltp@lists.linux.it>; Thu, 25 Mar 2021 19:19:55 +0100 (CET)
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 8415C60086A
 for <ltp@lists.linux.it>; Thu, 25 Mar 2021 19:19:55 +0100 (CET)
Received: by mail-pg1-x532.google.com with SMTP id l76so2639846pga.6
 for <ltp@lists.linux.it>; Thu, 25 Mar 2021 11:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=doMmuOk1oZ25414DyliC5k3oA0GCClB4jG8Ut6pvAyw=;
 b=BluCpnaJT5WA49HlsT6eDpBDqc410Bb6KiA6Cd2U5WuxbPQN5MIlaCmLQLl9gbvmDh
 ArOHeJzdM6wUEVdGKnwFlXdyD3T3cLEa9bRRYTw4W1SMxQIRDP9MEWgiX+NTp0xdVT+N
 pnSRjc4BzorGOylzpOy4zuTONi/SPgfikdw30wTkJPAxhm94JXdxuhuwjqqbqTL1lJBz
 HPIlpomAqMcgtNY7oENgaB/jGU2yzDa8r7hTDoQB24csXL7j5IVUCjeuUkJjVWdZnTye
 F199Z7bLx/VcAXN9jJd8TaQZxB5/wFWQVEY0a72u0jaaY50srHqde80CbQahGkTUvub3
 KvvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=doMmuOk1oZ25414DyliC5k3oA0GCClB4jG8Ut6pvAyw=;
 b=o7OLpyqseknkRoihK4ezLeQjshu8V3kvELdD3u1jjH0yY6pISVSyGTyHSW/Q04Nifn
 4Q4KbfSEROxGpnvQqAy+T5FCzdDPCz2R9RJfiUqngmPoSD+k3hHLNTkjCHWdtykSUBbU
 ME3cSYJOWuwsXJE+YeYRUflU7PyE9EFY87DXuN2Dcf8sxPNlGjxyOmLglNfwhhL7Rzdm
 Kl266zubii6/ns0QMR6F749ua5VBCNj5yqTQ6xraQn0BNvzwFiQAb0eWqk2SUEDVjLsA
 DC5ZB8Kb4Bz9AO0hW+XjoqUtIcfm+Y9kjnUXGwvHOqSBkqfeSboNCeFSXkwp2aMyhU+r
 vnlg==
X-Gm-Message-State: AOAM530bKqtkGZE2bbyYczdkJny/hr//ribBtwQVRRhwO1M7RyIPk4+h
 xf77Sp+8l3YTun0k/kCeC1/7A5fnWgE=
X-Google-Smtp-Source: ABdhPJzcF+QoYQNNleVEQoqAnA830XtNrESbWa0Kon6lGvELZCDtfU9c36h6pfTqkDqWjoPDznnExA==
X-Received: by 2002:aa7:8d84:0:b029:1f8:3449:1bc6 with SMTP id
 i4-20020aa78d840000b02901f834491bc6mr9025218pfr.76.1616696393689; 
 Thu, 25 Mar 2021 11:19:53 -0700 (PDT)
Received: from localhost.localdomain (softbank126008192101.bbtec.net.
 [126.8.192.101])
 by smtp.gmail.com with ESMTPSA id i20sm5977597pgg.65.2021.03.25.11.19.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 11:19:53 -0700 (PDT)
From: QI Fuli <fukuri.sai@gmail.com>
X-Google-Original-From: QI Fuli <qi.fuli@fujitsu.com>
To: ltp@lists.linux.it
Date: Fri, 26 Mar 2021 03:19:03 +0900
Message-Id: <20210325181906.40688-2-qi.fuli@fujitsu.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210325181906.40688-1-qi.fuli@fujitsu.com>
References: <20210325181906.40688-1-qi.fuli@fujitsu.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 1/4] libs/libltpswap: Rename and Convert
 libs/libltpswapon to the new API
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
Cc: QI Fuli <qi.fuli@fujitsu.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

From: QI Fuli <qi.fuli@fujitsu.com>

Signed-off-by: QI Fuli <qi.fuli@fujitsu.com>
---
 include/libswap.h         | 24 +++++++++++++++
 libs/libltpswap/Makefile  | 12 ++++++++
 libs/libltpswap/libswap.c | 63 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 99 insertions(+)
 create mode 100644 include/libswap.h
 create mode 100644 libs/libltpswap/Makefile
 create mode 100644 libs/libltpswap/libswap.c

diff --git a/include/libswap.h b/include/libswap.h
new file mode 100644
index 000000000..d4b5301a5
--- /dev/null
+++ b/include/libswap.h
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2013 Oracle and/or its affiliates. All Rights Reserved.
+ * Author: Stanislav Kholmanskikh <stanislav.kholmanskikh@oracle.com>
+ */
+
+/*
+ * Contains common content for all swapon/swapoff tests
+ */
+
+#ifndef __LIBSWAP_H__
+#define __LIBSWAP_H__
+
+/*
+ * Make a swap file
+ */
+int make_swapfile(const char *swapfile, int safe);
+
+/*
+ * Check swapon/swapoff support status of filesystems or files
+ * we are testing on.
+ */
+void is_swap_supported(const char *filename);
+#endif /* __LIBSWAP_H__ */
diff --git a/libs/libltpswap/Makefile b/libs/libltpswap/Makefile
new file mode 100644
index 000000000..d8e692d17
--- /dev/null
+++ b/libs/libltpswap/Makefile
@@ -0,0 +1,12 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+#
+# Copyright (C) Richard Purdie <richard.purdie@linuxfoundation.org>
+
+top_srcdir		?= ../..
+
+include $(top_srcdir)/include/mk/env_pre.mk
+
+INTERNAL_LIB		:= libltpswap.a
+
+include $(top_srcdir)/include/mk/lib.mk
+include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/libs/libltpswap/libswap.c b/libs/libltpswap/libswap.c
new file mode 100644
index 000000000..658960c67
--- /dev/null
+++ b/libs/libltpswap/libswap.c
@@ -0,0 +1,63 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2013 Oracle and/or its affiliates. All Rights Reserved.
+ * Author: Stanislav Kholmanskikh <stanislav.kholmanskikh@oracle.com>
+ */
+
+#include <errno.h>
+#include "lapi/syscalls.h"
+#define TST_NO_DEFAULT_MAIN
+#include "tst_test.h"
+#include "libswap.h"
+
+/*
+ * Make a swap file
+ */
+int make_swapfile(const char *swapfile, int safe)
+{
+	if (!tst_fs_has_free(".", sysconf(_SC_PAGESIZE) * 10, TST_BYTES))
+		tst_brk(TBROK, "Insufficient disk space to create swap file");
+
+	/* create file */
+	if (tst_fill_file(swapfile, 0, sysconf(_SC_PAGESIZE), 10) != 0)
+		tst_brk(TBROK, "Failed to create swapfile");
+
+	/* make the file swapfile */
+	const char *argv[2 + 1];
+	argv[0] = "mkswap";
+	argv[1] = swapfile;
+	argv[2] = NULL;
+
+	return tst_cmd(argv, "/dev/null", "/dev/null", safe);
+}
+
+/*
+ * Check swapon/swapoff support status of filesystems or files
+ * we are testing on.
+ */
+void is_swap_supported(const char *filename)
+{
+	int fibmap = tst_fibmap(filename);
+	long fs_type = tst_fs_type(filename);
+	const char *fstype = tst_fs_type_name(fs_type);
+
+	int ret = make_swapfile(filename, 1);
+	if (ret != 0) {
+		if (fibmap == 1)
+			tst_brk(TCONF, "mkswap on %s not supported", fstype);
+		else
+			tst_brk(TFAIL, "mkswap on %s failed", fstype);
+	}
+
+	TEST(tst_syscall(__NR_swapon, filename, 0));
+	if (TST_RET == -1) {
+		if (fibmap == 1 && errno == EINVAL)
+			tst_brk(TCONF, "Swapfile on %s not implemented", fstype);
+		else
+			tst_brk(TFAIL | TERRNO, "swapon on %s failed", fstype);
+	}
+
+	TEST(tst_syscall(__NR_swapoff, filename, 0));
+	if (TST_RET == -1)
+		tst_brk(TFAIL | TTERRNO, "swapoff on %s failed", fstype);
+}
--
2.30.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
