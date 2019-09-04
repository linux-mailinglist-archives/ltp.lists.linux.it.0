Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 06048A81EE
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Sep 2019 14:13:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9ED653C216C
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Sep 2019 14:13:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 5C7233C20A6
 for <ltp@lists.linux.it>; Wed,  4 Sep 2019 14:12:59 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 34A301A00E62
 for <ltp@lists.linux.it>; Wed,  4 Sep 2019 14:12:57 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A4111AC7F;
 Wed,  4 Sep 2019 12:12:56 +0000 (UTC)
From: Richard Palethorpe <rpalethorpe@suse.com>
To: ltp@lists.linux.it
Date: Wed,  4 Sep 2019 14:11:46 +0200
Message-Id: <20190904121147.26027-1-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20190823094621.21747-1-rpalethorpe@suse.com>
References: <20190823094621.21747-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v4 1/2] capability: Introduce capability API
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Allow users to easily ensure particular capabilities are either present or not
present during testing without requiring libcap.

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
Reviewed-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Reviewed-by: Jan Stancek <jstancek@redhat.com>
Reviewed-by: Li Wang <liwang@redhat.com>
Reviewed-by: Cyril Hrubis <chrubis@suse.cz>
Reviewed-by: Petr Vorel <pvorel@suse.cz>
---

V4: Request capabilities before setup, but still perform drops after setup.
    Also document this and add note about using tst_cap_action afterwards.

 doc/test-writing-guidelines.txt |  85 ++++++++++++++++++++++++
 include/lapi/capability.h       |  27 ++++++++
 include/tst_capability.h        |  48 ++++++++++++++
 include/tst_test.h              |   6 ++
 lib/tst_capability.c            | 114 ++++++++++++++++++++++++++++++++
 lib/tst_test.c                  |   6 ++
 6 files changed, 286 insertions(+)
 create mode 100644 include/lapi/capability.h
 create mode 100644 include/tst_capability.h
 create mode 100644 lib/tst_capability.c

diff --git a/doc/test-writing-guidelines.txt b/doc/test-writing-guidelines.txt
index 1e933c49e..a735b43bb 100644
--- a/doc/test-writing-guidelines.txt
+++ b/doc/test-writing-guidelines.txt
@@ -1769,6 +1769,91 @@ setting up the size or struct iovec, which is allocated recursively including
 the individual buffers as described by an '-1' terminated array of buffer
 sizes.
 
