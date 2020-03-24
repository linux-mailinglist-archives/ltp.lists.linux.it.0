Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CBC2190D30
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Mar 2020 13:18:33 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8C9C23C4D49
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Mar 2020 13:18:32 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 6F3373C0431
 for <ltp@lists.linux.it>; Tue, 24 Mar 2020 13:18:28 +0100 (CET)
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 7A3E21001167
 for <ltp@lists.linux.it>; Tue, 24 Mar 2020 13:18:26 +0100 (CET)
Received: by mail-pl1-x641.google.com with SMTP id g6so7338836plt.2
 for <ltp@lists.linux.it>; Tue, 24 Mar 2020 05:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=JliAUwbqkDp4RUscjkbw/A/CW57wkfWqamN7snvwTN0=;
 b=RDbBxEYxmW/vSZLBKJIypDNVGPgieIOJBHbp1NcWdwEVmN0wpOyVRgUwzhpMH4ES/3
 J38c+CDniW6GMdXaEzkR5Lsk05LXxoWnoWKyeVcSyOEdFoc77DxIrH23XhBDzfYb1U1G
 MUbQZh+eXm/u/foQyhyJH2CfvX3TFWUQjO6VixyNtCUvnYp+cIROGuryyk5e7AtaXt9O
 59TgIgbNiWdbAr6TmD1Gl9QD98VGE1cXjM8jF3UMj60bYqo+PSeL5xpn5J2nhtUiObaJ
 R1YdU/YnNIvgarVawFZr3gYM33NnjVoSGga8xLXAYx+nER7X7a8a+WquDejSWgva2+UP
 aBKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=JliAUwbqkDp4RUscjkbw/A/CW57wkfWqamN7snvwTN0=;
 b=gijPcT7EQkBwTrxfBqPcMWSspozhxEmf8CH+S4deVnGDThsjUKT7Aip4fqnn+voxdu
 jsqVr+udOv6do4TQ6aQGmrweS228lbweuvndMZW6mdyUsnM5ypnhxj/TFrIQkj6/25Ti
 lD4NVLXJwPHGsgzQWNiOsITfwUdQtKq8rHh8DFq0sx2lMI/XSIBW6UHnI+hSBRbkQt4U
 XMGIfNT2KwnP709136y9DUAt3NTbM93pKDlc7SCq1zJdKVlWs5UNDsV+gM1lA3ddKMTA
 IYL6tjprIlIhhr/KBpWt7BSnectwqdAbLCBSYQua4UMu2BbeZKlp6Yel7UHw0+Jf7iju
 JnBA==
X-Gm-Message-State: ANhLgQ0zXtKl6wh8qQxJM3cnhiQbCe5n/EaemtbjM6cO1RxDtLVJr90h
 agxR9ym2CQAaBg7guJcHVi2IaYGbtII=
X-Google-Smtp-Source: ADFU+vtf73GblQBPOo38Im3Pkx9SliA5lBDpZS+cLWyrYLSN3hOC27iW/EzN2VqjwzZRv+Yj7MYM1A==
X-Received: by 2002:a17:902:7d91:: with SMTP id
 a17mr26560584plm.267.1585052304434; 
 Tue, 24 Mar 2020 05:18:24 -0700 (PDT)
Received: from bj616583pcu.spreadtrum.com ([117.18.48.82])
 by smtp.gmail.com with ESMTPSA id q91sm2204943pjb.11.2020.03.24.05.18.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Mar 2020 05:18:23 -0700 (PDT)
From: gengcixi@gmail.com
To: ltp@lists.linux.it,
	pvorel@suse.cz
Date: Tue, 24 Mar 2020 20:17:42 +0800
Message-Id: <20200324121742.7130-1-gengcixi@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v2] uart: add uart testcase in kernel device-drivers
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Orson Zhai <orsonzhai@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

From: Cixi Geng <gengcixi@gmail.com>

Porting UART test from ltp-ddt back to ltp.
rewrite case use ltp library functions instead of ltp-ddt's

Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
Signed-off-by: Orson Zhai <orsonzhai@gmail.com>
Signed-off-by: Cixi Geng <gengcixi@gmail.com>
---
changes v2:
    1. support more bandrate test 
    2. move test tags in kernel_misc file 
    3. use TST_NEEDS_CMDS to check lsof,dd and serialcheck command 
    4. remove arrays in bash,rewrite test flow control to adapt dash 
    5. others like License and code-style issues
explatin for v1:
    1. create_test_file should be just 2 lines of code in setup function.
    >>>the test files need have random data,So use create_test_file
    function
    2. why run 2 instances of serialcheck
    >>>run 2 instances is one test send and one test recv, sleep in
    send  for make sure recv instances can get the send data
