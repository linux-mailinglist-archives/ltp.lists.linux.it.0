Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EAA83F5BBD
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Aug 2021 12:11:26 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7BF353C31DA
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Aug 2021 12:11:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 13D053C18F7
 for <ltp@lists.linux.it>; Tue, 24 Aug 2021 12:11:24 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 2BE1E1400BDE
 for <ltp@lists.linux.it>; Tue, 24 Aug 2021 12:11:22 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 7E53A220AD;
 Tue, 24 Aug 2021 10:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1629799882; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=F0fdLSshVVLFuWpdp7gYPst3CQxciAb7JdWVwRWGWFw=;
 b=ctZK9oBFjjqNnXGdcNDEjskjmjoa3xUl+1pUnY+oAnaqbieZ3jJBnwGBbLxGAZDUhFULu1
 uVkcxpBmvsY7gRh0KvsLxTWW2BAgX2N9C+uSi6wjMWCdV/2gvKVpIurNMvoHv1gT15xxji
 NtLVTh5VBOJEvXq+r8Ad/M69jHLsGf8=
Received: from g78.suse.de (unknown [10.163.24.38])
 by relay2.suse.de (Postfix) with ESMTP id 4ABEDA3BC0;
 Tue, 24 Aug 2021 10:11:22 +0000 (UTC)
To: ltp@lists.linux.it
Date: Tue, 24 Aug 2021 11:10:42 +0100
Message-Id: <20210824101042.11772-1-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH] kernel/irq: Add irqbalance01
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

Add first test specifically targeting interrupts and IRQ management.

This includes some comments inline because I think the parsing code is
unavoidably confusing.

Note on the CPU mask parsing; there is already some code for parsing
and manipulating bitmaps in the LTP. However it is absurdly
complicated and we don't need actual bitmaps. In fact an array of
bytes is more flexible.

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
---
 runtest/irq                         |   1 +
 testcases/kernel/irq/.gitignore     |   1 +
 testcases/kernel/irq/Makefile       |   9 +
 testcases/kernel/irq/irqbalance01.c | 288 ++++++++++++++++++++++++++++
 4 files changed, 299 insertions(+)
 create mode 100644 runtest/irq
 create mode 100644 testcases/kernel/irq/.gitignore
 create mode 100644 testcases/kernel/irq/Makefile
 create mode 100644 testcases/kernel/irq/irqbalance01.c

