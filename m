Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 513CA8C74C2
	for <lists+linux-ltp@lfdr.de>; Thu, 16 May 2024 12:43:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0FA4D3CFA6A
	for <lists+linux-ltp@lfdr.de>; Thu, 16 May 2024 12:43:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B899A3CFA6B
 for <ltp@lists.linux.it>; Thu, 16 May 2024 12:42:34 +0200 (CEST)
Authentication-Results: in-7.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=2a07:de40:b251:101:10:150:64:1; helo=smtp-out1.suse.de;
 envelope-from=andrea.cervesato@suse.de; receiver=lists.linux.it)
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 3B551200BB7
 for <ltp@lists.linux.it>; Thu, 16 May 2024 12:42:34 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DB388347C3;
 Thu, 16 May 2024 10:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1715856152; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/Sduz6UrFj+8hawv2qrNVKlEIVirWdk2qziGH3mrTTw=;
 b=n3cNoRM+To9K+a4Q9AEBkrCfXj5RjMy0hQ6i4axxpcRtG57oD9gedIAQo/f3gw4TmXv1gq
 NHfCyg1gc4i8fQ37//nzKWlqi+/f6tvLmv8eGxIY1dxa9N9jNoE9zp0H9Wneu8UDnGgFVY
 263TthMn9a4MEuV7yZEHeofjpV9sBwk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1715856152;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/Sduz6UrFj+8hawv2qrNVKlEIVirWdk2qziGH3mrTTw=;
 b=Udfm2vHk1aE/DIUOnKQ0ra3OQsZIS86p5jBWWZ2A4l+7IdMafVQUy+cMUpmJwE/A9Emsu1
 Voi+klHFzfHH5rBA==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=n3cNoRM+;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Udfm2vHk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1715856152; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/Sduz6UrFj+8hawv2qrNVKlEIVirWdk2qziGH3mrTTw=;
 b=n3cNoRM+To9K+a4Q9AEBkrCfXj5RjMy0hQ6i4axxpcRtG57oD9gedIAQo/f3gw4TmXv1gq
 NHfCyg1gc4i8fQ37//nzKWlqi+/f6tvLmv8eGxIY1dxa9N9jNoE9zp0H9Wneu8UDnGgFVY
 263TthMn9a4MEuV7yZEHeofjpV9sBwk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1715856152;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/Sduz6UrFj+8hawv2qrNVKlEIVirWdk2qziGH3mrTTw=;
 b=Udfm2vHk1aE/DIUOnKQ0ra3OQsZIS86p5jBWWZ2A4l+7IdMafVQUy+cMUpmJwE/A9Emsu1
 Voi+klHFzfHH5rBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BC72213A6A;
 Thu, 16 May 2024 10:42:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id uBnALBjjRWbwGQAAD6G6ig
 (envelope-from <andrea.cervesato@suse.de>); Thu, 16 May 2024 10:42:32 +0000
From: Andrea Cervesato <andrea.cervesato@suse.de>
To: ltp@lists.linux.it
Date: Thu, 16 May 2024 12:42:26 +0200
Message-Id: <20240516104227.25381-3-andrea.cervesato@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240516104227.25381-1-andrea.cervesato@suse.de>
References: <20240516104227.25381-1-andrea.cervesato@suse.de>
MIME-Version: 1.0
X-Spam-Score: -5.01
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: DB388347C3
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-5.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 DWL_DNSWL_MED(-2.00)[suse.de:dkim]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 FUZZY_BLOCKED(0.00)[rspamd.com]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+]; FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 RCPT_COUNT_TWO(0.00)[2];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCVD_COUNT_TWO(0.00)[2]; RCVD_TLS_ALL(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,
 imap1.dmz-prg2.suse.org:rdns, suse.de:dkim]
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v1 2/3] Add cachestat01 and cachestat01A tests
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

From: Andrea Cervesato <andrea.cervesato@suse.com>

This test verifies that cachestat() syscall is properly counting
cached pages written inside a file. If storage device synchronization
is requested, test will check if the number of dirty pages is zero.

The cachestat01 covers the first scenario and cachestat01A covers the
second one.

Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.com>
---
 runtest/syscalls                              |   3 +
 .../kernel/syscalls/cachestat/.gitignore      |   1 +
 testcases/kernel/syscalls/cachestat/Makefile  |  10 ++
 .../kernel/syscalls/cachestat/cachestat.h     |  27 +++++
 .../kernel/syscalls/cachestat/cachestat01.c   | 102 ++++++++++++++++++
 5 files changed, 143 insertions(+)
 create mode 100644 testcases/kernel/syscalls/cachestat/.gitignore
 create mode 100644 testcases/kernel/syscalls/cachestat/Makefile
 create mode 100644 testcases/kernel/syscalls/cachestat/cachestat.h
 create mode 100644 testcases/kernel/syscalls/cachestat/cachestat01.c

diff --git a/runtest/syscalls b/runtest/syscalls
index cf06ee563..961775cf7 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -62,6 +62,9 @@ capset04 capset04
 
 cacheflush01 cacheflush01
 
+cachestat01 cachestat01
+cachestat01A cachestat01 -s
+
 chdir01 chdir01
 chdir01A symlink01 -T chdir01
 chdir04 chdir04
