Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A50AFB9A1
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Jul 2025 19:07:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 464F53C9F61
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Jul 2025 19:07:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A30123CA12A
 for <ltp@lists.linux.it>; Mon,  7 Jul 2025 19:06:08 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 080BD1000BD9
 for <ltp@lists.linux.it>; Mon,  7 Jul 2025 19:06:07 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 02D8C21167;
 Mon,  7 Jul 2025 17:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1751907955; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qY/8Aarctyzsot2+Z7B1zNHec6hxDLvWGg8Idvhh/sY=;
 b=iVuOf99g6n6jJugfi1eOekEkR26fDFBMO9YawQm92Zl7YL6N+W2nCL+7H6hpSxbMDn89rs
 OvzIhNBU87VXgvC8vwdNcmXHROqkPeOEb96wNUYZUz/7bmQA2dGiwq/H+MrveMluzknZ6j
 B3IBh3jrhp5obzwuno1bSS1VaW651vw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1751907955;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qY/8Aarctyzsot2+Z7B1zNHec6hxDLvWGg8Idvhh/sY=;
 b=m2gQ90gjdiLdUM/nunFHQfjqQvi7AD5pxDu8Q0gA7QZ7SL6rDRd8tqaW8RIpKqv9rOusjd
 vj+i2+LhMRiE9gBg==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=iVuOf99g;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=m2gQ90gj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1751907955; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qY/8Aarctyzsot2+Z7B1zNHec6hxDLvWGg8Idvhh/sY=;
 b=iVuOf99g6n6jJugfi1eOekEkR26fDFBMO9YawQm92Zl7YL6N+W2nCL+7H6hpSxbMDn89rs
 OvzIhNBU87VXgvC8vwdNcmXHROqkPeOEb96wNUYZUz/7bmQA2dGiwq/H+MrveMluzknZ6j
 B3IBh3jrhp5obzwuno1bSS1VaW651vw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1751907955;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qY/8Aarctyzsot2+Z7B1zNHec6hxDLvWGg8Idvhh/sY=;
 b=m2gQ90gjdiLdUM/nunFHQfjqQvi7AD5pxDu8Q0gA7QZ7SL6rDRd8tqaW8RIpKqv9rOusjd
 vj+i2+LhMRiE9gBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B652113A5E;
 Mon,  7 Jul 2025 17:05:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 2IzDJ3L+a2g/YgAAD6G6ig
 (envelope-from <andrea.cervesato@suse.de>); Mon, 07 Jul 2025 17:05:54 +0000
From: Andrea Cervesato <andrea.cervesato@suse.de>
Date: Mon, 07 Jul 2025 19:05:48 +0200
MIME-Version: 1.0
Message-Id: <20250707-ioctl_pidfd_suite-v3-7-22ba4d15ee02@suse.com>
References: <20250707-ioctl_pidfd_suite-v3-0-22ba4d15ee02@suse.com>
In-Reply-To: <20250707-ioctl_pidfd_suite-v3-0-22ba4d15ee02@suse.com>
To: ltp@lists.linux.it
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751907947; l=3007;
 i=andrea.cervesato@suse.com; s=20240812; h=from:subject:message-id;
 bh=iG0K6lfSLK7bDCcpoJQpQBNgV3aJVdXTYhz597Oqld4=;
 b=9ixAgrD5V11DuiTQqMPNWc7s8XzVqk4BWaguT0nXXo7D8Cxjh2v3KA1WV25tvMDzdqlRICbYn
 LvJrrmlTNpTBIxetfOs10T8QvD7OdIYRjw+r3GpoJJjZ/daJipCEvcO
X-Developer-Key: i=andrea.cervesato@suse.com; a=ed25519;
 pk=RG/nLJ5snb1tLKGwSORQXBJ5XA4juT0WF2Pc/lq9meo=
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 RCPT_COUNT_TWO(0.00)[2];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:email];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
 DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Level: 
X-Rspamd-Queue-Id: 02D8C21167
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.51
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v3 7/8] Add ioctl_pidfd05 test
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

