Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 245F13E2DE7
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Aug 2021 17:46:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D98AA3CA3BA
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Aug 2021 17:46:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 8FBFD3C6873
 for <ltp@lists.linux.it>; Fri,  6 Aug 2021 17:45:59 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 0B1381A014C0
 for <ltp@lists.linux.it>; Fri,  6 Aug 2021 17:45:58 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5836A1FEDC
 for <ltp@lists.linux.it>; Fri,  6 Aug 2021 15:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1628264758; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B8qypNDDI/6wFxw/s7lBebi25GWVK5MegJG9S1WHdxY=;
 b=iv47W5ETBk2pjaaSdOl5ZqWQlkDORTdLyq1QtWbMorO2HCQYHCw+7XsIu1n/6g3SVyTBLT
 DH2Xz0EqEHRlQsVanZUXzY1PKPnlhCpUzLVtpXF6y4aYGSXbhjw5ofGP7lXVUONref8RQ8
 VbNgsEcyvFsyK+bx4Y6l91KI0dR2beg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1628264758;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B8qypNDDI/6wFxw/s7lBebi25GWVK5MegJG9S1WHdxY=;
 b=zjRlfJQxHvdJOvQBjVoWnPh4gp8H5A+PDIKPTa26fRv+ywKRLbklVkS2hC09aqqeTB6yDv
 e+8mgnKJ2Eyp3QBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 37E9913A8E
 for <ltp@lists.linux.it>; Fri,  6 Aug 2021 15:45:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id uOG4DDZZDWG6WwAAMHmgww
 (envelope-from <mdoucha@suse.cz>)
 for <ltp@lists.linux.it>; Fri, 06 Aug 2021 15:45:58 +0000
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Fri,  6 Aug 2021 17:45:57 +0200
Message-Id: <20210806154557.19551-3-mdoucha@suse.cz>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210806154557.19551-1-mdoucha@suse.cz>
References: <20210806154557.19551-1-mdoucha@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 3/3] Add test for CVE 2018-13405
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

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---
 runtest/cve                                |   1 +
 runtest/syscalls                           |   1 +
 testcases/kernel/syscalls/creat/.gitignore |   1 +
 testcases/kernel/syscalls/creat/creat09.c  | 115 +++++++++++++++++++++
 4 files changed, 118 insertions(+)
 create mode 100644 testcases/kernel/syscalls/creat/creat09.c

diff --git a/runtest/cve b/runtest/cve
index c27f58d8d..42c8eedbe 100644
--- a/runtest/cve
+++ b/runtest/cve
@@ -55,6 +55,7 @@ cve-2018-1000001 realpath01
 cve-2018-1000199 ptrace08
 cve-2018-1000204 ioctl_sg01
 cve-2018-12896 timer_settime03
+cve-2018-13405 creat09
 cve-2018-18445 bpf_prog04
 cve-2018-18559 bind06
 cve-2018-18955 userns08
diff --git a/runtest/syscalls b/runtest/syscalls
index 9af5aa5c0..161794f2a 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -136,6 +136,7 @@ creat05 creat05
 creat06 creat06
 creat07 creat07
 creat08 creat08
+creat09 creat09
 
 delete_module01 delete_module01
 delete_module02 delete_module02
diff --git a/testcases/kernel/syscalls/creat/.gitignore b/testcases/kernel/syscalls/creat/.gitignore
index a39e63590..caafc02b6 100644
--- a/testcases/kernel/syscalls/creat/.gitignore
+++ b/testcases/kernel/syscalls/creat/.gitignore
@@ -6,3 +6,4 @@
 /creat07
 /creat07_child
 /creat08
