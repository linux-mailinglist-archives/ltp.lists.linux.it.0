Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6878C945CB3
	for <lists+linux-ltp@lfdr.de>; Fri,  2 Aug 2024 13:00:25 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 192C13D1CFF
	for <lists+linux-ltp@lfdr.de>; Fri,  2 Aug 2024 13:00:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6E2453D1F46
 for <ltp@lists.linux.it>; Fri,  2 Aug 2024 12:59:15 +0200 (CEST)
Authentication-Results: in-4.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.223.130; helo=smtp-out1.suse.de;
 envelope-from=andrea.cervesato@suse.de; receiver=lists.linux.it)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id DCBEB1001599
 for <ltp@lists.linux.it>; Fri,  2 Aug 2024 12:59:14 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E90AE2119F;
 Fri,  2 Aug 2024 10:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1722596354; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4Rud/C+9sXalWtS4xPERrac2YyNoKiyyLBKUckaTCnY=;
 b=JBqnRKI3telfK1sx3yhjBbONhsyReuuL04ASXGv8c/8dnwC9fyQHkKAprhbFnrz0p4mLAl
 K8XRpD2o0HyAMtIBtsnetZaMViTHnQfJ2dbvW4m1ElNqE75KbwiuQzMknN/QgIIfMSJQO0
 QNS9GbQGC2abciHeaCruRFR55W2xbzU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1722596354;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4Rud/C+9sXalWtS4xPERrac2YyNoKiyyLBKUckaTCnY=;
 b=l5Jdw6r+ILdy1ZNqZjQl5pdtlkWWlV6KErShN6wxkhQN0It8qQhOKcaySwz1xY0NO9jqYt
 kSXP3H3yW99U5yAA==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=gs7sRfuH;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Vvoo28jT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1722596353; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4Rud/C+9sXalWtS4xPERrac2YyNoKiyyLBKUckaTCnY=;
 b=gs7sRfuH0gDPF0HJIF4/q3YQ6pSi85QnRGJkTF/D288XDQeapAN4oK+yLDV87zJZtO/7Gg
 WhSSmEnNvOa5ESzN15IeZTkN1rOmBusQkVNoB8FVNju9RG4ZjSRB3UE8MPWBI6rdBkWhkd
 NrTlSN5FzwS8hY/Oo2QwX9v7ib1ujQ8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1722596353;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4Rud/C+9sXalWtS4xPERrac2YyNoKiyyLBKUckaTCnY=;
 b=Vvoo28jTRXraPTeN0SyUmFMyKppmcUyh89qWnP580kPV6uQeznH7LLmByU/1LtEW5omyNP
 AFT1RfihjwG6Y2Ag==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7C53E13999;
 Fri,  2 Aug 2024 10:59:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id qBw3GAG8rGbRQgAAD6G6ig
 (envelope-from <andrea.cervesato@suse.de>); Fri, 02 Aug 2024 10:59:13 +0000
From: Andrea Cervesato <andrea.cervesato@suse.de>
Date: Fri, 02 Aug 2024 12:59:07 +0200
MIME-Version: 1.0
Message-Id: <20240802-fchmodat2-v6-4-dcb0293979b3@suse.com>
References: <20240802-fchmodat2-v6-0-dcb0293979b3@suse.com>
In-Reply-To: <20240802-fchmodat2-v6-0-dcb0293979b3@suse.com>
To: ltp@lists.linux.it
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4824;
 i=andrea.cervesato@suse.com; h=from:subject:message-id;
 bh=beCKX/qbnlnxNubmn9LKbS3EzKGDANS/nyJIwe0iNLc=;
 b=owEB7QES/pANAwAIAcvMGrIgs+ZGAcsmYgBmrLv9BHWZZuPqKW+n4muj4w2FTvbENOt8psuHe
 41tlRZaCFiJAbMEAAEIAB0WIQT1ysFzUKRW0sIb39jLzBqyILPmRgUCZqy7/QAKCRDLzBqyILPm
 RuVTC/0fmwnjv7h862i+V9VxxB+QeOdpuMZUwCicIWukznFkF9zJ82msjkSdebXDG0W2BuE2Nfy
 gf8UIuWQ2SkXCINlJXp8ot80Z1tkWceMXbiYUBosaFTBv5HNRUgY6e7foFOnJ/jFhFVoWQWeb+0
 Q92AD5Rkx6EaDCeypCnasWeq4knC9KuYeO3NxXTJxGl4gAUrPao+TgxuhPk8Xt9N/3JfvWg8l5f
 urbfp82JIU7eTpz2SvmQ+dLRYl4VHYmxNu5AbgLV9At+07973UGBbeD8rkwLDAdd/23ltuniSIH
 nyBfD8JhM4Zf/pbK9bJZV+De6ffbJEmyZaFhO5qRontKvambuK/yMIoN8NEp1FtY3HkzrZZdGO6
 idpm1GpQftkOptbTTyaPuSoMNc1zJwMMHEWKjVojRKxOaV784RZOwSKc1kqaHbbYYQN/P4eu6ZQ
 Hu96+7Rnp3oVrqJg/8RPqOk4+fUW209kj1nAKlp8y9xB1gG76TqqsoxZ0M98wN6xymPO8=
