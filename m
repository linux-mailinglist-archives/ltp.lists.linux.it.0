Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iEnBCAnpp2mDlgAAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Wed, 04 Mar 2026 09:10:49 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B60D71FC45F
	for <lists+linux-ltp@lfdr.de>; Wed, 04 Mar 2026 09:10:48 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5111B3DAEFA
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Mar 2026 09:10:48 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 063B63DAC05
 for <ltp@lists.linux.it>; Wed,  4 Mar 2026 09:10:34 +0100 (CET)
Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 21499600948
 for <ltp@lists.linux.it>; Wed,  4 Mar 2026 09:10:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
 s=onoh2408; t=1772611829;
 bh=OjShRm+mjLFX/+KfMnYIT3JeWUHJaF6MBNeImrwLwoM=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=MhRwL13KPpNkO6Jqhyl/cbt2Rvam2NvDnLaxRTrSiScu1r8R6eWdAAjYwu5y6Ef35
 yDbbAIFtVY16COP9+C/l5VBsb6XvTx8J7dqsJ6QxaEU6CKpf9RYJIniSoTd5USGDLs
 CBaGPRUKBauXbuXC4x++pizVAyNso9ZO95PXpPTY=
X-QQ-mid: esmtpgz14t1772611824tca04cdf3
X-QQ-Originating-IP: xpw1vv5fziCV0li3vXMQDsMjm3jUqcbGfQibwASBVdQ=
Received: from localhost.localdomain ( [1.85.7.34])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Wed, 04 Mar 2026 16:10:19 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14182512658488720613
EX-QQ-RecipientCnt: 2
From: lufei <lufei@uniontech.com>
To: ltp@lists.linux.it
Date: Wed,  4 Mar 2026 16:05:39 +0800
Message-Id: <20260304080538.1793-2-lufei@uniontech.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20260304080538.1793-1-lufei@uniontech.com>
References: <20260304080538.1793-1-lufei@uniontech.com>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz3a-1
X-QQ-XMAILINFO: Mo8Zw3vvjMZ9GrJBn+qD+wPk13+dpaEad+O5HXULR0gmndP+7u1J8d15
 echiJpHaly+Z+1A+Do/7zKRBJTTlDGq0IltLeAThnDu1SivJp7bEtDzCx3TfZ2ZJbEYi8YM
 FB5jZifatr5BCzaVaJ6MeGTXh12XD0tUe/Kifgh1X5JPsrwwcpPjqiZ/mbUurLdbb4lbPQ7
 ubhQdepjqOehFqkoNyzl8gT/lheY4RJrx0vQcdOmxiaAyUneBIOjhS5NlHMSbIe0Y7BROyo
 5Kk+sJDeK0Sbr9V3yk/q6I+MrC5rcKLlPviJs20eAWHGdZJDXJHopnJulaXF63PwD6hO7Gq
 XtiLtktVmZ3V9qTzHAmU68i7uO+Lq1zT2kSfl+v3BYgf+ctNLknTSagt9wTvP8wwk25ACDp
 /Fnr4misQRhtTAKRt66mNk5JXEcsoT0EfCcJ8wxhbmBXJQ4uIdKQKAcSy3O/DhYR0I1miqn
 j9yWQCL/UKEuWElm1Pult7rZxih+hojXFXvzLwFTZiLAilB8aGTINW9Is2Cbk1b8W3FpoT0
 E8SMA7asDf1K/I7CUnXpLU9Yi+C2iBYsTdOKnlbpCc/Q275rbT/5FIt5lsHNSlsiqxhvW2k
 pfHOViTUM5CJAnn570cdvAbJbyiIYNlwYOjndL3gxYRHWDOeaE2uwUdxPdDETISyqoHj0e8
 /a2DFd+jaWDTzV/oYEbEY5xVrtw9T+WxZ4MPcNs0yFEBWTATep411ZcsTTWm15LNtS+cwLv
 ShqvNL7npZDfLGNhkK60bsCrSjLJDdStOjYfQwYuyX6Z1RTyP3Ku06q2Lp2DOCC5ybhKegf
 XKOwIQ+bov203W+nZpnH3G5rRnfYQu+kfEpqdeobjBTYPfFZSLtcFclwEcl3wAfpCDgElHT
 KxQ9S4ZLW/tCd1QcW+AQYRDl5lYVjv1MfK/MiO4Jn6micQPSmzHsG6+eYUY3DXROnvAppGy
 JwMqMfVURnLJSggQPv/L7PQVnw8C+QdSWvv0TdLAY//4iA9E5A7uTpZYasVJgUcPXuEuIXG
 AGq3TU93oefjZ7sY66/CgzVPEjJwFrN8bXQFYw+0zDtE/ipgnO
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH 2/2] Rewrite ftrace_regression02.sh with new C API
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
Cc: lufei <lufei@uniontech.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Rspamd-Queue-Id: B60D71FC45F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.59 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[uniontech.com:s=onoh2408];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+a:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[uniontech.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_RCPT(0.00)[linux-ltp];
	NEURAL_HAM(-0.00)[-0.665];
	ASN(0.00)[asn:12779, ipnet:213.254.0.0/19, country:IT];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.it:url,uniontech.com:mid,uniontech.com:email,picard.linux.it:rdns,picard.linux.it:helo];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[lufei@uniontech.com,ltp-bounces@lists.linux.it];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	DKIM_TRACE(0.00)[uniontech.com:-]
