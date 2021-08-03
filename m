Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 59BE93DE6F6
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Aug 2021 09:05:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0CBFC3C8139
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Aug 2021 09:05:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id EE3733C03FE
 for <ltp@lists.linux.it>; Tue,  3 Aug 2021 09:05:32 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 587A56008C2
 for <ltp@lists.linux.it>; Tue,  3 Aug 2021 09:05:32 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id CE42A20013;
 Tue,  3 Aug 2021 07:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1627974331; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=ddtSODD3pe/nzRCGsgnACtlr76zU17BKFeGB5+kmpvE=;
 b=gSFilp1otJOXUkjP1aUmpOqXfpeiCNMfRUDwuAKlISseD79rOrale9Z3LUBNznon+COKwb
 +Ezu912EXdZXBqV2VXhFL+GuJLzhMwbMOgmhIKN3C13P42ZV7HIZbBqs9kaYms14ZGtXF/
 rDg/zgLDCXy+SKKTrMU8sdLxvs5rk48=
Received: from g78.suse.de (unknown [10.163.24.38])
 by relay2.suse.de (Postfix) with ESMTP id 9064DA3BC9;
 Tue,  3 Aug 2021 07:05:31 +0000 (UTC)
To: ltp@lists.linux.it
Date: Tue,  3 Aug 2021 08:05:20 +0100
Message-Id: <20210803070520.30885-1-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH] Add setsockopt08, CVE-2021-22555
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>, Nicolai Stange <nstange@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

This is a copy and paste of Nicolai's reproducer. The main difference
is that I moved some code around. Of course I also used LTP library
features, but essentially it works the same.

There are some hard coded values which I do not like. I guess these
could be calculated or varied somehow. However I struggle to understand
what the kernel is doing. This perhaps needs more investigation. We
could try generalising this test and setsockopt03.

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
Cc: Nicolai Stange <nstange@suse.de>
---

runtest/cve                                   |   1 +
 runtest/syscalls                              |   1 +
 .../kernel/syscalls/setsockopt/.gitignore     |   1 +
 .../kernel/syscalls/setsockopt/setsockopt08.c | 151 ++++++++++++++++++
 4 files changed, 154 insertions(+)
 create mode 100644 testcases/kernel/syscalls/setsockopt/setsockopt08.c

diff --git a/runtest/cve b/runtest/cve
index 8aa048a40..60bd22f01 100644
--- a/runtest/cve
+++ b/runtest/cve
@@ -65,4 +65,5 @@ cve-2020-14416 pty03
 cve-2020-25705 icmp_rate_limit01
 cve-2020-29373 io_uring02
 cve-2021-3444 bpf_prog05
+cve-2021-22555 setsockopt08 -i 100
 cve-2021-26708 vsock01
diff --git a/runtest/syscalls b/runtest/syscalls
index b379b2d90..2222990fe 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -1378,6 +1378,7 @@ setsockopt04 setsockopt04
 setsockopt05 setsockopt05
 setsockopt06 setsockopt06
 setsockopt07 setsockopt07
+setsockopt08 setsockopt08
 
 settimeofday01 settimeofday01
 settimeofday02 settimeofday02
diff --git a/testcases/kernel/syscalls/setsockopt/.gitignore b/testcases/kernel/syscalls/setsockopt/.gitignore
index 1ca5b836b..95a5e43f8 100644
--- a/testcases/kernel/syscalls/setsockopt/.gitignore
+++ b/testcases/kernel/syscalls/setsockopt/.gitignore
@@ -5,3 +5,4 @@
 /setsockopt05
 /setsockopt06
 /setsockopt07
