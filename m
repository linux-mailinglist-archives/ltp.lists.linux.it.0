Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4037548760A
	for <lists+linux-ltp@lfdr.de>; Fri,  7 Jan 2022 11:59:52 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0A7413C879E
	for <lists+linux-ltp@lfdr.de>; Fri,  7 Jan 2022 11:59:51 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 792303C719A
 for <ltp@lists.linux.it>; Fri,  7 Jan 2022 11:59:18 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id E274A10009F4
 for <ltp@lists.linux.it>; Fri,  7 Jan 2022 11:59:17 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7C38B1F3A3;
 Fri,  7 Jan 2022 10:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1641553157; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6kMzWG/p3djDPTf7bQP12qodgVDgwP6uGy8E/02IKx8=;
 b=OPQs1wv5VvDfyEtZtNqfRMcnsyLVhzsR+dPR9KUQ4uMFpIAvIvDP3niWQFOOaU/ZnrgR5F
 ov9EtG62hR+8IRcg6MVbdJmtBiFeioDqoGWQKDf2RhW6YQJLpnsSLeqinsNKqlFxa4NoEO
 pFMXOUjuKLrOmE3xFz0UF/vX6jZkXzs=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5358A13CCC;
 Fri,  7 Jan 2022 10:59:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 0LFIEgUd2GExFwAAMHmgww
 (envelope-from <andrea.cervesato@suse.com>); Fri, 07 Jan 2022 10:59:17 +0000
To: ltp@lists.linux.it
Date: Fri,  7 Jan 2022 11:59:07 +0100
Message-Id: <20220107105913.29036-5-andrea.cervesato@suse.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220107105913.29036-1-andrea.cervesato@suse.com>
References: <20220107105913.29036-1-andrea.cervesato@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v2 04/10] Add wqueue03 test
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

This test is testing NOTIFY_KEY_REVOKED event

Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.com>
---
 runtest/watchqueue                     |  1 +
 testcases/kernel/watchqueue/.gitignore |  1 +
 testcases/kernel/watchqueue/wqueue03.c | 41 ++++++++++++++++++++++++++
 3 files changed, 43 insertions(+)
 create mode 100644 testcases/kernel/watchqueue/wqueue03.c

diff --git a/runtest/watchqueue b/runtest/watchqueue
index 0d442ff01..0606db1e0 100644
--- a/runtest/watchqueue
+++ b/runtest/watchqueue
@@ -1,2 +1,3 @@
 wqueue01 wqueue01
 wqueue02 wqueue02
+wqueue03 wqueue03
diff --git a/testcases/kernel/watchqueue/.gitignore b/testcases/kernel/watchqueue/.gitignore
index 4f8695201..36a7473d8 100644
--- a/testcases/kernel/watchqueue/.gitignore
+++ b/testcases/kernel/watchqueue/.gitignore
@@ -1,2 +1,3 @@
 wqueue01
 wqueue02
+wqueue03
diff --git a/testcases/kernel/watchqueue/wqueue03.c b/testcases/kernel/watchqueue/wqueue03.c
new file mode 100644
index 000000000..c60286c5c
--- /dev/null
+++ b/testcases/kernel/watchqueue/wqueue03.c
@@ -0,0 +1,41 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2021 SUSE LLC Andrea Cervesato <andrea.cervesato@suse.com>
+ */
+
+/*\
+ * [Description]
+ *
+ * Test if keyctl revoke is correctly recognized by watch queue.
+ */
+
+#include "tst_test.h"
+#include "lapi/keyctl.h"
+#include "common.h"
+
+static void saw_key_revoked(struct watch_notification *n, size_t len, unsigned int wtype)
+{
+	if (wqueue_key_event(n, len, wtype, NOTIFY_KEY_REVOKED))
+		tst_res(TPASS, "keyctl revoke has been recognized");
+	else
+		tst_res(TFAIL, "keyctl revoke has not been recognized");
+}
+
+static void run(void)
+{
+	int fd;
+	key_serial_t key;
+
+	fd = wqueue_watch(256, &wqueue_filter);
+	key = wqueue_add_key(fd);
+
+	keyctl(KEYCTL_REVOKE, key);
+	wqueue_consumer(fd, saw_key_revoked);
+
+	SAFE_CLOSE(fd);
+}
+
+static struct tst_test test = {
+	.test_all = run,
+	.needs_root = 1,
+};
-- 
2.34.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
