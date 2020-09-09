Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B89263528
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Sep 2020 19:58:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0982A3C2C0D
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Sep 2020 19:58:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 7261A3C267D
 for <ltp@lists.linux.it>; Wed,  9 Sep 2020 19:57:24 +0200 (CEST)
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 29289600683
 for <ltp@lists.linux.it>; Wed,  9 Sep 2020 19:57:24 +0200 (CEST)
Received: by mail-wr1-x443.google.com with SMTP id z1so3928451wrt.3
 for <ltp@lists.linux.it>; Wed, 09 Sep 2020 10:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=eMpgBnxlHJPY8RJJAuKD1HXzm7RMV1POLeoNgrS7q/E=;
 b=oAs1EJDQl0R6uQhzNdpOfsExrYy29t4u5gvSFaViv3AkycMeAsbKqHKVZxKFXowcxo
 1d9+piCkhC5zLCWu8w7bX/O4uOB0icB0DSpdwJqG7VXkBg3CjibbGYiF+xFcGI0I9RJ2
 1JTIsUB4Ca5/2KzOFqJFkLtspB1EPmwUqyoSMC9X9uyvBHkA3XXvlxBtMbDAttASb5Ts
 b1GJMZ6a5nBA2lxd9q5FbpIKqNPYk54CKx2XwL6/oyZcDf9qiTSrizNAjcXQa+htSt1l
 M7w9Xu4cgC2sVxZf3LhyM7+lBYHmxLIpgjKiWosx3G/AVof3sn6sVyDMoAJ3WbjBDPlz
 jq7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=eMpgBnxlHJPY8RJJAuKD1HXzm7RMV1POLeoNgrS7q/E=;
 b=cusG0nuP3IcWE2r6mVrFGn0X1OKA8eshZuv2UYmOvVS5SF7gUIsD1oxKh3wLv7rHPw
 wk7lSdBNpzHepPgd4go8AKPZ1vlBpzfM4ffu2/E0ASHHi8Uv57iO74Q7q3GbrOTusM8m
 2VjO8hX/b59OwMmn2O5YTjdujtXwIoNzvxNpZdnrAykG3azcgBNbDXS5BzhH9qTOFY78
 16GQvSS0ywBd9ULzsBWLv6U99voYVQb9+RistWLNRbLvuAU3j2B9LV/95tnhzEg8LLbi
 mzADbk5g3xDFRxmPO7Hu+PfVgkXRH9bpHluKGTGEXWwOAn17TttPE19pC5phUPDRyPNB
 uxzw==
X-Gm-Message-State: AOAM531OTaGgQE7vgOBzVSDMIkyOujiUfqq2xZXf98fkwq3pFTXsC/Hp
 GwlouS4uRJ1YlL2exuDzZ92041G6OFI=
X-Google-Smtp-Source: ABdhPJx8tModr0h1iaKIu/kxBw7nW/+lo4YHwB7MYXWxBuK3WgbLqctouH8V/J5JntgBAQe92A+V4A==
X-Received: by 2002:a5d:4d8f:: with SMTP id b15mr5080114wru.341.1599674243642; 
 Wed, 09 Sep 2020 10:57:23 -0700 (PDT)
Received: from localhost.localdomain ([141.226.8.56])
 by smtp.gmail.com with ESMTPSA id z83sm4979714wmb.4.2020.09.09.10.57.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2020 10:57:23 -0700 (PDT)
From: Amir Goldstein <amir73il@gmail.com>
To: Petr Vorel <pvorel@suse.cz>
Date: Wed,  9 Sep 2020 20:57:03 +0300
Message-Id: <20200909175707.10670-7-amir73il@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200909175707.10670-1-amir73il@gmail.com>
References: <20200909175707.10670-1-amir73il@gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 06/10] syscalls/fcntl: New test for F_NOTIFY (dnotify)
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
Cc: Jan Kara <jack@suse.cz>, ltp@lists.linux.it
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Check that signal is delivered for both watching parent and watching subdir
when subdir metadata changes.

Signed-off-by: Amir Goldstein <amir73il@gmail.com>
---
 runtest/syscalls                          |  2 +
 testcases/kernel/syscalls/fcntl/fcntl38.c | 96 +++++++++++++++++++++++
 2 files changed, 98 insertions(+)
 create mode 100644 testcases/kernel/syscalls/fcntl/fcntl38.c

