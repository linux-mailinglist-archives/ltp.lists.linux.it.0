Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 503784D4539
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Mar 2022 11:59:45 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 21B123C6DFD
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Mar 2022 11:59:45 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D26F33C0F3B
 for <ltp@lists.linux.it>; Thu, 10 Mar 2022 11:59:22 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 157D0600E5A
 for <ltp@lists.linux.it>; Thu, 10 Mar 2022 11:59:21 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8684721118;
 Thu, 10 Mar 2022 10:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1646909961; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2ep1kb9bxDLKX8E08+9zslMEJjPpcQpssey9ohJjgq4=;
 b=AQhmuyH4kBCgS7JSoYmHMGQOyKTOzdHPZSNFnMQy9MaPsC2olCXZ6my7WuIxElRfBUrXxR
 0g9UPApemJNeGamBw4XoKwYt+UJZMEJoRPizUqUlcqDa0wP+BFrNLxZKtbxwxOvLPVUrcs
 /FivS4U5+ud7ArS+Z7CP9eq0hUUvQIE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1646909961;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2ep1kb9bxDLKX8E08+9zslMEJjPpcQpssey9ohJjgq4=;
 b=dfeW15qzRNO8c8Kg4iIgkRWjq3RaeRdYw6rsep2clcRFbEE6DRn0ffQjVMqb4ThFfNm5ll
 6LtEYaZDDoEcuUBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6150C13A3D;
 Thu, 10 Mar 2022 10:59:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id IAjbFQnaKWK8fgAAMHmgww
 (envelope-from <andrea.cervesato@suse.de>); Thu, 10 Mar 2022 10:59:21 +0000
From: Andrea Cervesato <andrea.cervesato@suse.de>
To: ltp@lists.linux.it
Date: Thu, 10 Mar 2022 11:59:07 +0100
Message-Id: <20220310105916.7960-2-andrea.cervesato@suse.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220310105916.7960-1-andrea.cervesato@suse.de>
References: <20220310105916.7960-1-andrea.cervesato@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v2 01/10] Rewrite mesgq_nstest.c using new LTP API
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

Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.de>
---
 testcases/kernel/containers/sysvipc/common.h  | 157 +++++++++++
 .../kernel/containers/sysvipc/mesgq_nstest.c  | 247 +++++++-----------
 2 files changed, 254 insertions(+), 150 deletions(-)
 create mode 100644 testcases/kernel/containers/sysvipc/common.h

