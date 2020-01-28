Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E7B14C230
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Jan 2020 22:27:44 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CE0E03C2476
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Jan 2020 22:27:43 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 0CEC43C2464
 for <ltp@lists.linux.it>; Tue, 28 Jan 2020 22:27:41 +0100 (CET)
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 821481A00E60
 for <ltp@lists.linux.it>; Tue, 28 Jan 2020 22:27:37 +0100 (CET)
Received: by mail-wm1-x341.google.com with SMTP id p9so4099067wmc.2
 for <ltp@lists.linux.it>; Tue, 28 Jan 2020 13:27:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dlErUNenJJ56yPXI5w2YNsoH1yRaeGNvSakff89nLhk=;
 b=VJqQjhLyjgwHTRbs8kjGJzfyM/EaxTUWVU+heW8OXwoKkr0REs1aT+aDs/St+jLeWZ
 beOV8iFS+Bu8sf+g/20WNo+zk4IF0ih3jZGxcaa2Kr9k0z1ArCVRO740fgA5dm9D96XB
 9LAq0EEGSStdXyBlZzKZ4qeVhHlWkBilzCdKTuCWIsrLq94jJ1x0gRvAKHVfP6PIHAsR
 OFULL71clPrYP9KoW1JiyGfquBgM1vpQo6GBLvibm3oKmKnwACCNL5dxGbIhwp6LKbKy
 E0TxVpSWRYYqgKNZytYqzRy4/hoT9cJUF1qk/6mkTMZpbluBMOjMmA31BpRq/jzD8Uzv
 y/YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dlErUNenJJ56yPXI5w2YNsoH1yRaeGNvSakff89nLhk=;
 b=blpvIi3wtZDc3xSZAxPrfk7ORIJBJmKRf+XsbAjJKmyycUQZWLzh60QiaD6TTMmS1d
 tHi0CEaGI8clyo+/Dfi9yyRPsc8O3d8oVGS7SnRQSXWRvh+4Ti40eQO813Bkk2MjN8DC
 UumNW8WmAeUdcIqM/EQM8LFOTP53Lr1qmVXHRO8D9cPOdkgI35HdF/nKnr0eDRbMT1+7
 kiEENhflgVcUrZ5k3TakkW8qUTeKUmg9ptqYeMAEWxkLs1RC6St0+96yxvACNSkWQwgF
 QN483vfxaBkFfjMsXAxfodBA0D1+wXXpTFo5QQFuYK3NQLHCZA8T7oBgTHfkJTx3sKoV
 sOQQ==
X-Gm-Message-State: APjAAAX4HjG4Sn0cpqx4wM7IEnA/o0qevqorI4nnMui0SaWQIVfjmLyA
 0ED5tT72WyhoJw3mmPy3mU13nJv1Kog=
X-Google-Smtp-Source: APXvYqy+AqOdmpJpWFVmPZjzZ1BXYEnALiNmkxrDJPRhSvam1/YHjn3WVdQzLBypIp+VOsT2/QJAfA==
X-Received: by 2002:a05:600c:54b:: with SMTP id
 k11mr7071641wmc.63.1580246856661; 
 Tue, 28 Jan 2020 13:27:36 -0800 (PST)
Received: from dell5510.arch.suse.de ([62.201.25.198])
 by smtp.gmail.com with ESMTPSA id 25sm4447053wmi.32.2020.01.28.13.27.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jan 2020 13:27:35 -0800 (PST)
From: Petr Vorel <petr.vorel@gmail.com>
To: ltp@lists.linux.it
Date: Tue, 28 Jan 2020 22:27:25 +0100
Message-Id: <20200128212725.22781-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] ioctl02.c: check for struct termio
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

Test is meant to use legacy struct termio, so we need to check for it.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Tested: https://travis-ci.org/pevik/ltp/builds/643099597

NOTE: also rewriting other tests to new API which will use LTP_CHECK_TERMIO
(ioctl02.c and ptem01.c).

Kind regards,
Petr

 configure.ac                              |  1 +
 m4/ltp-termio.m4                          |  6 ++++++
 testcases/kernel/syscalls/ioctl/ioctl01.c | 20 ++++++++++++--------
 3 files changed, 19 insertions(+), 8 deletions(-)
 create mode 100644 m4/ltp-termio.m4

diff --git a/configure.ac b/configure.ac
index c7cdff1c4..b860bdacc 100644
--- a/configure.ac
+++ b/configure.ac
@@ -257,6 +257,7 @@ LTP_CHECK_SYSCALL_QUOTACTL
 LTP_CHECK_SYSCALL_SIGNALFD
 LTP_CHECK_SYSCALL_UTIMENSAT
 LTP_CHECK_TASKSTATS
+LTP_CHECK_TERMIO
 LTP_CHECK_TIMERFD
 test "x$with_tirpc" = xyes && LTP_CHECK_TIRPC
 LTP_CHECK_TPACKET_V3
diff --git a/m4/ltp-termio.m4 b/m4/ltp-termio.m4
new file mode 100644
index 000000000..e745df1d9
--- /dev/null
+++ b/m4/ltp-termio.m4
@@ -0,0 +1,6 @@
+dnl SPDX-License-Identifier: GPL-2.0-or-later
+dnl Copyright (c) 2020 Petr Vorel <petr.vorel@gmail.com>
+
+AC_DEFUN([LTP_CHECK_TERMIO],[
+AC_CHECK_TYPES([struct termio],,,[#include <sys/ioctl.h>])
+])
diff --git a/testcases/kernel/syscalls/ioctl/ioctl01.c b/testcases/kernel/syscalls/ioctl/ioctl01.c
index 7fb8d417e..88c0b9ffb 100644
--- a/testcases/kernel/syscalls/ioctl/ioctl01.c
+++ b/testcases/kernel/syscalls/ioctl/ioctl01.c
@@ -1,11 +1,10 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * Copyright (c) International Business Machines  Corp., 2001
- *  07/2001 Ported by Wayne Boyer
- *  04/2002 Fixes by wjhuie
- */
-/*
- * DESCRIPTION
+ * Copyright (c) International Business Machines Corp., 2001
+ * Copyright (c) 2020 Petr Vorel <petr.vorel@gmail.com>
+ * 07/2001 Ported by Wayne Boyer
+ * 04/2002 Fixes by wjhuie
+ *
  *	Testcase to check the errnos set by the ioctl(2) system call.
  *
  * ALGORITHM
@@ -14,13 +13,13 @@
  *	3. EINVAL: Pass invalid cmd in ioctl(fd, cmd, arg)
  *	4. ENOTTY: Pass an non-streams fd in ioctl(fd, cmd, arg)
  *	5. EFAULT: Pass a NULL address for termio
- *
  */
 
+#include "config.h"
 #include <errno.h>
 #include <fcntl.h>
 #include <stdio.h>
-#include <termio.h>
+#include <sys/ioctl.h>
 #include <termios.h>
 #include "tst_test.h"
 
@@ -29,6 +28,7 @@
 static int fd, fd_file;
 static int bfd = -1;
 
+#ifdef HAVE_STRUCT_TERMIO
 static struct termio termio;
 
 static struct tcase {
@@ -113,3 +113,7 @@ static struct tst_test test = {
 		{}
 	}
 };
+
+#else
+	TST_TEST_TCONF("libc doesn't provide legacy struct termio");
+#endif /* HAVE_STRUCT_TERMIO */
-- 
2.24.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