---
 runtest/kernel_misc                           |  6 ++
 testcases/kernel/device-drivers/Makefile      |  1 +
 testcases/kernel/device-drivers/uart/Makefile | 10 +++
 .../kernel/device-drivers/uart/serialcheck.sh | 68 +++++++++++++++++++
 4 files changed, 85 insertions(+)
 create mode 100644 testcases/kernel/device-drivers/uart/Makefile
 create mode 100755 testcases/kernel/device-drivers/uart/serialcheck.sh

diff --git a/runtest/kernel_misc b/runtest/kernel_misc
index 7937c7bbf..7a077b23b 100644
--- a/runtest/kernel_misc
+++ b/runtest/kernel_misc
@@ -13,3 +13,9 @@ zram01 zram01.sh
 zram02 zram02.sh
 zram03 zram03
 umip_basic_test umip_basic_test
+# uart test in loopback mode
+uart_9600_k serialcheck.sh 9600 5 k
+uart_19200_k serialcheck.sh 19200 5 k
+uart_38400_k serialcheck.sh 38400 5 k
+uart_57600_k  serialcheck.sh 57600 5 k
+uart_115200_k serialcheck.sh 115200 5 k
diff --git a/testcases/kernel/device-drivers/Makefile b/testcases/kernel/device-drivers/Makefile
index 55e0d25a0..a214f211b 100644
--- a/testcases/kernel/device-drivers/Makefile
+++ b/testcases/kernel/device-drivers/Makefile
@@ -27,6 +27,7 @@ SUBDIRS		:= acpi \
 		   rtc \
 		   tbio \
 		   uaccess \
+		   uart \
 		   zram
 
 include $(top_srcdir)/include/mk/generic_trunk_target.mk
diff --git a/testcases/kernel/device-drivers/uart/Makefile b/testcases/kernel/device-drivers/uart/Makefile
new file mode 100644
index 000000000..2e4781a6b
--- /dev/null
+++ b/testcases/kernel/device-drivers/uart/Makefile
@@ -0,0 +1,10 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0-or-later
+# Copyright (c) 2014-2015 Oracle and/or its affiliates. All Rights Reserved.
+
+top_srcdir	?= ../../../..
+include $(top_srcdir)/include/mk/testcases.mk
+
+INSTALL_TARGETS		:= *.sh
+
+include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/device-drivers/uart/serialcheck.sh b/testcases/kernel/device-drivers/uart/serialcheck.sh
new file mode 100755
index 000000000..afdc9212f
--- /dev/null
+++ b/testcases/kernel/device-drivers/uart/serialcheck.sh
@@ -0,0 +1,68 @@
+#!/bin/sh
+###############################################################################
+#
+# SPDX-License-Identifier: GPL-2.0-or-later
+# Copyright (C) 2015 Texas Instruments Incorporated - http://www.ti.com/
+# Copyright (C) 2019, Unisoc Communications Inc.
+#
+# Test UART ports using git://git.breakpoint.cc/bigeasy/serialcheck.git
+#
+###############################################################################
+
+TST_TESTFUNC=do_test
+TST_POS_ARGS=3
+TST_USAGE=usage
+TST_NEEDS_ROOT=1
+TST_NEEDS_CMDS="serialcheck"
+TST_NEEDS_CMDS="lsof"
+TST_NEEDS_CMDS="dd"
+TST_NEEDS_TMPDIR=1
+
+. tst_test.sh
+
+usage()
+{
+    echo "usage: ./${0} [-r UART_RATE] [-l LOOPS] [-h|k to enable HW flow control or loopback]"
+    exit 1
+}
+
+UART_RATE=$1
+UART_LOOPS=$2
+UART_HWFLOW=$3
+
+create_test_file()
+{
+    temp_test_file=`mktemp`
+    dd if=/dev/urandom of=$temp_test_file count=1 bs=$((UART_RATE / 2))
+}
+
+test_serial()
+{
+    create_test_file
+    { sleep 1; serialcheck -b $UART_RATE -d $1 -f $temp_test_file -l $UART_LOOPS -m t -${UART_HWFLOW}; }&
+    PID=$!
+    serialcheck -b $UART_RATE -d $1 -f $temp_test_file -l $UART_LOOPS -m r -${UART_HWFLOW}
+    if [ $? ];  then
+        kill -- -$PID 2>/dev/null
+        tst_res TFAIL "uart test failed"
+    else
+        tst_res TPASS "uart test passed"
+    fi
+    rm $temp_test_file
+}
+
+do_test()
+{
+    for i in /sys/class/tty/*/uartclk ;do
+        PORT=`echo $i |cut -d '/' -f 5`
+        # Activate port in case it will be initialized only when startup
+        echo "UART TESTING">${PORT} 2>/dev/null
+        if [ `cat /sys/class/tty/${PORT}/uartclk` -ne 0 ]; then
+            lsof | grep "/dev/${PORT}" &> /dev/null || PORT_TO_TEST="/dev/${PORT}"
+            tst_res TINFO "start test on ${PORT_TO_TEST} ${UART_RATE}"
+            test_serial ${PORT_TO_TEST}
+        fi
+    done
+}
+
+tst_run
-- 
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