diff --git a/testcases/kernel/containers/sysvipc/common.h b/testcases/kernel/containers/sysvipc/common.h
new file mode 100644
index 000000000..1fea6fafa
--- /dev/null
+++ b/testcases/kernel/containers/sysvipc/common.h
@@ -0,0 +1,157 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) International Business Machines Corp., 2007
+ *               Rishikesh K Rajak <risrajak@in.ibm.com>
+ * Copyright (C) 2022 SUSE LLC Andrea Cervesato <andrea.cervesato@suse.com>
+ */
+
+#ifndef COMMON_H
+#define COMMON_H
+
+#include <stdlib.h>
+#include "tst_test.h"
+#include "lapi/syscalls.h"
+#include "lapi/namespaces_constants.h"
+
+enum {
+	T_CLONE,
+	T_UNSHARE,
+	T_NONE,
+};
+
+static int dummy_child(void *v)
+{
+	(void)v;
+	return 0;
+}
+
+static void check_newipc(void)
+{
+	int pid, status;
+
+	if (tst_kvercmp(2, 6, 19) < 0)
+		tst_brk(TCONF, "CLONE_NEWIPC not supported");
+
+	pid = ltp_clone_quick(CLONE_NEWIPC | SIGCHLD, dummy_child, NULL);
+	if (pid < 0)
+		tst_brk(TCONF | TERRNO, "CLONE_NEWIPC not supported");
+
+	SAFE_WAITPID(pid, &status, 0);
+}
+
+static inline int get_clone_unshare_enum(const char* str_op)
+{
+	int use_clone;
+
+	if (strcmp(str_op, "clone") &&
+		strcmp(str_op, "unshare") &&
+		strcmp(str_op, "none"))
+		tst_brk(TBROK, "Test execution mode <clone|unshare|none>");
+
+	if (!strcmp(str_op, "clone"))
+		use_clone = T_CLONE;
+	else if (!strcmp(str_op, "unshare"))
+		use_clone = T_UNSHARE;
+	else
+		use_clone = T_NONE;
+
+	return use_clone;
+}
+
+static int clone_test(unsigned long clone_flags, int (*fn1)(void *arg),
+		      void *arg1)
+{
+	int ret;
+
+	ret = ltp_clone_quick(clone_flags | SIGCHLD, fn1, arg1);
+
+	if (ret != -1) {
+		/* no errors: we'll get the PID id that means success */
+		ret = 0;
+	}
+
+	return ret;
+}
+
+static int unshare_test(unsigned long clone_flags, int (*fn1)(void *arg),
+			void *arg1)
+{
+	int pid, ret = 0;
+	int retpipe[2];
+	char buf[2];
+
+	SAFE_PIPE(retpipe);
+
+	pid = fork();
+	if (pid < 0) {
+		SAFE_CLOSE(retpipe[0]);
+		SAFE_CLOSE(retpipe[1]);
+		tst_brk(TBROK, "fork");
+	}
+
+	if (!pid) {
+		SAFE_CLOSE(retpipe[0]);
+
+		ret = tst_syscall(SYS_unshare, clone_flags);
+		if (ret == -1) {
+			SAFE_WRITE(1, retpipe[1], "0", 2);
+			SAFE_CLOSE(retpipe[1]);
+			exit(1);
+		} else {
+			SAFE_WRITE(1, retpipe[1], "1", 2);
+		}
+
+		SAFE_CLOSE(retpipe[1]);
+
+		ret = fn1(arg1);
+		exit(ret);
+	}
+
+	SAFE_CLOSE(retpipe[1]);
+	SAFE_READ(1, retpipe[0], &buf, 2);
+	SAFE_CLOSE(retpipe[0]);
+
+	if (*buf == '0')
+		return -1;
+
+	return ret;
+}
+
+static int plain_test(int (*fn1)(void *arg), void *arg1)
+{
+	int ret = 0, pid;
+
+	pid = SAFE_FORK();
+	if (!pid)
+		exit(fn1(arg1));
+
+	return ret;
+}
+
+static void clone_unshare_test(int use_clone, unsigned long clone_flags,
+			       int (*fn1)(void *arg), void *arg1)
+{
+	int ret = 0;
+
+	switch (use_clone) {
+	case T_NONE:
+		ret = plain_test(fn1, arg1);
+		break;
+	case T_CLONE:
+		ret = clone_test(clone_flags, fn1, arg1);
+		break;
+	case T_UNSHARE:
+		ret = unshare_test(clone_flags, fn1, arg1);
+		break;
+	default:
+		ret = -1;
+		tst_brk(TBROK, "%s: bad use_clone option: %d", __FUNCTION__,
+			use_clone);
+		break;
+	}
+
+	if (ret == -1)
+		tst_brk(TBROK, "child2 clone failed");
+}
+
+#endif
diff --git a/testcases/kernel/containers/sysvipc/mesgq_nstest.c b/testcases/kernel/containers/sysvipc/mesgq_nstest.c
index dbf311dc8..bb58b7211 100644
--- a/testcases/kernel/containers/sysvipc/mesgq_nstest.c
+++ b/testcases/kernel/containers/sysvipc/mesgq_nstest.c
@@ -1,175 +1,122 @@
-/* *************************************************************************
-* Copyright (c) International Business Machines Corp., 2009
-* This program is free software; you can redistribute it and/or modify
-* it under the terms of the GNU General Public License as published by
-* the Free Software Foundation; either version 2 of the License, or
-* (at your option) any later version.
-*
-* This program is distributed in the hope that it will be useful,
-* but WITHOUT ANY WARRANTY; without even the implied warranty of
-* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
-* the GNU General Public License for more details.
-* You should have received a copy of the GNU General Public License
-* along with this program; if not, write to the Free Software
-* Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
-*
-* Author: Veerendra C <vechandr@in.ibm.com>
-*
-* In Parent Process , create mesgq with key 154326L
-* Now create container by passing 1 of the flag values..
-*	Flag = clone, clone(CLONE_NEWIPC), or unshare(CLONE_NEWIPC)
-* In cloned process, try to access the created mesgq
-* Test PASS: If the mesgq is readable when flag is None.
-* Test FAIL: If the mesgq is readable when flag is Unshare or Clone.
-***************************************************************************/
-
-#define _GNU_SOURCE 1
-#include <stdio.h>
-#include <stdlib.h>
-#include <unistd.h>
-#include <string.h>
-#include <sys/ipc.h>
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) International Business Machines Corp., 2009
+ *				Veerendra C <vechandr@in.ibm.com>
+ * Copyright (C) 2022 SUSE LLC Andrea Cervesato <andrea.cervesato@suse.com>
+ */
+
+/*\
+ * [Description]
+ *
+ * Test SysV IPC message passing through different namespaces.
+ *
+ * [Algorithm]
+ *
+ * In parent process create a new mesgq with a specific key.
+ * In cloned process try to access the created mesgq.
+ *
+ * Test will PASS if the mesgq is readable when flag is None.
+ * Test will FAIL if the mesgq is readable when flag is Unshare or Clone or
+ * the message received is wrong.
+ */
+
+#define _GNU_SOURCE
+
+#include <sys/wait.h>
 #include <sys/msg.h>
