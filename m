Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 93BF72FB4EC
	for <lists+linux-ltp@lfdr.de>; Tue, 19 Jan 2021 10:33:22 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2ED053C53D9
	for <lists+linux-ltp@lfdr.de>; Tue, 19 Jan 2021 10:33:22 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id E55823C0BCB
 for <ltp@lists.linux.it>; Tue, 19 Jan 2021 10:33:10 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 9BCD414000E9
 for <ltp@lists.linux.it>; Tue, 19 Jan 2021 10:33:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1611048790; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F0O1yfxvj2cf6vUfDqzCU1sr5/oQEGYafzItc2hZ3k4=;
 b=uz6gEMwLD1/Up+TZUzZiuH022niA4/BwnkZ5B9tisM8NUpyxEKk21DlqTQ8zuf7bc7fOY2
 rH1O69jL+mtYU2e1rZVWem3S/9MRNSrpcO5r2AGjdE9tfJ6tHUM5VXaGgUbv+ygZ1JVuCM
 QjHfP3rbcooJRmL+5JVMKcw6KLZ8luk=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 38ED4ACF5;
 Tue, 19 Jan 2021 09:33:10 +0000 (UTC)
To: ltp@lists.linux.it
Date: Tue, 19 Jan 2021 09:31:39 +0000
Message-Id: <20210119093143.17222-3-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210119093143.17222-1-rpalethorpe@suse.com>
References: <20210119093143.17222-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v2 2/6] can: Add can_common.h for vcan device setup
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
From: Richard Palethorpe via ltp <ltp@lists.linux.it>
Reply-To: Richard Palethorpe <rpalethorpe@suse.com>
Cc: Oliver Hartkopp <socketcan@hartkopp.net>,
 Richard Palethorpe <rpalethorpe@suse.com>, linux-can@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Note that we call modprobe to set echo=1. However this does seem to be
necessary for the current tests on 5.10. It has been kept to avoid
changing the test behavior unnecessarily, but can most likely be
safely removed if it causes problems.

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
---
 .../network/can/filter-tests/can_common.h     | 70 +++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 testcases/network/can/filter-tests/can_common.h

diff --git a/testcases/network/can/filter-tests/can_common.h b/testcases/network/can/filter-tests/can_common.h
new file mode 100644
index 000000000..d01694b80
--- /dev/null
+++ b/testcases/network/can/filter-tests/can_common.h
@@ -0,0 +1,70 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2021 SUSE LLC
+ */
+
+#include <stdio.h>
+#include <stdlib.h>
+#include <unistd.h>
+#include <string.h>
+
+#include <sys/types.h>
+#include <sys/socket.h>
+#include <sys/ioctl.h>
+#include <sys/time.h>
+#include <net/if.h>
+
+#include "tst_cmd.h"
+#include "tst_safe_stdio.h"
+#include "tst_safe_file_ops.h"
+
+#include <linux/if.h>
+#include <linux/can.h>
+#include <linux/can/raw.h>
+
+static char *can_dev_name;
+static int can_created_dev;
+
+static void can_cmd(const char *const argv[])
+{
+	tst_cmd(argv, NULL, NULL, TST_CMD_TCONF_ON_MISSING);
+}
+
+#define CAN_CMD(...) can_cmd((const char *const[]){ __VA_ARGS__, NULL })
+
+static void can_setup_vcan(void)
+{
+	unsigned int flags;
+	char *path;
+
+	if (can_dev_name)
+		goto check_echo;
+
+	can_dev_name = "vcan0";
+
+	tst_res(TINFO, "Creating vcan0 device; use -D option to avoid this");
+
+	CAN_CMD("modprobe", "-r", "vcan");
+	CAN_CMD("modprobe", "vcan", "echo=1");
+
+	can_created_dev = 1;
+
+	CAN_CMD("ip", "link", "add", "dev", "vcan0", "type", "vcan");
+	CAN_CMD("ip", "link", "set", "dev", "vcan0", "up");
+
+check_echo:
+	/* Precondition for the frame flow test? */
+	SAFE_ASPRINTF(&path, "/sys/class/net/%s/flags", can_dev_name);
+	if (FILE_SCANF(path, "%x", &flags) || !(flags & IFF_ECHO))
+		tst_res(TWARN, "Could not determine if ECHO is set on vcan0");
+}
+
+static void can_cleanup_vcan(void)
+{
+	if (!can_created_dev)
+		return;
+
+	CAN_CMD("ip", "link", "set", "dev", "vcan0", "down");
+	CAN_CMD("ip", "link", "del", "dev", "vcan0");
+	CAN_CMD("modprobe", "-r", "vcan");
+}
-- 
2.29.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
