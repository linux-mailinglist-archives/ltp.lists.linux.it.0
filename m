Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UOW+EGYOhmkRJQQAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Fri, 06 Feb 2026 16:53:10 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 756E6FFE80
	for <lists+linux-ltp@lfdr.de>; Fri, 06 Feb 2026 16:53:09 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BE9973CE47E
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Feb 2026 16:53:08 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4421B3CC812
 for <ltp@lists.linux.it>; Fri,  6 Feb 2026 16:52:59 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 16383200DBC
 for <ltp@lists.linux.it>; Fri,  6 Feb 2026 16:52:57 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C8B275BCC5;
 Fri,  6 Feb 2026 15:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1770393177; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=fJ7pXiZfmVzJkmp19ndb2Nq9uG+33xziPXYQlxgO0Yc=;
 b=ZlxjUsa8Ja68FscyuJQmTvghM0VgsV48DycyLXOmZf8Jv8iZ4qp2uP93LkZ4uJN4s8Do9o
 qJ3prSQMzIWorfayZIlXj8JFv03VyOHdjpTrvVCGfRj/jWoQ34/eudgPvrZC6BwZswxO+8
 UxhIjTykSDxc3EgNfYI2fhhd5LCvKZE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1770393177;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=fJ7pXiZfmVzJkmp19ndb2Nq9uG+33xziPXYQlxgO0Yc=;
 b=JHkOzkF0a57MMc6ohXWTcEVFtNvcSBXSUNit1QP0VZvIGInyMw8U/QSJFOlQlvKKDTBuL8
 kvkI514WD3YQbOAw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1770393176; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=fJ7pXiZfmVzJkmp19ndb2Nq9uG+33xziPXYQlxgO0Yc=;
 b=IXTMxGR8AwILpFABeiWYqYxxPWSHKAD/GJF3bhHhMXICI1oe4AJZJeHhgreJ+hj3uaPLCj
 AZyt3o0qxpnZTtP4RN8HMPoQio5O2kF4ngNi5j9vwNKKJq2encmlT2Jr5ocCqIiqr2akxO
 lY8vpRTec++RIR2aEY/CuHaqD5c/IVc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1770393176;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=fJ7pXiZfmVzJkmp19ndb2Nq9uG+33xziPXYQlxgO0Yc=;
 b=rAQnTA026eUuvS3ifFkIc/gPBn0SZWoGtFo2asvwYGTipNwfRfZfPXvMvT/iwxF6e+Cd9y
 Ezo5gCez2tMkRqAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A04703EA63;
 Fri,  6 Feb 2026 15:52:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id U/KxJVgOhmmWGAAAD6G6ig
 (envelope-from <rbranco@suse.de>); Fri, 06 Feb 2026 15:52:56 +0000
From: Ricardo Branco <rbranco@suse.de>
To: ltp@lists.linux.it
Date: Fri,  6 Feb 2026 16:52:40 +0100
Message-ID: <20260206155244.243291-1-rbranco@suse.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v2] userfaultfd: Add test using UFFDIO_POISON
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.59 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	R_SPF_ALLOW(-0.20)[+a:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[suse.de : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.de:-];
	ASN(0.00)[asn:12779, ipnet:2001:1418::/29, country:IT];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[rbranco@suse.de,ltp-bounces@lists.linux.it];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-ltp];
	NEURAL_HAM(-0.00)[-0.995];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[picard.linux.it:helo,picard.linux.it:rdns,pollfd.events:url]
X-Rspamd-Queue-Id: 756E6FFE80
X-Rspamd-Action: no action

Signed-off-by: Ricardo Branco <rbranco@suse.de>
---
 configure.ac                                  |   1 +
 include/lapi/userfaultfd.h                    |  13 ++
 .../kernel/syscalls/userfaultfd/.gitignore    |   1 +
 .../kernel/syscalls/userfaultfd/Makefile      |   1 +
 .../syscalls/userfaultfd/userfaultfd06.c      | 141 ++++++++++++++++++
 5 files changed, 157 insertions(+)
 create mode 100644 testcases/kernel/syscalls/userfaultfd/userfaultfd06.c