Verify that ioctl() raises an EINVAL error when PIDFD_GET_INFO
is used. This happens when:

- info parameter is NULL
- info parameter is providing the wrong size

Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.com>
---
 runtest/syscalls                                |  1 +
 testcases/kernel/syscalls/ioctl/.gitignore      |  1 +
 testcases/kernel/syscalls/ioctl/ioctl_pidfd05.c | 57 +++++++++++++++++++++++++
 3 files changed, 59 insertions(+)

diff --git a/runtest/syscalls b/runtest/syscalls
index a28f4857ffccc070665361f2741ddbaa480d1153..91908312df82f677e6fa711653b56de8e5ccf016 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -616,6 +616,7 @@ ioctl_pidfd01 ioctl_pidfd01
 ioctl_pidfd02 ioctl_pidfd02
 ioctl_pidfd03 ioctl_pidfd03
 ioctl_pidfd04 ioctl_pidfd04
+ioctl_pidfd05 ioctl_pidfd05
 
 inotify_init1_01 inotify_init1_01
 inotify_init1_02 inotify_init1_02
diff --git a/testcases/kernel/syscalls/ioctl/.gitignore b/testcases/kernel/syscalls/ioctl/.gitignore
index b6203828f324647ccf5d809e80e2ada515817006..4658173eac337a8e9cae1844340f9ecc0e55218f 100644
--- a/testcases/kernel/syscalls/ioctl/.gitignore
+++ b/testcases/kernel/syscalls/ioctl/.gitignore
@@ -33,3 +33,4 @@
 /ioctl_pidfd02
 /ioctl_pidfd03
 /ioctl_pidfd04
+/ioctl_pidfd05
diff --git a/testcases/kernel/syscalls/ioctl/ioctl_pidfd05.c b/testcases/kernel/syscalls/ioctl/ioctl_pidfd05.c
new file mode 100644
index 0000000000000000000000000000000000000000..81a5e4f22746491d4cbea67d74a58586cc016d14
--- /dev/null
+++ b/testcases/kernel/syscalls/ioctl/ioctl_pidfd05.c
@@ -0,0 +1,57 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2025 Andrea Cervesato <andrea.cervesato@suse.com>
+ */
+
+/*\
+ * Verify that ioctl() raises an EINVAL error when PIDFD_GET_INFO is used. This
+ * happens when:
+ *
+ * - info parameter is NULL
+ * - info parameter is providing the wrong size
+ */
+
+#include "tst_test.h"
+#include "lapi/pidfd.h"
+#include "lapi/sched.h"
+#include "lapi/ioctl.h"
+
+struct pidfd_info_invalid {
+	uint32_t dummy;
+};
+
+#define PIDFD_GET_INFO_SHORT _IOWR(PIDFS_IOCTL_MAGIC, 11, struct pidfd_info_invalid)
+
+static struct tst_clone_args *args;
+static struct pidfd_info_invalid *info_invalid;
+
+static void run(void)
+{
+	int pidfd = 0;
+	pid_t pid_child;
+
+	memset(args, 0, sizeof(struct tst_clone_args));
+
+	info_invalid->dummy = 1;
+
+	args->flags = CLONE_PIDFD | CLONE_NEWUSER | CLONE_NEWPID;
+	args->pidfd = (uint64_t)&pidfd;
+	args->exit_signal = SIGCHLD;
+
+	pid_child = SAFE_CLONE(args);
+	if (!pid_child)
+		exit(0);
+
+	TST_EXP_FAIL(ioctl(pidfd, PIDFD_GET_INFO, NULL), EINVAL);
+	TST_EXP_FAIL(ioctl(pidfd, PIDFD_GET_INFO_SHORT, info_invalid), EINVAL);
+}
+
+static struct tst_test test = {
+	.test_all = run,
+	.forks_child = 1,
+	.bufs = (struct tst_buffers []) {
+		{&args, .size = sizeof(*args)},
+		{&info_invalid, .size = sizeof(*info_invalid)},
+		{}
+	}
+};

-- 
2.50.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
