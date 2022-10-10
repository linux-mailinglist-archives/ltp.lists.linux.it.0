Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B32A5FA08F
	for <lists+linux-ltp@lfdr.de>; Mon, 10 Oct 2022 16:54:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1B6873CAE85
	for <lists+linux-ltp@lfdr.de>; Mon, 10 Oct 2022 16:54:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D9D0E3CAE90
 for <ltp@lists.linux.it>; Mon, 10 Oct 2022 16:54:00 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id BD669200975
 for <ltp@lists.linux.it>; Mon, 10 Oct 2022 16:53:59 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0CD522188A;
 Mon, 10 Oct 2022 14:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1665413639; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=tLMF9i4T5/WXOIiOYkSnW+tcN1ey0QTiX9T1eBXVqL0=;
 b=B6Q4cxL+qBcuFwlhou5SdnM33iz71/mhCmZ+ktMu3TFWjqruYu2F/b8pB9zcLzHMDSzmiU
 yYOXFbFMT2fD6d0IGC3qO1p3ZSby5B4SlIVoVBVY2NWfmlHKcYoEC64py3PatVXk3KRmBf
 qQBK4cmAlhuryFQ3cNBbM2++NCUE4+o=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AE72C13ACA;
 Mon, 10 Oct 2022 14:53:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id AuqYKAYyRGPQJwAAMHmgww
 (envelope-from <andrea.cervesato@suse.com>); Mon, 10 Oct 2022 14:53:58 +0000
To: ltp@lists.linux.it
Date: Mon, 10 Oct 2022 16:52:43 +0200
Message-Id: <20221010145243.3133-1-andrea.cervesato@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v1] Add epoll_wait07 test
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

This test verifies EPOLLONESHOT functionality.

Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.com>
---
 .../kernel/syscalls/epoll_wait/.gitignore     |  1 +
 .../kernel/syscalls/epoll_wait/epoll_wait07.c | 86 +++++++++++++++++++
 2 files changed, 87 insertions(+)
 create mode 100644 testcases/kernel/syscalls/epoll_wait/epoll_wait07.c

diff --git a/testcases/kernel/syscalls/epoll_wait/.gitignore b/testcases/kernel/syscalls/epoll_wait/.gitignore
index 8c5ed7c5c..66ac18ae2 100644
--- a/testcases/kernel/syscalls/epoll_wait/.gitignore
+++ b/testcases/kernel/syscalls/epoll_wait/.gitignore
@@ -4,3 +4,4 @@ epoll_wait03
 epoll_wait04
 epoll_wait05
 epoll_wait06
+epoll_wait07
diff --git a/testcases/kernel/syscalls/epoll_wait/epoll_wait07.c b/testcases/kernel/syscalls/epoll_wait/epoll_wait07.c
new file mode 100644
index 000000000..760ab6c10
--- /dev/null
+++ b/testcases/kernel/syscalls/epoll_wait/epoll_wait07.c
@@ -0,0 +1,86 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2022 SUSE LLC Andrea Cervesato <andrea.cervesato@suse.com>
+ */
+
+/*\
+ * [Description]
+ *
+ * Verify that EPOLLONESHOT is correctly handled by epoll_wait.
+ * We open a channel, write on it multiple times and we verify that EPOLLOUT
+ * has been received only once.
+ */
+
+#include <poll.h>
+#include <sys/epoll.h>
+#include "tst_test.h"
+
+#define WRITE_SIZE 2048
+
+static int fds[2];
+static int epfd;
+
+static void cleanup(void)
+{
+	if (epfd > 0)
+		SAFE_CLOSE(epfd);
+
+	if (fds[0] > 0)
+		SAFE_CLOSE(fds[0]);
+
+	if (fds[1] > 0)
+		SAFE_CLOSE(fds[1]);
+}
+
+static void run(void)
+{
+	int res;
+	char buff[WRITE_SIZE];
+	struct epoll_event evt_receive;
+	struct epoll_event evt_request;
+
+	SAFE_PIPE(fds);
+
+	evt_request.events = EPOLLOUT | EPOLLONESHOT;
+	evt_request.data.fd = fds[1];
+
+	epfd = epoll_create(2);
+	if (epfd == -1)
+		tst_brk(TBROK | TERRNO, "fail to create epoll instance");
+
+	tst_res(TINFO, "Polling channel with EPOLLONESHOT");
+
+	res = epoll_ctl(epfd, EPOLL_CTL_ADD, fds[1], &evt_request);
+	if (res == -1)
+		tst_brk(TBROK | TERRNO, "epoll_ctl failure");
+
+	tst_res(TINFO, "Write on channel multiple times");
+
+	memset(buff, 'a', WRITE_SIZE);
+	SAFE_WRITE(0, fds[1], buff, WRITE_SIZE);
+	SAFE_WRITE(0, fds[1], buff, WRITE_SIZE);
+
+	res = epoll_wait(epfd, &evt_receive, 1, 2000);
+	if (res <= 0) {
+		tst_res(TFAIL | TERRNO, "epoll_wait() returned %i", res);
+		goto close;
+	}
+
+	if ((evt_receive.events & EPOLLOUT) == 0) {
+		tst_res(TFAIL, "No EPOLLOUT received");
+		goto close;
+	}
+
+	tst_res(TINFO, "Received first EPOLLOUT event");
+
+	TST_EXP_EQ_LI(epoll_wait(epfd, &evt_receive, 1, 0), 0);
+
+close:
+	SAFE_CLOSE(fds[0]);
+	SAFE_CLOSE(fds[1]);
+}
+
+static struct tst_test test = {
+	.cleanup = cleanup,
+	.test_all = run,
+};
-- 
2.35.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