diff --git a/runtest/syscalls b/runtest/syscalls
index dc0ca5626..376a2bc6b 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -316,6 +316,8 @@ fcntl36 fcntl36
 fcntl36_64 fcntl36_64
 fcntl37 fcntl37
 fcntl37_64 fcntl37_64
+fcntl38 fcntl38
+fcntl38_64 fcntl38_64
 
 fdatasync01 fdatasync01
 fdatasync02 fdatasync02
diff --git a/testcases/kernel/syscalls/fcntl/fcntl38.c b/testcases/kernel/syscalls/fcntl/fcntl38.c
new file mode 100644
index 000000000..6185d3209
--- /dev/null
+++ b/testcases/kernel/syscalls/fcntl/fcntl38.c
@@ -0,0 +1,96 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2020 CTERA Networks. All Rights Reserved.
+ *
+ * Started by Amir Goldstein <amir73il@gmail.com>
+ *
+ * DESCRIPTION
+ *     Check that dnotify event is reported to both parent and subdir
+ */
+
+#include <fcntl.h>
+#include <signal.h>
+#include <stdio.h>
+#include <unistd.h>
+#include "tst_test.h"
+#include "lapi/fcntl.h"
+
+#define	TEST_DIR	"test_dir"
+
+#define TEST_SIG SIGRTMIN+1
+
+static int parent_fd, subdir_fd;
+static int got_parent_event, got_subdir_event;
+
+static void dnotify_handler(int sig, siginfo_t *si, void *data __attribute__((unused)))
+{
+	if (si->si_fd == parent_fd)
+		got_parent_event = 1;
+	else if (si->si_fd == subdir_fd)
+		got_subdir_event = 1;
+	else
+		tst_brk(TBROK, "Got unexpected signal %d with si_fd %d", sig, si->si_fd);
+}
+
+static void setup_dnotify(int fd)
+{
+	struct sigaction act;
+
+	act.sa_sigaction = dnotify_handler;
+	sigemptyset(&act.sa_mask);
+	act.sa_flags = SA_SIGINFO;
+	sigaction(TEST_SIG, &act, NULL);
+
+	TEST(fcntl(fd, F_SETSIG, TEST_SIG));
+	if (TST_RET != 0) {
+		tst_brk(TBROK, "F_SETSIG failed errno = %d : %s",
+			TST_ERR, strerror(TST_ERR));
+	}
+	TEST(fcntl(fd, F_NOTIFY, DN_ATTRIB|DN_MULTISHOT));
+	if (TST_RET != 0) {
+		tst_brk(TBROK, "F_NOTIFY failed errno = %d : %s",
+			TST_ERR, strerror(TST_ERR));
+	}
+}
+
+static void verify_dnotify(void)
+{
+	parent_fd = SAFE_OPEN(".", O_RDONLY);
+	subdir_fd = SAFE_OPEN(TEST_DIR, O_RDONLY);
+	/* Watch "." and its children for changes */
+	setup_dnotify(parent_fd);
+	/* Also watch subdir itself for changes */
+	setup_dnotify(subdir_fd);
+	/* Generate DN_ATTRIB event on subdir that should send a signal on both fds */
+	SAFE_CHMOD(TEST_DIR, 0755);
+	if (got_parent_event)
+		tst_res(TPASS, "Got event on parent as expected");
+	else
+		tst_res(TFAIL, "Missing event on parent");
+	if (got_subdir_event)
+		tst_res(TPASS, "Got event on subdir as expected");
+	else
+		tst_res(TFAIL, "Missing event on subdir");
+	SAFE_CLOSE(parent_fd);
+	SAFE_CLOSE(subdir_fd);
+}
+
+static void setup(void)
+{
+	SAFE_MKDIR(TEST_DIR, 00700);
+}
+
+static void cleanup(void)
+{
+	if (parent_fd > 0)
+		SAFE_CLOSE(parent_fd);
+	if (subdir_fd > 0)
+		SAFE_CLOSE(subdir_fd);
+}
+
+static struct tst_test test = {
+	.needs_tmpdir = 1,
+	.setup = setup,
+	.cleanup = cleanup,
+	.test_all = verify_dnotify,
+};
-- 
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
