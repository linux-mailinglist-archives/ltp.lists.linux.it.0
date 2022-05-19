Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E2352DB81
	for <lists+linux-ltp@lfdr.de>; Thu, 19 May 2022 19:41:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E4DE93CAAE4
	for <lists+linux-ltp@lfdr.de>; Thu, 19 May 2022 19:41:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id DFAFE3C0CD0
 for <ltp@lists.linux.it>; Thu, 19 May 2022 19:41:55 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 00B2B1A0099D
 for <ltp@lists.linux.it>; Thu, 19 May 2022 19:41:54 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CB32721B57;
 Thu, 19 May 2022 17:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1652982113; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=88YqzK3y1AY/jFAwk17pC6p2+LoVpjDeQ84kQ8H2X44=;
 b=xi8h2KUDrTsNZbLj2FgWoDjn7w8ttuqTeYGqSxyTi1U/cELpsQO3+ejcZeXB5CrwZkYiXI
 rOBqgnReGQtQT0gJACuJFy5v2CFBlGkrfJyBUiVaBZbLtqHHQVt7eYa7wbHR4z/PGr+mcL
 ViH+hKmkprn8wQ1yR4adV/2ArssfLlk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1652982113;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=88YqzK3y1AY/jFAwk17pC6p2+LoVpjDeQ84kQ8H2X44=;
 b=Vaqdr5Wjo3kgrCEfsW2U5VimiSPXRuiMSiL6quSeXfmRQQgQ/pztHMekXUT2gJYgOvczHA
 QBEb1Fcpcfe1F+Cg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8887913AF8;
 Thu, 19 May 2022 17:41:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Mgj7HWGBhmJhHgAAMHmgww
 (envelope-from <andrea.cervesato@suse.de>); Thu, 19 May 2022 17:41:53 +0000
From: Andrea Cervesato <andrea.cervesato@suse.de>
To: ltp@lists.linux.it
Date: Thu, 19 May 2022 19:41:51 +0200
Message-Id: <20220519174151.14114-1-andrea.cervesato@suse.de>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v1] Fix ltp-aiodio tests failing on s390
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

run_child flag is commonly used by aiodio tests in order to check if
tests are passed or not and compiler seems to optimize run_child flag
because it's not defined as volatile. With this patch we ensure that the
flag is set as volatile so tests will work as expected on s390.

Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.de>
---
 testcases/kernel/io/ltp-aiodio/aiodio_append.c | 4 ++--
 testcases/kernel/io/ltp-aiodio/aiodio_sparse.c | 4 ++--
 testcases/kernel/io/ltp-aiodio/dio_append.c    | 7 +++++--
 testcases/kernel/io/ltp-aiodio/dio_sparse.c    | 4 ++--
 testcases/kernel/io/ltp-aiodio/dio_truncate.c  | 4 ++--
 5 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/testcases/kernel/io/ltp-aiodio/aiodio_append.c b/testcases/kernel/io/ltp-aiodio/aiodio_append.c
index 46cc74ee4..e42c577cd 100644
--- a/testcases/kernel/io/ltp-aiodio/aiodio_append.c
+++ b/testcases/kernel/io/ltp-aiodio/aiodio_append.c
@@ -24,7 +24,7 @@
 #include <libaio.h>
 #include "common.h"
 
-static int *run_child;
+static volatile int *run_child;
 
 static char *str_numchildren;
 static char *str_writesize;
@@ -133,7 +133,7 @@ static void cleanup(void)
 {
 	if (run_child) {
 		*run_child = 0;
-		SAFE_MUNMAP(run_child, sizeof(int));
+		SAFE_MUNMAP((void *)run_child, sizeof(int));
 	}
 }
 
diff --git a/testcases/kernel/io/ltp-aiodio/aiodio_sparse.c b/testcases/kernel/io/ltp-aiodio/aiodio_sparse.c
index 2aa5662bb..9aa9b8d54 100644
--- a/testcases/kernel/io/ltp-aiodio/aiodio_sparse.c
+++ b/testcases/kernel/io/ltp-aiodio/aiodio_sparse.c
@@ -28,7 +28,7 @@
 #include <libaio.h>
 #include "common.h"
 
-static int *run_child;
+static volatile int *run_child;
 
 static char *str_numchildren;
 static char *str_writesize;
@@ -181,7 +181,7 @@ static void cleanup(void)
 {
 	if (run_child) {
 		*run_child = 0;
-		SAFE_MUNMAP(run_child, sizeof(int));
+		SAFE_MUNMAP((void *)run_child, sizeof(int));
 	}
 }
 
diff --git a/testcases/kernel/io/ltp-aiodio/dio_append.c b/testcases/kernel/io/ltp-aiodio/dio_append.c
index c099793f6..3a7e7c836 100644
--- a/testcases/kernel/io/ltp-aiodio/dio_append.c
+++ b/testcases/kernel/io/ltp-aiodio/dio_append.c
@@ -19,7 +19,7 @@
 #include "tst_test.h"
 #include "common.h"
 
-static int *run_child;
+static volatile int *run_child;
 
 static char *str_numchildren;
 static char *str_writesize;
@@ -49,7 +49,10 @@ static void setup(void)
 
 static void cleanup(void)
 {
-	SAFE_MUNMAP(run_child, sizeof(int));
+	if (run_child) {
+		*run_child = 0;
+		SAFE_MUNMAP((void *)run_child, sizeof(int));
+	}
 }
 
 static void run(void)
diff --git a/testcases/kernel/io/ltp-aiodio/dio_sparse.c b/testcases/kernel/io/ltp-aiodio/dio_sparse.c
index 0039daa8d..661afde4c 100644
--- a/testcases/kernel/io/ltp-aiodio/dio_sparse.c
+++ b/testcases/kernel/io/ltp-aiodio/dio_sparse.c
@@ -26,7 +26,7 @@
 #include "tst_test.h"
 #include "common.h"
 
-static int *run_child;
+static volatile int *run_child;
 
 static char *str_numchildren;
 static char *str_writesize;
@@ -85,7 +85,7 @@ static void cleanup(void)
 {
 	if (run_child) {
 		*run_child = 0;
-		SAFE_MUNMAP(run_child, sizeof(int));
+		SAFE_MUNMAP((void *)run_child, sizeof(int));
 	}
 }
 
diff --git a/testcases/kernel/io/ltp-aiodio/dio_truncate.c b/testcases/kernel/io/ltp-aiodio/dio_truncate.c
index 1fbf83de0..0fe6b87ac 100644
--- a/testcases/kernel/io/ltp-aiodio/dio_truncate.c
+++ b/testcases/kernel/io/ltp-aiodio/dio_truncate.c
@@ -33,7 +33,7 @@
 #include "tst_test.h"
 #include "common.h"
 
-static int *run_child;
+static volatile int *run_child;
 
 static char *str_numchildren;
 static char *str_filesize;
@@ -109,7 +109,7 @@ static void cleanup(void)
 {
 	if (run_child) {
 		*run_child = 0;
-		SAFE_MUNMAP(run_child, sizeof(int));
+		SAFE_MUNMAP((void *)run_child, sizeof(int));
 	}
 }
 
-- 
2.36.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
