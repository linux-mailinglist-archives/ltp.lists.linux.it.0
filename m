Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5403BE37A
	for <lists+linux-ltp@lfdr.de>; Wed,  7 Jul 2021 09:18:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6D81D3C6878
	for <lists+linux-ltp@lfdr.de>; Wed,  7 Jul 2021 09:18:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 982A13C678C
 for <ltp@lists.linux.it>; Wed,  7 Jul 2021 09:18:51 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 7D6A51401164
 for <ltp@lists.linux.it>; Wed,  7 Jul 2021 09:18:50 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 9E7DE22576;
 Wed,  7 Jul 2021 07:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1625642329; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=hHVrQrJ6y9Nr6RsEr1jhvp6ns54N4Iy2UOfuGPfoG9o=;
 b=UUJBlDukstdcJwADeOpbIFlQoTifhAV1wGVLzOCqYCpled9CPXVk8QM2KzgXFrZnaqGET7
 GQEQaluQmQfTJ1Cud2Groot8S4kwhOz6xLQILybADuknejMkcZ8jQUhh9Q6xhhY5ypPj7Z
 E9mcUGT1rmBubRP62nIOn/+ey1xxRHs=
Received: from g78.suse.de (unknown [10.163.24.38])
 by relay2.suse.de (Postfix) with ESMTP id 6EDD6A3B8A;
 Wed,  7 Jul 2021 07:18:49 +0000 (UTC)
To: ltp@lists.linux.it
Date: Wed,  7 Jul 2021 08:18:38 +0100
Message-Id: <20210707071838.27834-1-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH] kill13, CVE-2018-10124: Reproduce INT_MIN negation
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
---
 runtest/cve                               |  1 +
 runtest/syscalls                          |  1 +
 testcases/kernel/syscalls/kill/.gitignore |  1 +
 testcases/kernel/syscalls/kill/kill13.c   | 35 +++++++++++++++++++++++
 4 files changed, 38 insertions(+)
 create mode 100644 testcases/kernel/syscalls/kill/kill13.c

diff --git a/runtest/cve b/runtest/cve
index 5a6ef966d..226b5ea44 100644
--- a/runtest/cve
+++ b/runtest/cve
@@ -49,6 +49,7 @@ cve-2018-5803 sctp_big_chunk
 cve-2018-7566 snd_seq01
 cve-2018-8897 ptrace09
 cve-2018-9568 connect02
+cve-2018-10124 kill13
 cve-2018-1000001 realpath01
 cve-2018-1000199 ptrace08
 cve-2018-1000204 ioctl_sg01
diff --git a/runtest/syscalls b/runtest/syscalls
index 98fe3c02e..0c1e16f9e 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -644,6 +644,7 @@ kill09 kill09
 kill10 kill10
 kill11 kill11
 kill12 kill12
+kill13 kill13
 
 lchown01 lchown01
 lchown01_16 lchown01_16
diff --git a/testcases/kernel/syscalls/kill/.gitignore b/testcases/kernel/syscalls/kill/.gitignore
index 75fdaa561..810ed0200 100644
--- a/testcases/kernel/syscalls/kill/.gitignore
+++ b/testcases/kernel/syscalls/kill/.gitignore
@@ -8,3 +8,4 @@
 /kill10
 /kill11
 /kill12
+/kill13
diff --git a/testcases/kernel/syscalls/kill/kill13.c b/testcases/kernel/syscalls/kill/kill13.c
new file mode 100644
index 000000000..b5afb653f
--- /dev/null
+++ b/testcases/kernel/syscalls/kill/kill13.c
@@ -0,0 +1,35 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2021 SUSE LLC <rpalethorpe@suse.com>
+ */
+
+/*\
+ * [Description]
+ *
+ * Reproducer of CVE-2018-10124; INT_MIN negation.
+ *
+ * Most likely this test will always pass without UBSAN
+ * enabled. Perhaps unless negating INT_MIN results in -1 or
+ * 0. However on my computer it just results in INT_MIN.
+ *
+ */
+
+#include <limits.h>
+#include <signal.h>
+#include "tst_test.h"
+
+static void run(void)
+{
+	TST_EXP_FAIL2(kill(INT_MIN, 1000), ESRCH,
+		      "kill(INT_MIN, ...) fails with ESRCH");
+}
+
+static struct tst_test test = {
+	.test_all = run,
+	.taint_check = TST_TAINT_W | TST_TAINT_D,
+	.tags = (const struct tst_tag[]) {
+		{"linux-git", "4ea77014af0d"},
+		{"CVE", "CVE-2018-10124"},
+		{}
+	}
+};
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
