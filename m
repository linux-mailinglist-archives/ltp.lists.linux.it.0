Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 264DB942A3D
	for <lists+linux-ltp@lfdr.de>; Wed, 31 Jul 2024 11:21:08 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DDECF3D1E73
	for <lists+linux-ltp@lfdr.de>; Wed, 31 Jul 2024 11:21:07 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 51FA83D1E5C
 for <ltp@lists.linux.it>; Wed, 31 Jul 2024 11:20:50 +0200 (CEST)
Authentication-Results: in-4.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=2a07:de40:b251:101:10:150:64:1; helo=smtp-out1.suse.de;
 envelope-from=chrubis@suse.cz; receiver=lists.linux.it)
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 4C72210085F1
 for <ltp@lists.linux.it>; Wed, 31 Jul 2024 11:20:49 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 32B4721CCC
 for <ltp@lists.linux.it>; Wed, 31 Jul 2024 09:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1722417648; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VHkXZ5L6Vz9O2tq8pv0j91TzolX6AjaEE+NuKdmgEx8=;
 b=megVemn1D/kIFeaYD/3mFJ93YS1+uLUII5I2EV07n6E6Iz1QbI6k5xV0uhuk1jUxeZ9yMC
 uCtrcYTJcdCT3stHRUb6bNDp4xyW6sKM73+lIlP0KD4DEgfEAoQeJopgz5fG+HN6AVe7VK
 319CVcfu0jrxpw2hCwGYyln+jBXyYIQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1722417648;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VHkXZ5L6Vz9O2tq8pv0j91TzolX6AjaEE+NuKdmgEx8=;
 b=+pmcXo2HIOyd3p5Atf2WHI041+4wE1CIY/O33iRXNSU9Cq2lC9Frcx5quWQogpruzvW9FH
 +elK4uZO8Z/pwnAg==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=mnCsNENw;
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=T0SKEn+k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1722417647; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VHkXZ5L6Vz9O2tq8pv0j91TzolX6AjaEE+NuKdmgEx8=;
 b=mnCsNENwmLK/GL/eaBDPYaZceIV/Kmd0goF2LRF+IIMvmwa+U+GsIQR6516fjaEbM4DovU
 xcnWutUuAtXB1prKRc4hEdhAjetnLpXl9+3gZtoWwPlr25VLpQhknV3z3vYXo81ZtqP29y
 eTVHduPxTfdWebwPYNdFbP/ukJt2eiU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1722417647;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VHkXZ5L6Vz9O2tq8pv0j91TzolX6AjaEE+NuKdmgEx8=;
 b=T0SKEn+klPrOfiaF6PCN7XbLDwXf3vw6EqDMNDhIFuwJx8PbqBRlYV9VCvV+Y72Z4HsFwa
 hGn35VySl/Jp3ZCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1FDE41368F
 for <ltp@lists.linux.it>; Wed, 31 Jul 2024 09:20:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id E47PBu8BqmZbGQAAD6G6ig
 (envelope-from <chrubis@suse.cz>)
 for <ltp@lists.linux.it>; Wed, 31 Jul 2024 09:20:47 +0000
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 31 Jul 2024 11:20:15 +0200
Message-ID: <20240731092017.8267-2-chrubis@suse.cz>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240731092017.8267-1-chrubis@suse.cz>
References: <20240731092017.8267-1-chrubis@suse.cz>
MIME-Version: 1.0
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 32B4721CCC
X-Spam-Score: -2.81
X-Spam-Level: 
X-Spamd-Result: default: False [-2.81 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 MIME_GOOD(-0.10)[text/plain]; MX_GOOD(-0.01)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:email,suse.cz:dkim];
 FUZZY_BLOCKED(0.00)[rspamd.com]; MIME_TRACE(0.00)[0:+];
 RCPT_COUNT_ONE(0.00)[1]; RCVD_VIA_SMTP_AUTH(0.00)[];
 ARC_NA(0.00)[];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
 PREVIOUSLY_DELIVERED(0.00)[ltp@lists.linux.it];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 RCVD_TLS_ALL(0.00)[]; TO_DN_NONE(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_TRACE(0.00)[suse.cz:+]
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH 1/3] Add support for mixing C and shell code
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

