Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B16B2B1E6EB
	for <lists+linux-ltp@lfdr.de>; Fri,  8 Aug 2025 13:02:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 61C7D3CA671
	for <lists+linux-ltp@lfdr.de>; Fri,  8 Aug 2025 13:02:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 699DB3CA699
 for <ltp@lists.linux.it>; Fri,  8 Aug 2025 13:01:16 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id C470F600964
 for <ltp@lists.linux.it>; Fri,  8 Aug 2025 13:01:15 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5CD8733E2A;
 Fri,  8 Aug 2025 11:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1754650867; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d613D6itHx54LIflTVOBig+RXEwiWcVOdPRooEsPMYQ=;
 b=Q+ZZO6eLcTzueAEsfqJ/9m+iQnYN70dNCMNbxBdE5JJhcf143+i0ZaW53OA3mYiR26yJPy
 9fRFLN/tdnvwdzYHF7Tpr/2FlTUovm2P0ZmUxVENd+7H+8Y+TYj+lTCBPSjUy8vafQUdr3
 YXeyrokBYLlZmpuvn7YnSmyI5AnbFio=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1754650867;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d613D6itHx54LIflTVOBig+RXEwiWcVOdPRooEsPMYQ=;
 b=nc5bZE/WyH+zvEFu96rqBi7AB9GtMSX2tW5N+DPjRhMOQItr4Mpk4qeO7ZuKvu2PkmOssB
 u1fJoYSxBUAjXFCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1754650867; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d613D6itHx54LIflTVOBig+RXEwiWcVOdPRooEsPMYQ=;
 b=Q+ZZO6eLcTzueAEsfqJ/9m+iQnYN70dNCMNbxBdE5JJhcf143+i0ZaW53OA3mYiR26yJPy
 9fRFLN/tdnvwdzYHF7Tpr/2FlTUovm2P0ZmUxVENd+7H+8Y+TYj+lTCBPSjUy8vafQUdr3
 YXeyrokBYLlZmpuvn7YnSmyI5AnbFio=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1754650867;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d613D6itHx54LIflTVOBig+RXEwiWcVOdPRooEsPMYQ=;
 b=nc5bZE/WyH+zvEFu96rqBi7AB9GtMSX2tW5N+DPjRhMOQItr4Mpk4qeO7ZuKvu2PkmOssB
 u1fJoYSxBUAjXFCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2D19B13AB6;
 Fri,  8 Aug 2025 11:01:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id IF2bBfPYlWgHcwAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Fri, 08 Aug 2025 11:01:07 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri,  8 Aug 2025 13:01:02 +0200
Message-ID: <20250808110102.454689-4-pvorel@suse.cz>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250808110102.454689-1-pvorel@suse.cz>
References: <20250808110102.454689-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-0.999];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FROM_HAS_DN(0.00)[]; MIME_TRACE(0.00)[0:+];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,fujitsu.com:email,suse.cz:mid,suse.cz:email];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; RCPT_COUNT_TWO(0.00)[2];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[]
X-Spam-Level: 
X-Spam-Score: -2.80
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,DMARC_MISSING,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v2 3/3] m4: fcntl31: Remove check for struct f_owner_ex
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

struct f_owner_ex support was added to glibc 2.11 released in 2009.
Other libc of course contain it as well (musl, uclibc-ng, bionic) and we
can safely assume it's widely supported.

The check m4/ltp-fcntl.m4 was unnecessarily complicated. Adding struct
into AC_CHECK_TYPES in configure.ac would be much faster than compile
with AC_COMPILE_IFELSE.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 configure.ac                              |  1 -
 m4/ltp-fcntl.m4                           | 21 ---------------------
 testcases/kernel/syscalls/fcntl/fcntl31.c |  8 --------
 3 files changed, 30 deletions(-)
 delete mode 100644 m4/ltp-fcntl.m4

diff --git a/configure.ac b/configure.ac
index 5362aaf1bc..62ae27d494 100644
--- a/configure.ac
+++ b/configure.ac
@@ -397,7 +397,6 @@ LTP_CHECK_LIBMNL
 LTP_CHECK_SELINUX
 LTP_CHECK_SYNC_ADD_AND_FETCH
 LTP_CHECK_SYSCALL_EVENTFD