X-Rspamd-Action: no action

This test is for checking signal:signal_generate gives 2 more fields:
grp res.

Signed-off-by: lufei <lufei@uniontech.com>
---
 .../tracing/ftrace_test/ftrace_regression02.c | 73 +++++++++++++++++++
 1 file changed, 73 insertions(+)
 create mode 100644 testcases/kernel/tracing/ftrace_test/ftrace_regression02.c

diff --git a/testcases/kernel/tracing/ftrace_test/ftrace_regression02.c b/testcases/kernel/tracing/ftrace_test/ftrace_regression02.c
new file mode 100644
index 000000000..aa3500090
--- /dev/null
+++ b/testcases/kernel/tracing/ftrace_test/ftrace_regression02.c
@@ -0,0 +1,73 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2015 Red Hat Inc.
+ * Copyright (c) 2026 lufei <lufei@uniontech.com>
+ */
+
+/*\
+ *
+ * Check signal:signal_generate gives 2 more fields: grp res
+ *
+ */
+
+#include <unistd.h>
+#include <stdio.h>
+#include "ftrace_regression.h"
+
+#define DEBUGFS_DIR "debugfs"
+#define SET_EVENT DEBUGFS_DIR "/tracing/set_event"
+#define TRACING_ON DEBUGFS_DIR "/tracing/tracing_on"
+#define TRACE_FILE DEBUGFS_DIR "/tracing/trace"
+
+#define LOOP 100
+
+static void setup(void)
+{
+	SAFE_MKDIR(DEBUGFS_DIR, 0755);
+	SAFE_MOUNT(NULL, DEBUGFS_DIR, "debugfs", 0, NULL);
+}
+
+static void run(void)
+{
+	int i;
+
+	SAFE_FILE_PRINTF(SET_EVENT, "signal:signal_generate");
+	SAFE_FILE_PRINTF(TRACING_ON, "1");
+	SAFE_FILE_PRINTF(TRACE_FILE, "\n");
+
+	for (i = 0; i < LOOP; i++)
+		tst_cmd((const char *[]){"ls", "-l", "/proc", NULL},
+			"/dev/null", "/dev/null", 0);
+
+	if (file_contains(TRACE_FILE, "grp=") && file_contains(TRACE_FILE, "res="))
+		tst_res(TPASS, "Finished running the test");
+	else
+		tst_res(TFAIL, "Pattern grp=[0-9] res=[0-9] not found in trace");
+}
+
+static void cleanup(void)
+{
+	SAFE_UMOUNT(DEBUGFS_DIR);
+}
+
+static struct tst_test test = {
+	.needs_root = 1,
+	.needs_tmpdir = 1,
+	.setup = setup,
+	.test_all = run,
+	.cleanup = cleanup,
+	.needs_cmds = (struct tst_cmd[]) {
+		{.cmd = "ls"},
+		{}
+	},
+	.save_restore = (const struct tst_path_val[]) {
+		{"/proc/sys/kernel/stack_tracer_enabled", NULL, TST_SR_TCONF},
+		{}
+	},
+	.tags = (const struct tst_tag[]) {
+		{"linux-git", "6c303d3"},
+		{"linux-git", "163566f"},
+		{}
+	},
+};
+
-- 
2.39.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