X-Developer-Key: i=andrea.cervesato@suse.com; a=openpgp;
 fpr=F5CAC17350A456D2C21BDFD8CBCC1AB220B3E646
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spam-Score: -4.51
X-Rspamd-Queue-Id: E90AE2119F
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 MIME_TRACE(0.00)[0:+]; TO_DN_SOME(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 RCVD_TLS_ALL(0.00)[]; RCPT_COUNT_THREE(0.00)[3];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.cz:email,suse.com:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v6 4/5] Add fchmodat2_01 test
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

This test verifies that fchmodat2() syscall is properly working with
AT_SYMLINK_NOFOLLOW on regular files. When AT_SYMLINK_NOFOLLOW is used
on symbolic links instead, we check for EOPNOTSUPP, since the feature is
not implemented for VFS.

Reviewed-by: Petr Vorel <pvorel@suse.cz>
Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.com>
---
 runtest/syscalls                                   |   2 +
 testcases/kernel/syscalls/fchmodat2/.gitignore     |   1 +
 testcases/kernel/syscalls/fchmodat2/Makefile       |   7 ++
 testcases/kernel/syscalls/fchmodat2/fchmodat2_01.c | 117 +++++++++++++++++++++
 4 files changed, 127 insertions(+)

diff --git a/runtest/syscalls b/runtest/syscalls
index 9b3cba667..50298d01e 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -270,6 +270,8 @@ fchmod06 fchmod06
 fchmodat01 fchmodat01
 fchmodat02 fchmodat02
 
+fchmodat2_01 fchmodat2_01
+
 fchown01 fchown01
 fchown01_16 fchown01_16
 fchown02 fchown02