This is a proof of a concept of a seamless C and shell integration. The
idea is that with this you can mix shell and C code as much as as you
wish to get the best of the two worlds.

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 include/tst_test.h                           | 38 +++++++++++++
 lib/tst_test.c                               | 51 +++++++++++++++++
 testcases/lib/.gitignore                     |  1 +
 testcases/lib/Makefile                       |  4 +-
 testcases/lib/run_tests.sh                   | 11 ++++
 testcases/lib/tests/.gitignore               |  6 ++
 testcases/lib/tests/Makefile                 | 11 ++++
 testcases/lib/tests/shell_test01.c           | 17 ++++++
 testcases/lib/tests/shell_test02.c           | 18 ++++++
 testcases/lib/tests/shell_test03.c           | 25 +++++++++
 testcases/lib/tests/shell_test04.c           | 18 ++++++
 testcases/lib/tests/shell_test05.c           | 27 +++++++++
 testcases/lib/tests/shell_test06.c           | 16 ++++++
 testcases/lib/tests/shell_test_brk.sh        |  6 ++
 testcases/lib/tests/shell_test_check_argv.sh | 23 ++++++++
 testcases/lib/tests/shell_test_checkpoint.sh |  7 +++
 testcases/lib/tests/shell_test_pass.sh       |  6 ++
 testcases/lib/tst_env.sh                     | 21 +++++++
 testcases/lib/tst_res_.c                     | 58 ++++++++++++++++++++
 19 files changed, 362 insertions(+), 2 deletions(-)
 create mode 100755 testcases/lib/run_tests.sh
 create mode 100644 testcases/lib/tests/.gitignore
 create mode 100644 testcases/lib/tests/Makefile
 create mode 100644 testcases/lib/tests/shell_test01.c
 create mode 100644 testcases/lib/tests/shell_test02.c
 create mode 100644 testcases/lib/tests/shell_test03.c
 create mode 100644 testcases/lib/tests/shell_test04.c
 create mode 100644 testcases/lib/tests/shell_test05.c
 create mode 100644 testcases/lib/tests/shell_test06.c
 create mode 100755 testcases/lib/tests/shell_test_brk.sh
 create mode 100755 testcases/lib/tests/shell_test_check_argv.sh
 create mode 100755 testcases/lib/tests/shell_test_checkpoint.sh
 create mode 100755 testcases/lib/tests/shell_test_pass.sh
 create mode 100644 testcases/lib/tst_env.sh
 create mode 100644 testcases/lib/tst_res_.c

