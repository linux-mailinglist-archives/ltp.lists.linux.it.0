Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 975BB610C9A
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Oct 2022 11:00:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2E9953CA940
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Oct 2022 11:00:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3D3A73CA92F
 for <ltp@lists.linux.it>; Fri, 28 Oct 2022 11:00:37 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id D02EC200D3D
 for <ltp@lists.linux.it>; Fri, 28 Oct 2022 11:00:36 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 023451F8B6;
 Fri, 28 Oct 2022 09:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1666947636; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=8JLlKjQNkPzMgSFyfVYvbsTHXdTh1DK4MYCwqpRvDDI=;
 b=tv6F/3y7Ms4I9wLhoXqusOpudjWec8aXK65uVmQHwX4z0sD6pYfz+7sxt+KHUeMMPmarsk
 1yr1XIvVn/iHHQlxEHon2OcECNzxQVIuJBy7/vpfkMMynRMwvFwCyLF7t78aYVjkcTOT/5
 haHn3HUsCIBttze7hd8+fZNx5JrRdao=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A4FBE13A6E;
 Fri, 28 Oct 2022 09:00:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id PhZUIzOaW2OEDQAAMHmgww
 (envelope-from <andrea.cervesato@suse.com>); Fri, 28 Oct 2022 09:00:35 +0000
To: ltp@lists.linux.it
Date: Fri, 28 Oct 2022 10:59:13 +0200
Message-Id: <20221028085913.983-1-andrea.cervesato@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v4] Add epoll_wait06 test
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

This test verifies EPOLLET functionality.

Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.com>
---
Make use of SAFE_EPOLL_* macros.
Wait for EPOLLOUT event instead of EPOLLIN

 .../kernel/syscalls/epoll_wait/.gitignore     |  1 +
 .../kernel/syscalls/epoll_wait/epoll_wait06.c | 90 +++++++++++++++++++
 2 files changed, 91 insertions(+)
 create mode 100644 testcases/kernel/syscalls/epoll_wait/epoll_wait06.c

diff --git a/testcases/kernel/syscalls/epoll_wait/.gitignore b/testcases/kernel/syscalls/epoll_wait/.gitignore
index ab5a9c010..8c5ed7c5c 100644
--- a/testcases/kernel/syscalls/epoll_wait/.gitignore
+++ b/testcases/kernel/syscalls/epoll_wait/.gitignore
@@ -3,3 +3,4 @@ epoll_wait02
 epoll_wait03
 epoll_wait04
 epoll_wait05
+epoll_wait06
diff --git a/testcases/kernel/syscalls/epoll_wait/epoll_wait06.c b/testcases/kernel/syscalls/epoll_wait/epoll_wait06.c
new file mode 100644
index 000000000..f263f9041
--- /dev/null
+++ b/testcases/kernel/syscalls/epoll_wait/epoll_wait06.c
@@ -0,0 +1,90 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2022 SUSE LLC Andrea Cervesato <andrea.cervesato@suse.com>
+ */
+
+/*\
+ * [Description]
+ *
+ * Verify that EPOLLET is correctly handled by epoll_wait.
+ *
+ * [Algorithm]
+ *
+ * 1. The file descriptor that represents the read side of a pipe (rfd) is
+ *    registered on the epoll instance.
+ * 2. A pipe writer writes 2 kB of data on the write side of the pipe.
+ * 3. A call to epoll_wait(2) is done that will return rfd as a ready file
+ *    descriptor.
+ * 4. The pipe reader reads 1 kB of data from rfd.
+ * 5. A call to epoll_wait(2) should hang (return 0) because there's data left
+ *    to read.
+ */
+
+#include <poll.h>
+#include <sys/epoll.h>
+#include "tst_test.h"
+#include "tst_epoll.h"
+
+#define WRITE_SIZE 2048
+#define READ_SIZE (WRITE_SIZE / 2)
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
+	char buff[WRITE_SIZE];
+	struct epoll_event evt_receive;
+	struct epoll_event evt_request;
+
+	SAFE_PIPE(fds);
+
+	evt_request.events = EPOLLOUT | EPOLLET;
+	evt_request.data.fd = fds[0];
+
+	epfd = SAFE_EPOLL_CREATE1(0);
+
+	tst_res(TINFO, "Polling channel with EPOLLET");
+
+	SAFE_EPOLL_CTL(epfd, EPOLL_CTL_ADD, fds[1], &evt_request);
+
+	tst_res(TINFO, "Write bytes on channel");
+
+	memset(buff, 'a', WRITE_SIZE);
+	SAFE_WRITE(0, fds[1], buff, WRITE_SIZE);
+
+	SAFE_EPOLL_WAIT(epfd, &evt_receive, 1, 2000);
+
+	if ((evt_receive.events & EPOLLOUT) == 0) {
+		tst_res(TFAIL, "No EPOLLOUT received");
+		goto close;
+	}
+
+	tst_res(TINFO, "Received EPOLLOUT event. Read half bytes from channel");
+
+	memset(buff, 0, READ_SIZE);
+	SAFE_READ(1, evt_receive.data.fd, buff, READ_SIZE);
+
+	TST_EXP_EQ_LI(epoll_wait(epfd, &evt_receive, 1, 10), 0);
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