diff --git a/testcases/kernel/syscalls/cachestat/.gitignore b/testcases/kernel/syscalls/cachestat/.gitignore
new file mode 100644
index 000000000..daea1f4be
--- /dev/null
+++ b/testcases/kernel/syscalls/cachestat/.gitignore
@@ -0,0 +1 @@
+cachestat01
diff --git a/testcases/kernel/syscalls/cachestat/Makefile b/testcases/kernel/syscalls/cachestat/Makefile
new file mode 100644
index 000000000..62b00d2f4
--- /dev/null
+++ b/testcases/kernel/syscalls/cachestat/Makefile
@@ -0,0 +1,10 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# Copyright (C) 2024 SUSE LLC Andrea Cervesato <andrea.cervesato@suse.com>
+
+top_srcdir		?= ../../../..
+
+include $(top_srcdir)/include/mk/testcases.mk
+
+LDLIBS += -lrt
+
+include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/cachestat/cachestat.h b/testcases/kernel/syscalls/cachestat/cachestat.h
new file mode 100644
index 000000000..efce6dc7f
--- /dev/null
+++ b/testcases/kernel/syscalls/cachestat/cachestat.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (C) 2024 SUSE LLC Andrea Cervesato <andrea.cervesato@suse.com>
+ */
+
+#ifndef CACHESTAT_H__
+#define CACHESTAT_H__
+
+#include "tst_test.h"
+#include "lapi/mman.h"
+
+static inline void print_cachestat(struct cachestat *cs)
+{
+	tst_res(TDEBUG,
+		"nr_cache=%lu "
+		"nr_dirty=%lu "
+		"nr_writeback=%lu "
+		"nr_evicted=%lu "
+		"nr_recently_evicted=%lu",
+		cs->nr_cache,
+		cs->nr_dirty,
+		cs->nr_writeback,
+		cs->nr_evicted,
+		cs->nr_recently_evicted);
+}
+
+#endif
diff --git a/testcases/kernel/syscalls/cachestat/cachestat01.c b/testcases/kernel/syscalls/cachestat/cachestat01.c
new file mode 100644
index 000000000..7362a9dcf
--- /dev/null
+++ b/testcases/kernel/syscalls/cachestat/cachestat01.c
@@ -0,0 +1,102 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2024 SUSE LLC Andrea Cervesato <andrea.cervesato@suse.com>
+ */
+
+/*\
+ * [Description]
+ *
+ * This test verifies that cachestat() syscall is properly counting cached pages
+ * written inside a file. If storage device synchronization is requested, test
+ * will check if the number of dirty pages is zero.
+ *
+ * [Algorithm]
+ *
+ * * create a file with specific amount of pages
+ * ** synchronize storage device, if needed
+ * * monitor file with cachestat()
+ * * check if the right amount of pages have been moved into cache
+ * ** if storage device synchronization is requested, check that dirty pages is
+ *    zero
+ */
+
+#include "cachestat.h"
+
+#define MNTPOINT "mntpoint"
+#define FILENAME MNTPOINT "/myfile.bin"
+#define NUMPAGES 32
+
+static char *data;
+static int file_size;
+static struct cachestat *cs;
+static struct cachestat_range *cs_range;
+static char *run_fsync;
+
+static void run(void)
+{
+	int fd;
+
+	memset(cs, 0, sizeof(struct cachestat));
+
+	fd = SAFE_OPEN(FILENAME, O_RDWR | O_CREAT, 0600);
+	SAFE_WRITE(0, fd, data, file_size);
+
+	if (run_fsync)
+		fsync(fd);
+
+	TST_EXP_PASS(cachestat(fd, cs_range, cs, 0));
+	print_cachestat(cs);
+
+	TST_EXP_EQ_LI(cs->nr_cache + cs->nr_evicted, NUMPAGES);
+
+	if (run_fsync)
+		TST_EXP_EQ_LI(cs->nr_dirty, 0);
+
+	SAFE_CLOSE(fd);
+	SAFE_UNLINK(FILENAME);
+}
+
+static void setup(void)
+{
+	int page_size;
+
+	page_size = (int)sysconf(_SC_PAGESIZE);
+	file_size = page_size * NUMPAGES;
+
+	data = SAFE_MALLOC(file_size);
+	memset(data, 'a', file_size);
+
+	cs_range->off = 0;
+	cs_range->len = file_size;
+}
+
+static void cleanup(void)
+{
+	if (data)
+		free(data);
+}
+
+static struct tst_test test = {
+	.test_all = run,
+	.setup = setup,
+	.cleanup = cleanup,
+	.needs_tmpdir = 1,
+	.min_kver = "6.5",
+	.mount_device = 1,
+	.mntpoint = MNTPOINT,
+	.all_filesystems = 1,
+	.skip_filesystems = (const char *const []) {
+		"fuse",
+		"tmpfs",
+		NULL
+	},
+	.bufs = (struct tst_buffers []) {
+		{&cs, .size = sizeof(struct cachestat)},
+		{&cs_range, .size = sizeof(struct cachestat_range)},
+		{}
+	},
+	.options = (struct tst_option[]) {
+		{"s", &run_fsync, "Synchronize file with storage device"},
+		{},
+	},
+};
-- 
2.35.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