diff --git a/configure.ac b/configure.ac
index 7fa614dcb..94bcbcc98 100644
--- a/configure.ac
+++ b/configure.ac
@@ -278,6 +278,7 @@ AC_CHECK_TYPES([struct sockaddr_vm],,,[
 ])
 
 AC_CHECK_TYPES([struct uffdio_move],,,[#include <linux/userfaultfd.h>])
+AC_CHECK_TYPES([struct uffdio_poison],,,[#include <linux/userfaultfd.h>])
 AC_CHECK_TYPES([struct uffdio_writeprotect],,,[#include <linux/userfaultfd.h>])
 
 # Tools knobs
diff --git a/include/lapi/userfaultfd.h b/include/lapi/userfaultfd.h
index 0c9e34c84..aab3890b7 100644
--- a/include/lapi/userfaultfd.h
+++ b/include/lapi/userfaultfd.h
@@ -233,6 +233,19 @@ struct uffdio_writeprotect {
 };
 #endif	/* HAVE_STRUCT_UFFDIO_WRITEPROTECT */
 
+#ifndef HAVE_STRUCT_UFFDIO_POISON
+#define UFFD_FEATURE_POISON			(1<<14)
+#define _UFFDIO_POISON				(0x08)
+#define UFFDIO_POISON		_IOWR(UFFDIO, _UFFDIO_POISON, \
+				      struct uffdio_poison)
+struct uffdio_poison {
+        struct uffdio_range range;
+#define UFFDIO_POISON_MODE_DONTWAKE		((__u64)1<<0)
+        __u64 mode;
+        __s64 updated;
+};
+#endif	/* HAVE_STRUCT_UFFDIO_POISON */
+
 #define SAFE_USERFAULTFD(flags, retry) \
 	safe_userfaultfd(__FILE__, __LINE__, (flags), (retry))
 
diff --git a/testcases/kernel/syscalls/userfaultfd/.gitignore b/testcases/kernel/syscalls/userfaultfd/.gitignore
index fb2ae243b..bc32fdf3b 100644
--- a/testcases/kernel/syscalls/userfaultfd/.gitignore
+++ b/testcases/kernel/syscalls/userfaultfd/.gitignore
@@ -3,3 +3,4 @@
 /userfaultfd03
 /userfaultfd04
 /userfaultfd05
+/userfaultfd06
diff --git a/testcases/kernel/syscalls/userfaultfd/Makefile b/testcases/kernel/syscalls/userfaultfd/Makefile
index 96650a65a..3252e47df 100644
--- a/testcases/kernel/syscalls/userfaultfd/Makefile
+++ b/testcases/kernel/syscalls/userfaultfd/Makefile
@@ -16,3 +16,4 @@ userfaultfd02: CFLAGS += -pthread
 userfaultfd03: CFLAGS += -pthread
 userfaultfd04: CFLAGS += -pthread
 userfaultfd05: CFLAGS += -pthread
+userfaultfd06: CFLAGS += -pthread
diff --git a/testcases/kernel/syscalls/userfaultfd/userfaultfd06.c b/testcases/kernel/syscalls/userfaultfd/userfaultfd06.c
new file mode 100644
index 000000000..213ba77d7
--- /dev/null
+++ b/testcases/kernel/syscalls/userfaultfd/userfaultfd06.c
@@ -0,0 +1,141 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2026 SUSE LLC
+ * Author: Ricardo Branco <rbranco@suse.com>
+ */
+
+/*\
+ * Force a pagefault event and handle it using :manpage:`userfaultfd(2)`
+ * from a different thread testing UFFDIO_POISON.
+ */
+
+#include "config.h"
+#include <poll.h>
+#include <setjmp.h>
+#include <signal.h>
+#include <unistd.h>
+#include "tst_test.h"
+#include "tst_safe_macros.h"
+#include "tst_safe_pthread.h"
+#include "lapi/userfaultfd.h"
+
+static int page_size;
+static char *page;
+static int uffd;
+static volatile int poison_fault_seen;
+static volatile int sigbus_seen;
+static sigjmp_buf jmpbuf;
+static pthread_barrier_t barrier;
+
+static void sigbus_handler(int sig)
+{
+	if (sig == SIGBUS) {
+		sigbus_seen = 1;
+		siglongjmp(jmpbuf, 1);
+	}
+}
+
+static void set_pages(void)
+{
+	page_size = sysconf(_SC_PAGE_SIZE);
+	page = SAFE_MMAP(NULL, page_size, PROT_READ | PROT_WRITE,
+			MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+}
+
+static void reset_pages(void)
+{
+	if (page) {
+		SAFE_MUNMAP(page, page_size);
+		page = NULL;
+	}
+}
+
+static void *handle_thread(void)
+{
+	static struct uffd_msg msg;
+	struct uffdio_poison uffdio_poison = {};
+	struct pollfd pollfd;
+	int nready;
+
+	SAFE_PTHREAD_BARRIER_WAIT(&barrier);
+
+	pollfd.fd = uffd;
+	pollfd.events = POLLIN;
+	nready = poll(&pollfd, 1, -1);
+	if (nready == -1)
+		tst_brk(TBROK | TERRNO, "Error on poll");
+
+	SAFE_READ(1, uffd, &msg, sizeof(msg));
+
+	if (msg.event != UFFD_EVENT_PAGEFAULT)
+		tst_brk(TFAIL, "Received unexpected UFFD_EVENT %d", msg.event);
+
+	poison_fault_seen = 1;
+
+	/* Poison the page that triggered the fault */
+	uffdio_poison.range.start = msg.arg.pagefault.address & ~(page_size - 1);
+	uffdio_poison.range.len = page_size;
+
+	SAFE_IOCTL(uffd, UFFDIO_POISON, &uffdio_poison);
+
+	close(uffd);
+	return NULL;
+}
+
+static void run(void)
+{
+	pthread_t thr;
+	struct uffdio_api uffdio_api = {};
+	struct uffdio_register uffdio_register;
+	struct sigaction sa = {};
+	volatile char dummy;
+
+	sa.sa_handler = sigbus_handler;
+	sigemptyset(&sa.sa_mask);
+	SAFE_SIGACTION(SIGBUS, &sa, NULL);
+
+	set_pages();
+
+	uffd = SAFE_USERFAULTFD(O_CLOEXEC | O_NONBLOCK, false);
+
+	uffdio_api.api = UFFD_API;
+	uffdio_api.features = UFFD_FEATURE_POISON;
+
+	SAFE_IOCTL(uffd, UFFDIO_API, &uffdio_api);
+
+	uffdio_register.range.start = (unsigned long) page;
+	uffdio_register.range.len = page_size;
+	uffdio_register.mode = UFFDIO_REGISTER_MODE_MISSING;
+
+	SAFE_IOCTL(uffd, UFFDIO_REGISTER, &uffdio_register);
+
+	SAFE_PTHREAD_BARRIER_INIT(&barrier, NULL, 2);
+	SAFE_PTHREAD_CREATE(&thr, NULL, (void *) handle_thread, NULL);
+
+	SAFE_PTHREAD_BARRIER_WAIT(&barrier);
+
+	/* Try to read from the page: should trigger fault, get poisoned, then SIGBUS */
+	if (sigsetjmp(jmpbuf, 1) == 0) {
+		dummy = page[0];
+		(void)dummy;
+	}
+
+	SAFE_PTHREAD_JOIN(thr, NULL);
+	SAFE_PTHREAD_BARRIER_DESTROY(&barrier);
+	reset_pages();
+
+	if (poison_fault_seen && sigbus_seen) {
+		tst_res(TPASS, "POISON successfully triggered SIGBUS");
+	} else if (poison_fault_seen && !sigbus_seen) {
+		tst_res(TFAIL, "POISON fault seen but no SIGBUS received");
+	} else if (!poison_fault_seen && sigbus_seen) {
+		tst_res(TFAIL, "SIGBUS received but no poison fault seen");
+	} else {
+		tst_res(TFAIL, "No poison fault or SIGBUS observed");
+	}
+}
+
+static struct tst_test test = {
+	.test_all = run,
+	.min_kver = "6.6",
+};
-- 
2.53.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
