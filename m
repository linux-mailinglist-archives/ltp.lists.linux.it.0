Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EE792391548
	for <lists+linux-ltp@lfdr.de>; Wed, 26 May 2021 12:46:44 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7C69D3C7765
	for <lists+linux-ltp@lfdr.de>; Wed, 26 May 2021 12:46:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 294AB3C2ADD
 for <ltp@lists.linux.it>; Wed, 26 May 2021 12:46:41 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id A2FB91A0121D
 for <ltp@lists.linux.it>; Wed, 26 May 2021 12:46:40 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by smtp-out1.suse.de (Postfix) with ESMTP id 1313F218C1;
 Wed, 26 May 2021 10:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622026000; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=nm66JEJr53Cemm6NNU8WH6/kGLISwGZ6HeYQuWP9tmQ=;
 b=ZfYu6IenJzdlPzEPadAjY6Q62rj0sJ2YRTdFsjYGJLXhOHHfbfSQOVCfejusZ6+HnfrIjB
 /B6wNNhi0k4O1a3z3QdI2QVKSUkXmV5ff3TX0kQ6+e9KAC1i3OUH1XObgc/1owB99znFq7
 gp3k1BpY8ZwYLKrWpB7PKYqg3D7v36c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622026000;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=nm66JEJr53Cemm6NNU8WH6/kGLISwGZ6HeYQuWP9tmQ=;
 b=m7zjv5Wb/JpB5YozRpeEHr6G3IrDbKKpYUC4KGMb0NQv0qEfZ+CqC4hl4V4wB0RrO2QFuy
 Ub5dKibCYMvCxfBw==
Received: from director2.suse.de (director2.suse-dmz.suse.de [192.168.254.72])
 by imap.suse.de (Postfix) with ESMTPSA id E5E8011A98;
 Wed, 26 May 2021 10:46:39 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 26 May 2021 12:46:33 +0200
Message-Id: <20210526104633.29561-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] sendfile0{2,9}: Remove OFF_T workaround
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

Using OFF_T definition to off64_t for 64bit variants seems to be am old
workaround for buggy libc. Nowadays we can rely on off_t to have correct size
(i.e.: 32bit: 4 bytes; 64bit or 32bit with -D_FILE_OFFSET_BITS=64: 8 bytes)

Suggested-by: Cyril Hrubis <chrubis@suse.cz>
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
NOTE: -DOFF_T=off64_t is also defined in testcases/kernel/io/disktest
and mentioned in {tst_,}safe_macros.h.

Kind regards,
Petr

 testcases/kernel/syscalls/sendfile/Makefile     |  2 +-
 testcases/kernel/syscalls/sendfile/sendfile02.c |  6 +-----
 testcases/kernel/syscalls/sendfile/sendfile09.c | 10 +++-------
 3 files changed, 5 insertions(+), 13 deletions(-)

diff --git a/testcases/kernel/syscalls/sendfile/Makefile b/testcases/kernel/syscalls/sendfile/Makefile
index f63a42fe9..7ee7bbed4 100644
--- a/testcases/kernel/syscalls/sendfile/Makefile
+++ b/testcases/kernel/syscalls/sendfile/Makefile
@@ -6,6 +6,6 @@ top_srcdir		?= ../../../..
 include $(top_srcdir)/include/mk/testcases.mk
 include $(abs_srcdir)/../utils/newer_64.mk
 
-%_64: CPPFLAGS += -D_FILE_OFFSET_BITS=64 -DOFF_T=off64_t -D_GNU_SOURCE
+%_64: CPPFLAGS += -D_FILE_OFFSET_BITS=64 -D_GNU_SOURCE
 
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/sendfile/sendfile02.c b/testcases/kernel/syscalls/sendfile/sendfile02.c
index e5f115146..729a9e123 100644
--- a/testcases/kernel/syscalls/sendfile/sendfile02.c
+++ b/testcases/kernel/syscalls/sendfile/sendfile02.c
@@ -59,10 +59,6 @@
 #include "test.h"
 #include "safe_macros.h"
 
-#ifndef OFF_T
-#define OFF_T off_t
-#endif /* Not def: OFF_T */
-
 TCID_DEFINE(sendfile02);
 int TST_TOTAL = 4;
 
@@ -95,7 +91,7 @@ struct test_case_t {
 static char *argv0;
 #endif
 
-void do_sendfile(OFF_T offset, int i)
+void do_sendfile(off_t offset, int i)
 {
 	int in_fd;
 	struct stat sb;
diff --git a/testcases/kernel/syscalls/sendfile/sendfile09.c b/testcases/kernel/syscalls/sendfile/sendfile09.c
index 297b3e212..320649dcd 100644
--- a/testcases/kernel/syscalls/sendfile/sendfile09.c
+++ b/testcases/kernel/syscalls/sendfile/sendfile09.c
@@ -26,17 +26,13 @@
 
 #ifndef TST_ABI32
 
-#ifndef OFF_T
-#define OFF_T off_t
-#endif
-
 #define ONE_GB		(INT64_C(1) << 30)
 #define IN_FILE		"in_file"
 #define OUT_FILE	"out_file"
 
 static struct test_case_t {
 	char *desc;
-	OFF_T offset;
+	off_t offset;
 	int64_t count;
 	int64_t exp_retval;
 	int64_t exp_updated_offset;
@@ -67,9 +63,9 @@ static void run(unsigned int i)
 {
 	int in_fd = SAFE_OPEN(IN_FILE, O_RDONLY);
 	int out_fd = SAFE_OPEN(OUT_FILE, O_WRONLY);
-	OFF_T offset = tc[i].offset;
+	off_t offset = tc[i].offset;
 
-	OFF_T before_pos, after_pos;
+	off_t before_pos, after_pos;
 	before_pos = SAFE_LSEEK(in_fd, 0, SEEK_CUR);
 
 	TEST(sendfile(out_fd, in_fd, &offset, tc[i].count));
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
