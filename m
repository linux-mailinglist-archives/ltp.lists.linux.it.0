Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A9234B637
	for <lists+linux-ltp@lfdr.de>; Sat, 27 Mar 2021 11:33:12 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6758F3C8DEA
	for <lists+linux-ltp@lfdr.de>; Sat, 27 Mar 2021 11:33:12 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 902F43C2BD0
 for <ltp@lists.linux.it>; Sat, 27 Mar 2021 11:33:01 +0100 (CET)
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 1E05A600668
 for <ltp@lists.linux.it>; Sat, 27 Mar 2021 11:33:01 +0100 (CET)
Received: by mail-pj1-x1029.google.com with SMTP id
 x7-20020a17090a2b07b02900c0ea793940so5437506pjc.2
 for <ltp@lists.linux.it>; Sat, 27 Mar 2021 03:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=doMmuOk1oZ25414DyliC5k3oA0GCClB4jG8Ut6pvAyw=;
 b=OwJnMIO9UaRXnYyWorB2rLcG3e7g9JmVBSzMsCTdl5pfBNTK9ss6IL566RJo/+ewBJ
 1HFantcwHBtfIrJ7aFiU2di/dOpFDaVG4A++O075t/oBXcDH0hlh+PuTVR3IdshxaHns
 PHzxj9cZWfawTcLvwA9FxmrS/LX9p9RJDWmt3iOQ/N+zc+WxOzL27qElyI+dsvLFieG2
 h2noks24Kp2S7vGvSVAsvbZy7nRfi+mlPGwqSvNPmC7RVpRMTPySX9bg401iAGsLCxmR
 rV7sllEzkZYgQIpOAXNtrO9+nD8TB+9rOKQJlUb7jT362LDCG+D0qnibMCnU/8xXc6cq
 n4Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=doMmuOk1oZ25414DyliC5k3oA0GCClB4jG8Ut6pvAyw=;
 b=guWum0I9j7HTLZ1DcbXAS/jACtZ4n8SP9NIoCh0QGqeN2NbyvZ1KWt2RIu7xA9fpeT
 oeDVpA5neQdVmxhs8+PpzkaP/OEXpTrOTJO4dSGnX3vK4w8C0p4kQNQJJ7U4ar10113i
 QkQnwyLiwfJe0ahTgY8yiK/bzI6PScrRkcdAZYYAKdibfwMpr9p7k2C+KZVmAILd4oOv
 42MLaSr0tSz2W343wtUpE5MguWOh0NvScjHYiVVq9opHx2/Jgf3twq+j2DnlRZ4aAh1N
 ghk7sJglZXKZdtCbvMO3yufgiKIkeWRWqob9FlBzdNw/L7XpUt/QOfn444pyczi2c+OL
 g/zQ==
X-Gm-Message-State: AOAM5317iIoUqeOHp5bT/Nv2bT7VKUqbg2Oh7mxWl3DGQwlD5/Ube3tP
 nWqRbrrBkYVLF2CH6Ab724KVeYiWCrcVwQ==
X-Google-Smtp-Source: ABdhPJygC+i1WbrOUD8CoS3yhfi4fH7PlZRHlre7RiDLretIm2u2to2uALharANUVPfHDjeS84uGJQ==
X-Received: by 2002:a17:90a:9f8c:: with SMTP id
 o12mr17556057pjp.215.1616841179306; 
 Sat, 27 Mar 2021 03:32:59 -0700 (PDT)
Received: from localhost.localdomain (softbank060103061185.bbtec.net.
 [60.103.61.185])
 by smtp.gmail.com with ESMTPSA id q184sm11890097pfc.78.2021.03.27.03.32.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Mar 2021 03:32:58 -0700 (PDT)
From: QI Fuli <fukuri.sai@gmail.com>
X-Google-Original-From: QI Fuli <qi.fuli@fujitsu.com>
To: ltp@lists.linux.it
Date: Sat, 27 Mar 2021 19:32:21 +0900
Message-Id: <20210327103226.99073-2-qi.fuli@fujitsu.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210327103226.99073-1-qi.fuli@fujitsu.com>
References: <20210327103226.99073-1-qi.fuli@fujitsu.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 1/6] libs/libltpswap: Add libs/libltpswap by using the
 new API
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