-#include <libclone.h>
-#include "test.h"
-#include "ipcns_helper.h"
-
-#define KEY_VAL		154326L
-#define UNSHARESTR	"unshare"
-#define CLONESTR	"clone"
-#define NONESTR		"none"
-
-char *TCID = "mesgq_nstest";
-int TST_TOTAL = 1;
-int p1[2];
-int p2[2];
-struct msg_buf {
-	long int mtype;		/* type of received/sent message */
-	char mtext[80];		/* text of the message */
+#include <sys/types.h>
+#include "tst_safe_sysv_ipc.h"
+#include "tst_test.h"
+#include "common.h"
+
+#define KEY_VAL 154326L
+#define MSG_TYPE 5
+#define MSG_TEXT "My message!"
+
+static char *str_op = "clone";
+static int use_clone;
+static int ipc_id = -1;
+
+static struct msg_buf {
+	long mtype;
+	char mtext[80];
 } msg;
 
-void mesgq_read(int id)
+static int check_mesgq(LTP_ATTRIBUTE_UNUSED void *vtest)
 {
-	int READMAX = 80;
-	int n;
-	/* read msg type 5 on the Q; msgtype, flags are last 2 params.. */
+	int id, n;
 
-	n = msgrcv(id, &msg, READMAX, 5, 0);
-	if (n == -1)
-		perror("msgrcv"), tst_exit();
-
-	tst_resm(TINFO, "Mesg read of %d bytes; Type %ld: Msg: %.*s",
-		 n, msg.mtype, n, msg.mtext);
-}
+	id = msgget(KEY_VAL, 0);
 
-int check_mesgq(void *vtest)
-{
-	char buf[3];
-	int id;
+	if (id < 0) {
+		if (use_clone == T_NONE)
+			tst_res(TFAIL, "Plain cloned process didn't find mesgq");
+		else
+			tst_res(TPASS, "%s: container didn't find mesgq", str_op);
+	} else {
+		if (use_clone == T_NONE)
+			tst_res(TPASS, "Plain cloned process found mesgq inside container");
+		else
+			tst_res(TFAIL, "%s: container init process found mesgq", str_op);
 
-	(void) vtest;
+		n = SAFE_MSGRCV(id, &msg, sizeof(msg.mtext), MSG_TYPE, 0);
 
-	close(p1[1]);
-	close(p2[0]);
+		tst_res(TINFO, "Mesg read of %d bytes, Type %ld, Msg: %s", n, msg.mtype, msg.mtext);
 
-	read(p1[0], buf, 3);
-	id = msgget(KEY_VAL, 0);
-	if (id == -1)
-		write(p2[1], "notfnd", 7);
-	else {
-		write(p2[1], "exists", 7);
-		mesgq_read(id);
+		if (strcmp(msg.mtext, MSG_TEXT))
+			tst_res(TFAIL, "Received the wrong text message");
 	}
-	tst_exit();
-}
 
-static void setup(void)
-{
-	tst_require_root();
-	check_newipc();
+	TST_CHECKPOINT_WAKE(0);
+
+	return 0;
 }
 
-int main(int argc, char *argv[])
+static void run(void)
 {
-	int ret, use_clone = T_NONE, id, n;
-	char *tsttype = NONESTR;
-	char buf[7];
+	msg.mtype = MSG_TYPE;
+	strcpy(msg.mtext, "My message!");
 
-	setup();
+	SAFE_MSGSND(ipc_id, &msg, strlen(msg.mtext), 0);
 
-	if (argc != 2) {
-		tst_resm(TFAIL, "Usage: %s <clone|unshare|none>", argv[0]);
-		tst_brkm(TFAIL, NULL, " where clone, unshare, or fork specifies"
-			 " unshare method.");
-	}
+	tst_res(TINFO, "mesgq namespaces test: %s", str_op);
 
-	/* Using PIPE's to sync between container and Parent */
-	if (pipe(p1) == -1) {
-		perror("pipe");
-		exit(EXIT_FAILURE);
-	}
-	if (pipe(p2) == -1) {
-		perror("pipe");
-		exit(EXIT_FAILURE);
-	}
+	clone_unshare_test(use_clone, CLONE_NEWIPC, check_mesgq, NULL);
 
-	tsttype = NONESTR;
+	TST_CHECKPOINT_WAIT(0);
+}
 
-	if (strcmp(argv[1], "clone") == 0) {
-		use_clone = T_CLONE;
-		tsttype = CLONESTR;
-	} else if (strcmp(argv[1], "unshare") == 0) {
-		use_clone = T_UNSHARE;
-		tsttype = UNSHARESTR;
-	}
+static void setup(void)
+{
+	use_clone = get_clone_unshare_enum(str_op);
 
-	id = msgget(KEY_VAL, IPC_CREAT | IPC_EXCL | 0600);
-	if (id == -1) {
-		perror("msgget");
-		/* Retry without attempting to create the MQ */
-		id = msgget(KEY_VAL, 0);
-		if (id == -1)
-			perror("msgget failure"), exit(1);
-	}
+	if (use_clone != T_NONE)
+		check_newipc();
 
-	msg.mtype = 5;
-	strcpy(msg.mtext, "Message of type 5!");
-	n = msgsnd(id, &msg, strlen(msg.mtext), 0);
-	if (n == -1)
-		perror("msgsnd"), tst_exit();
-
-	tst_resm(TINFO, "mesgq namespaces test : %s", tsttype);
-	/* fire off the test */
-	ret = do_clone_unshare_test(use_clone, CLONE_NEWIPC, check_mesgq, NULL);
-	if (ret < 0) {
-		tst_brkm(TFAIL, NULL, "%s failed", tsttype);
+	ipc_id = msgget(KEY_VAL, IPC_CREAT | IPC_EXCL | 0600);
+	if (ipc_id < 0) {
+		tst_res(TINFO, "Message already exists");
+		ipc_id = SAFE_MSGGET(KEY_VAL, 0);
 	}
+}
 
-	close(p1[0]);
-	close(p2[1]);
-	write(p1[1], "go", 3);
-
-	read(p2[0], buf, 7);
-	if (strcmp(buf, "exists") == 0) {
-		if (use_clone == T_NONE)
-			tst_resm(TPASS, "Plain cloned process found mesgq "
-				 "inside container");
-		else
-			tst_resm(TFAIL,
-				 "%s: Container init process found mesgq",
-				 tsttype);
-	} else {
-		if (use_clone == T_NONE)
-			tst_resm(TFAIL,
-				 "Plain cloned process didn't find mesgq");
-		else
-			tst_resm(TPASS, "%s: Container didn't find mesgq",
-				 tsttype);
+static void cleanup(void)
+{
+	if (ipc_id != -1) {
+		tst_res(TINFO, "Destroy message");
+		SAFE_MSGCTL(ipc_id, IPC_RMID, NULL);
 	}
-
-	/* Delete the mesgQ */
-	id = msgget(KEY_VAL, 0);
-	msgctl(id, IPC_RMID, NULL);
-
-	tst_exit();
 }
+
+static struct tst_test test = {
+	.test_all = run,
+	.setup = setup,
+	.cleanup = cleanup,
+	.needs_root = 1,
+	.forks_child = 1,
+	.needs_checkpoints = 1,
+	.options = (struct tst_option[]) {
+		{ "m:", &str_op, "Test execution mode <clone|unshare|none>" },
+		{},
+	},
+};
-- 
2.35.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
