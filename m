Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2BE495FDE
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Jan 2022 14:41:03 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CB32E3C96EA
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Jan 2022 14:41:02 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A20283C96DE
 for <ltp@lists.linux.it>; Fri, 21 Jan 2022 14:40:58 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id D152820013D
 for <ltp@lists.linux.it>; Fri, 21 Jan 2022 14:40:57 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 258C31F3AF;
 Fri, 21 Jan 2022 13:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1642772457; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=5ww1A1KhdGKfJMGXvpsTmqsSY+abOfCwCUyEXzAlEBU=;
 b=VJfi+0PT7mkyxUchfq8u5RpFs0EKnoj8O2VPIrmznK6mpXZ5674gIbL8OTXJ6ZPv4eBBaa
 9pVyYysN3cpWAioyLSY0aQtgHFhPUvucYmKYcwcXoEb2DVEo6TGikEc+5kUXEnARnaMAV9
 2ogke2M7y7d7fKp3qZZhYptAT6+ClUQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1642772457;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=5ww1A1KhdGKfJMGXvpsTmqsSY+abOfCwCUyEXzAlEBU=;
 b=pNJm5pehZGxEX+57Gfg0P0YowC80c6yXABDYQjWxa3RRvnxE6FDSE6FQiBOkm533ExaDZ6
 DcdxK8Eyj4N3qlCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BA65A13BC9;
 Fri, 21 Jan 2022 13:40:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id YBYEKui36mF6UAAAMHmgww
 (envelope-from <pvorel@suse.cz>); Fri, 21 Jan 2022 13:40:56 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 21 Jan 2022 14:40:51 +0100
Message-Id: <20220121134052.30048-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [v2 PATCH 1/2] aiodio: Skip tests on tmpfs
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

tmpfs does not support O_DIRECT.

Used only on newly rewritten tests (old are currently using hardcoded
paths in the runtest files).

Reviewed-by: Cyril Hrubis <chrubis@suse.cz>
Reviewed-by: Martin Doucha <mdoucha@suse.cz>
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Changes v1->v2:
Fix commit message.

Kind regards,
Petr

 testcases/kernel/io/ltp-aiodio/aiodio_append.c | 10 ++++++++--
 testcases/kernel/io/ltp-aiodio/dio_append.c    |  4 ++++
 testcases/kernel/io/ltp-aiodio/dio_read.c      |  4 ++++
 testcases/kernel/io/ltp-aiodio/dio_sparse.c    | 10 ++++++++--
 testcases/kernel/io/ltp-aiodio/dio_truncate.c  | 10 ++++++++--
 5 files changed, 32 insertions(+), 6 deletions(-)

diff --git a/testcases/kernel/io/ltp-aiodio/aiodio_append.c b/testcases/kernel/io/ltp-aiodio/aiodio_append.c
index cb04b04a57..46cc74ee4e 100644
--- a/testcases/kernel/io/ltp-aiodio/aiodio_append.c
+++ b/testcases/kernel/io/ltp-aiodio/aiodio_append.c
@@ -131,8 +131,10 @@ static void setup(void)
 
 static void cleanup(void)
 {
-	*run_child = 0;
-	SAFE_MUNMAP(run_child, sizeof(int));
+	if (run_child) {
+		*run_child = 0;
+		SAFE_MUNMAP(run_child, sizeof(int));
+	}
 }
 
 static void run(void)
@@ -177,6 +179,10 @@ static struct tst_test test = {
 		{"b:", &str_numaio, "Number of async IO blocks (default 16)"},
 		{}
 	},
+	.skip_filesystems = (const char *[]) {
+		"tmpfs",
+		NULL
+	},
 };
 #else
 TST_TEST_TCONF("test requires libaio and its development packages");
diff --git a/testcases/kernel/io/ltp-aiodio/dio_append.c b/testcases/kernel/io/ltp-aiodio/dio_append.c
index 59fd710e70..c099793f6c 100644
--- a/testcases/kernel/io/ltp-aiodio/dio_append.c
+++ b/testcases/kernel/io/ltp-aiodio/dio_append.c
@@ -93,4 +93,8 @@ static struct tst_test test = {
 		{"c:", &str_appends, "Number of appends (default 1000)"},
 		{}
 	},
+	.skip_filesystems = (const char *[]) {
+		"tmpfs",
+		NULL
+	},
 };
diff --git a/testcases/kernel/io/ltp-aiodio/dio_read.c b/testcases/kernel/io/ltp-aiodio/dio_read.c
index 2c2ec4bce0..67a28147fd 100644
--- a/testcases/kernel/io/ltp-aiodio/dio_read.c
+++ b/testcases/kernel/io/ltp-aiodio/dio_read.c
@@ -177,4 +177,8 @@ static struct tst_test test = {
 		{"s:", &str_filesize, "File size (default 128M)"},
 		{}
 	},
+	.skip_filesystems = (const char *[]) {
+		"tmpfs",
+		NULL
+	},
 };
diff --git a/testcases/kernel/io/ltp-aiodio/dio_sparse.c b/testcases/kernel/io/ltp-aiodio/dio_sparse.c
index 4ee2fbab18..39fc895d65 100644
--- a/testcases/kernel/io/ltp-aiodio/dio_sparse.c
+++ b/testcases/kernel/io/ltp-aiodio/dio_sparse.c
@@ -83,8 +83,10 @@ static void setup(void)
 
 static void cleanup(void)
 {
-	*run_child = 0;
-	SAFE_MUNMAP(run_child, sizeof(int));
+	if (run_child) {
+		*run_child = 0;
+		SAFE_MUNMAP(run_child, sizeof(int));
+	}
 }
 
 static void run(void)
@@ -129,4 +131,8 @@ static struct tst_test test = {
 		{"o:", &str_offset, "File offset (default 0)"},
 		{}
 	},
+	.skip_filesystems = (const char *[]) {
+		"tmpfs",
+		NULL
+	},
 };
diff --git a/testcases/kernel/io/ltp-aiodio/dio_truncate.c b/testcases/kernel/io/ltp-aiodio/dio_truncate.c
index 4bf11c9588..1fbf83de06 100644
--- a/testcases/kernel/io/ltp-aiodio/dio_truncate.c
+++ b/testcases/kernel/io/ltp-aiodio/dio_truncate.c
@@ -107,8 +107,10 @@ static void setup(void)
 
 static void cleanup(void)
 {
-	*run_child = 0;
-	SAFE_MUNMAP(run_child, sizeof(int));
+	if (run_child) {
+		*run_child = 0;
+		SAFE_MUNMAP(run_child, sizeof(int));
+	}
 }
 
 static void run(void)
@@ -163,4 +165,8 @@ static struct tst_test test = {
 		{"c:", &str_numwrites, "Number of append & truncate (default 100)"},
 		{}
 	},
+	.skip_filesystems = (const char *[]) {
+		"tmpfs",
+		NULL
+	},
 };
-- 
2.34.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
