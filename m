Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7843F864F
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Aug 2021 13:22:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 50E903C2FC3
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Aug 2021 13:22:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 02AE13C8DC4
 for <ltp@lists.linux.it>; Thu, 26 Aug 2021 13:22:14 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 663C11000F3B
 for <ltp@lists.linux.it>; Thu, 26 Aug 2021 13:22:14 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id F0D4720192
 for <ltp@lists.linux.it>; Thu, 26 Aug 2021 11:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1629976933; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZHQIPMEu+zcM9/rDa1DWlX4s7bI2ZbYeLRmBQIbWSo4=;
 b=b6oIx2SguouPkzs5y3Ep1q9o5W9tfidAF58z1ej+ARxuqyQ27UkSLfOz9epEOToYS/Yzk7
 ocEOUZjTDosj1/8G+orm71WDsEHRh0i3aCo9GIs+vPOC33M3AvgPB3q34xeiYSu4zU1Nu3
 GcB0y1sVLmUBXTuQHBqiBJXzQwuGIxc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1629976933;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZHQIPMEu+zcM9/rDa1DWlX4s7bI2ZbYeLRmBQIbWSo4=;
 b=mHJK7v46YY8sRfAo///ZLC4Rq+KU1gy2V+swbzi6NV2+XlpnJnL0Q0Do2vaJq7OUf/vYJu
 tjQ1F02StZLrfjDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DC3E5133A4
 for <ltp@lists.linux.it>; Thu, 26 Aug 2021 11:22:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id qNSUNGV5J2FEPgAAMHmgww
 (envelope-from <mdoucha@suse.cz>)
 for <ltp@lists.linux.it>; Thu, 26 Aug 2021 11:22:13 +0000
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 26 Aug 2021 13:22:12 +0200
Message-Id: <20210826112212.26394-4-mdoucha@suse.cz>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210826112212.26394-1-mdoucha@suse.cz>
References: <20210826112212.26394-1-mdoucha@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v2 4/4] Add test for CVE 2018-13405
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

Changes since v1:
- Run the test under nobody's primary group
- Set WORKDIR group owner to any unassigned gid
- Remove unnecessary parameter from file_test()
- Don't switch users in cleanup()

 runtest/cve                                |   1 +
 runtest/syscalls                           |   1 +
 testcases/kernel/syscalls/creat/.gitignore |   1 +
 testcases/kernel/syscalls/creat/creat09.c  | 110 +++++++++++++++++++++
 4 files changed, 113 insertions(+)
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
index 6762a234c..81c3a381b 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -134,6 +134,7 @@ creat05 creat05
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
index 000000000..d678101b7
--- /dev/null
+++ b/testcases/kernel/syscalls/creat/creat09.c
@@ -0,0 +1,110 @@
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
+#include "tst_uid.h"
+
+#define MODE_RWX        0777
+#define MODE_SGID       (S_ISGID|0777)
+
+#define WORKDIR		"testdir"
+#define CREAT_FILE	WORKDIR "/creat.tmp"
+#define OPEN_FILE	WORKDIR "/open.tmp"
+
+static gid_t free_gid;
+static int fd = -1;
+
+static void setup(void)
+{
+	struct stat buf;
+	struct passwd *ltpuser = SAFE_GETPWNAM("nobody");
+
+	free_gid = tst_get_free_gid(ltpuser->pw_gid);
+
+	/* Create directories and set permissions */
+	SAFE_MKDIR(WORKDIR, MODE_RWX);
+	SAFE_CHOWN(WORKDIR, ltpuser->pw_uid, free_gid);
+	SAFE_CHMOD(WORKDIR, MODE_SGID);
+	SAFE_STAT(WORKDIR, &buf);
+
+	if (!(buf.st_mode & S_ISGID))
+		tst_brk(TBROK, "%s: Setgid bit not set", WORKDIR);
+
+	if (buf.st_gid != free_gid) {
+		tst_brk(TBROK, "%s: Incorrect group, %u != %u", WORKDIR,
+			buf.st_gid, free_gid);
+	}
+
+	/* Switch user */
+	SAFE_SETGID(ltpuser->pw_gid);
+	SAFE_SETREUID(-1, ltpuser->pw_uid);
+}
+
+static void file_test(const char *name)
+{
+	struct stat buf;
+
+	SAFE_STAT(name, &buf);
+
+	if (buf.st_gid != free_gid) {
+		tst_res(TFAIL, "%s: Incorrect group, %u != %u", name,
+			buf.st_gid, free_gid);
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
+	file_test(CREAT_FILE);
+
+	fd = SAFE_OPEN(OPEN_FILE, O_CREAT | O_EXCL | O_RDWR, MODE_SGID);
+	file_test(OPEN_FILE);
+	SAFE_CLOSE(fd);
+
+	/* Cleanup between loops */
+	tst_purge_dir(WORKDIR);
+}
+
+static void cleanup(void)
+{
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
