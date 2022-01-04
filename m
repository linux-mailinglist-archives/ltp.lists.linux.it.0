Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B03483DEF
	for <lists+linux-ltp@lfdr.de>; Tue,  4 Jan 2022 09:19:13 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 96F763C90A4
	for <lists+linux-ltp@lfdr.de>; Tue,  4 Jan 2022 09:19:13 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B18613C8FEA
 for <ltp@lists.linux.it>; Tue,  4 Jan 2022 09:18:43 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 499766008B0
 for <ltp@lists.linux.it>; Tue,  4 Jan 2022 09:18:43 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DB001212B5;
 Tue,  4 Jan 2022 08:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1641284322; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+Xp/U+p5YEnOlW3tVuRiATh5dbt9VQjN6PGGUUSh7OI=;
 b=XM1Wx6bInxR0HIssEE4l++aHdUi5/+YF+hYRx8jIiTiUhIBk0d0QuIE5iTtrYOVNtNgUbJ
 J71q9urfSIetqDuyiNTZ9+J7/V++wqNh3aV7t9psfry1W1wgOoVHIdH06WYGF8Tc44mZtS
 fy1M4un4a2F+qEtN6eY4lefJ8t2iZ04=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8CA0113AB9;
 Tue,  4 Jan 2022 08:18:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id EEW+HuIC1GGeZwAAMHmgww
 (envelope-from <andrea.cervesato@suse.com>); Tue, 04 Jan 2022 08:18:42 +0000
To: ltp@lists.linux.it
Date: Tue,  4 Jan 2022 09:18:29 +0100
Message-Id: <20220104081836.22827-4-andrea.cervesato@suse.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220104081836.22827-1-andrea.cervesato@suse.com>
References: <20220104081836.22827-1-andrea.cervesato@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v1 03/10] Add wqueue02 new test
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
From: Andrea Cervesato via ltp <ltp@lists.linux.it>
Reply-To: Andrea Cervesato <andrea.cervesato@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

This test checks if KEYCTL_UNLINK is recognized by watch queue

Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.com>
---
 testcases/kernel/watchqueue/wqueue02.c | 68 ++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100644 testcases/kernel/watchqueue/wqueue02.c

diff --git a/testcases/kernel/watchqueue/wqueue02.c b/testcases/kernel/watchqueue/wqueue02.c
new file mode 100644
index 000000000..2efefe90a
--- /dev/null
+++ b/testcases/kernel/watchqueue/wqueue02.c
@@ -0,0 +1,68 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2021 Andrea Cervesato <andrea.cervesato@suse.com>
+ */
+
+/*\
+ * [Description]
+ *
+ * Test if keyctl unlink is correctly recognized by watch queue.
+ */
+
+#define _FCNTL_H
+
+#include "tst_test.h"
+#include "lapi/keyctl.h"
+#include "common.h"
+
+static int *keep_polling;
+
+static void saw_key_unlinked(struct watch_notification *n, size_t len, unsigned int wtype)
+{
+	if (wqueue_key_event(n, len, wtype, NOTIFY_KEY_UNLINKED))
+		tst_res(TPASS, "keyctl unlink has been recognized");
+	else
+		tst_res(TFAIL, "keyctl unlink has not been recognized");
+}
+
+static void setup(void)
+{
+	keep_polling = SAFE_MMAP(NULL, sizeof(int), PROT_READ | PROT_WRITE, MAP_SHARED | MAP_ANONYMOUS, -1, 0);
+}
+
+static void cleanup(void)
+{
+	*keep_polling = 0;
+	SAFE_MUNMAP(keep_polling, sizeof(int));
+}
+
+static void run(void)
+{
+	int fd;
+	int pid;
+	key_serial_t key;
+
+	fd = wqueue_watch(256, &wqueue_key_filter);
+	key = wqueue_add_key(fd);
+
+	*keep_polling = 1;
+
+	pid = SAFE_FORK();
+	if (pid > 0) {
+		wqueue_consumer(fd, keep_polling, saw_key_unlinked);
+		return;
+	}
+
+	safe_keyctl(KEYCTL_UNLINK, key, KEY_SPEC_SESSION_KEYRING);
+
+	*keep_polling = 0;
+
+	SAFE_CLOSE(fd);
+}
+
+static struct tst_test test = {
+	.setup = setup,
+	.cleanup = cleanup,
+	.test_all = run,
+	.forks_child = 1
+};
-- 
2.34.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
