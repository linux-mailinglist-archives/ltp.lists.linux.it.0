Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B395F7EB5
	for <lists+linux-ltp@lfdr.de>; Fri,  7 Oct 2022 22:26:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9830A3CAE31
	for <lists+linux-ltp@lfdr.de>; Fri,  7 Oct 2022 22:26:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6343C3C0FBC
 for <ltp@lists.linux.it>; Fri,  7 Oct 2022 22:26:17 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id BD7B0100155F
 for <ltp@lists.linux.it>; Fri,  7 Oct 2022 22:26:16 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D8B4D1F8B8;
 Fri,  7 Oct 2022 20:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1665174375; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Laa4LDZl+bg8dQaGfBGX/VdbtKkEwrzXCQh6rWxS3Gw=;
 b=kg+Nsm1/uFRf1qXnRpGUDctTRL8TgEIeM7JluPhJRwZO+A1jndMOcO7yEMeH/UyKAIu5cC
 KIyP7QQqwzWu12uwdO34WLcP4C3PJ4t6cJT6l4I8+RFDyMtqISuZ1LiaW5NbzOjBm8E1LD
 Q3vieRi5SlcQ/biC6cdG11FxFr8Yqwo=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9E63113A9A;
 Fri,  7 Oct 2022 20:26:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id N0CdJGeLQGO1EgAAMHmgww
 (envelope-from <andrea.cervesato@suse.com>); Fri, 07 Oct 2022 20:26:15 +0000
To: ltp@lists.linux.it
Date: Fri,  7 Oct 2022 22:25:02 +0200
Message-Id: <20221007202502.21414-1-andrea.cervesato@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v1] Add epoll_ctl06 test
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

The epoll_ctl06 test verifies that EPOLLRDHUP event is correctly
recognised by epoll.

Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.com>
---
 .../kernel/syscalls/epoll_ctl/.gitignore      |  1 +
 .../kernel/syscalls/epoll_ctl/epoll_ctl06.c   | 86 +++++++++++++++++++
 2 files changed, 87 insertions(+)
 create mode 100644 testcases/kernel/syscalls/epoll_ctl/epoll_ctl06.c

diff --git a/testcases/kernel/syscalls/epoll_ctl/.gitignore b/testcases/kernel/syscalls/epoll_ctl/.gitignore
index 3e05f2e1f..9c555f41b 100644
--- a/testcases/kernel/syscalls/epoll_ctl/.gitignore
+++ b/testcases/kernel/syscalls/epoll_ctl/.gitignore
@@ -3,3 +3,4 @@ epoll_ctl02
 epoll_ctl03
 epoll_ctl04
 epoll_ctl05
+epoll_ctl06
diff --git a/testcases/kernel/syscalls/epoll_ctl/epoll_ctl06.c b/testcases/kernel/syscalls/epoll_ctl/epoll_ctl06.c
new file mode 100644
index 000000000..b3cb80a36
--- /dev/null
+++ b/testcases/kernel/syscalls/epoll_ctl/epoll_ctl06.c
@@ -0,0 +1,86 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2022 SUSE LLC Andrea Cervesato <andrea.cervesato@suse.com>
+ */
+
+/*\
+ * [Description]
+ *
+ * Verify that epoll receives EPOLLRDHUP event when we hang a reading
+ * half-socket we are polling on.
+ */
+
+#include <poll.h>
+#include <sys/epoll.h>
+#include "tst_test.h"
+
+static int sockfd;
+static int epfd;
+
+static void setup(void)
+{
+	sockfd = SAFE_SOCKET(AF_INET, SOCK_STREAM, 0);
+}
+
+static void cleanup(void)
+{
+	if (epfd > 0)
+		SAFE_CLOSE(epfd);
+
+	if (sockfd > 0)
+		SAFE_CLOSE(sockfd);
+}
+
+static void run(void)
+{
+	int res;
+	pid_t pid;
+	struct epoll_event evt_req;
+	struct epoll_event evt_rec;
+
+	pid = SAFE_FORK();
+	if (pid != 0) {
+		TST_CHECKPOINT_WAIT(0);
+
+		tst_res(TINFO, "Hang reading half-socket");
+		shutdown(sockfd, SHUT_RD);
+
+		TST_CHECKPOINT_WAKE(0);
+
+		return;
+	}
+
+	epfd = epoll_create1(0);
+	if (epfd == -1)
+		tst_brk(TBROK | TERRNO, "fail to create epoll instance");
+
+	tst_res(TINFO, "Looking at EPOLLRDHUP events");
+
+	evt_req.events = EPOLLRDHUP;
+	res = epoll_ctl(epfd, EPOLL_CTL_ADD, sockfd, &evt_req);
+	if (res == -1)
+		tst_brk(TBROK | TERRNO, "epoll_ctl failure");
+
+	TST_CHECKPOINT_WAKE_AND_WAIT(0);
+
+	res = epoll_wait(epfd, &evt_rec, 1, 2000);
+	if (res <= 0) {
+		tst_res(TFAIL | TERRNO, "epoll_wait() returned %i", res);
+		return;
+	}
+
+	if (evt_rec.events & evt_req.events)
+		tst_res(TPASS, "Received EPOLLRDHUP");
+	else
+		tst_res(TFAIL, "EPOLLRDHUP has not been received");
+
+	SAFE_CLOSE(epfd);
+}
+
+static struct tst_test test = {
+	.setup = setup,
+	.cleanup = cleanup,
+	.test_all = run,
+	.forks_child = 1,
+	.needs_checkpoints = 1,
+};
-- 
2.35.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
