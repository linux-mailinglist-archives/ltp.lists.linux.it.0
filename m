Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D1BFF31C6F1
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Feb 2021 08:48:03 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9A9AC3C5930
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Feb 2021 08:48:03 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 2ECCE3C58FF
 for <ltp@lists.linux.it>; Tue, 16 Feb 2021 08:48:02 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 776F21A00E46
 for <ltp@lists.linux.it>; Tue, 16 Feb 2021 08:48:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1613461681; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V4Xy7DYHHE6aWfCBWbaU1BuqVaFQujCRShZ/ML8uVrA=;
 b=WDE+OIK3LEsmON7F0jpe3/BEgQl9/E90jIfVG6l1qDvY4hpZhIt1PntJfJTU9jt2IdwLK4
 Ng+v0VZjNJQgf/A3/GijkdhyyIRe3uZbvBnFK3QCr+KrkVDBnlF+1T9ngXQkNmNYy+cd1L
 C7xC2pykpvA/oGezIHjH4pCGQpfMMu0=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E71FFAD73;
 Tue, 16 Feb 2021 07:48:00 +0000 (UTC)
To: ltp@lists.linux.it
Date: Tue, 16 Feb 2021 07:47:48 +0000
Message-Id: <20210216074748.6873-2-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210216074748.6873-1-rpalethorpe@suse.com>
References: <20210216074748.6873-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v2 2/2] close_range02: Add simpler test and Check
 invalid params
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
From: Richard Palethorpe via ltp <ltp@lists.linux.it>
Reply-To: Richard Palethorpe <rpalethorpe@suse.com>
Cc: Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

This adds some coverage for invalid parameters and a min fd above or
on the limits. There is also some overlap with close_range01, but this
test is simpler and has less requirements.

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
Reviewed-by: Petr Vorel <pvorel@suse.cz>
---

V2: Try Closing the path file descriptor at the end if it was opened
    to prevent hitting the FD limit with -i

This does not include a check for EMFILE during unsharing because it
only happens if the _system's_ maximum file count is reduced after
clone and before unshare. This should probably go into a separate
test. Also it seems like a corner case which is not likely to happen
in practice and can not be done without CAP_SYS_ADMIN AFAICT.

More tests could be added, but I think we can leave it to the fuzzers
to find where coverage is lacking now that we have the basics. Also
Cyrils and I discussed creating generic data copying tests which copy
data between various types of FD (file system files, pipes, sockets,
etc.)  using various system calls (e.g (vm)splice, send/recvmsg,
write) and these could also use close_range() in addtion to close(). I
think that would be more productive than adding just to
close_range.

 runtest/syscalls                              |   1 +
 .../kernel/syscalls/close_range/.gitignore    |   1 +
 .../syscalls/close_range/close_range02.c      | 116 ++++++++++++++++++
 3 files changed, 118 insertions(+)
 create mode 100644 testcases/kernel/syscalls/close_range/close_range02.c

diff --git a/runtest/syscalls b/runtest/syscalls
index c71f2b371..ae47a6d5e 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -121,6 +121,7 @@ close02 close02
 close08 close08
 
 close_range01 close_range01
+close_range02 close_range02
 
 confstr01 confstr01
 
diff --git a/testcases/kernel/syscalls/close_range/.gitignore b/testcases/kernel/syscalls/close_range/.gitignore
index dddc1b7f8..4b8bab442 100644
--- a/testcases/kernel/syscalls/close_range/.gitignore
+++ b/testcases/kernel/syscalls/close_range/.gitignore
@@ -1 +1,2 @@
 close_range01
