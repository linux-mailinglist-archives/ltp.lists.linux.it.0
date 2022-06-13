Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C2664548549
	for <lists+linux-ltp@lfdr.de>; Mon, 13 Jun 2022 14:49:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 184103C9410
	for <lists+linux-ltp@lfdr.de>; Mon, 13 Jun 2022 14:49:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 494A53C80B0
 for <ltp@lists.linux.it>; Mon, 13 Jun 2022 14:49:48 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 22AA510007F3
 for <ltp@lists.linux.it>; Mon, 13 Jun 2022 14:49:47 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id EC3091F38A
 for <ltp@lists.linux.it>; Mon, 13 Jun 2022 12:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1655124586; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=lGs0AckwlhR1B4ZZ/FJMRJRzObcgsHQud0vDMeL6eNY=;
 b=oIHl8Ln8bAGKPT5Hs8csnSeflutaXln3/VADQb6I1CxLGU13InkHdZ4QLbKJzpw55Eo/jS
 9omYSc5ywPn+Rbf/LiHtrLOZkRf1kp2iAeyOwopmU+6riCV/+fIQ5RU63gWEqYjdTCrLfQ
 nsX5V9wxhixkd4qUpXh4V82e4Tfjl20=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1655124586;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=lGs0AckwlhR1B4ZZ/FJMRJRzObcgsHQud0vDMeL6eNY=;
 b=su4nsqPy5MDj0Bbmf9Bq8qIuJn6CNAFvYb5xkW9B9h445YUvMd0uxPBRzjIcV4F93AtaJd
 5NRNzZxDcaZVbSBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D588D13443
 for <ltp@lists.linux.it>; Mon, 13 Jun 2022 12:49:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Y7t7M2oyp2IjGwAAMHmgww
 (envelope-from <chrubis@suse.cz>)
 for <ltp@lists.linux.it>; Mon, 13 Jun 2022 12:49:46 +0000
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 13 Jun 2022 14:51:53 +0200
Message-Id: <20220613125153.20423-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/execve06: Add test for argv[0] = NULL
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

Adds a test that kernel sets argv[0] to a dummy empty string if NULL was
passed to the execve() syscall. This was introduced in commit:

commit dcd46d897adb70d63e025f175a00a89797d31a43
Author: Kees Cook <keescook@chromium.org>
Date:   Mon Jan 31 16:09:47 2022 -0800

    exec: Force single empty string when argv is empty

in order to fix all potential CVEs where userspace programs attempt to
blindly process the argv[] list starting at argv[1]. There was at least
one example of this caught in the wild CVE-2021-4034 in polkit but there
are likely more.

Fixes: #911

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 testcases/kernel/syscalls/execve/.gitignore   |  2 +
 testcases/kernel/syscalls/execve/execve06.c   | 49 +++++++++++++++++++
 .../kernel/syscalls/execve/execve06_child.c   | 27 ++++++++++
 3 files changed, 78 insertions(+)
 create mode 100644 testcases/kernel/syscalls/execve/execve06.c
 create mode 100644 testcases/kernel/syscalls/execve/execve06_child.c

diff --git a/testcases/kernel/syscalls/execve/.gitignore b/testcases/kernel/syscalls/execve/.gitignore
index 50cabbb83..fee81faf7 100644
--- a/testcases/kernel/syscalls/execve/.gitignore
+++ b/testcases/kernel/syscalls/execve/.gitignore
@@ -4,4 +4,6 @@
 /execve03
 /execve04
 /execve05
+/execve06
+/execve06_child
 /execve_child
diff --git a/testcases/kernel/syscalls/execve/execve06.c b/testcases/kernel/syscalls/execve/execve06.c
new file mode 100644
index 000000000..b3280cf76
--- /dev/null
+++ b/testcases/kernel/syscalls/execve/execve06.c
@@ -0,0 +1,49 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2022 Cyril Hrubis <chrubis@suse.cz>
+ */
+
+/*\
+ * [Description]
+ *
+ * Test that kernel adds dummy argv[0] if empty argument list was passed to
+ * execve(). This fixes at least one CVE where userspace programs start to
+ * process argument list blindly from argv[1] such as polkit pkexec
+ * CVE-2021-4034.
+ */
+
+#include <stdlib.h>
+#include <stdio.h>
+#include "tst_test.h"
+
+static void verify_execve(void)
+{
+	pid_t pid;
+	char path[512];
+	char ipc_env_var[1024];
+
+	sprintf(ipc_env_var, IPC_ENV_VAR "=%s", getenv(IPC_ENV_VAR));
+
+	char *const envp[] = {ipc_env_var, NULL};
+	char *const argv[] = {NULL};
+
+	if (tst_get_path("execve06_child", path, sizeof(path)))
+		tst_brk(TCONF, "Couldn't find execve06_child in $PATH");
+
+	pid = SAFE_FORK();
+	if (pid == 0) {
+		execve(path, argv, envp);
+		tst_brk(TFAIL | TERRNO, "Failed to execute execl01_child");
+	}
+}
+
+static struct tst_test test = {
+	.forks_child = 1,
+	.child_needs_reinit = 1,
+	.test_all = verify_execve,
+	.tags = (const struct tst_tag[]) {
+		{"linux-git", "dcd46d897adb"},
+		{"CVE", "2021-4034"},
+		{}
+	}
+};
diff --git a/testcases/kernel/syscalls/execve/execve06_child.c b/testcases/kernel/syscalls/execve/execve06_child.c
new file mode 100644
index 000000000..17280d58a
--- /dev/null
+++ b/testcases/kernel/syscalls/execve/execve06_child.c
@@ -0,0 +1,27 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2022 Cyril Hrubis chrubis@suse.cz
+ */
+
+#define TST_NO_DEFAULT_MAIN
+#include <stdlib.h>
+#include "tst_test.h"
+
+int main(int argc, char *argv[])
+{
+	tst_reinit();
+
+	if (argc != 1) {
+		tst_res(TFAIL, "argc is %d, expected 1", argc);
+		return 0;
+	}
+
+	if (!argv[0]) {
+		tst_res(TFAIL, "argv[0] == NULL");
+		return 0;
+	}
+
+	tst_res(TPASS, "argv[0] was filled in by kernel");
+
+	return 0;
+}
-- 
2.35.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
