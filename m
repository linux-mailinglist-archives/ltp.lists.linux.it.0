Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F5449DDD9
	for <lists+linux-ltp@lfdr.de>; Thu, 27 Jan 2022 10:24:59 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EADD53C9729
	for <lists+linux-ltp@lfdr.de>; Thu, 27 Jan 2022 10:24:58 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7DD823C9606
 for <ltp@lists.linux.it>; Thu, 27 Jan 2022 10:24:35 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id D5BDA6006C9
 for <ltp@lists.linux.it>; Thu, 27 Jan 2022 10:24:34 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 59644210FF;
 Thu, 27 Jan 2022 09:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1643275474; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ilwb/lxzBMEa8odqJGSIa7sHFcYfHsbOUzM8cFLUr6M=;
 b=b4XDHyeMCl+bjXjbI8E/8qCRX8fpmDHsw6MjUCXzZr40yU8Fw5PYfOdsTftPmw3iOHv+NK
 aWCst9uHbs6zpfcjcjFjFQ8hzLh4HJPGKszTE9lSpiUJWYZzgsLTM0roMfXQEkVcxbB5Oy
 Y5sJZtR5pSIeucQKv9uZDrhkzKFHbjQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1643275474;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ilwb/lxzBMEa8odqJGSIa7sHFcYfHsbOUzM8cFLUr6M=;
 b=hUH+3uoaQTJYMxiuDaYIUoM28cB3baULjIFcwMR8TKNrece51HyoZp/r3HjEAKBESWlPl3
 2iz1OvP0PF68+uCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 31C4D13CFB;
 Thu, 27 Jan 2022 09:24:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id GKz6CdJk8mHLHwAAMHmgww
 (envelope-from <andrea.cervesato@suse.de>); Thu, 27 Jan 2022 09:24:34 +0000
From: Andrea Cervesato <andrea.cervesato@suse.de>
To: ltp@lists.linux.it
Date: Thu, 27 Jan 2022 10:24:23 +0100
Message-Id: <20220127092431.25996-4-andrea.cervesato@suse.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220127092431.25996-1-andrea.cervesato@suse.de>
References: <20220127092431.25996-1-andrea.cervesato@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v5 03/11] Add wqueue01 test
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

This test is testing NOTIFY_KEY_UPDATED event

Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.de>
---

In v5 wqueue_watch function is now handling pipe2 when CONFIG_WATCH_QUEUE is
not defined. Also added a better format for common.h and tests files.

 runtest/watchqueue                     |   1 +
 scenario_groups/default                |   1 +
 testcases/kernel/Makefile              |   1 +
 testcases/kernel/watchqueue/.gitignore |   1 +
 testcases/kernel/watchqueue/Makefile   |   8 ++
 testcases/kernel/watchqueue/common.h   | 167 +++++++++++++++++++++++++
 testcases/kernel/watchqueue/wqueue01.c |  43 +++++++
 7 files changed, 222 insertions(+)
 create mode 100644 runtest/watchqueue
 create mode 100644 testcases/kernel/watchqueue/.gitignore
 create mode 100644 testcases/kernel/watchqueue/Makefile
 create mode 100644 testcases/kernel/watchqueue/common.h
 create mode 100644 testcases/kernel/watchqueue/wqueue01.c

diff --git a/runtest/watchqueue b/runtest/watchqueue
new file mode 100644
index 000000000..782577d6d
--- /dev/null
+++ b/runtest/watchqueue
@@ -0,0 +1 @@
+wqueue01 wqueue01
diff --git a/scenario_groups/default b/scenario_groups/default
index 1dc2987d5..68bd5300d 100644
--- a/scenario_groups/default
+++ b/scenario_groups/default
@@ -30,3 +30,4 @@ cve
 crypto
 kernel_misc
 uevent
+watchqueue
diff --git a/testcases/kernel/Makefile b/testcases/kernel/Makefile
index 4604f1f38..d44856c57 100644
--- a/testcases/kernel/Makefile
+++ b/testcases/kernel/Makefile
@@ -38,6 +38,7 @@ SUBDIRS			+= connectors \
 			   sound \
 			   tracing \
 			   uevents \