diff --git a/runtest/irq b/runtest/irq
new file mode 100644
index 000000000..56d0d23c8
--- /dev/null
+++ b/runtest/irq
@@ -0,0 +1 @@
+irqbalance01 irqbalance01
diff --git a/testcases/kernel/irq/.gitignore b/testcases/kernel/irq/.gitignore
new file mode 100644
index 000000000..8ed69a99c
--- /dev/null
+++ b/testcases/kernel/irq/.gitignore
@@ -0,0 +1 @@
+irqbalance01
diff --git a/testcases/kernel/irq/Makefile b/testcases/kernel/irq/Makefile
new file mode 100644
index 000000000..085e06fac
--- /dev/null
+++ b/testcases/kernel/irq/Makefile
@@ -0,0 +1,9 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+top_srcdir		?= ../../..
+
+include $(top_srcdir)/include/mk/testcases.mk
+
+INSTALL_TARGETS		:= *.sh
+
+include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/irq/irqbalance01.c b/testcases/kernel/irq/irqbalance01.c
new file mode 100644
index 000000000..0a476839c
--- /dev/null
+++ b/testcases/kernel/irq/irqbalance01.c
@@ -0,0 +1,288 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/* Copyright (c) 2021 SUSE LLC <rpalethorpe@suse.com> */
+/*\
+ * [Description]
+ *
+ * Check that something (e.g. irqbalance daemon) is performing IRQ
+ * load balancing.
+ *
+ * On most systems userland needs to set /proc/irq/$IRQ/smp_affinity
+ * to prevent many IRQs being delivered to the same CPU.
+ *
+ * Note some drivers and IRQ controllers will distribute IRQs
+ * evenly. Some systems will have housekeeping CPUs configured. Some
+ * IRQs can not be masked etc. So this test is not appropriate for all
+ * scenarios.
+ *
+ * Furthermore, exactly how IRQs should be distributed is a
+ * performance and/or security issue. This is only a generic smoke
+ * test. It will hopefully detect misconfigured systems and total
+ * balancing failures which are often silent errors.
+ *
+ * Heuristic: Evidence of Change
+ * 1. Find IRQs with a non-zero count
+ * 2. Check if they are now disallowed
+ *
+ * There are two sources of information we need to parse:
+ * 1. /proc/interrupts
+ * 2. /proc/irq/$IRQ/smp_affinity
+ *
+ * We get the active IRQs and CPUs from /proc/interrupts. It also
+ * contains the per-CPU IRQ counts and info we do not care about.
+ *
+ * We get the IRQ masks from each active IRQ's smp_affinity file. This
+ * is a bitmask written out in hexidecimal format. It shows which CPUs
+ * an IRQ may be recieved by.
+ */
+
+#include <stdlib.h>
+
+#include "tst_test.h"
+#include "tst_safe_stdio.h"
+#include "tst_safe_file_at.h"
+
+enum affinity {
+	ALLOW,
+	DENY,
+};
+
+static unsigned int *irq_stats;
+static enum affinity *irq_affinity;
+
+static unsigned int nr_cpus;
+static unsigned int nr_irqs;
+static unsigned int *irq_ids;
+
+static void collect_irq_info(void)
+{
+	char *buf = NULL, *c, *first_row;
+	char path[PATH_MAX];
+	size_t size = 1024;
+	size_t ret, row, col;
+	long acc;
+	unsigned int cpu_total, mask_pos;
+	int fd = SAFE_OPEN("/proc/interrupts", O_RDONLY);
+
+	nr_cpus = 0;
+	nr_irqs = 0;
+
+	do {
+		size *= 2;
+		buf = SAFE_REALLOC(buf, size);
+		SAFE_LSEEK(fd, SEEK_SET, 0);
+		ret = SAFE_READ(0, fd, buf, size - 1);
+	} while (ret >= size - 1);
+
+	SAFE_CLOSE(fd);
+
+	if (ret < 1)
+		tst_brk(TBROK, "Empty /proc/interrupts?");
+
+	buf[ret] = '\0';
+
+	/* Count CPUs, header columns are like /CPU[0-9]+/ */
+	for (c = buf; *c != '\0' && *c != '\n'; c++) {
+		if (!strncmp(c, "CPU", 3))
+			nr_cpus++;
+	}
+
+	c++;
+	first_row = c;
+	/* Count IRQs, real IRQs start with /[0-9]+:/ */
+	while (*c != '\0') {
+		switch (*c) {
+		case ' ':
+		case '\t':
+		case '\n':
+		case '0' ... '9':
+			c++;
+			break;
+		case ':':
+			nr_irqs++;
+			/* fall-through */
+		default:
+			while (*c != '\n' && *c != '\0')
+				c++;
+		}
+	}
+
+	tst_res(TINFO, "Found %u CPUS, %u IRQs", nr_cpus, nr_irqs);
+
+	irq_ids = SAFE_REALLOC(irq_ids, nr_irqs * sizeof(*irq_ids));
+	irq_stats = SAFE_REALLOC(irq_stats, nr_cpus * (nr_irqs + 1) * sizeof(*irq_stats));
+	irq_affinity = SAFE_REALLOC(irq_affinity, nr_cpus * nr_irqs * sizeof(*irq_affinity));
+
+	c = first_row;
+	acc = -1;
+	row = col = 0;
+	/* Parse columns containing IRQ counts and IRQ IDs into acc. Ignore everything else. */
+	while (*c != '\0') {
+		switch (*c) {
+		case ' ':
+		case '\t':
+			if (acc >= 0) {
+				irq_stats[row * nr_cpus + col] = acc;
+				acc = -1;
+				col++;
+			}
+			break;
+		case '\n':
+			col = 0;
+			row++;
+			break;
+		case '0' ... '9':
+			if (acc == -1)
+				acc = 0;
+
+			acc *= 10;
+			acc += *c - '0';
+			break;
+		case ':':
+			irq_ids[row] = acc;
+			acc = -1;
+			break;
+		default:
+			acc = -1;
+			while (*c != '\n' && *c != '\0')
+				c++;
+			continue;
+		}
+
+		c++;
+	}
+
+	for (col = 0; col < nr_cpus; col++) {
+		cpu_total = 0;
+
+		for (row = 0; row < nr_irqs; row++)
+			cpu_total += irq_stats[row * nr_cpus + col];
+
+		irq_stats[row * nr_cpus + col] = cpu_total;
+	}
+
+	/* Read the CPU affinity masks for each IRQ. See bitmap_string() in the kernel (%*pb) */
+	for (row = 0; row < nr_irqs; row++) {
+		sprintf(path, "/proc/irq/%u/smp_affinity", irq_ids[row]);
+		ret = SAFE_FILE_READAT(0, path, buf, size);
+		if (ret < 1)
+			tst_brk(TBROK, "Empty /proc/irq/%u/smp_affinity?", irq_ids[row]);
+		c = buf;
+		col = 0;
+
+		while (*c != '\0') {
+			switch (*c) {
+			case '\n':
+			case ' ':
+			case ',':
+				c++;
+				continue;
+			case '0' ... '9':
+				acc = *c - '0';
+				break;
+			case 'a' ... 'f':
+				acc = 10 + *c - 'a';
+				break;
+			default:
+				tst_res(TINFO, "%u/smp_affnity: %s", irq_ids[row], buf);
+				tst_brk(TBROK, "Wasn't expecting 0x%02x", *c);
+			}
+
+			for (mask_pos = 0; mask_pos < 4; mask_pos++) {
+				if (mask_pos + col >= nr_cpus)
+					break;
+
+				irq_affinity[row * nr_cpus + (nr_cpus - 1 - col - mask_pos)] =
+					(acc & (8 >> mask_pos)) ? ALLOW : DENY;
+			}
+
+			col += mask_pos;
+			c++;
+		}
+	}
+
+	free(buf);
+}
+
+static void print_irq_info(void)
+{
+	size_t row, col;
+	unsigned int count;
+	enum affinity aff;
+
+	for (row = 0; row < nr_irqs; row++) {
+		printf("%5u:", irq_ids[row]);
+
+		for (col = 0; col < nr_cpus; col++) {
+			count = irq_stats[row * nr_cpus + col];
+			aff = irq_affinity[row * nr_cpus + col] == ALLOW ? '+' : '-';
+
+			printf("%10u%c", count, aff);
+		}
+
+		printf("\n");
+	}
+
+	printf("Total:");
+
+	for (col = 0; col < nr_cpus; col++)
+		printf("%11u", irq_stats[row * nr_cpus + col]);
+
+	printf("\n");
+}
+
+static void evidence_of_change(void)
+{
+	size_t row, col, changed = 0;
+
+	for (row = 0; row < nr_irqs; row++) {
+		for (col = 0; col < nr_cpus; col++) {
+			if (!irq_stats[row * nr_cpus + col])
+				continue;
+
+			if (irq_affinity[row * nr_cpus + col] == ALLOW)
+				continue;
+
+			changed++;
+		}
+	}
+
+	tst_res(changed ? TPASS : TFAIL,
+		"Heuristic: Detected %zu irq-cpu pairs have been dissallowed",
+		changed);
+}
+
+static void setup(void)
+{
+	collect_irq_info();
+	print_irq_info();
+
+	if (nr_cpus < 1)
+		tst_brk(TBROK, "No CPUs found in /proc/interrupts?");
+
+	if (nr_irqs < 1)
+		tst_brk(TBROK, "No IRQs found in /proc/interrupts?");
+}
+
+static void run(void)
+{
+	collect_irq_info();
+
+	evidence_of_change();
+}
+
+static void cleanup(void)
+{
+	if (irq_ids)
+		free(irq_ids);
+	if (irq_stats)
+		free(irq_stats);
+	if (irq_affinity)
+		free(irq_affinity);
+}
+
+static struct tst_test test = {
+	.test_all = run,
+	.setup = setup,
+	.cleanup = cleanup,
+	.min_cpus = 2,
+};
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
