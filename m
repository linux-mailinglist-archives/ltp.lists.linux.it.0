Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F3F483DF8
	for <lists+linux-ltp@lfdr.de>; Tue,  4 Jan 2022 09:20:06 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7B0E43C903B
	for <lists+linux-ltp@lfdr.de>; Tue,  4 Jan 2022 09:20:05 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5433B3C9094
 for <ltp@lists.linux.it>; Tue,  4 Jan 2022 09:18:46 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 85E871A00719
 for <ltp@lists.linux.it>; Tue,  4 Jan 2022 09:18:45 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1F1671F386;
 Tue,  4 Jan 2022 08:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1641284325; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SujbahQi5U4f81g68I3F82NioalhexZTrnRBSl2Epds=;
 b=UN8iH8tnpa6hbGXG0wmJVEUU2/DcKi5ksHP3C9vCxioTazaU1feCLARYBhdk+n1pw06lR/
 pwpRq477FJgmrPIlfQRy3T0a1wksFACtkjKcshFIVPqOw94MCEV6ijFdpfWZL9QlNHJLAP
 m1yZ0XRq1Hm4stImwEbKD146UmZmuL8=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C724413AB9;
 Tue,  4 Jan 2022 08:18:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id yOtfLeQC1GGeZwAAMHmgww
 (envelope-from <andrea.cervesato@suse.com>); Tue, 04 Jan 2022 08:18:44 +0000
To: ltp@lists.linux.it
Date: Tue,  4 Jan 2022 09:18:34 +0100
Message-Id: <20220104081836.22827-9-andrea.cervesato@suse.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220104081836.22827-1-andrea.cervesato@suse.com>
References: <20220104081836.22827-1-andrea.cervesato@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v1 08/10] Add wqueue07 new test
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

This test checks if KEYCTL_SETPERM is recognized by watch queue

Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.com>
---
 testcases/kernel/watchqueue/wqueue07.c | 68 ++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100644 testcases/kernel/watchqueue/wqueue07.c

diff --git a/testcases/kernel/watchqueue/wqueue07.c b/testcases/kernel/watchqueue/wqueue07.c
new file mode 100644
index 000000000..99b3c9e70
--- /dev/null
+++ b/testcases/kernel/watchqueue/wqueue07.c
@@ -0,0 +1,68 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2021 Andrea Cervesato <andrea.cervesato@suse.com>
+ */
+
+/*\
+ * [Description]
+ *
+ * Test if keyctl setperm is correctly recognized by watch queue.
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
+static void saw_key_setattr(struct watch_notification *n, size_t len, unsigned int wtype)
+{
+	if (wqueue_key_event(n, len, wtype, NOTIFY_KEY_SETATTR))
+		tst_res(TPASS, "keyctl setattr has been recognized");
+	else
+		tst_res(TFAIL, "keyctl setattr has not been recognized");
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
+		wqueue_consumer(fd, keep_polling, saw_key_setattr);
+		return;
+	}
+
+	safe_keyctl(KEYCTL_SETPERM, key, KEY_POS_ALL | KEY_USR_ALL);
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