+2.2.32 Adding and removing capabilities
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+Some tests may require the presence or absence of particular
+capabilities. Using the API provided by 'tst_capability.h' the test author can
+try to ensure that some capabilities are either present or absent during the
+test.
+
+For example; below we try to create a raw socket, which requires
+CAP_NET_ADMIN. During setup we should be able to do it, then during run it
+should be impossible. The LTP capability library will check before setup that
+we have this capability, then after setup it will drop it.
+
+[source,c]
+--------------------------------------------------------------------------------
+#include "tst_test.h"
+#include "tst_capability.h"
+#include "tst_safe_net.h"
+
+#include "lapi/socket.h"
+
+static void run(void)
+{
+	TEST(socket(AF_INET, SOCK_RAW, 1));
+	if (TST_RET > -1) {
+		tst_res(TFAIL, "Created raw socket");
+	} else if (TST_ERR != EPERM) {
+		tst_res(TBROK | TTERRNO,
+			"Failed to create socket for wrong reason");
+	} else {
+		tst_res(TPASS | TTERRNO, "Didn't create raw socket");
+	}
+}
+
+static void setup(void)
+{
+	TEST(socket(AF_INET, SOCK_RAW, 1));
+	if (TST_RET < 0)
+		tst_brk(TCONF | TTERRNO, "We don't have CAP_NET_RAW to begin with");
+
+	SAFE_CLOSE(TST_RET);
+}
+
+static struct tst_test test = {
+	.setup = setup,
+	.test_all = run,
+	.caps = (struct tst_cap []) {
+		TST_CAP(TST_CAP_REQ, CAP_NET_RAW),
+		TST_CAP(TST_CAP_DROP, CAP_NET_RAW),
+		{}
+	},
+};
+--------------------------------------------------------------------------------
+
+Look at the test struct at the bottom. We have filled in the 'caps' field with
+a NULL terminated array containing two 'tst_cap' structs. 'TST_CAP_REQ'
+actions are executed before setup and 'TST_CAP_DROP' are executed after
+setup. This means it is possible to both request and drop a capability.
+
+[source,c]
+--------------------------------------------------------------------------------
+static struct tst_test test = {
+	.test_all = run,
+	.caps = (struct tst_cap []) {
+		TST_CAP(TST_CAP_REQ, CAP_NET_RAW),
+		TST_CAP(TST_CAP_DROP, CAP_SYS_ADMIN),
+		{}
+	},
+};
+--------------------------------------------------------------------------------
+
+Here we request 'CAP_NET_RAW', but drop 'CAP_SYS_ADMIN'. If the capability is
+in the permitted set, but not the effective set, the library will try to
+permit it. If it is not in the permitted set, then it will fail with 'TCONF'.
+
+This API does not require 'libcap' to be installed. However it has limited
+features relative to 'libcap'. It only tries to add or remove capabilities
+from the effective set. This means that tests which need to spawn child
+processes may have difficulties ensuring the correct capabilities are
+available to the children (see the capabilities (7) manual pages).
+
+However a lot of problems can be solved by using 'tst_cap_action(struct
+tst_cap  *cap)' directly which can be called at any time. This also helps if
+you wish to drop a capability at the begining of setup.
+
 2.3 Writing a testcase in shell
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
diff --git a/include/lapi/capability.h b/include/lapi/capability.h
new file mode 100644
index 000000000..02d7a9fda
--- /dev/null
+++ b/include/lapi/capability.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (c) 2019 Richard Palethorpe <rpalethorpe@suse.com>
+ */
+
+#ifndef LAPI_CAPABILITY_H
+#define LAPI_CAPABILITY_H
+
+#include "config.h"
+
+#ifdef HAVE_SYS_CAPABILITY_H
+# include <sys/capability.h>
+#endif
+
+#ifndef CAP_SYS_ADMIN
+# define CAP_SYS_ADMIN        21
+#endif
+
+#ifndef CAP_TO_INDEX
+# define CAP_TO_INDEX(x)     ((x) >> 5)
+#endif
+
+#ifndef CAP_TO_MASK
+# define CAP_TO_MASK(x)      (1 << ((x) & 31))
+#endif
+
+#endif
diff --git a/include/tst_capability.h b/include/tst_capability.h
new file mode 100644
index 000000000..3f772589c
--- /dev/null
+++ b/include/tst_capability.h
@@ -0,0 +1,48 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (c) 2019 Richard Palethorpe <rpalethorpe@suse.com>
+ */
+/**
+ * @file tst_capability.h
+ *
+ * Limited capability operations without libcap.
+ */
+
+#ifndef TST_CAPABILITY_H
+#define TST_CAPABILITY_H
+
+#include <stdint.h>
+
+#include "lapi/capability.h"
+
+#define TST_CAP_DROP 1
+#define TST_CAP_REQ  (1 << 1)
+
+#define TST_CAP(action, capability) {action, capability, #capability}
+
+struct tst_cap_user_header {
+	uint32_t version;
+	int pid;
+};
+
+struct tst_cap_user_data {
+	uint32_t effective;
+	uint32_t permitted;
+	uint32_t inheritable;
+};
+
+struct tst_cap {
+	uint32_t action;
+	uint32_t id;
+	char *name;
+};
+
+int tst_capget(struct tst_cap_user_header *hdr,
+	       struct tst_cap_user_data *data);
+int tst_capset(struct tst_cap_user_header *hdr,
+	       const struct tst_cap_user_data *data);
+
+void tst_cap_action(struct tst_cap *cap);
+void tst_cap_setup(struct tst_cap *cap, unsigned int action_mask);
+
+#endif
diff --git a/include/tst_test.h b/include/tst_test.h
index cdeaf6ad0..84acf2c59 100644
--- a/include/tst_test.h
+++ b/include/tst_test.h
@@ -36,6 +36,7 @@
 #include "tst_sys_conf.h"
 #include "tst_coredump.h"
 #include "tst_buffers.h"
+#include "tst_capability.h"
 
 /*
  * Reports testcase result.
@@ -206,6 +207,11 @@ struct tst_test {
 	 * NULL-terminated array to be allocated buffers.
 	 */
 	struct tst_buffers *bufs;