+/setsockopt08
diff --git a/testcases/kernel/syscalls/setsockopt/setsockopt08.c b/testcases/kernel/syscalls/setsockopt/setsockopt08.c
new file mode 100644
index 000000000..e77e40aa1
--- /dev/null
+++ b/testcases/kernel/syscalls/setsockopt/setsockopt08.c
@@ -0,0 +1,151 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2021 SUSE LLC <rpalethorpe@suse.com>
+ * Based on reproducer by Nicolai Stange based on PoC Andy Nguyen
+ */
+/*\
+ * [Description]
+ *
+ * This will reproduce the bug on x86_64 in 32bit compatability
+ * mode. It is most reliable with KASAN enabled. Otherwise it relies
+ * on the out-of-bounds write corrupting something which leads to a
+ * crash. It will run in other scenarious, but is not a test for the
+ * CVE.
+ *
+ * See https://google.github.io/security-research/pocs/linux/cve-2021-22555/writeup.html
+ *
+ * Also below is Nicolai's detailed description of the bug itself.
+ *
+ * The problem underlying CVE-2021-22555 fixed by upstream commit
+ * b29c457a6511 ("netfilter: x_tables: fix compat match/target pad
+ * out-of-bound write") is that the (now removed) padding zeroing code
+ * in xt_compat_target_from_user() had been based on the premise that
+ * the user specified ->u.user.target_size, which will be considered
+ * for the target buffer allocation size, is greater or equal than
+ * what's needed to fit the corresponding xt_target instance's
+ * ->targetsize: if OTOH the user specified ->u.user.target_size is
+ * too small, then the memset() destination address calculated by
+ * adding ->targetsize to the payload start will not point at, but
+ * into or even past the padding. For the table's last entry's target
+ * record, this will result in an out-of-bounds write past the
+ * destination buffer allocated for the converted table. The code
+ * below will create a (compat) table such that the converted table's
+ * calculated size will fit exactly into a slab size of 1024 bytes and
+ * that the memset() in xt_compat_target_from_user() will write past
+ * this slab.
+ *
+ * The table will consist of
+ *  - the mandatory struct compat_ipt_replace header,
+ *  - a single entry consisting of
+ *    - the mandatory compat_ipt_entry header
+ *    - a single 'state' match entry of appropriate size for
+ *      controlling the out-of-bounds write when converting
+ *      the target entry following next,
+ *    - a single 'REJECT' target entry.
+ * The kernel will transform this into a buffer containing (in
+ * this order)
+ * - a xt_table_info
+ * - a single entry consisting of
+ *   - its ipt_entry header
+ *   - a single 'state' match entry
+ *   - followed by a single 'REJECT' target entry.
+ *
+ * The expected sizes for the 'state' match entries as well as the
+ * 'REJECT' target are the size of the base header struct (32 bytes)
+ * plus the size of an unsigned int (4 bytes) each. In the course of
+ * the compat => non-compat conversion, the kernel will insert four
+ * bytes of padding after the unsigned int payload (c.f.  'off'
+ * adjustments via xt_compat_match_offset() and
+ * xt_compat_target_offset() in xt_compat_match_from_user() and
+ * xt_compat_target_from_user() resp.). This code is based on the
+ * premise that the user sets the given ->u.user.match_size or
+ * ->u.user.target_size consistent to the COMPAT_XT_ALIGN()ed payload
+ * size as specified by the corresponding xt_match instance's
+ * ->matchsize or xt_target instance's ->targetsize. That is, the
+ * padding gets inserted unconditionally during the transformation,
+ * independent of the actual values of ->u.user.match_size or
+ * ->u.user.target_size and the result ends up getting layed out with
+ * proper alignment only if said values match the expectations. That's
+ * not a problem in itself, but this unconditional insertion of
+ * padding must be taken into account in the match_size calculation
+ * below.
+ *
+ * For the match_size calculation below, note that the chosen
+ * target slab size is 1024 and that
+ *  - sizeof(xt_table_info) = 64
+ *  - sizeof(ipt_entry) = 112
+ *  - the kernel will insert four bytes of padding
+ *    after the match and target entries each.
+ *  - sizeof(struct xt_entry_target) = 32
+ */
+
+#include "tst_test.h"
+#include "tst_safe_net.h"
+#include "lapi/ip_tables.h"
+#include "lapi/namespaces_constants.h"
+
+static void *buffer;
+
+void setup(void)
+{
+	SAFE_UNSHARE(CLONE_NEWUSER);
+	SAFE_UNSHARE(CLONE_NEWNET);
+}
+
+void run(void)
+{
+	struct ipt_replace *ipt_replace = buffer;
+	struct ipt_entry *ipt_entry = &ipt_replace->entries[0];
+	struct xt_entry_match *xt_entry_match =
+		(struct xt_entry_match *)&ipt_entry->elems[0];
+	const size_t tgt_size = 32;
+	const size_t match_size = 1024 - 64 - 112 - 4 - tgt_size - 4;
+	struct xt_entry_target *xt_entry_tgt =
+		((struct xt_entry_target *) (&ipt_entry->elems[0] + match_size));
+	int fd = SAFE_SOCKET(AF_INET, SOCK_DGRAM, 0);
+
+	xt_entry_match->u.user.match_size = (u_int16_t)match_size;
+	strcpy(xt_entry_match->u.user.name, "state");
+
+	xt_entry_tgt->u.user.target_size = (u_int16_t)tgt_size;
+	strcpy(xt_entry_tgt->u.user.name, "REJECT");
+
+	ipt_entry->target_offset =
+		(__builtin_offsetof(struct ipt_entry, elems) + match_size);
+	ipt_entry->next_offset = ipt_entry->target_offset + tgt_size;
+
+	strcpy(ipt_replace->name, "filter");
+	ipt_replace->num_entries = 1;
+	ipt_replace->num_counters = 1;
+	ipt_replace->size = ipt_entry->next_offset;
+
+	TST_EXP_FAIL(setsockopt(fd, IPPROTO_IP, IPT_SO_SET_REPLACE, buffer, 1),
+		     0,
+		     "setsockopt(%d, IPPROTO_IP, IPT_SO_SET_REPLACE, %p, 1)",
+		     fd, buffer);
+
+	SAFE_CLOSE(fd);
+}
+
+static struct tst_test test = {
+	.setup = setup,
+	.test_all = run,
+	.taint_check = TST_TAINT_W | TST_TAINT_D,
+	.forks_child = 1,
+	.bufs = (struct tst_buffers []) {
+		{&buffer, .size = 2048},
+		{},
+	},
+	.needs_kconfigs = (const char *[]) {
+		"CONFIG_NETFILTER_XT_MATCH_STATE",
+		"CONFIG_IP_NF_TARGET_REJECT",
+		"CONFIG_USER_NS=y",
+		"CONFIG_NET_NS=y",
+		NULL
+	},
+	.tags = (const struct tst_tag[]) {
+		{"linux-git", "b29c457a6511"},
+		{"CVE", "2021-22555"},
+		{}
+	}
+};
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