diff --git a/testcases/kernel/syscalls/fchmodat2/.gitignore b/testcases/kernel/syscalls/fchmodat2/.gitignore
new file mode 100644
index 000000000..47d5e2427
--- /dev/null
+++ b/testcases/kernel/syscalls/fchmodat2/.gitignore
@@ -0,0 +1 @@
+fchmodat2_01
diff --git a/testcases/kernel/syscalls/fchmodat2/Makefile b/testcases/kernel/syscalls/fchmodat2/Makefile
new file mode 100644
index 000000000..8cf1b9024
--- /dev/null
+++ b/testcases/kernel/syscalls/fchmodat2/Makefile
@@ -0,0 +1,7 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# Copyright (C) 2024 SUSE LLC Andrea Cervesato <andrea.cervesato@suse.com>
+
+top_srcdir		?= ../../../..
+
+include $(top_srcdir)/include/mk/testcases.mk
+include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/fchmodat2/fchmodat2_01.c b/testcases/kernel/syscalls/fchmodat2/fchmodat2_01.c
new file mode 100644
index 000000000..f9f353e76
--- /dev/null
+++ b/testcases/kernel/syscalls/fchmodat2/fchmodat2_01.c
@@ -0,0 +1,117 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2024 SUSE LLC Andrea Cervesato <andrea.cervesato@suse.com>
+ */
+
+/*\
+ * [Description]
+ *
+ * This test verifies that fchmodat2() syscall is properly working with
+ * regular files, symbolic links and directories. AT_SYMLINK_NOFOLLOW is a
+ * special feature that is not enabled in VFS for symbolic links since
+ * (introduced by 5d1f903f75a8), so we only verify that EOPNOTSUPP is correctly
+ * raised when used on those particular files.
+ */
+
+#include "tst_test.h"
+#include "tst_safe_file_at.h"
+#include "lapi/fcntl.h"
+#include "lapi/stat.h"
+
+#define MNTPOINT "mntpoint"
+#define FNAME "myfile"
+#define SNAME "symlink"
+#define DNAME "mydir"
+#define DNAME_PATH MNTPOINT"/"DNAME
+
+static int fd_dir = -1;
+
+static void verify_mode(int dirfd, const char *path, mode_t mode)
+{
+	struct stat st;
+
+	SAFE_FSTATAT(dirfd, path, &st, AT_SYMLINK_NOFOLLOW);
+	TST_EXP_EQ_LI(st.st_mode, mode);
+}
+
+static void test_regular_file(void)
+{
+	tst_res(TINFO, "Using regular files");
+
+	SAFE_CHMOD(MNTPOINT"/"FNAME, 0640);
+
+	SAFE_FCHMODAT2(fd_dir, FNAME, 0700, 0);
+	verify_mode(fd_dir, FNAME, S_IFREG | 0700);
+
+	SAFE_FCHMODAT2(fd_dir, FNAME, 0700, AT_SYMLINK_NOFOLLOW);
+	verify_mode(fd_dir, FNAME, S_IFREG | 0700);
+}
+
+static void test_symbolic_link(void)
+{
+	tst_res(TINFO, "Using symbolic link");
+
+	SAFE_FCHMODAT2(fd_dir, SNAME, 0700, 0);
+	verify_mode(fd_dir, FNAME, S_IFREG | 0700);
+	verify_mode(fd_dir, SNAME, S_IFLNK | 0777);
+
+	TST_EXP_FAIL(tst_syscall(__NR_fchmodat2,
+		fd_dir, SNAME, 0640, AT_SYMLINK_NOFOLLOW),
+		EOPNOTSUPP);
+}
+
+static void test_empty_folder(void)
+{
+	tst_res(TINFO, "Using empty folder");
+
+	int fd;
+
+	SAFE_CHMOD(DNAME_PATH, 0640);
+	fd = SAFE_OPEN(DNAME_PATH, O_PATH | O_DIRECTORY, 0640);
+
+	SAFE_FCHMODAT2(fd, "", 0777, AT_EMPTY_PATH);
+	verify_mode(fd_dir, DNAME, S_IFDIR | 0777);
+
+	SAFE_CLOSE(fd);
+}
+
+static void run(void)
+{
+	test_regular_file();
+	test_empty_folder();
+	test_symbolic_link();
+}
+
+static void setup(void)
+{
+	fd_dir = SAFE_OPEN(MNTPOINT, O_PATH | O_DIRECTORY, 0640);
+
+	if (access(DNAME_PATH, F_OK) == -1)
+		SAFE_MKDIR(DNAME_PATH, 0640);
+
+	SAFE_TOUCH(MNTPOINT"/"FNAME, 0640, NULL);
+	SAFE_SYMLINKAT(FNAME, fd_dir, SNAME);
+}
+
+static void cleanup(void)
+{
+	SAFE_UNLINKAT(fd_dir, SNAME, 0);
+	SAFE_RMDIR(DNAME_PATH);
+
+	if (fd_dir != -1)
+		SAFE_CLOSE(fd_dir);
+}
+
+static struct tst_test test = {
+	.test_all = run,
+	.setup = setup,
+	.cleanup = cleanup,
+	.needs_root = 1,
+	.mntpoint = MNTPOINT,
+	.format_device = 1,
+	.all_filesystems = 1,
+	.tags = (const struct tst_tag[]) {
+		{"linux-git", "5d1f903f75a8"},
+		{}
+	}
+};

-- 
2.43.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