+
+	/*
+	 * NULL-terminated array of capability settings
+	 */
+	struct tst_cap *caps;
 };
 
 /*
diff --git a/lib/tst_capability.c b/lib/tst_capability.c
new file mode 100644
index 000000000..2b55849f7
--- /dev/null
+++ b/lib/tst_capability.c
@@ -0,0 +1,114 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2019 Richard Palethorpe <rpalethorpe@suse.com>
+ */
+
+#include <string.h>
+
+#define TST_NO_DEFAULT_MAIN
+#include "tst_test.h"
+#include "tst_capability.h"
+
+#include "lapi/syscalls.h"
+
+/**
+ * Get the capabilities as decided by hdr.
+ *
+ * Note that the memory pointed to by data should be large enough to store two
+ * structs.
+ */
+int tst_capget(struct tst_cap_user_header *hdr,
+	       struct tst_cap_user_data *data)
+{
+	return tst_syscall(__NR_capget, hdr, data);
+}
+
+/**
+ * Set the capabilities as decided by hdr and data
+ *
+ * Note that the memory pointed to by data should be large enough to store two
+ * structs.
+ */
+int tst_capset(struct tst_cap_user_header *hdr,
+	       const struct tst_cap_user_data *data)
+{
+	return tst_syscall(__NR_capset, hdr, data);
+}
+
+static void do_cap_drop(uint32_t *set, uint32_t mask, const struct tst_cap *cap)
+{
+	if (*set & mask) {
+		tst_res(TINFO, "Dropping %s(%d)", cap->name, cap->id);
+		*set &= ~mask;
+	}
+}
+
+static void do_cap_req(uint32_t *permitted, uint32_t *effective, uint32_t mask,
+		       const struct tst_cap *cap)
+{
+	if (!(*permitted & mask))
+		tst_brk(TCONF, "Need %s(%d)", cap->name, cap->id);
+
+	if (!(*effective & mask)) {
+		tst_res(TINFO, "Permitting %s(%d)", cap->name, cap->id);
+		*effective |= mask;
+	}
+}
+
+/**
+ * Add, check or remove capabilities
+ *
+ * Takes a NULL terminated array of structs which describe whether some
+ * capabilities are needed or not.
+ *
+ * It will attempt to drop or add capabilities to the effective set. It will
+ * try to detect if this is needed and whether it can or can't be done. If it
+ * clearly can not add a privilege to the effective set then it will return
+ * TCONF. However it may fail for some other reason and return TBROK.
+ *
+ * This only tries to change the effective set. Some tests may need to change
+ * the inheritable and ambient sets, so that child processes retain some
+ * capability.
+ */
+void tst_cap_action(struct tst_cap *cap)
+{
+	struct tst_cap_user_header hdr = {
+		.version = 0x20080522,
+		.pid = tst_syscall(__NR_gettid),
+	};
+	struct tst_cap_user_data cur[2] = { {0} };
+	struct tst_cap_user_data new[2] = { {0} };
+	uint32_t act = cap->action;
+	uint32_t *pE = &new[CAP_TO_INDEX(cap->id)].effective;
+	uint32_t *pP = &new[CAP_TO_INDEX(cap->id)].permitted;
+	uint32_t mask = CAP_TO_MASK(cap->id);
+
+	if (tst_capget(&hdr, cur))
+		tst_brk(TBROK | TTERRNO, "tst_capget()");
+
+	memcpy(new, cur, sizeof(new));
+
+	switch (act) {
+	case TST_CAP_DROP:
+		do_cap_drop(pE, mask, cap);
+		break;
+	case TST_CAP_REQ:
+		do_cap_req(pP, pE, mask, cap);
+		break;
+	default:
+		tst_brk(TBROK, "Unrecognised action %d", cap->action);
+	}
+
+	if (memcmp(cur, new, sizeof(new)) && tst_capset(&hdr, new))
+		tst_brk(TBROK | TERRNO, "tst_capset(%s)", cap->name);
+}
+
+void tst_cap_setup(struct tst_cap *caps, unsigned int action_mask)
+{
+	struct tst_cap *cap;
+
+	for (cap = caps; cap->action; cap++) {
+		if (cap->action & action_mask)
+			tst_cap_action(cap);
+	}
+}
diff --git a/lib/tst_test.c b/lib/tst_test.c
index 39f261472..81f6d28f8 100644
--- a/lib/tst_test.c
+++ b/lib/tst_test.c
@@ -891,11 +891,17 @@ static void do_test_setup(void)
 {
 	main_pid = getpid();
 
+	if (tst_test->caps)
+		tst_cap_setup(tst_test->caps, TST_CAP_REQ);
+
 	if (tst_test->setup)
 		tst_test->setup();
 
 	if (main_pid != getpid())
 		tst_brk(TBROK, "Runaway child in setup()!");
+
+	if (tst_test->caps)
+		tst_cap_setup(tst_test->caps, TST_CAP_DROP);
 }
 
 static void do_cleanup(void)
-- 
2.22.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