+close_range02
\ No newline at end of file
diff --git a/testcases/kernel/syscalls/close_range/close_range02.c b/testcases/kernel/syscalls/close_range/close_range02.c
new file mode 100644
index 000000000..780da68ff
--- /dev/null
+++ b/testcases/kernel/syscalls/close_range/close_range02.c
@@ -0,0 +1,116 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2021 SUSE LLC
+ */
+/*\
+ * [DESCRIPTION]
+ *
+ * - First check close_range works on a valid range.
+ * - Then check close_range does not accept invalid paramters.
+ * - Then check it accepts a large lower fd.
+ * - Finally check CLOEXEC works
+ *
+\*/
+
+#include <stdlib.h>
+
+#include "tst_test.h"
+#include "tst_clone.h"
+#include "lapi/fcntl.h"
+#include "lapi/close_range.h"
+#include "lapi/clone.h"
+
+static int try_close_range(int fd, int flags)
+{
+	int res;
+
+	TEST(close_range(fd, fd, flags));
+
+	if (TST_RET == -1 && TST_ERR == EINVAL)
+		res = TCONF;
+	else if (TST_RET == -1)
+		res = TFAIL;
+	else
+		res = TPASS;
+
+	return res;
+}
+
+static void run(unsigned int n)
+{
+	const struct tst_clone_args args = {
+		.flags = CLONE_FILES,
+		.exit_signal = SIGCHLD,
+	};
+	int fd = -1, res;
+
+	switch (n) {
+	case 0:
+		fd = SAFE_OPEN("/", O_PATH);
+		SAFE_DUP2(fd, 100);
+
+		TST_EXP_PASS(close_range(fd, 100, 0),
+			     "close_range(%d, 100, 0)", fd);
+		TST_EXP_FAIL(fcntl(fd, F_GETFD), EBADF,
+			     "fcntl(%d, F_GETFD)", fd);
+		TST_EXP_FAIL(fcntl(100, F_GETFD), EBADF);
+		break;
+	case 1:
+		TST_EXP_FAIL(close_range(4, 3, 0), EINVAL);
+		break;
+	case 2:
+		TST_EXP_FAIL(close_range(3, ~0U, ~0U), EINVAL);
+		break;
+	case 3:
+		TST_EXP_PASS(close_range(~0U, ~0U, 0));
+		break;
+	case 4:
+		fd = SAFE_OPEN("/", O_PATH);
+
+		res = try_close_range(fd, CLOSE_RANGE_CLOEXEC);
+		tst_res(res | TTERRNO,
+			"close_range(%d, %d, CLOSE_RANGE_CLOEXEC)", fd, fd);
+
+		if (res != TPASS)
+			break;
+
+		TST_EXP_FD_SILENT(fcntl(fd, F_GETFD), "fcntl(%d, F_GETFD)", fd);
+		if (TST_RET & FD_CLOEXEC)
+			tst_res(TPASS, "FD_CLOEXEC was set on %d", fd);
+		else
+			tst_res(TFAIL, "FD_CLOEXEC not set on %d", fd);
+		break;
+	case 5:
+		fd = SAFE_OPEN("/", O_PATH);
+
+		if (!SAFE_CLONE(&args)) {
+			res = try_close_range(fd, CLOSE_RANGE_UNSHARE);
+			tst_res(res | TTERRNO,
+				"close_range(%d, %d, CLOSE_RANGE_UNSHARE)",
+				fd, fd);
+
+			if (res != TPASS)
+				exit(0);
+
+			TST_EXP_FAIL(fcntl(fd, F_GETFD), EBADF,
+				     "fcntl(%d, F_GETFD)", fd);
+			exit(0);
+		}
+
+		tst_reap_children();
+
+		TST_EXP_PASS(fcntl(fd, F_GETFD), "%d is open", fd);
+	}
+
+	if (fd > -1) {
+		TST_EXP_PASS_SILENT(close_range(fd, fd, 0),
+				    "close_range(%d, %d, 0)", fd, fd);
+		fd = -1;
+	}
+}
+
+static struct tst_test test = {
+	.tcnt = 6,
+	.forks_child = 1,
+	.test = run,
+};
-- 
2.30.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