+/creat09
diff --git a/testcases/kernel/syscalls/creat/creat09.c b/testcases/kernel/syscalls/creat/creat09.c
new file mode 100644
index 000000000..6255d8784
--- /dev/null
+++ b/testcases/kernel/syscalls/creat/creat09.c
@@ -0,0 +1,115 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2021 SUSE LLC <mdoucha@suse.cz>
+ *
+ * CVE-2018-13405
+ *
+ * Check for possible privilege escalation through creating files with setgid
+ * bit set inside a setgid directory owned by a group which the user does not
+ * belong to. Fixed in:
+ *
+ *  commit 0fa3ecd87848c9c93c2c828ef4c3a8ca36ce46c7
+ *  Author: Linus Torvalds <torvalds@linux-foundation.org>
+ *  Date:   Tue Jul 3 17:10:19 2018 -0700
+ *
+ *  Fix up non-directory creation in SGID directories
+ */
+
+#include <stdlib.h>
+#include <sys/types.h>
+#include <pwd.h>
+#include "tst_test.h"
+
+#define MODE_RWX        0777
+#define MODE_SGID       (S_ISGID|0777)
+
+#define WORKDIR		"testdir"
+#define CREAT_FILE	WORKDIR "/creat.tmp"
+#define OPEN_FILE	WORKDIR "/open.tmp"
+
+static uid_t orig_uid;
+static gid_t bin_gid;
+static int fd = -1;
+
+static void setup(void)
+{
+	struct stat buf;
+	struct passwd *ltpuser = SAFE_GETPWNAM("nobody");
+	struct group *ltpgroup = SAFE_GETGRNAM("bin");
+
+	orig_uid = getuid();
+	bin_gid = ltpgroup->gr_gid;
+
+	/* Create directories and set permissions */
+	SAFE_MKDIR(WORKDIR, MODE_RWX);
+	SAFE_CHOWN(WORKDIR, ltpuser->pw_uid, bin_gid);
+	SAFE_CHMOD(WORKDIR, MODE_SGID);
+	SAFE_STAT(WORKDIR, &buf);
+
+	if (!(buf.st_mode & S_ISGID))
+		tst_brk(TBROK, "%s: Setgid bit not set", WORKDIR);
+
+	if (buf.st_gid != bin_gid) {
+		tst_brk(TBROK, "%s: Incorrect group, %u != %u", WORKDIR,
+			buf.st_gid, bin_gid);
+	}
+
+	/* Switch user */
+	ltpgroup = SAFE_GETGRNAM_FALLBACK("nobody", "nogroup");
+	SAFE_SETGID(ltpgroup->gr_gid);
+	SAFE_SETREUID(-1, ltpuser->pw_uid);
+}
+
+static void file_test(const char *name, gid_t gid)
+{
+	struct stat buf;
+
+	SAFE_STAT(name, &buf);
+
+	if (buf.st_gid != gid) {
+		tst_res(TFAIL, "%s: Incorrect group, %u != %u", name,
+			buf.st_gid, gid);
+	} else {
+		tst_res(TPASS, "%s: Owned by correct group", name);
+	}
+
+	if (buf.st_mode & S_ISGID)
+		tst_res(TFAIL, "%s: Setgid bit is set", name);
+	else
+		tst_res(TPASS, "%s: Setgid bit not set", name);
+}
+
+static void run(void)
+{
+	fd = SAFE_CREAT(CREAT_FILE, MODE_SGID);
+	SAFE_CLOSE(fd);
+	file_test(CREAT_FILE, bin_gid);
+
+	fd = SAFE_OPEN(OPEN_FILE, O_CREAT | O_EXCL | O_RDWR, MODE_SGID);
+	file_test(OPEN_FILE, bin_gid);
+	SAFE_CLOSE(fd);
+
+	/* Cleanup between loops */
+	tst_purge_dir(WORKDIR);
+}
+
+static void cleanup(void)
+{
+	SAFE_SETREUID(-1, orig_uid);
+
+	if (fd >= 0)
+		SAFE_CLOSE(fd);
+}
+
+static struct tst_test test = {
+	.test_all = run,
+	.setup = setup,
+	.cleanup = cleanup,
+	.needs_root = 1,
+	.needs_tmpdir = 1,
+	.tags = (const struct tst_tag[]) {
+		{"linux-git", "0fa3ecd87848"},
+		{"CVE", "2018-13405"},
+		{}
+	},
+};
-- 
2.32.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