diff --git a/include/tst_test.h b/include/tst_test.h
index 6c76f043d..a334195ac 100644
--- a/include/tst_test.h
+++ b/include/tst_test.h
@@ -331,6 +331,8 @@ struct tst_fs {
  * @child_needs_reinit: Has to be set if the test needs to call tst_reinit()
  *                      from a process started by exec().
  *
+ * @runs_script: Implies child_needs_reinit and forks_child at the moment.
+ *
  * @needs_devfs: If set the devfs is mounted at tst_test.mntpoint. This is
  *               needed for tests that need to create device files since tmpfs
  *               at /tmp is usually mounted with 'nodev' option.
@@ -518,6 +520,7 @@ struct tst_fs {
 	unsigned int mount_device:1;
 	unsigned int needs_rofs:1;
 	unsigned int child_needs_reinit:1;
+	unsigned int runs_script:1;
 	unsigned int needs_devfs:1;
 	unsigned int restore_wallclock:1;
 
@@ -526,6 +529,8 @@ struct tst_fs {
 	unsigned int skip_in_lockdown:1;
 	unsigned int skip_in_secureboot:1;
 	unsigned int skip_in_compat:1;
+
+
 	int needs_abi_bits;
 
 	unsigned int needs_hugetlbfs:1;
@@ -611,6 +616,39 @@ void tst_run_tcases(int argc, char *argv[], struct tst_test *self)
  */
 void tst_reinit(void);
 
+/**
+ * tst_run_shell() - Prepare the environment and execute a shell script.
+ *
+ * @script_name: A filename of the script.
+ * @params: A NULL terminated array of shell script parameters, pass NULL if
+ *          none are needed. This what is passed starting from argv[1].
+ *
+ * The shell script is executed with LTP_IPC_PATH in environment so that the
+ * binary helpers such as tst_res_ or tst_checkpoint work properly when executed
+ * from the script. This also means that the tst_test.runs_script flag needs to
+ * be set.
+ *
+ * The shell script itself has to source the tst_env.sh shell script at the
+ * start and after that it's free to use tst_res in the same way C code would
+ * use.
+ *
+ * Example shell script that reports success::
+ *
+ *   #!/bin/sh
+ *   . tst_env.sh
+ *
+ *   tst_res TPASS "Example test works"
+ *
+ * The call returns a pid in a case that you want to examine the return value
+ * of the script yourself. If you do not need to check the return value
+ * yourself you can use tst_reap_children() to wait for the completion. Or let
+ * the test library collect the child automatically, just be wary that the
+ * script and the test both runs concurently at the same time in this case.
+ *
+ * Return: A pid of the shell process.
+ */
+int tst_run_shell(char *script_name, char *const params[]);
+
 unsigned int tst_multiply_timeout(unsigned int timeout);
 
 /*
diff --git a/lib/tst_test.c b/lib/tst_test.c
index e5bc5bf4d..7e1075fdf 100644
--- a/lib/tst_test.c
+++ b/lib/tst_test.c
@@ -4,6 +4,8 @@
  * Copyright (c) Linux Test Project, 2016-2024
  */
 
+#define _GNU_SOURCE
+
 #include <limits.h>
 #include <stdio.h>
 #include <stdarg.h>
@@ -173,6 +175,50 @@ void tst_reinit(void)
 	SAFE_CLOSE(fd);
 }
 
+extern char **environ;
+
+static unsigned int params_array_len(char *const array[])
+{
+	unsigned int ret = 0;
+
+	if (!array)
+		return 0;
+
+	while (*(array++))
+		ret++;
+
+	return ret;
+}
+
+int tst_run_shell(char *script_name, char *const params[])
+{
+	int pid;
+	unsigned int i, params_len = params_array_len(params);
+	char *argv[params_len + 2];
+
+	if (!tst_test->runs_script)
+		tst_brk(TBROK, "runs_script flag must be set!");
+
+	argv[0] = script_name;
+
+	if (params) {
+		for (i = 0; i < params_len; i++)
+			argv[i+1] = params[i];
+	}
+
+	argv[params_len+1] = NULL;
+
+	pid = SAFE_FORK();
+	if (pid)
+		return pid;
+
+	execvpe(script_name, argv, environ);
+
+	tst_brk(TBROK | TERRNO, "execvpe(%s, ...) failed!", script_name);
+
+	return -1;
+}
+
 static void update_results(int ttype)
 {
 	if (!results)
@@ -1224,6 +1270,11 @@ static void do_setup(int argc, char *argv[])
 		tdebug = 1;
 	}
 
+	if (tst_test->runs_script) {
+		tst_test->child_needs_reinit = 1;
+		tst_test->forks_child = 1;
+	}
+
 	if (tst_test->needs_kconfigs && tst_kconfig_check(tst_test->needs_kconfigs))
 		tst_brk(TCONF, "Aborting due to unsuitable kernel config, see above!");
 
diff --git a/testcases/lib/.gitignore b/testcases/lib/.gitignore
index e8afd06f3..d0dacf62a 100644
--- a/testcases/lib/.gitignore
+++ b/testcases/lib/.gitignore
@@ -23,3 +23,4 @@
 /tst_sleep
 /tst_supported_fs
 /tst_timeout_kill
+/tst_res_
diff --git a/testcases/lib/Makefile b/testcases/lib/Makefile
index 990b46089..928d76d62 100644
--- a/testcases/lib/Makefile
+++ b/testcases/lib/Makefile
@@ -13,6 +13,6 @@ MAKE_TARGETS		:= tst_sleep tst_random tst_checkpoint tst_rod tst_kvcmp\
 			   tst_getconf tst_supported_fs tst_check_drivers tst_get_unused_port\
 			   tst_get_median tst_hexdump tst_get_free_pids tst_timeout_kill\
 			   tst_check_kconfigs tst_cgctl tst_fsfreeze tst_ns_create tst_ns_exec\
-			   tst_ns_ifmove tst_lockdown_enabled tst_secureboot_enabled
+			   tst_ns_ifmove tst_lockdown_enabled tst_secureboot_enabled tst_res_
 
-include $(top_srcdir)/include/mk/generic_leaf_target.mk
+include $(top_srcdir)/include/mk/generic_trunk_target.mk
diff --git a/testcases/lib/run_tests.sh b/testcases/lib/run_tests.sh
new file mode 100755
index 000000000..60e7d1bcf
--- /dev/null
+++ b/testcases/lib/run_tests.sh
@@ -0,0 +1,11 @@
+#!/bin/sh
+
+testdir=$(realpath $(dirname $0))
+export PATH=$PATH:$testdir:$testdir/tests/
+
+for i in `seq -w 01 06`; do
+	echo
+	echo "*** Running shell_test$i ***"
+	echo
+	./tests/shell_test$i
+done
diff --git a/testcases/lib/tests/.gitignore b/testcases/lib/tests/.gitignore
new file mode 100644
index 000000000..da967c4d6
--- /dev/null
+++ b/testcases/lib/tests/.gitignore
@@ -0,0 +1,6 @@
+shell_test01
+shell_test02
+shell_test03
+shell_test04
+shell_test05
+shell_test06
diff --git a/testcases/lib/tests/Makefile b/testcases/lib/tests/Makefile
new file mode 100644
index 000000000..5a5cf5310
--- /dev/null
+++ b/testcases/lib/tests/Makefile
@@ -0,0 +1,11 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# Copyright (C) 2009, Cisco Systems Inc.
+# Ngie Cooper, August 2009
+
+top_srcdir		?= ../../..
+
+include $(top_srcdir)/include/mk/testcases.mk
+
+INSTALL_TARGETS=
+
+include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/lib/tests/shell_test01.c b/testcases/lib/tests/shell_test01.c
new file mode 100644
index 000000000..53c092783
--- /dev/null
+++ b/testcases/lib/tests/shell_test01.c
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Shell test example.
+ */
+
+#include "tst_test.h"
+
+static void run_test(void)
+{
+	tst_run_shell("shell_test_pass.sh", NULL);
+	tst_res(TINFO, "C test exits now");
+}
+
+static struct tst_test test = {
+	.runs_script = 1,
+	.test_all = run_test,
+};
diff --git a/testcases/lib/tests/shell_test02.c b/testcases/lib/tests/shell_test02.c
new file mode 100644
index 000000000..1bc300ed3
--- /dev/null
+++ b/testcases/lib/tests/shell_test02.c
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Shell test example.
+ */
+
+#include "tst_test.h"
+
+static void run_test(void)
+{
+	tst_run_shell("shell_test_pass.sh", NULL);
+	tst_reap_children();
+	tst_res(TINFO, "Shell test has finished at this point!");
+}
+
+static struct tst_test test = {
+	.runs_script = 1,
+	.test_all = run_test,
+};
diff --git a/testcases/lib/tests/shell_test03.c b/testcases/lib/tests/shell_test03.c
new file mode 100644
index 000000000..2faa5e84c
--- /dev/null
+++ b/testcases/lib/tests/shell_test03.c
@@ -0,0 +1,25 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Shell test example.
+ */
+
+#include <sys/wait.h>
+#include "tst_test.h"
+
+static void run_test(void)
+{
+	int pid, status;
+
+	pid = tst_run_shell("shell_test_pass.sh", NULL);
+
+	tst_res(TINFO, "Waiting for the pid %i", pid);
+
+	waitpid(pid, &status, 0);
+
+	tst_res(TINFO, "Shell test has %s", tst_strstatus(status));
+}
+
+static struct tst_test test = {
+	.runs_script = 1,
+	.test_all = run_test,
+};
diff --git a/testcases/lib/tests/shell_test04.c b/testcases/lib/tests/shell_test04.c
new file mode 100644
index 000000000..beb4d783d
--- /dev/null
+++ b/testcases/lib/tests/shell_test04.c
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Shell test example.
+ */
+
+#include "tst_test.h"
+
+static void run_test(void)
+{
+	char *const params[] = {"param1", "param2", NULL};
+
+	tst_run_shell("shell_test_check_argv.sh", params);
+}
+
+static struct tst_test test = {
+	.runs_script = 1,
+	.test_all = run_test,
+};
diff --git a/testcases/lib/tests/shell_test05.c b/testcases/lib/tests/shell_test05.c
new file mode 100644
index 000000000..c6b446c76
--- /dev/null
+++ b/testcases/lib/tests/shell_test05.c
@@ -0,0 +1,27 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Shell test example.
+ */
+
+#include "tst_test.h"
+
+static void run_test(void)
+{
+	int pid;
+
+	pid = tst_run_shell("shell_test_checkpoint.sh", NULL);
+
+	tst_res(TINFO, "Waiting for shell to sleep on checkpoint!");
+
+	TST_PROCESS_STATE_WAIT(pid, 'S', 10000);
+
+	tst_res(TINFO, "Waking shell child!");
+
+	TST_CHECKPOINT_WAKE(0);
+}
+
+static struct tst_test test = {
+	.runs_script = 1,
+	.needs_checkpoints = 1,
+	.test_all = run_test,
+};
diff --git a/testcases/lib/tests/shell_test06.c b/testcases/lib/tests/shell_test06.c
new file mode 100644
index 000000000..d7f0ce946
--- /dev/null
+++ b/testcases/lib/tests/shell_test06.c
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Shell test example.
+ */
+
+#include "tst_test.h"
+
+static void run_test(void)
+{
+	tst_run_shell("shell_test_brk.sh", NULL);
+}
+
+static struct tst_test test = {
+	.runs_script = 1,
+	.test_all = run_test,
+};
diff --git a/testcases/lib/tests/shell_test_brk.sh b/testcases/lib/tests/shell_test_brk.sh
new file mode 100755
index 000000000..f266dc3fe
--- /dev/null
+++ b/testcases/lib/tests/shell_test_brk.sh
@@ -0,0 +1,6 @@
+#!/bin/sh
+
+. tst_env.sh
+
+tst_brk TCONF "This exits test and the next message should not be reached"
+tst_res TFAIL "If you see this the test failed"
diff --git a/testcases/lib/tests/shell_test_check_argv.sh b/testcases/lib/tests/shell_test_check_argv.sh
new file mode 100755
index 000000000..ce357027d
--- /dev/null
+++ b/testcases/lib/tests/shell_test_check_argv.sh
@@ -0,0 +1,23 @@
+#!/bin/sh
+
+. tst_env.sh
+
+tst_res TINFO "argv = $@"
+
+if [ $# -ne 2 ]; then
+	tst_res TFAIL "Wrong number of parameters got $# expected 2"
+else
+	tst_res TPASS "Got 2 parameters"
+fi
+
+if [ "$1" != "param1" ]; then
+	tst_res TFAIL "First parameter is $1 expected param1"
+else
+	tst_res TPASS "First parameter is $1"
+fi
+
+if [ "$2" != "param2" ]; then
+	tst_res TFAIL "Second parameter is $2 expected param2"
+else
+	tst_res TPASS "Second parameter is $2"
+fi
diff --git a/testcases/lib/tests/shell_test_checkpoint.sh b/testcases/lib/tests/shell_test_checkpoint.sh
new file mode 100755
index 000000000..0ceb7cf66
--- /dev/null
+++ b/testcases/lib/tests/shell_test_checkpoint.sh
@@ -0,0 +1,7 @@
+#!/bin/sh
+
+. tst_env.sh
+
+tst_res TINFO "Waiting for a checkpoint 0"
+tst_checkpoint wait 10000 0
+tst_res TPASS "Continuing after checkpoint"
diff --git a/testcases/lib/tests/shell_test_pass.sh b/testcases/lib/tests/shell_test_pass.sh
new file mode 100755
index 000000000..fd0684eb2
--- /dev/null
+++ b/testcases/lib/tests/shell_test_pass.sh
@@ -0,0 +1,6 @@
+#!/bin/sh
+
+. tst_env.sh
+
+tst_res TPASS "This is called from the shell script!"
+tst_sleep 100ms
diff --git a/testcases/lib/tst_env.sh b/testcases/lib/tst_env.sh
new file mode 100644
index 000000000..948bc5024
--- /dev/null
+++ b/testcases/lib/tst_env.sh
@@ -0,0 +1,21 @@
+#!/bin/sh
+
+tst_script_name=$(basename $0)
+
+if [ -z "$LTP_IPC_PATH" ]; then
+	echo "This script has to be executed from a LTP loader!"
+	exit 1
+fi
+
+tst_brk_()
+{
+	tst_res_ "$@"
+
+	case "$3" in
+		"TBROK") exit 2;;
+		*) exit 0;;
+	esac
+}
+
+alias tst_res="tst_res_ $tst_script_name \$LINENO"
+alias tst_brk="tst_brk_ $tst_script_name \$LINENO"
diff --git a/testcases/lib/tst_res_.c b/testcases/lib/tst_res_.c
new file mode 100644
index 000000000..a43920f36
--- /dev/null
+++ b/testcases/lib/tst_res_.c
@@ -0,0 +1,58 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2024 Cyril Hrubis <chrubis@suse.cz>
+ */
+
+#define TST_NO_DEFAULT_MAIN
+#include "tst_test.h"
+
+static void print_help(void)
+{
+	printf("Usage: tst_res_ filename lineno [TPASS|TFAIL|TCONF|TINFO|TDEBUG] 'A short description'\n");
+}
+
+int main(int argc, char *argv[])
+{
+	int type, i;
+
+	if (argc < 5)
+		goto help;
+
+	if (!strcmp(argv[3], "TPASS"))
+		type = TPASS;
+	else if (!strcmp(argv[3], "TFAIL"))
+		type = TFAIL;
+	else if (!strcmp(argv[3], "TCONF"))
+		type = TCONF;
+	else if (!strcmp(argv[3], "TINFO"))
+		type = TINFO;
+	else if (!strcmp(argv[3], "TDEBUG"))
+		type = TDEBUG;
+	else
+		goto help;
+
+	size_t len = 0;
+
+	for (i = 4; i < argc; i++)
+		len += strlen(argv[i]) + 1;
+
+	char *msg = SAFE_MALLOC(len);
+	char *msgp = msg;
+
+	for (i = 4; i < argc; i++) {
+		msgp = strcpy(msgp, argv[i]);
+		msgp += strlen(argv[i]);
+		*(msgp++) = ' ';
+	}
+
+	*(msgp - 1) = 0;
+
+	tst_reinit();
+
+	tst_res_(argv[1], atoi(argv[2]), type, "%s", msg);
+
+	return 0;
+help:
+	print_help();
+	return 1;
+}
-- 
2.44.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
