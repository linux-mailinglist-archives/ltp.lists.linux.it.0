Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C14A3F70ED
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Aug 2021 10:10:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 110E93C8DCE
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Aug 2021 10:10:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 61B1D3C2FB4
 for <ltp@lists.linux.it>; Wed, 25 Aug 2021 10:09:42 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id D10F91400BF6
 for <ltp@lists.linux.it>; Wed, 25 Aug 2021 10:09:41 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4FDC5220FB;
 Wed, 25 Aug 2021 08:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1629878981; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MKl39StYBFr1AXaFs3o1PsODhkVQBOP5xG8sBmk2AdQ=;
 b=LuUdA5Ftw4IUkxVYuAytZMAtq/f5I7fwk20EYKOq/y7488IALNqCi1qvrvoB+AyWbnE19a
 EdTWe0zHp9zATDkcTpmsn6xGBfOPhyPBzC5lONhTbTi9B/5E3C6Vy+j4zYZQkH3ng1x/I2
 Vc19eoEM/+mz5VJiUyxNHQ2dUFT8gaY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1629878981;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MKl39StYBFr1AXaFs3o1PsODhkVQBOP5xG8sBmk2AdQ=;
 b=aiRRNoS4KoIac5t4G7X5wwziqT8sRNxc1jNVngWw5C3clHPJrphB8+aUftHo/+QUAM/8ka
 K+7OUQAPVojsRWDA==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 0B75713A7D;
 Wed, 25 Aug 2021 08:09:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id kLnsAMX6JWHwcQAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Wed, 25 Aug 2021 08:09:41 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 25 Aug 2021 10:09:31 +0200
Message-Id: <20210825080933.12949-2-pvorel@suse.cz>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210825080933.12949-1-pvorel@suse.cz>
References: <20210825080933.12949-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 1/3] lib: Move IPC_ENV_VAR definition into header
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

thus it can be used in tests instead of duplicate definition.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 include/tst_test.h                          | 2 ++
 lib/tst_test.c                              | 2 --
 testcases/kernel/syscalls/execle/execle01.c | 2 --
 testcases/kernel/syscalls/execve/execve01.c | 2 --
 testcases/kernel/syscalls/prctl/prctl06.h   | 1 -
 5 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/include/tst_test.h b/include/tst_test.h
index ce4e007cf..27ebed94e 100644
--- a/include/tst_test.h
+++ b/include/tst_test.h
@@ -275,6 +275,8 @@ struct tst_test {
 void tst_run_tcases(int argc, char *argv[], struct tst_test *self)
                     __attribute__ ((noreturn));
 
+#define IPC_ENV_VAR "LTP_IPC_PATH"
+
 /*
  * Does library initialization for child processes started by exec()
  *
diff --git a/lib/tst_test.c b/lib/tst_test.c
index 1bdea769a..b61aa8b03 100644
--- a/lib/tst_test.c
+++ b/lib/tst_test.c
@@ -71,8 +71,6 @@ static int ipc_fd;
 extern void *tst_futexes;
 extern unsigned int tst_max_futexes;
 
-#define IPC_ENV_VAR "LTP_IPC_PATH"
-
 static char ipc_path[1064];
 const char *tst_ipc_path = ipc_path;
 
diff --git a/testcases/kernel/syscalls/execle/execle01.c b/testcases/kernel/syscalls/execle/execle01.c
index f10813cca..917dc892f 100644
--- a/testcases/kernel/syscalls/execle/execle01.c
+++ b/testcases/kernel/syscalls/execle/execle01.c
@@ -16,8 +16,6 @@
 
 #include "tst_test.h"
 
-#define IPC_ENV_VAR "LTP_IPC_PATH"
-
 static void verify_execle(void)
 {
 	pid_t pid;
diff --git a/testcases/kernel/syscalls/execve/execve01.c b/testcases/kernel/syscalls/execve/execve01.c
index 9331c9480..2b12c7666 100644
--- a/testcases/kernel/syscalls/execve/execve01.c
+++ b/testcases/kernel/syscalls/execve/execve01.c
@@ -17,8 +17,6 @@
 
 #include "tst_test.h"
 
-#define IPC_ENV_VAR "LTP_IPC_PATH"
-
 static void verify_execve(void)
 {
 	pid_t pid;
diff --git a/testcases/kernel/syscalls/prctl/prctl06.h b/testcases/kernel/syscalls/prctl/prctl06.h
index 227ce3006..510fefa60 100644
--- a/testcases/kernel/syscalls/prctl/prctl06.h
+++ b/testcases/kernel/syscalls/prctl/prctl06.h
@@ -17,7 +17,6 @@
 #include "tst_test.h"
 
 #define PROC_STATUS        "/proc/self/status"
-#define IPC_ENV_VAR        "LTP_IPC_PATH"
 #define MNTPOINT           "mntpoint"
 #define TESTBIN            "prctl06_execve"
 #define TEST_REL_BIN_DIR   MNTPOINT"/"
-- 
2.32.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