-LTP_CHECK_SYSCALL_FCNTL
 LTP_CHECK_FSVERITY
 
 AX_CHECK_COMPILE_FLAG([-no-pie], [LTP_CFLAGS_NOPIE=1])
diff --git a/m4/ltp-fcntl.m4 b/m4/ltp-fcntl.m4
deleted file mode 100644
index 90ab5fd0fc..0000000000
--- a/m4/ltp-fcntl.m4
+++ /dev/null
@@ -1,21 +0,0 @@
-dnl SPDX-License-Identifier: GPL-2.0-or-later
-dnl Copyright (c) 2014 Fujitsu Ltd.
-dnl Author: Xiaoguang Wang <wangxg.fnst@cn.fujitsu.com>
-
-AC_DEFUN([LTP_CHECK_SYSCALL_FCNTL],[
-	AC_MSG_CHECKING([for fcntl f_owner_ex])
-	AC_COMPILE_IFELSE([AC_LANG_SOURCE([
-#define _GNU_SOURCE
-#include <fcntl.h>
-int main(void) {
-	struct f_owner_ex tst_own_ex;
-	return 0;
-}])],[has_f_owner_ex="yes"])
-
-if test "x$has_f_owner_ex" = xyes; then
-	AC_DEFINE(HAVE_STRUCT_F_OWNER_EX,1,[Define to 1 if you have struct f_owner_ex])
-	AC_MSG_RESULT(yes)
-else
-	AC_MSG_RESULT(no)
-fi
-])
diff --git a/testcases/kernel/syscalls/fcntl/fcntl31.c b/testcases/kernel/syscalls/fcntl/fcntl31.c
index f6f625e855..f5c4f83983 100644
--- a/testcases/kernel/syscalls/fcntl/fcntl31.c
+++ b/testcases/kernel/syscalls/fcntl/fcntl31.c
@@ -44,13 +44,11 @@ static void cleanup(void);
 static void setown_pid_test(void);
 static void setown_pgrp_test(void);
 
-#if defined(HAVE_STRUCT_F_OWNER_EX)
 static void setownex_tid_test(void);
 static void setownex_pid_test(void);
 static void setownex_pgrp_test(void);
 
 static struct f_owner_ex orig_own_ex;
-#endif
 
 static void signal_parent(void);
 static void check_io_signal(char *des);
@@ -68,9 +66,7 @@ static int pipe_fds[2];
 
 static void (*testfunc[])(void) = {
 	setown_pid_test, setown_pgrp_test,
-#if defined(HAVE_STRUCT_F_OWNER_EX)
 	setownex_tid_test, setownex_pid_test, setownex_pgrp_test
-#endif
 };
 
 char *TCID = "fcntl31";
@@ -122,14 +118,12 @@ static void setup(void)
 	if (pgrp_pid < 0)
 		tst_brkm(TBROK | TERRNO, cleanup, "getpgid() failed");
 
-#if defined(HAVE_STRUCT_F_OWNER_EX)
 	/* get original f_owner_ex info */
 	TEST(fcntl(test_fd, F_GETOWN_EX, &orig_own_ex));
 	if (TEST_RETURN < 0) {
 		tst_brkm(TFAIL | TTERRNO, cleanup,
 			 "fcntl get original f_owner_ex info failed");
 	}
-#endif
 
 	/* get original pid info */
 	TEST(fcntl(test_fd, F_GETOWN));
@@ -183,7 +177,6 @@ static void setown_pgrp_test(void)
 	}
 }
 
-#if defined(HAVE_STRUCT_F_OWNER_EX)
 static void setownex_cleanup(void)
 {
 	TEST(fcntl(test_fd, F_SETOWN_EX, &orig_own_ex));
@@ -245,7 +238,6 @@ static void setownex_pgrp_test(void)
 
 	setownex_cleanup();
 }
-#endif
 
 static void test_set_and_get_sig(int sig, char *des)
 {
-- 
2.50.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