+			   watchqueue \
 
 ifeq ($(WITH_POWER_MANAGEMENT_TESTSUITE),yes)
 SUBDIRS			+= power_management
diff --git a/testcases/kernel/watchqueue/.gitignore b/testcases/kernel/watchqueue/.gitignore
new file mode 100644
index 000000000..c61ac6165
--- /dev/null
+++ b/testcases/kernel/watchqueue/.gitignore
@@ -0,0 +1 @@
+wqueue01
diff --git a/testcases/kernel/watchqueue/Makefile b/testcases/kernel/watchqueue/Makefile
new file mode 100644
index 000000000..896d66d42
--- /dev/null
+++ b/testcases/kernel/watchqueue/Makefile
@@ -0,0 +1,8 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+top_srcdir			?= ../../..
+
+include $(top_srcdir)/include/mk/testcases.mk
+include $(top_srcdir)/include/mk/generic_leaf_target.mk
+
+LDLIBS += $(KEYUTILS_LIBS)
diff --git a/testcases/kernel/watchqueue/common.h b/testcases/kernel/watchqueue/common.h
new file mode 100644
index 000000000..8ed38bd4a
--- /dev/null
+++ b/testcases/kernel/watchqueue/common.h
@@ -0,0 +1,167 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2021 SUSE LLC Andrea Cervesato <andrea.cervesato@suse.com>
+ */
+
+#ifndef WQUEUE_COMMON_H__
+#define WQUEUE_COMMON_H__
+
+#define _GNU_SOURCE
+
+#include <unistd.h>
+#include "tst_test.h"
+#include "lapi/watch_queue.h"
+#include "lapi/keyctl.h"
+
+static struct watch_notification_filter wqueue_filter = {
+	.nr_filters	= 2,
+	.filters = {
+		[0]	= {
+			.type			= WATCH_TYPE_META,
+			.subtype_filter[0]	= UINT_MAX,
+		},
+		[1]	= {
+			.type			= WATCH_TYPE_KEY_NOTIFY,
+			.subtype_filter[0]	= UINT_MAX,
+		},
+	},
+};
+
+static inline int wqueue_key_event(struct watch_notification *n, size_t len,
+								   unsigned int wtype, int type)
+{
+	struct key_notification *k;
+	const char *msg;
+
+	if (wtype != WATCH_TYPE_KEY_NOTIFY)
+		return 0;
+
+	if (len != sizeof(struct key_notification))
+		tst_brk(TBROK, "Incorrect key message length");
+
+	switch (n->subtype) {
+	case NOTIFY_KEY_INSTANTIATED:
+		msg = "instantiated";
+		break;
+	case NOTIFY_KEY_UPDATED:
+		msg = "updated";
+		break;
+	case NOTIFY_KEY_LINKED:
+		msg = "linked";
+		break;
+	case NOTIFY_KEY_UNLINKED:
+		msg = "unlinked";
+		break;
+	case NOTIFY_KEY_CLEARED:
+		msg = "cleared";
+		break;
+	case NOTIFY_KEY_REVOKED:
+		msg = "revoked";
+		break;
+	case NOTIFY_KEY_INVALIDATED:
+		msg = "invalidated";
+		break;
+	case NOTIFY_KEY_SETATTR:
+		msg = "setattr";
+		break;
+	default:
+		msg = "Invalid notification";
+		break;
+	};
+
+	k = (struct key_notification *)n;
+	tst_res(TINFO, "KEY %08x change=%u[%s] aux=%u", k->key_id, n->subtype, msg,
+			k->aux);
+
+	if (n->subtype == type)
+		return 1;
+
+	return 0;
+}
+
+static inline key_serial_t wqueue_add_key(int fd)
+{
+	key_serial_t key;
+
+	key = add_key("user", "ltptestkey", "a", 1, KEY_SPEC_SESSION_KEYRING);
+	if (key == -1)
+		tst_brk(TBROK, "add_key error: %s", tst_strerrno(errno));
+
+	keyctl(KEYCTL_WATCH_KEY, key, fd, 0x01);
+	keyctl(KEYCTL_WATCH_KEY, KEY_SPEC_SESSION_KEYRING, fd, 0x02);
+
+	return key;
+}
+
+static inline int wqueue_watch(int buf_size,
+							   struct watch_notification_filter *filter)
+{
+	int pipefd[2];
+	int fd;
+
+	TEST(pipe2(pipefd, O_NOTIFICATION_PIPE));
+	if (TST_RET) {
+		switch (TST_ERR) {
+		case ENOPKG:
+			tst_brk(TCONF | TTERRNO, "CONFIG_WATCH_QUEUE is not set");
+			break;
+		case EINVAL:
+			tst_brk(TCONF | TTERRNO, "O_NOTIFICATION_PIPE is not supported");
+			break;
+		default:
+			tst_brk(TBROK | TTERRNO, "pipe2() returned %ld", TST_RET);
+		}
+	}
+
+	fd = pipefd[0];
+
+	SAFE_IOCTL(fd, IOC_WATCH_QUEUE_SET_SIZE, buf_size);
+	SAFE_IOCTL(fd, IOC_WATCH_QUEUE_SET_FILTER, filter);
+
+	return fd;
+}
+
+typedef void (*wqueue_callback)(struct watch_notification *n, size_t len,
+								unsigned int wtype);
+
+static void wqueue_consumer(int fd, wqueue_callback cb)
+{
+	unsigned char buffer[433], *p, *end;
+	union {
+		struct watch_notification n;
+		unsigned char buf1[128];
+	} n;
+	ssize_t buf_len;
+
+	tst_res(TINFO, "Reading watch queue events");
+
+	buf_len = SAFE_READ(0, fd, buffer, sizeof(buffer));
+
+	p = buffer;
+	end = buffer + buf_len;
+	while (p < end) {
+		size_t largest, len;
+
+		largest = end - p;
+		if (largest > 128)
+			largest = 128;
+
+		if (largest < sizeof(struct watch_notification))
+			tst_brk(TBROK, "Short message header: %zu", largest);
+
+		memcpy(&n, p, largest);
+
+		tst_res(TINFO, "NOTIFY[%03zx]: ty=%06x sy=%02x i=%08x", p - buffer,
+				n.n.type, n.n.subtype, n.n.info);
+
+		len = n.n.info & WATCH_INFO_LENGTH;
+		if (len < sizeof(n.n) || len > largest)
+			tst_brk(TBROK, "Bad message length: %zu/%zu", len, largest);
+
+		cb(&n.n, len, n.n.type);
+
+		p += len;
+	}
+}
+
+#endif
diff --git a/testcases/kernel/watchqueue/wqueue01.c b/testcases/kernel/watchqueue/wqueue01.c
new file mode 100644
index 000000000..7ee2845ef
--- /dev/null
+++ b/testcases/kernel/watchqueue/wqueue01.c
@@ -0,0 +1,43 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2021 SUSE LLC Andrea Cervesato <andrea.cervesato@suse.com>
+ */
+
+/*\
+ * [Description]
+ *
+ * Test if keyctl update is correctly recognized by watch queue.
+ */
+
+#define _GNU_SOURCE
+
+#include "tst_test.h"
+#include "lapi/keyctl.h"
+#include "common.h"
+
+static void saw_key_updated(struct watch_notification *n, size_t len,
+							unsigned int wtype)
+{
+	if (wqueue_key_event(n, len, wtype, NOTIFY_KEY_UPDATED))
+		tst_res(TPASS, "keyctl update has been recognized");
+	else
+		tst_res(TFAIL, "keyctl update has not been recognized");
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
+	keyctl(KEYCTL_UPDATE, key, "b", 1);
+	wqueue_consumer(fd, saw_key_updated);
+
+	SAFE_CLOSE(fd);
+}
+
+static struct tst_test test = {
+	.test_all = run,
+};
-- 
2.34.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
